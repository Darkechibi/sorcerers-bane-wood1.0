/* Playable slice of the Sorcerer's Bane reconstruction.

   Combat numbers come from you_hit_1C8BF and stabbed_1D361.
   A hit lands when RND falls on the attacker's side of
   to-hit / (to-hit + defense). Damage is INT(RND * to-damage / armor * 8).
   Worn gear (the word at byte 64 of each .INV record) then adds its bonus.
*/
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stdint.h>
#include <math.h>
#include <conio.h>
#include <io.h>
#include <windows.h>

#define RECORD 196
#define CHAR_RECORD 166
#define NAME_LEN 20
#define MAX_MONSTERS 128
#define MAX_HEROES 32
#define MAX_INV 64

typedef struct {
    char name[NAME_LEN + 1];
    int tier;
    int disposition;
    int life;
    int to_hit;
    int to_damage;
    int defense;
    int armor;
    int speech;
    int gender;
    int prize;
    int hp_lo;
    int hp_hi;
    int magic;
    int guard;
    int speed;
    int verbs;
    int ability[8];
    int staff;
    int lair; /* [0xF0], the lair tile 16-20 */
    char desc[2][66];
} Monster;

typedef struct {
    char name[21];
    char class_name[8];
    char race[6];
    int level;
    int hp;
    int max_hp;
    int str;
    int intel;
    int con;
    int dex;
    int chr;
    int lck;
    int to_hit;
    int to_damage;
    int defense;
    int armor;
    int to_charm;
    int gold;
    int xp;
    int sickness;
    int wishes;
    int down;
    int blind;
    int invisible;
    int haste;
    int shield;
    int trap_ward;
    int dream_wolf;
    int run_mode;
    int song;
    int song_bonus;
    int dispel;
    int foe_sleep;
    int pet;
    char pet_name[21];
    int pet_hp;
    int pet_max_hp;
    int pet_extra;
    int pet_to_hit;
    int pet_to_damage;
    int pet_defense;
    int pet_armor;
    int pet_speed;
    int spell_max[5];
    int spell_left[5];
    int staff_red;
    int staff_black;
    int staff_white;
    int staff_gold;
    int staff_power;
    char killer[21];
    int death_floor;
    int floor;          /* var_01F4, record +60: 0 in town */
    char file[9];
    char save_path[260];
    int save_slot;
    int inv_n;
    unsigned char inv[MAX_INV][68];
} Hero;

static char party_path[260];
/* The USER.SBS record at DS 0xA90 and its number, var_0096. */
static unsigned char user_rec[87];
static long user_no;
/* SYSTEM.SBS at DS 0xA7A: mode, max users, max live characters, starting
   blocked hour, hours blocked, time limit (minutes), master password. */
static unsigned char sys_rec[21];
static int session_end; /* var_0060, minutes after midnight; 0 for none */
static int time_up;     /* var_0062 */

/* The live console. With a console on both ends the screen calls of the original run
   on an 80 by 25 window: color_25283 (COLOR), proc_253B3 (LOCATE), proc_21194 (blank
   rows), proc_2311E (row 25 in 15 on 4), the key reader proc_243D9 with the mouse and
   the background PLAY of mnt120_24D5C. Through a pipe they do nothing and the text goes
   out as it is. */
static void check_time(void);
static int live;
static HANDLE con_out = INVALID_HANDLE_VALUE;
static void force_console_80x25(void);
static HANDLE con_in = INVALID_HANDLE_VALUE;
static int color_on = 1;   /* [0x56] */
static int sound_on;       /* [0x52] */
static int mouse_on;       /* [0x66] */
static int mouse_desc;     /* [0x8A] */
static int alarm_on;       /* USER.SBS +86 is CHR$(7) */
static int cur_row = 1, cur_col = 1;
static int win_top = 1, win_bot = 24, win_left = 1, win_right = 80;
static int at_fresh;       /* newlines right after a LOCATE are dropped */
static WORD cur_attr = 7;
static int mouse_left = 13, mouse_right = 27;              /* DS 112 and 114 */
static const char *mouse_left_name = "ENTER", *mouse_right_name = "ESCAPE"; /* DS 116 and 126 */
static volatile LONG key_waiting;

/* color_25283. Without color: 0 on 7 for 7 or 15 on 4 or 12 and for 0 on 7 or 15, else 7 on 0. */
static WORD attr_of(int fg, int bg) {
    if (!color_on) {
        int rev = ((fg == 7 || fg == 15) && (bg == 12 || bg == 4)) || ((bg == 7 || bg == 15) && fg == 0);
        fg = rev ? 0 : 7;
        bg = rev ? 7 : 0;
    }
    return (WORD)((fg & 15) | ((bg & 7) << 4));
}

static void scr_color(int fg, int bg) {
    cur_attr = attr_of(fg, bg);
}

static wchar_t cp437_glyph(unsigned char c) {
    static const wchar_t low[32] = {
        0x0020, 0x263A, 0x263B, 0x2665, 0x2666, 0x2663, 0x2660, 0x2022,
        0x25D8, 0x25CB, 0x25D9, 0x2642, 0x2640, 0x266A, 0x266B, 0x263C,
        0x25BA, 0x25C4, 0x2195, 0x203C, 0x00B6, 0x00A7, 0x25AC, 0x21A8,
        0x2191, 0x2193, 0x2192, 0x2190, 0x221F, 0x2194, 0x25B2, 0x25BC,
    };
    wchar_t w = L'?';
    if (c < 32) return low[c];
    if (c == 127) return 0x2302;
    MultiByteToWideChar(437, 0, (LPCCH)&c, 1, &w, 1);
    return w;
}

static void scr_cells(int row, int col, const char *s, int n, WORD attr) {
    COORD pos;
    DWORD wrote;
    wchar_t w[80];
    int i;
    if (!live || n <= 0 || row < 1 || row > 25 || col < 1 || col > 80) return;
    if (col - 1 + n > 80) n = 81 - col;
    for (i = 0; i < n; i++) w[i] = cp437_glyph((unsigned char)s[i]);
    pos.X = (SHORT)(col - 1);
    pos.Y = (SHORT)(row - 1);
    WriteConsoleOutputCharacterW(con_out, w, (DWORD)n, pos, &wrote);
    FillConsoleOutputAttribute(con_out, attr, (DWORD)n, pos, &wrote);
}

static void scr_put(int row, int col, const char *s, WORD attr) {
    scr_cells(row, col, s, (int)strlen(s), attr);
}

static void scr_blank(int row, int col, int n) {
    char sp[80];
    memset(sp, ' ', sizeof sp);
    scr_cells(row, col, sp, n > 80 ? 80 : n, 7);
}

/* proc_253B3 */
static void scr_at(int row, int col) {
    cur_row = row;
    cur_col = col;
    at_fresh = 1;
}

/* proc_21194: blank the rows, then LOCATE top, 1. The full screen is the window again. */
static void scr_clear(int top, int bottom) {
    int r;
    for (r = top; r <= bottom; r++) scr_blank(r, 1, 80);
    win_top = 1;
    win_bot = 24;
    win_left = 1;
    win_right = 80;
    scr_at(top, 1);
}

/* The rows and columns text runs in. A newline past the bottom holds, then blanks it. */
static void scr_region(int top, int bottom, int left, int right) {
    win_top = top;
    win_bot = bottom;
    win_left = left;
    win_right = right;
    scr_at(top, left);
}

static void scr_window(int top, int bottom, int left, int right) {
    int r;
    for (r = top; r <= bottom; r++) scr_blank(r, left, right - left + 1);
    scr_region(top, bottom, left, right);
}

/* proc_2311E, then the key reader blanks row 25 with SPACE$(79). */
static void scr_status(const char *s) {
    scr_cells(25, 1, s, (int)strlen(s), color_on ? 0x4F : 0x70);
}

static void scr_cursor(void) {
    COORD pos;
    if (!live) return;
    pos.X = (SHORT)((cur_col > 80 ? 80 : cur_col) - 1);
    pos.Y = (SHORT)((cur_row > 25 ? 25 : cur_row) - 1);
    SetConsoleCursorPosition(con_out, pos);
}

static int read_key(void);
static void alarm(void);
static void read_line(char *line, int cap);

/* PRINT past the bottom of the text window scrolls it up a line, as QB does. */
static void scr_newline(void) {
    cur_col = win_left;
    if (++cur_row > win_bot) {
        SMALL_RECT r;
        COORD to;
        CHAR_INFO fill;
        cur_row = win_bot;
        r.Left = (SHORT)(win_left - 1);
        r.Right = (SHORT)(win_right - 1);
        r.Top = (SHORT)win_top;
        r.Bottom = (SHORT)(win_bot - 1);
        to.X = r.Left;
        to.Y = (SHORT)(win_top - 1);
        fill.Char.AsciiChar = ' ';
        fill.Attributes = 7;
        if (win_bot > win_top) ScrollConsoleScreenBufferA(con_out, &r, NULL, to, &fill);
        scr_blank(win_bot, win_left, win_right - win_left + 1);
    }
}

static void scr_text(const char *s) {
    while (*s) {
        int n = 0;
        if (*s == '\n') {
            if (!at_fresh) scr_newline();
            s++;
            continue;
        }
        if (*s == '\r') {
            s++;
            continue;
        }
        at_fresh = 0;
        if (cur_col > win_right) scr_newline();
        while (s[n] && s[n] != '\n' && s[n] != '\r' && cur_col + n <= win_right) n++;
        scr_cells(cur_row, cur_col, s, n, cur_attr);
        cur_col += n;
        s += n;
    }
}

static int sb_printf(const char *fmt, ...) {
    char buf[4096];
    va_list ap;
    int n;
    va_start(ap, fmt);
    if (!live) {
        n = vprintf(fmt, ap);
        va_end(ap);
        return n;
    }
    n = vsnprintf(buf, sizeof buf, fmt, ap);
    va_end(ap);
    scr_text(buf);
    return n;
}

static void sb_write(const void *data, size_t n) {
    char s[256];
    size_t i;
    if (!live) {
        fwrite(data, 1, n, stdout);
        return;
    }
    if (n > sizeof s - 1) n = sizeof s - 1;
    for (i = 0; i < n; i++) s[i] = ((const char *)data)[i] ? ((const char *)data)[i] : ' ';
    s[n] = 0;
    scr_text(s);
}

static int sb_putchar(int c) {
    char s[2];
    if (!live) return putchar(c);
    s[0] = (char)c;
    s[1] = 0;
    scr_text(s);
    return c;
}

/* stay_12801: the twelve choices three to a row at column 42, the last direction lit in 1 on 7. */
static int stay_sel = 5;

static void stay_grid(void) {
    static const char *const item[12] = {"\\", "\x18", "/", "\x1b", "STAY", "\x1a", "/", "\x19", "\\",
                                         "(M)enu", "(Q)uit", "(H)elp"};
    int i;
    for (i = 0; i < 12; i++)
        scr_cells(2 + i / 3, 42 + (i % 3) * 12, item[i], (int)strlen(item[i]), i + 1 == stay_sel ? attr_of(1, 7) : 7);
}

/* proc_0AA39: the right panel, rows 2-9 from column 42, for the cast and sing menus.
   The text window in use (the dungeon panel or the fight window) comes back after. */
static int panel_saved[6];

static void panel_open(void) {
    panel_saved[0] = win_top;
    panel_saved[1] = win_bot;
    panel_saved[2] = win_left;
    panel_saved[3] = win_right;
    panel_saved[4] = cur_row;
    panel_saved[5] = cur_col;
    scr_window(2, 9, 42, 79);
}

static int panel_choose(const char *const *item, int n, int row) {
    int cur = 1, i, key;
    WORD hi = attr_of(1, 7);
    for (i = 0; i < n; i++) scr_put(row + i, 42, item[i], i == 0 ? hi : 7);
    for (;;) {
        int prev = cur;
        key = read_key();
        if (key == 13 || key == 27) break;
        if (key < 256 && key != 13) {
            int uc = toupper(key);
            for (i = 0; i < n; i++) {
                const char *s = item[i];
                if (s[0] == '(' && toupper((unsigned char)s[1]) == uc && s[2] == ')') {
                    key = uc; goto done;
                }
            }
            scr_status("Unknown key was hit");
            alarm();
            continue;
        }
        if (key == 256 + 72)      cur--;         /* Up   */
        else if (key == 256 + 80) cur++;          /* Down */
        else if (key == 256 + 71) cur = 1;        /* Home */
        else if (key == 256 + 79) cur = n;         /* End  */
        else continue;
        if (cur < 1) cur = 1;
        if (cur > n) cur = n;
        if (cur != prev) {
            scr_put(row + prev - 1, 42, item[prev - 1], 7);
            scr_put(row + cur - 1, 42, item[cur - 1], hi);
        }
    }
    if (key == 13) {
        const char *s = item[cur - 1];
        key = (s[0] == '(' && s[2] == ')') ? toupper((unsigned char)s[1])
                                            : toupper((unsigned char)s[0]);
    }
done:
    scr_window(2, 9, 42, 79);
    scr_region(panel_saved[0], panel_saved[1], panel_saved[2], panel_saved[3]);
    if (panel_saved[0] != 2) scr_at(panel_saved[4], panel_saved[5]);
    return key < 256 ? key : 0;
}

/* LOCATE row, col: PRINT text (locate_print_21DEA). */
static void at_print(int row, int col, int fg, int bg, const char *s) {
    scr_color(fg, bg);
    scr_at(row, col);
    sb_printf("%s\n", s);
    scr_color(7, 0);
}

/* menu_choice_225B8's grid: item i at row + (i - 1) \ cols, col + ((i - 1) MOD cols) * INT((80 - col) / cols). */
/* menu_items removed: replaced by menu_choice and panel_choose usage. */

/* menu_choice_225B8: light-bar selector. Arrows navigate, Enter confirms, typed
   letters return immediately when they match an item's "(X) " prefix. Escape
   returns 27. In piped mode, prints items and reads a line instead. */
static int menu_choice(const char *const *item, int n, int cols, int col, int row,
                        const char *lead) {
    if (!live) {
        char line[64];
        int i;
        for (i = 0; i < n; i++) sb_printf("%s%s\n", lead, item[i]);
        read_line(line, sizeof line);
        if (feof(stdin)) return 'Q';
        return toupper((unsigned char)line[0]);
    }
    {
        /* Enhanced menu_choice with basic paging support when the item grid
           does not fit vertically. It supports arrow navigation, Home/End,
           Enter to choose, typed letter shortcuts for '(X) ' prefixes, and
           Escape to cancel. In non-live (piped) mode it prints items and
           falls back to read_line as before. */
        int cell_w = (80 - col) / cols;
        int cur = 1;
        int i;
        WORD hi = attr_of(1, 7);
        int rows_avail = 25 - row + 1;
        if (rows_avail < 1) rows_avail = 1;
        int start_row = 0; /* start index in rows (0-based) */

        auto_draw:
        /* draw visible window */
        for (i = 0; i < n; i++) {
            int item_row = i / cols;
            int item_col = i % cols;
            if (item_row < start_row || item_row >= start_row + rows_avail) continue;
            int r = row + (item_row - start_row);
            int c = col + item_col * cell_w;
            scr_cells(r, c, item[i], (int)strlen(item[i]), (i + 1 == cur) ? hi : 7);
        }

        for (;;) {
            int key = read_key();
            int prev = cur;
            if (key == 13) {
                const char *s = item[cur - 1];
                /* If item begins with (X) return the X, else return first char */
                if (s[0] == '(') {
                    /* parse multi-digit number inside parentheses if present */
                    int j = 1;
                    int num = 0;
                    int has_digit = 0;
                    while (s[j] && s[j] >= '0' && s[j] <= '9') { has_digit = 1; num = num * 10 + (s[j] - '0'); j++; }
                    if (has_digit) return num; /* return numeric pick */
                    if (s[2] == ')') return toupper((unsigned char)s[1]);
                }
                return toupper((unsigned char)s[0]);
            }
            if (key == 27) return 27;
            if (key < 256 && key != 13) {
                int uc = toupper(key);
                for (i = 0; i < n; i++) {
                    const char *s = item[i];
                    if (s[0] == '(' && toupper((unsigned char)s[1]) == uc && s[2] == ')')
                        return uc;
                }
                scr_status("Unknown key was hit");
                alarm();
                continue;
            }
            if (key == 256 + 72)      cur -= cols;        /* Up    */
            else if (key == 256 + 80) cur += cols;        /* Down  */
            else if (key == 256 + 75) cur--;              /* Left  */
            else if (key == 256 + 77) cur++;              /* Right */
            else if (key == 256 + 71) cur = 1;            /* Home  */
            else if (key == 256 + 79) cur = n;            /* End   */
            else continue;
            if (cur < 1) cur = 1;
            if (cur > n) cur = n;
            /* adjust start_row to keep cur visible */
            {
                int cur_row_idx = (cur - 1) / cols;
                if (cur_row_idx < start_row) start_row = cur_row_idx;
                else if (cur_row_idx >= start_row + rows_avail) start_row = cur_row_idx - rows_avail + 1;
            }
            if (cur != prev) {
                /* redraw previous and current visible items that changed */
                int prev_row_idx = (prev - 1) / cols;
                int cur_row_idx = (cur - 1) / cols;
                /* If visible window changed, do full redraw */
                if (abs(prev_row_idx - cur_row_idx) > 1) {
                    /* clear and redraw window */
                    int rr;
                    for (rr = 0; rr < rows_avail; rr++) scr_blank(row + rr, col, 81 - col);
                    goto auto_draw;
                } else {
                    int r, c;
                    r = row + ((prev - 1) / cols - start_row); c = col + ((prev - 1) % cols) * cell_w;
                    if (r >= row && r < row + rows_avail) scr_cells(r, c, item[prev - 1], (int)strlen(item[prev - 1]), 7);
                    r = row + ((cur - 1) / cols - start_row); c = col + ((cur - 1) % cols) * cell_w;
                    if (r >= row && r < row + rows_avail) scr_cells(r, c, item[cur - 1], (int)strlen(item[cur - 1]), hi);
                }
                /* if window changed due to start_row movement, redraw window */
                if ((prev - 1) / cols < start_row || (prev - 1) / cols >= start_row + rows_avail ||
                    (cur - 1) / cols < start_row || (cur - 1) / cols >= start_row + rows_avail) {
                    goto auto_draw;
                }
            }
        }
    }
}

/* mnt120_24D5C: MN T120, then one phrase each time fewer than 7 notes are left. */
static const char *const tune[38] = {
    "MNT120",
    "MBL16O1G#O2C#EG#C#EG#AEG#AO3EO2G#O3C#E", "MBL16O3G#C#EF#O4C#O3EG#O4C#EO3G#O4C#EL8G#G#",
    "MBL16O1G#CO2D#G#O1CO2D#G#CD#G#CO3D#O2G#CO3D#", "MBL16O3G#CD#G#O4CO3D#G#O4CD#O3G#O4CD#L8F#F#",
    "MBL16O2C#F#G#O3C#O2F#G#O3C#F#O2G#O3C#F#G#C#F#G#", "MBL16O4C#O3F#G#O4C#F#O3G#O4C#F#G#C#F#G#L8O5C#C#",
    "MBL16O2C#F#AO3C#C#F#A#O4C#C#F#A#O5L8C#C#", "MBL16O2C#EFO3C#C#EFO4C#C#EFL8O5C#C#",
    "MBL16O3G#O4G#O3G#O4G#O3A#O4G#O4CG#C#G#D#G#CG#", "MBL16O4F#G#EG#EG#D#G#D#G#C#G#C#G#L4C",
    "MBL16O3G#O4G#O3G#O4G#O3A#O4G#O4CG#C#G#D#G#CG#", "MBL16O4F#G#EG#EG#D#G#D#G#C#G#C#G#CG#",
    "MBL16O3G#O4G#O3AO4FO3G#O4G#O3AO4FO3G#O4G#O3AO4FO3G#O4G#O3AO4F", "MBL8O4G#O2L2G#.",
    "MBL16O1G#O2C#EG#C#EG#O3C#O2EG#O3C#EO2G#O3C#E", "MBL16O3G#C#EG#O4C#O3EG#O4C#EEG#O5C#L8EE",
    "MBL16O2EFO3C#EO2FO3C#EFC#EFO4C#O3EFO4C#", "MBL16O4EO3FO4C#EFC#EFO5C#O4EFO5C#L8EE",
    "MBL16O2D#A#O3C#D#O2A#O3C#D#A#C#D#A#O4C#O3D#A#O4C#", "MBL16O4D#O2A#O3C#D#A#O4C#D#A#O4C#D#A#O5C#L8D#D#",
    "MBL16O4D#O3A#O4C#D#A#C#D#A#O5C#O4A#D#C#A#D#C#O3A#", "MBL16O4C#EF#G#ABO5C#O4BAEF#G#ABO5C#O4A",
    "MBL16O4GEF#G#ABO5C#O4BAEF#G#ABO5C#DE", "MBL16O5F#D#ED#EC#O4BAG#AG#F#G#F#G#O3E",
    "MBL16O3F#EF#C#EC#EC#EF#G#ABO4C#O3B", "MBL16O3AEF#G#ABO4C#O3BAEF#G#ABO4C#O3B",
    "MBL16O3AEF#G#ABO4C#DEF#G#ABO5C#DD#L4E", "MBL08O4AF#C#O3AF#C#AF#C#O2AF#C#",
    "MBL16O2AF#C#AC#F#AO3C#F#AO4C#F#AF#C#O3A", "MBL16O2AF#DO1AO2DF#AO3DF#AO4DF#AF#DO3A",
    "MBL08O5C#O4A#F#EC#O3A#O4EC#O3A#F#EC#O2A#", "MBL16O3EC#O2A#F#EC#EF#A#C#ED#A#C#ED#A#O5C#O4A#E",
    "MBL08O5EC#O4G#EC#O3G#O4EC#O3G#L16EO4C#O3G#E", "MBL16O3C#G#EC#O2G#O3EC#O2G#EO3C#O2G#EC#G#EC#",
    "MBL16O1GAA#BO2CC#C#D#EFF#F#G#AA#B", "MBL16O3CC#C#D#EFF#F#G#AA#BO4CC#DD#EFF#F#G#",
    "MBL32O4G#F#ED#F#C#CO4D#O3AG#F#AED#EC#CD#O2AG#F#AED#F#C#CD#O1AG#L1C#",
};
static int tune_at;              /* var_0054 */
static int play_tempo = 120, play_len = 4, play_octave = 4, play_style = 7;

static int play_num(const char **p) {
    int n = 0;
    while (isdigit((unsigned char)**p)) n = n * 10 + *(*p)++ - '0';
    return n;
}

/* PLAY: T tempo, L length, O octave, < >, MN ML MS MB MF, notes A-G with # + - and a length, dots, P or R rests. */
static void play_string(const char *p) {
    static const int step[7] = {9, 11, 0, 2, 4, 5, 7};
    while (*p) {
        int c = toupper((unsigned char)*p++);
        int len = play_len;
        int note = -1;
        double ms;
        if (c == 'M') {
            c = toupper((unsigned char)*p);
            if (c) p++;
            if (c == 'N') play_style = 7;
            else if (c == 'L') play_style = 8;
            else if (c == 'S') play_style = 6;
            continue;
        }
        if (c == 'T') { int t = play_num(&p); if (t >= 32) play_tempo = t; continue; }
        if (c == 'L') { int l = play_num(&p); if (l >= 1) play_len = l; continue; }
        if (c == 'O') { play_octave = play_num(&p) % 7; continue; }
        if (c == '<') { if (play_octave > 0) play_octave--; continue; }
        if (c == '>') { if (play_octave < 6) play_octave++; continue; }
        if (c >= 'A' && c <= 'G') {
            note = play_octave * 12 + step[c - 'A'];
            if (*p == '#' || *p == '+') { note++; p++; }
            else if (*p == '-') { note--; p++; }
        } else if (c == 'N') {
            int n = play_num(&p);
            note = n > 0 ? n - 1 : -1;
            len = play_len;
        } else if (c != 'P' && c != 'R') {
            continue;
        }
        if (isdigit((unsigned char)*p)) { int l = play_num(&p); if (l >= 1) len = l; }
        ms = 240000.0 / (play_tempo * len);
        while (*p == '.') { ms *= 1.5; p++; }
        if (note >= 0) {
            double hz = 261.63 * pow(2.0, (note - 36) / 12.0);
            DWORD on = (DWORD)(ms * play_style / 8.0);
            if (hz >= 37.0 && hz <= 32767.0 && on > 0) Beep((DWORD)hz, on);
            if (ms > on) Sleep((DWORD)(ms - on));
        } else {
            Sleep((DWORD)ms);
        }
    }
}

/* The background music: a phrase whenever the key reader is waiting and the sound is on. */
static DWORD WINAPI music_thread(LPVOID unused) {
    (void)unused;
    for (;;) {
        if (sound_on && key_waiting) {
            tune_at = (tune_at > 37 || tune_at < 1) ? 1 : tune_at + 1;
            play_string(tune[tune_at - 1]);
        } else {
            Sleep(50);
        }
    }
    return 0;
}

static void force_console_80x25(void) {
    CONSOLE_SCREEN_BUFFER_INFO info;
    SMALL_RECT tiny = {0, 0, 0, 0};
    SMALL_RECT win = {0, 0, 79, 24};
    COORD size = {80, 25};
    DWORD written;
    COORD home = {0, 0};
    /* Shrink visible window, set exact 80x25 buffer, then show 80x25. Do NOT
       MoveWindow here ? an async HWND resize after painting corrupts the buffer. */
    SetConsoleWindowInfo(con_out, TRUE, &tiny);
    SetConsoleScreenBufferSize(con_out, size);
    SetConsoleWindowInfo(con_out, TRUE, &win);
    if (GetConsoleScreenBufferInfo(con_out, &info)) {
        DWORD cells = (DWORD)info.dwSize.X * (DWORD)info.dwSize.Y;
        FillConsoleOutputCharacterA(con_out, ' ', cells, home, &written);
        FillConsoleOutputAttribute(con_out, 7, cells, home, &written);
    }
    SetConsoleCursorPosition(con_out, home);
}

static void live_start(void) {
    DWORD mode;
    con_out = GetStdHandle(STD_OUTPUT_HANDLE);
    con_in = GetStdHandle(STD_INPUT_HANDLE);
    live = GetConsoleMode(con_out, &mode) && GetConsoleMode(con_in, &mode);
    if (!live) return;
    SetConsoleOutputCP(437);
    SetConsoleCP(437);
    force_console_80x25();
    SetConsoleMode(con_in, ENABLE_EXTENDED_FLAGS | ENABLE_MOUSE_INPUT | ENABLE_WINDOW_INPUT);
    if (GetConsoleMode(con_out, &mode)) {
        mode |= ENABLE_PROCESSED_OUTPUT;
        mode &= ~ENABLE_WRAP_AT_EOL_OUTPUT;
#ifdef ENABLE_VIRTUAL_TERMINAL_PROCESSING
        mode &= ~ENABLE_VIRTUAL_TERMINAL_PROCESSING;
#endif
        SetConsoleMode(con_out, mode);
    }
    CreateThread(NULL, 0, music_thread, NULL, 0, NULL);
    scr_clear(1, 25);
}

/* left_mouse_button_is_24897 through proc_24259: row 24 filled in 15 on 5, the text centred. */
static void mouse_show(void) {
    char text[81];
    int n;
    if (!live || !mouse_on || !mouse_desc) return;
    n = snprintf(text, sizeof text, "LEFT MOUSE BUTTON IS %s; RIGHT MOUSE BUTTON IS %s", mouse_left_name, mouse_right_name);
    if (n > 80) n = 80;
    scr_cells(24, 1, "                                                                                ", 80, attr_of(15, 5));
    scr_cells(24, (80 - n) / 2 > 1 ? (80 - n) / 2 : 1, text, n, attr_of(15, 5));
}

static void mouse_buttons(int left, const char *left_name, int right, const char *right_name) {
    mouse_left = left;
    mouse_left_name = left_name;
    mouse_right = right;
    mouse_right_name = right_name;
    mouse_show();
}

/* proc_243D9. Extended keys come back as 256 + the scan code. A mouse move by a
   cell comes back as that arrow (or diagonal), the buttons as DS 112 and 114. */
static int read_key(void) {
    static COORD last = {-1, -1};
    static DWORD buttons;
    int key = 0;
    scr_cursor();
    InterlockedExchange(&key_waiting, 1);
    while (!key) {
        INPUT_RECORD rec;
        DWORD got = 0;
        check_time();
        if (WaitForSingleObject(con_in, 100) != WAIT_OBJECT_0) continue;
        if (!ReadConsoleInputA(con_in, &rec, 1, &got) || got == 0) continue;
        if (rec.EventType == KEY_EVENT && rec.Event.KeyEvent.bKeyDown) {
            unsigned char ch = (unsigned char)rec.Event.KeyEvent.uChar.AsciiChar;
            WORD scan = rec.Event.KeyEvent.wVirtualScanCode;
            WORD vk = rec.Event.KeyEvent.wVirtualKeyCode;
            if (vk == VK_SHIFT || vk == VK_CONTROL || vk == VK_MENU || vk == VK_CAPITAL || vk == VK_NUMLOCK) continue;
            if (!scan) scan = (WORD)MapVirtualKeyA(vk, MAPVK_VK_TO_VSC);
            if (vk == VK_TAB && (rec.Event.KeyEvent.dwControlKeyState & SHIFT_PRESSED)) key = 256 + 15;
            else key = ch ? ch : 256 + scan;
        } else if (rec.EventType == MOUSE_EVENT && mouse_on) {
            MOUSE_EVENT_RECORD *m = &rec.Event.MouseEvent;
            DWORD down = m->dwButtonState & ~buttons;
            buttons = m->dwButtonState;
            if (m->dwEventFlags == 0 && (down & FROM_LEFT_1ST_BUTTON_PRESSED)) key = mouse_left;
            else if (m->dwEventFlags == 0 && (down & RIGHTMOST_BUTTON_PRESSED)) key = mouse_right;
            else if (m->dwEventFlags & MOUSE_MOVED) {
                int dx = last.X < 0 ? 0 : m->dwMousePosition.X - last.X;
                int dy = last.Y < 0 ? 0 : m->dwMousePosition.Y - last.Y;
                static const int grid[3][3] = {{71, 72, 73}, {75, 0, 77}, {79, 80, 81}};
                last = m->dwMousePosition;
                dx = dx > 0 ? 1 : dx < 0 ? -1 : 0;
                dy = dy > 0 ? 1 : dy < 0 ? -1 : 0;
                if (dx || dy) key = 256 + grid[dy + 1][dx + 1];
            }
        }
    }
    InterlockedExchange(&key_waiting, 0);
    scr_blank(25, 1, 79);
    return key;
}

static void alarm(void) {
    if (alarm_on) MessageBeep(MB_OK);
}

/* invalid_key_was_hit_23200, the field editor: the prompt in 15, the text in 14.
   Home, End, the arrows, Backspace, Del and Ins edit; Enter takes it; Esc gives
   CHR$(27). Any other control or extended key: "Invalid key was hit". */
static void edit_field(char *line, int cap) {
    char text[256];
    int len = 0, at = 0, insert = 1;
    int row = cur_row, col = cur_col;
    int max = cap - 2 < (int)sizeof text - 1 ? cap - 2 : (int)sizeof text - 1;
    if (col > 80) {
        row++;
        col = 1;
    }
    if (max > 81 - col) max = 81 - col;
    if (max < 1) max = 1;
    for (;;) {
        int key;
        scr_blank(row, col, max);
        scr_cells(row, col, text, len, color_on ? 14 : 7);
        cur_row = row;
        cur_col = col + at;
        key = read_key();
        if (key == 13) break;
        if (key == 27) {
            line[0] = 27;
            line[1] = 0;
            scr_at(row + 1, win_left);
            return;
        }
        if (key == 256 + 71) at = 0;
        else if (key == 256 + 79) at = len;
        else if (key == 256 + 75) { if (at > 0) at--; }
        else if (key == 256 + 77) { if (at < len) at++; }
        else if (key == 256 + 82) insert = !insert;
        else if (key == 256 + 83) {
            if (at < len) { memmove(text + at, text + at + 1, (size_t)(len - at - 1)); len--; }
        } else if (key == 8) {
            if (at > 0) { memmove(text + at - 1, text + at, (size_t)(len - at)); len--; at--; }
        } else if (key >= 32 && key < 256) {
            if (insert && len < max) {
                memmove(text + at + 1, text + at, (size_t)(len - at));
                text[at++] = (char)key;
                len++;
            } else if (!insert && at < max) {
                text[at++] = (char)key;
                if (at > len) len = at;
            }
        } else {
            scr_status("Invalid key was hit");
            alarm();
        }
    }
    memcpy(line, text, (size_t)len);
    line[len] = '\n';
    line[len + 1] = 0;
    scr_at(row + 1, win_left);
}

#define printf sb_printf
#define putchar sb_putchar

/* rec+146, the killer name dun_0E905 hands the Hall of Fame. */
static void set_killer(Hero *hero, const char *cause) {
    snprintf(hero->killer, sizeof hero->killer, "%s", cause);
}
static unsigned basic_seed = 0x00050000u;

/* RT_2732_79CA. 24-bit generator, result / 2^24, same range as BASIC RND. */
static float basic_rnd(void) {
    unsigned lo = basic_seed & 0xFFFFu;
    unsigned hi = (basic_seed >> 16) & 0xFFFFu;
    unsigned product = lo * 17405u;
    unsigned di = product & 0xFFFFu;
    unsigned bx = (product >> 16) & 0xFFFFu;
    unsigned sum;
    unsigned carry;
    bx = (bx + ((hi * 17405u) & 0xFFFFu)) & 0xFFFFu;
    bx = (bx + (product & 0xFFFFu)) & 0xFFFFu;
    sum = di + 40643u;
    carry = sum > 0xFFFFu ? 1u : 0u;
    di = sum & 0xFFFFu;
    bx = ((bx & 0xFFu) + 0xC3u + carry) & 0xFFu;
    basic_seed = (bx << 16) | di;
    return (float)basic_seed / 16777216.0f;
}

static int basic_int(float x) {
    int i = (int)x;
    if ((float)i > x) i--;
    return i;
}

static float class_scale(const char *class_name) {
    if (strcmp(class_name, "MAGE") == 0) return 0.85f;
    if (strcmp(class_name, "BARD") == 0) return 1.0f;
    return 1.25f;
}

static int scaled_stat(int sum, float scale, int level) {
    return basic_int((float)sum * scale / 20.0f) + level;
}

static void rate_hero(Hero *h) {
    float scale = class_scale(h->class_name);
    h->to_hit = scaled_stat(2 * h->str + 4 * h->dex + h->intel + h->lck, scale, h->level);
    h->to_damage = scaled_stat(7 * h->str + h->lck, scale, h->level);
    h->armor = scaled_stat(7 * h->con + h->lck, scale, h->level);
    h->defense = scaled_stat(5 * h->dex + h->str + h->intel + h->lck, scale, h->level);
    h->to_charm = basic_int((float)(2 * h->intel + h->str + h->dex + 20 * h->chr + h->lck) / 40.0f) + h->level;
    if (h->shield > 0) {
        h->armor += 2;
        h->defense += 2;
    }
    if (h->invisible > 0) {
        h->to_hit += 2;
        h->defense += 2;
    }
    if (h->song == 2) {
        h->to_hit++;
        h->to_damage++;
        h->armor++;
        h->defense++;
    } else if (h->song == 3) {
        h->to_charm += 4;
    }
}

static int field_i16(const unsigned char *p) {
    return (int16_t)(p[0] | (p[1] << 8));
}

/* The magic scale is 1 for a fighter, 2 for a bard, 4 for a mage. */
static float magic_scale(const char *class_name) {
    if (strcmp(class_name, "MAGE") == 0) return 4.0f;
    if (strcmp(class_name, "BARD") == 0) return 2.0f;
    return 1.0f;
}

static int wears_effect(const Hero *h, int effect) {
    int i;
    for (i = 0; i < h->inv_n; i++) {
        if (field_i16(h->inv[i] + 64) == 1 && field_i16(h->inv[i] + 54) == effect) return 1;
    }
    return 0;
}

/* var_00A2 in mage_0C4A1. Only a mage keeps it; the others multiply it by 0. */
static int spell_power(const Hero *h) {
    int power;
    if (strcmp(h->class_name, "MAGE") != 0) return 0;
    power = scaled_stat(7 * h->intel + h->lck, magic_scale(h->class_name), h->level);
    if (wears_effect(h, 37)) power = (int)rintf((float)power * 1.5f);
    return power;
}

/* var_00A6. With an effect-37 item worn, the original stores 1.5 times the
   already raised var_00A4 here instead of raising its own value. */
static int item_power(const Hero *h) {
    float scale = magic_scale(h->class_name);
    if (wears_effect(h, 37)) {
        int a4 = scaled_stat(5 * h->intel + 2 * h->dex + h->lck, scale, h->level);
        a4 = (int)rintf((float)a4 * 1.5f);
        return (int)rintf((float)a4 * 1.5f);
    }
    return scaled_stat(3 * h->dex + 4 * h->intel + h->lck, scale, h->level);
}

/* var_00A4. The monsters' sickness, paralyze, charm, stone and spells roll against it. */
static int magic_resist(const Hero *h) {
    int a4 = scaled_stat(5 * h->intel + 2 * h->dex + h->lck, magic_scale(h->class_name), h->level);
    if (wears_effect(h, 37)) a4 = (int)rintf((float)a4 * 1.5f);
    return a4;
}

/* var_00AC, with the class value at [0x102]: fighter 0.75, bard 3, mage 0.85.
   Scream, ice, lightning and fire damage are divided by it. */
static float guard_scale(const Hero *h) {
    if (strcmp(h->class_name, "MAGE") == 0) return 0.85f;
    if (strcmp(h->class_name, "BARD") == 0) return 3.0f;
    return 0.75f;
}

static int special_guard(const Hero *h) {
    return scaled_stat(3 * h->intel + 4 * h->dex + h->lck, guard_scale(h), h->level);
}

/* var_00AE. Your side of the run contest, against the monster's guard.
   Any song costs one point. */
static int run_rating(const Hero *h) {
    return scaled_stat(6 * h->dex + h->intel + h->lck, guard_scale(h), h->level) - (h->song > 0);
}

/* [0xB2] for effect 4 (regeneration) and [0xD4] for effect 9 (boots):
   the byte-56 bonus summed over the worn items with that effect. */
static int worn_bonus(const Hero *h, int effect) {
    int i;
    int sum = 0;
    for (i = 0; i < h->inv_n; i++) {
        if (field_i16(h->inv[i] + 64) == 1 && field_i16(h->inv[i] + 54) == effect)
            sum += field_i16(h->inv[i] + 56);
    }
    return sum;
}

/* [0x210] haste plus [0xBC], which is 1 and one more for each worn effect-6 item. */
static int hero_speed(const Hero *h) {
    int i;
    int speed = 1 + h->haste + (h->song == 2);
    for (i = 0; i < h->inv_n; i++) {
        if (field_i16(h->inv[i] + 64) == 1 && field_i16(h->inv[i] + 54) == 6) speed++;
    }
    return speed;
}

/* [0xF2]: a worn effect-24 item or the song of dispelling. [0x15E]: the dispel spell. */
static int spell_shield(const Hero *h) {
    return h->dispel || h->song == 4 || wears_effect(h, 24);
}

static void item_name(char *dst, int cap, const unsigned char *rec) {
    int i;
    int len = 0;
    if (cap < 1) return;
    for (i = 0; i < 26 && rec[i] >= 32 && rec[i] < 127 && len < cap - 1; i++) dst[len++] = (char)rec[i];
    while (len > 0 && dst[len - 1] == ' ') len--;
    dst[len] = 0;
}

/* mage_0C4A1 adds the bonus at byte 56 when byte 64 is 1. */
static void add_worn_bonus(Hero *h, const unsigned char *rec) {
    int type = field_i16(rec + 54);
    int bonus = field_i16(rec + 56);
    if (field_i16(rec + 64) != 1) return;
    if (type == 1 || type == 35 || type == 36) {
        h->to_hit += bonus;
        h->to_damage += bonus;
    } else if (type == 2) {
        h->armor += bonus;
        h->defense += bonus;
    } else if (type == 5 && bonus <= 0) {
        h->blind = 1;
    } else if (type == 7) {
        h->to_hit += 2;
        h->defense += 2;
    } else if (type == 42 || type == 43 || type == 44 || type == 47) {
        h->defense += bonus;
    }
}

static void apply_worn_gear(Hero *h) {
    char path[64];
    FILE *f;
    unsigned char rec[68];
    snprintf(path, sizeof path, "%s.INV", h->file);
    f = fopen(path, "rb");
    if (!f) return;
    while (fread(rec, 1, 68, f) == 68) add_worn_bonus(h, rec);
    fclose(f);
}

static int read_dungeon_key(void);

/* [0xF6], the worn effect-39 and effect-40 instrument bonuses. */
static int song_power(const Hero *h) {
    return worn_bonus(h, 39) + worn_bonus(h, 40);
}

static int songs_known(const Hero *h) {
    return basic_int((float)h->level / 3.0f) + h->song_bonus;
}

/* mage_0C4A1 counts the songs with the [0xF6] of the previous rating,
   then sums it again. */
static void check_song(Hero *h) {
    int known = songs_known(h);
    h->song_bonus = song_power(h);
    if (strcmp(h->class_name, "BARD") == 0 && known < h->song) {
        h->song = 0;
        printf("You stop singing your song! Hit any key to continue.\n");
        read_dungeon_key();
    }
}

static void rate_from_pack(Hero *h) {
    int i;
    check_song(h);
    rate_hero(h);
    for (i = 0; i < h->inv_n; i++) add_worn_bonus(h, h->inv[i]);
}

static int load_monsters(const char *path, Monster *out, int cap) {
    FILE *f = fopen(path, "rb");
    unsigned char rec[RECORD];
    int count = 0;
    if (!f) return -1;
    while (count < cap && fread(rec, 1, RECORD, f) == RECORD) {
        int i;
        int32_t life;
        Monster *m = &out[count];
        memcpy(m->name, rec, NAME_LEN);
        m->name[NAME_LEN] = 0;
        for (i = NAME_LEN - 1; i >= 0 && (m->name[i] == ' ' || m->name[i] == 0); i--)
            m->name[i] = 0;
        m->tier = rec[20] | (rec[21] << 8);
        m->disposition = (int16_t)(rec[22] | (rec[23] << 8));
        m->speech = (int16_t)(rec[24] | (rec[25] << 8));
        m->gender = rec[194];
        m->prize = 0;
        life = (int32_t)(rec[36] | (rec[37] << 8) | (rec[38] << 16) | (rec[39] << 24));
        m->life = life;
        m->hp_lo = (int16_t)(rec[42] | (rec[43] << 8));
        m->hp_hi = (int16_t)(rec[44] | (rec[45] << 8));
        m->to_hit = (int16_t)(rec[48] | (rec[49] << 8));
        m->to_damage = (int16_t)(rec[50] | (rec[51] << 8));
        m->defense = (int16_t)(rec[52] | (rec[53] << 8));
        m->armor = (int16_t)(rec[54] | (rec[55] << 8));
        m->magic = (int16_t)(rec[56] | (rec[57] << 8));
        m->guard = (int16_t)(rec[58] | (rec[59] << 8));
        m->speed = (int16_t)(rec[60] | (rec[61] << 8));
        m->verbs = (int16_t)(rec[62] | (rec[63] << 8));
        memcpy(m->desc[0], rec + 64, 65);
        memcpy(m->desc[1], rec + 129, 65);
        m->desc[0][65] = m->desc[1][65] = 0;
        m->staff = 0;
        m->lair = 0;
        m->ability[5] = m->ability[6] = m->ability[7] = 0;
        for (i = 0; i < 5; i++)
            m->ability[i] = (int16_t)(rec[26 + i * 2] | (rec[27 + i * 2] << 8));
        count++;
    }
    fclose(f);
    return count;
}

static int has_ability(const Monster *m, int code) {
    int i;
    for (i = 0; i < 8; i++) {
        if (m->ability[i] == code) return 1;
    }
    return 0;
}

static int roll_between(int lo, int hi) {
    float roll = basic_rnd();
    int span = hi - lo + 1;
    int hp = basic_int(roll * (float)span) + lo;
    return hp;
}

static int attacker_lands(int to_hit, int defense, int hit_when_under) {
    float roll = basic_rnd();
    int denom = to_hit + defense;
    float ratio;
    int hit;
    if (denom == 0) return 0;
    ratio = (float)(hit_when_under ? to_hit : defense) / (float)denom;
    hit = hit_when_under ? roll <= ratio : roll > ratio;
    return hit;
}

static int roll_damage(int to_damage, int armor) {
    float roll = basic_rnd();
    float x;
    int damage;
    if (armor == 0) return 0;
    x = roll * (float)to_damage / (float)armor * 8.0f;
    damage = basic_int(x);
    return damage;
}

static int magic_weapon(const Hero *hero);

/* you_hit_1C8BF. Unless anti-magic is up, a phasing monster (ability 2)
   slips a second roll and one needing magic (ability 24) shrugs off all
   but a magic weapon, which also ends (K)ill. Returns 1 when it landed. */
static int player_strike(const Hero *hero, const Monster *enemy, int *hp, int *auto_fight) {
    int connected = attacker_lands(hero->to_hit, enemy->defense, 0);
    int damage = roll_damage(hero->to_damage, enemy->armor);
    int phased = !attacker_lands(hero->to_hit, enemy->defense, 0);
    int magic = magic_weapon(hero);
    const char *whom = enemy->gender == 1 ? "him" : enemy->gender == 2 ? "her" : "it ";
    if (has_ability(enemy, 2) && phased && !spell_shield(hero)) {
        printf("The monster phases as you hit %s!!\n", whom);
    } else if (has_ability(enemy, 24) && !magic && !spell_shield(hero)) {
        printf("As you miss, you realize that you need a magic weapon to hit this one!\n");
        *auto_fight = 0;
    } else if (connected && damage > 0) {
        if (damage > *hp) damage = *hp;
        if (has_ability(enemy, 24) && magic)
            printf("You hit %s for %d hitpoints. It's good that you have some magical artifacts!\n", whom, damage);
        else
            printf("You hit %s for %d hitpoints!\n", whom, damage);
        *hp -= damage;
        return 1;
    } else if (!connected) {
        printf("You missed.\n");
    } else {
        printf("Your blow glanced off the monster.\n");
    }
    return 0;
}

/* proc_1C140. A coin flip, and only a monster with the byte-24 flag sees through it. */
static void wolf_swipe(const Monster *enemy, Hero *hero) {
    printf("The monster swipes at your DREAMWOLF\n");
    if (basic_int(basic_rnd() * 2.0f) == 1 && enemy->speech == 1) {
        printf("As the blades passes through the wolf, the monster realizes that since wolves\n");
        printf("can't phase, this must be an illusion! As the illusion is discovered, it\n");
        printf("fades away.  No more DREAMWOLF!\n");
        hero->dream_wolf = 0;
    } else {
        printf("The wolf seems to phase as the strike passes through it.  The monster looks\n");
        printf("more than a little shaken and backs off!\n");
    }
}

/* The 3-character fixed string at 0x1B0, so "It" keeps its trailing space. */
static const char *pronoun3(const Monster *m) {
    if (m->gender == 1) return "He ";
    if (m->gender == 2) return "She";
    return "It ";
}

static void lose_hp(Hero *hero, int damage) {
    hero->hp -= damage;
    if (hero->hp < 0) hero->hp = 0;
}

/* Spell counts for an ability-27 monster ([0x198]). The original keeps them in
   globals, so they carry over between fights until the next caster sets them. */
static struct {
    int caster;
    int hasted;
    int missile, sleep_air, haste_wrench, fireball, prismatic;
} casting;

static void ready_caster(const Monster *m) {
    int n[6] = {0};
    int i;
    casting.caster = 1;
    casting.missile = basic_int((float)m->tier / 2.0f) + 1;
    for (i = 2; i <= 5; i++) {
        n[i] = basic_int((float)m->tier / 2.0f) - (3 * i - 3);
        if (n[i] < 0) {
            n[i] = 0;
            break;
        }
    }
    casting.sleep_air = n[2];
    casting.haste_wrench = n[3];
    casting.fireball = n[4];
    casting.prismatic = n[5];
}

/* 9D5:9F8B leaves [0x10E] at the experience the current level started at.
   Each threshold is 2^(level * 0.85) times the class base, rounded to 100,
   and past 120000 every level costs another 120000. */
static void hold_message(void);

static int xp_level(const Hero *h, long *floor_xp) {
    double base = 2500.0;
    long next;
    long prev = 0;
    int lvl = 1;
    if (strcmp(h->class_name, "BARD") == 0) base = 2800.0;
    else if (strcmp(h->class_name, "MAGE") == 0) base = 3000.0;
    next = lrint(base);
    if ((double)h->xp > base) {
        for (lvl = 2; lvl <= 15; lvl++) {
            prev = next;
            if (next > 120000L) {
                next += 120000L;
            } else {
                next = lrint(floor(pow(2.0, (double)lvl * (double)0.85f) * base));
                next = lrint((double)(next + 49) / 100.0) * 100;
            }
            if (h->xp < next) break;
        }
        if (lvl > 15) lvl = 15;
    }
    if (floor_xp) *floor_xp = prev;
    return lvl;
}

static long level_floor_xp(const Hero *h) {
    long prev;
    xp_level(h, &prev);
    return prev;
}

/* The rest of 9D5:9F8B. Each level gained or lost rolls INT(RND * die * 8) + 1,
   plus CON - 15 when going up with CON over 15. Returns 0 if the hero dies. */
static int check_level(Hero *hero) {
    float die = 1.25f;
    int lvl = xp_level(hero, NULL);
    int diff = lvl - hero->level;
    int bonus = 0;
    int gain = 0;
    int lost = 0;
    int i;
    if (diff == 0) return 1;
    if (strcmp(hero->class_name, "BARD") == 0) die = 1.0f;
    else if (strcmp(hero->class_name, "MAGE") == 0) die = 0.85f;
    if (hero->con > 15 && diff > 0) bonus = hero->con - 15;
    for (i = 1; i <= abs(diff); i++)
        gain = (int)rintf((float)gain + (float)basic_int(basic_rnd() * die * 8.0f) + (float)bonus + 1.0f);
    if (diff < 0) {
        lost = gain;
        gain = -gain;
    }
    hero->max_hp += gain;
    hero->hp += gain;
    if (diff == 1) {
        printf("You have gone up a level!\n");
        printf("You have an additional %d hitpoints!\n", gain);
    } else if (diff > 0) {
        printf("You have gone up %d levels!\n", diff);
        printf("You have gained %d hitpoints!\n", gain);
    } else if (diff == -1) {
        printf("You have gone down a level!\n");
        printf("You have lost %d hitpoints!\n", lost);
    } else {
        printf("You have gone down %d levels!\n", -diff);
        printf("You have lost %d hitpoints!\n", lost);
    }
    if (hero->xp < 0) {
        hero->hp = 0;
        set_killer(hero, "EXPERIENCE DRAIN");
        printf("You've lost too much experience!\n");
        printf("You die\n");
        printf("EXPERIENCE DRAIN\n");
        hold_message();
        return 0;
    }
    hero->level = lvl;
    rate_from_pack(hero);
    return 1;
}

/* Per-fight counters for 1A65:4B3C, and [0x15C] when the monster leaves. */
static struct {
    int possessed, lycan, drowned, left;
} onhit;

/* [0x1B6]: set by any of these codes, and by every lair. */
static int has_on_hit(const Monster *m) {
    static const int codes[] = {4, 3, 14, 6, 8, 11, 13, 20, 32, 31, 30};
    int i;
    if (m->lair) return 1;
    for (i = 0; i < 11; i++) {
        if (has_ability(m, codes[i])) return 1;
    }
    return 0;
}

static void lose_item(Hero *hero, int i) {
    int worn = field_i16(hero->inv[i] + 64) == 1;
    memmove(hero->inv[i], hero->inv[i + 1], (size_t)(hero->inv_n - i - 1) * 68);
    hero->inv_n--;
    if (worn) rate_from_pack(hero);
}

static int pick_item(const Hero *hero) {
    return (int)rintf((float)basic_int(basic_rnd() * (float)hero->inv_n) + 1.0f) - 1;
}

/* 1A65:4B3C. Runs after a melee hit that did damage. */
static void monster_hit_effects(const Monster *enemy, Hero *hero) {
    const char *who = pronoun3(enemy);
    int shield = spell_shield(hero);
    int resist = magic_resist(hero);
    int landed;
    char name[28];
    if (has_ability(enemy, 3) && attacker_lands(enemy->tier, resist, 1)) {
        printf("This monster is diseased!\n");
        if (wears_effect(hero, 46)) {
            printf("Just thinking about this filthy monster fills you with disgust.\n");
        } else {
            hero->sickness++;
            printf("You don't feel so good!\n");
        }
    }
    if (has_ability(enemy, 13) && !shield && attacker_lands(enemy->tier, resist, 1)) {
        printf("%s drains your energy!\n", who);
        printf("After finishing with you, the creature leaves you!  You feel a little\n");
        printf("worse off than before.\n");
        hero->xp = level_floor_xp(hero) - 1000;
        onhit.left = 1;
    }
    if (has_ability(enemy, 4)) {
        if (attacker_lands(enemy->tier, resist, 1)) {
            printf("%s grabs your money pouch and runs! Now you have no more gold!\n", who);
            hero->gold = 0;
            onhit.left = 1;
        }
    } else if (has_ability(enemy, 6)) {
        if (attacker_lands(enemy->tier, resist, 1)) {
            printf("%s tries to take your items!\n", who);
            if (hero->inv_n == 0) {
                printf("Finding nothing, the monster leaves.\n");
            } else {
                int pick = pick_item(hero);
                item_name(name, (int)sizeof name, hero->inv[pick]);
                printf("The monster takes your %s\n", name);
                lose_item(hero, pick);
            }
            onhit.left = 1;
        }
    } else if (has_ability(enemy, 8) && attacker_lands(enemy->tier, resist, 1) && hero->inv_n > 0) {
        int pick = pick_item(hero);
        item_name(name, (int)sizeof name, hero->inv[pick]);
        printf("%s touches your %s!\n", who, name);
        if (field_i16(hero->inv[pick] + 62) == 0) {
            printf("%s corrodes the item!\n", who);
            lose_item(hero, pick);
        } else {
            printf("Hmm.  Nothing seems to happen.\n");
        }
    }
    if (has_ability(enemy, 14) && attacker_lands(enemy->tier, resist, 1)) {
        onhit.drowned++;
        printf("%s tries to drown you!\n", who);
        if (onhit.drowned < 3) {
            printf("Its harder to breath!\n");
        } else {
            printf("You run out of air!\n");
            hero->hp = 0;
        }
    }
    landed = attacker_lands(enemy->tier, resist, 1);
    if (has_ability(enemy, 31) && landed) {
        printf("You've been hit with sleeping poison!\n");
        if (wears_effect(hero, 45)) {
            printf("Strangely enough, you don't feel any effects.\n");
        } else {
            printf("You doze off!\n");
            hero->down = (int)rintf((float)(hero->down + 1) + (float)basic_int(basic_rnd() * (float)enemy->tier));
        }
    } else if (has_ability(enemy, 32) && attacker_lands(enemy->tier, resist, 1)) {
        printf("You've been hit with strong sickness poison!\n");
        if (wears_effect(hero, 45) || wears_effect(hero, 46)) {
            printf("Strangely enough, you don't feel any effects.\n");
        } else {
            printf("It makes you sick!\n");
            hero->sickness++;
        }
    }
    if (has_ability(enemy, 20) && !shield && attacker_lands(enemy->tier, resist, 1)) {
        printf("%s tries to enter you and bend you to its will!\n", who);
        if (wears_effect(hero, 48)) {
            printf("You easily shrug it off.\n");
        } else if (++onhit.possessed < 3) {
            printf("You BARELY fight it off!\n");
        } else {
            printf("The monster's will becomes your own.  Your identity is lost forever!\n");
            printf("Your life is gone (and so is your game!)\n");
            hero->hp = 0;
        }
    }
    /* The original never raises this counter, so the disease never takes hold. */
    if (has_ability(enemy, 30) && attacker_lands(enemy->tier, resist, 1)) {
        printf("The monster has lycanthopy, and tries to give you the disease!\n");
        if (wears_effect(hero, 46)) {
            printf("It doesn't affect you (as you breath a sigh of relief).\n");
        } else if (onhit.lycan + 1 < 3) {
            printf("You feel strange, and you start identifying with the monster!\n");
        } else {
            printf("As lycanthropy consumes you, you become a %s\n", enemy->name);
            printf("You game, and your life, are over.\n");
            hero->hp = 0;
        }
    }
    if (onhit.left && !shield) printf("%s teleports away!\n", who);
}

/* stabbed_1D361. The verb index is INT(RND * a variable that is never set) + 1,
   so it is always the first verb the byte-62 mask allows. */
static int monster_strike(Monster *enemy, Hero *hero) {
    static const char *verbs[] = {" stabbed", " tail-stung", " bit", " clawed", " hit"};
    static const int bits[] = {16, 8, 4, 2, 1};
    const char *verb = "";
    float mult = 0.0f;
    int type = 0;
    int connected;
    int damage;
    int i;
    int mask = enemy->verbs;
    for (i = 0; i < 5; i++) {
        if (mask >= bits[i]) {
            mask -= bits[i];
            if (!verb[0]) verb = verbs[i];
        }
    }
    if (casting.caster) {
        const char *who = pronoun3(enemy);
        if (casting.prismatic > 0) {
            printf("%s casts PRISIMATIC SPHERES at you!  They start crushing you!\n", who);
            casting.prismatic--;
            mult = 0.6f;
            type = 5;
        } else if (casting.fireball > 0) {
            printf("%s casts a FIREBALL at you!  You get singed!!\n", who);
            casting.fireball--;
            mult = 0.7f;
            type = 4;
        } else if (casting.haste_wrench > 0 && !casting.hasted) {
            printf("%s casts a HASTE SPELL on itself! %s starts to speed up!\n", who, who);
            casting.haste_wrench--;
            mult = 0.6f;
            type = 0;
        } else if (casting.sleep_air > 0 && hero->down == 0) {
            printf("%s casts a SLEEP SPELL at you!  You start to doze off!\n", who);
            casting.sleep_air--;
            mult = 0.7f;
            type = 0;
        } else if (casting.haste_wrench > 0) {
            printf("%s casts a MIND WRENCH at you!  You clasp your ears in pain!\n", who);
            casting.haste_wrench--;
            mult = 0.8f;
            type = 3;
        } else if (casting.sleep_air > 0) {
            printf("%s casts AIR CONSTRICTION!  You turn blue as you lungs start to hurt!\n", who);
            casting.sleep_air--;
            mult = 1.0f;
            type = 2;
        } else if (casting.missile > 0) {
            printf("%s casts a MAGIC MISSILE at you!\n", who);
            casting.missile--;
            mult = 1.0f;
            type = 1;
        } else {
            casting.caster = 0;
            if (enemy->verbs >= 16) {
                printf("%s draws a weapon! (At least no more spells!)\n", who);
                return hero->hp;
            }
        }
    }
    if (casting.caster) {
        int power = (int)rintf((float)enemy->magic * mult);
        int against = type == 0 && mult == 0.6f ? 5 : magic_resist(hero);
        if (!attacker_lands(power, against, 1)) {
            printf("Its spell goes awry! (Doesn't that make you feel better?)\n");
            return hero->hp;
        }
        if (spell_shield(hero)) {
            printf("Its spell approaches you, then fizzles. (Thank God for small favors!)\n");
            casting.missile = casting.sleep_air = casting.haste_wrench = 0;
            casting.fireball = casting.prismatic = 0;
            return hero->hp;
        }
        if (type == 0) {
            if (mult == 0.6f) {
                casting.hasted = 1;
                enemy->speed++;
            } else {
                hero->down = (int)rintf((float)(basic_int(basic_rnd() * (float)enemy->tier) + hero->down + 1));
            }
            return hero->hp;
        }
        connected = 1;
        damage = (int)rintf((float)((basic_int(basic_rnd() * 10.0f) + 1) + type * 10 - 10) * 2.0f);
    } else {
        connected = attacker_lands(enemy->to_hit, hero->defense, 1);
        damage = roll_damage(enemy->to_damage, hero->armor);
    }
    if (!connected) {
        printf("You dodge the blow!\n");
    } else if (damage <= 0) {
        printf("The blow glanced off you!\n");
    } else {
        lose_hp(hero, damage);
        if (casting.caster) {
            printf("The spell hurt you for %d hitpoints!\n", damage);
        } else {
            basic_rnd();
            printf("%s%s you for %d hitpoints!\n", pronoun3(enemy), verb, damage);
        }
        if (!casting.caster && has_on_hit(enemy)) monster_hit_effects(enemy, hero);
    }
    return hero->hp;
}

/* CINT(TIMER / 60) */
static int minutes_now(void) {
    SYSTEMTIME t;
    GetLocalTime(&t);
    return (int)lrintf(((float)(t.wHour * 3600 + t.wMinute * 60 + t.wSecond) + (float)t.wMilliseconds / 1000.0f) / 60.0f);
}

/* proc_25CF7, run by the key reader (proc_243D9) when there is a limit. */
static void check_time(void) {
    int now;
    if (session_end <= 0) return;
    now = minutes_now();
    if (session_end > 1440) now += 1440;
    if (session_end < now) time_up = 1;
}

/* Piped input only: once it runs dry every prompt reads Q and a fight ends. */
static int input_eof;

static void read_line(char *line, int cap) {
    check_time();
    if (live) {
        edit_field(line, cap);
        return;
    }
    if (!fgets(line, cap, stdin)) {
        input_eof = 1;
        line[0] = 'Q';
        line[1] = 0;
        return;
    }
}

static void copy_field(char *dst, int cap, const unsigned char *src, int n) {
    int i;
    if (n >= cap) n = cap - 1;
    memcpy(dst, src, (size_t)n);
    dst[n] = 0;
    for (i = n - 1; i >= 0 && (dst[i] == ' ' || dst[i] == 0); i--) dst[i] = 0;
}

static void load_inv(Hero *hero) {
    char path[64];
    FILE *f;
    snprintf(path, sizeof path, "%s.INV", hero->file);
    hero->inv_n = 0;
    f = fopen(path, "rb");
    if (!f) return;
    while (hero->inv_n < MAX_INV && fread(hero->inv[hero->inv_n], 1, 68, f) == 68) hero->inv_n++;
    fclose(f);
}

static int load_heroes(Hero *out, int cap) {
    int count = 0;
    {
        FILE *f;
        unsigned char rec[CHAR_RECORD];
        f = fopen(party_path, "rb");
        if (!f) return 0;
        int slot = 0;
        while (count < cap && fread(rec, 1, CHAR_RECORD, f) == CHAR_RECORD) {
            Hero *h = &out[count];
            int index = slot++;
            if (rec[0] < 'A' || rec[0] > 'Z') continue;
            memset(h, 0, sizeof *h);
            snprintf(h->save_path, sizeof h->save_path, "%s", party_path);
            h->save_slot = index;
            copy_field(h->name, 21, rec, 20);
            copy_field(h->file, 9, rec + 20, 8);
            if (!h->file[0]) snprintf(h->file, sizeof h->file, "%.8s", h->name);
            copy_field(h->class_name, 8, rec + 28, 7);
            copy_field(h->race, 6, rec + 35, 5);
            h->level = (int16_t)(rec[40] | (rec[41] << 8));
            h->hp = (int16_t)(rec[42] | (rec[43] << 8));
            h->max_hp = (int16_t)(rec[44] | (rec[45] << 8));
            h->str = (int16_t)(rec[46] | (rec[47] << 8));
            h->intel = (int16_t)(rec[48] | (rec[49] << 8));
            h->con = (int16_t)(rec[50] | (rec[51] << 8));
            h->dex = (int16_t)(rec[52] | (rec[53] << 8));
            h->chr = (int16_t)(rec[54] | (rec[55] << 8));
            h->lck = (int16_t)(rec[56] | (rec[57] << 8));
            h->run_mode = (int16_t)(rec[58] | (rec[59] << 8)) != 0;
            h->song = (int16_t)(rec[96] | (rec[97] << 8));
            if (h->level < 1) h->level = 1;
            if (h->hp < 1) h->hp = 1;
            if (h->max_hp < h->hp) h->max_hp = h->hp;
            h->xp = (int32_t)(rec[100] | (rec[101] << 8) | (rec[102] << 16) | (rec[103] << 24));
            h->gold = (int32_t)(rec[104] | (rec[105] << 8) | (rec[106] << 16) | (rec[107] << 24));
            if (h->gold < 0) h->gold = 0;
            h->sickness = (int16_t)(rec[82] | (rec[83] << 8));
            if (h->sickness < 0) h->sickness = 0;
            h->floor = (int16_t)(rec[60] | (rec[61] << 8));
            if (h->floor < 0 || h->floor > 30) h->floor = 0;
            h->wishes = (int16_t)(rec[84] | (rec[85] << 8));
            if (h->wishes < 0) h->wishes = 0;
            h->staff_gold = (int16_t)(rec[72] | (rec[73] << 8));
            h->staff_red = (int16_t)(rec[74] | (rec[75] << 8));
            h->staff_black = (int16_t)(rec[76] | (rec[77] << 8));
            h->staff_white = (int16_t)(rec[78] | (rec[79] << 8));
            h->staff_power = (int16_t)(rec[80] | (rec[81] << 8));
            copy_field(h->pet_name, 21, rec + 108, 20);
            h->pet = (int16_t)(rec[128] | (rec[129] << 8));
            h->pet_max_hp = (int16_t)(rec[130] | (rec[131] << 8));
            h->pet_hp = (int16_t)(rec[132] | (rec[133] << 8));
            h->pet_armor = (int16_t)(rec[134] | (rec[135] << 8));
            h->pet_extra = (int16_t)(rec[136] | (rec[137] << 8));
            h->pet_speed = (int16_t)(rec[138] | (rec[139] << 8));
            h->pet_to_hit = (int16_t)(rec[140] | (rec[141] << 8));
            h->pet_to_damage = (int16_t)(rec[142] | (rec[143] << 8));
            h->pet_defense = (int16_t)(rec[144] | (rec[145] << 8));
            rate_hero(h);
            apply_worn_gear(h);
            load_inv(h);
            h->song_bonus = song_power(h);
            if (h->name[0]) count++;
        }
        fclose(f);
    }
    return count;
}

static const Monster *pick_monster(const Monster *monsters, int count, int depth) {
    int last[31];
    int i;
    int prev = 0;
    int lo;
    int hi;
    int start;
    int end;
    int span;
    int rec;
    int widen;
    float gate;
    if (count < 1) return monsters;
    if (depth < 1) depth = 1;
    if (depth > 30) depth = 30;
    for (i = 1; i <= 30; i++) last[i] = count;
    for (i = 0; i < count; i++) {
        int tier = monsters[i].tier;
        if (i > 0 && tier != prev && prev >= 1 && prev <= 30) last[prev] = i;
        if (tier >= 1 && tier <= 30) prev = tier;
    }
    gate = basic_rnd();
    widen = basic_int(gate * 5.0f) == 1;
    lo = depth - (widen ? 10 : 5);
    hi = widen ? depth + 1 : depth;
    if (lo < 1) lo = 1;
    if (hi > 30) hi = 30;
    if (hi < 1) hi = 1;
    start = last[hi];
    end = lo <= 1 ? 1 : last[lo - 1] + 1;
    if (last[depth] < end) end = last[depth];
    span = start - end + 1;
    if (span < 1) {
        end = 1;
        start = count;
        span = count;
    }
    rec = basic_int(basic_rnd() * (float)span) + end;
    if (rec < 1) rec = 1;
    if (rec > count) rec = count;
    return &monsters[rec - 1];
}

/* Walk check in experience_170C7. Over the floor's level, INT(RND*200)==1.
   At the floor's level, INT(RND*20)==1. */
static int meet_on_step(int level, int floor) {
    int span = level > floor + 2 ? 200 : 20;
    float roll = basic_rnd();
    int got = basic_int(roll * (float)span);
    return got == 1;
}

static int read_dungeon_key(void);

/* The original leaves a message up until "Hit any key to continue",
   then clears that window. The map redraw is our clear. */
static void hold_message(void) {
    if (live) {
        scr_status("Hit any key to continue");
        read_key();
        scr_window(win_top, win_bot, win_left, win_right);
        return;
    }
    printf("Hit any key to continue\n");
    read_dungeon_key();
}

static int end_encounter(int result) {
    hold_message();
    return result;
}

/* sb_dat_21E13. After the 20-column key: colour letter, then step digit
   (0 stay, 1/2 move down) or a space that starts a new window, then text. */
static int sb_color_fg(char letter) {
    switch (letter) {
    case 'H': return 15; /* bright white titles */
    case 'T': return 15; /* body */
    case 'W': return 15;
    case 'Y': return 14;
    case 'G': return 10;
    case 'B': return 11;
    case 'R': return 12;
    case 'M': return 13;
    case 'C': return 11;
    default:  return 7;
    }
}

static void print_sb_key(const char *key) {
    FILE *f = fopen("SB.DAT", "r");
    char line[320];
    int n = (int)strlen(key);
    int started = 0;
    if (!f) {
        printf("%snot found.  Hit any key to continue\n", key);
        hold_message();
        return;
    }
    while (fgets(line, sizeof line, f)) {
        char *p;
        size_t len;
        int step = 1;
        char color;
        if (strncmp(line, key, n) != 0) continue;
        if (n < 20 && line[n] != ' ') continue;
        len = strlen(line);
        while (len > 0 && (line[len - 1] == '\n' || line[len - 1] == '\r')) line[--len] = 0;
        if (len < 22) continue;
        color = line[20];
        if (line[21] == ' ') {
            /* Space starts a new full-screen text window. */
            scr_clear(1, 24);
            scr_color(sb_color_fg(color), 0);
            started = 0;
        } else if (line[21] >= '0' && line[21] <= '9') {
            step = line[21] - '0';
            scr_color(sb_color_fg(color), 0);
            if (started) {
                while (step-- > 0) putchar('\n');
            }
        } else {
            scr_color(sb_color_fg(color), 0);
            if (started) putchar('\n');
        }
        p = line + 22;
        sb_write(p, strlen(p));
        started = 1;
    }
    fclose(f);
    scr_color(7, 0);
    if (started) {
        putchar('\n');
    } else {
        printf("%snot found.  Hit any key to continue\n", key);
        hold_message();
    }
}

static void show_help(const char *key) {
    scr_clear(1, 24);
    print_sb_key(key);
    hold_message();
}

static void fill_spells(Hero *hero);

/* resurrection_16562. 100 gold buys the try; INT(RND * CON / 4) of 0 fails
   below CON 17, and CON under 10 always fails. */
static int resurrect(Hero *hero) {
    int roll;
    hold_message();
    print_sb_key("RESURRECTION");
    if (hero->gold < 100) {
        print_sb_key("RESURRNOGOLD");
        return 0;
    }
    roll = basic_int(basic_rnd() * (float)hero->con / 4.0f);
    if ((roll == 0 && hero->con < 17) || hero->con < 10 || hero->max_hp < 1) {
        print_sb_key("RESURRNOCON");
        return 0;
    }
    print_sb_key("RESURRWORKED");
    hero->gold = 0;
    hero->con--;
    hero->max_hp = basic_int((float)(int16_t)(hero->con * hero->max_hp) / (float)(hero->con + 1));
    hero->hp = hero->max_hp;
    fill_spells(hero);
    rate_from_pack(hero);
    hold_message();
    return 1;
}

/* loss_of_str_007A9. Statistics over 21 drop to 21; a statistic or the
   experience below 0, sickness 10, or no hitpoints after the resurrection
   ends the hero. A lost statistic stat_gone already told is not told again.
   Returns 1 when the hero stays dead. */
static int hero_died(Hero *hero, const char *cause) {
    static const char *const lost[6][2] = {
        {"Your strength is gone. You die!", "LOSS OF STR"},
        {"You've gone brain dead. You die!", "LOSS OF INT"},
        {"You wither away and die!", "LOSS OF CON"},
        {"You trip and kill yourself!", "LOSS OF DEX"},
        {"You're so ugly, you wish you could\ncurl up and die. Your wish has been\ngranted.  You curl up and die!", "LOSS OF CHR"},
        {"Your luck just ran out. You die!", "LOSS OF LCK"},
    };
    int *stat[6] = {&hero->str, &hero->intel, &hero->con, &hero->dex, &hero->chr, &hero->lck};
    const char *msg = NULL;
    int i;
    for (i = 0; i < 6; i++) if (*stat[i] > 21) *stat[i] = 21;
    for (i = 0; i < 6 && !msg; i++) {
        if (*stat[i] >= 0) continue;
        if (strcmp(hero->killer, lost[i][1]) == 0) {
            hero->hp = 0;
            return 1;
        }
        msg = lost[i][0];
        cause = lost[i][1];
    }
    if (!msg && hero->xp < 0) {
        msg = "Experience?  You don't need no stinkin' experience! You're dead!";
        cause = "LOSS OF EXPERIENCE";
    } else if (!msg && hero->sickness >= 10) {
        msg = "You're too sick to go on.  You die!";
        cause = "SICKNESS";
    } else if (!msg && hero->hp < 1 && !resurrect(hero)) {
        msg = "You die!";
    }
    if (!msg) return 0;
    hero->hp = 0;
    set_killer(hero, cause);
    printf("%s\n", msg);
    hold_message();
    return 1;
}

/* A routine that reported death (a lost statistic keeps its hitpoints) or
   left no hitpoints. Only the hitpoint case gets the resurrection. */
static int stays_dead(Hero *hero, int reported, const char *cause) {
    if (hero->hp < 1) return hero_died(hero, cause);
    return reported;
}

/* Part of mage_0C4A1: [0x200]-[0x206] together make [0x208]. */
static void assemble_staff(Hero *hero) {
    if (hero->staff_power) return;
    if (!hero->staff_red || !hero->staff_black || !hero->staff_white || !hero->staff_gold) return;
    printf("You put all of your staffs together to\n");
    printf("make a STAFF OF POWER!\n");
    hero->staff_power = 1;
    hold_message();
    print_sb_key("STAFFOFPOWER");
    hold_message();
}

static void visit_cleric(Hero *hero, const char *who);
static void visit_shop(Hero *hero, const char *who);
static int visit_deck(Hero *hero);

/* golddragon_1DD25, a talk that worked. [0xF0] 17 is the gold dragon's lair. */
static void talk_success(Hero *hero, const Monster *enemy, int lair_tile) {
    int pick = (int)rintf(basic_rnd() * 3.0f);
    char key[16];
    if (lair_tile == 17 && !hero->staff_gold && !hero->staff_power) {
        print_sb_key("GOLDDRAGON");
        hero->gold = 0;
        hero->staff_gold = 1;
    } else if (has_ability(enemy, 21) && pick == 1) {
        int granted = attacker_lands(hero->intel - 12 * hero->wishes + hero->level, 12, 1);
        printf("%s was impressed with your courage, tact, and eloquence. %shas granted,\n",
               pronoun3(enemy), pronoun3(enemy));
        printf("you a wish!\n");
        if (granted) {
            hero->wishes += 1;
        } else {
            int loss = (int)rintf(basic_rnd() * 50.0f + 50.0f);
            hero->hp -= loss;
            hero->intel -= 1;
            printf(" \n");
            printf("Alas, your weak, pathetic mind was not able to handle all of the magical\n");
            printf("energy.  In trying (in vain) to handle all of the magical energy, you have\n");
            printf("lost 1 intelligence and have lost  %d hitpoints!\n", loss);
            hold_message();
            check_level(hero);
            assemble_staff(hero);
        }
    } else if (has_ability(enemy, 25)) {
        visit_deck(hero);
    } else if (has_ability(enemy, 22)) {
        visit_cleric(hero, "The cleric");
    } else if (has_ability(enemy, 23)) {
        visit_shop(hero, "The salesperson");
    } else {
        snprintf(key, sizeof key, "HINT%d", basic_int(basic_rnd() * 48.0f + 1.0f));
        printf("\nThe creature starts to speak!\n\n");
        print_sb_key(key);
        printf("With that the creature leaves you.  Of course, this all seems perfectly normal\n");
        printf("to you.  (Creatures always act like that, don't they?)\n");
    }
}

/* RND * tier / var_00AC * k, the shared roll for scream, ice, lightning and fire. */
static int special_roll(const Monster *enemy, const Hero *hero, float k) {
    int guard = special_guard(hero);
    if (guard == 0) guard = 1;
    return (int)rintf((float)basic_int(basic_rnd() * (float)enemy->tier / (float)guard * k));
}

/* proc_1E3C3. Runs every tick after the first, before anyone acts.
   Each ability fires every tick; there is no separate chance roll.
   Returns -1 when the hero dies, 1 when the monster wanders off. */
static int monster_specials(Hero *hero, const Monster *enemy, int *charmed, int *stoned) {
    const char *who = pronoun3(enemy);
    int damage;
    if (enemy->staff) {
        damage = (int)rintf((float)(basic_int(basic_rnd() * 50.0f) + 10));
        lose_hp(hero, damage);
        printf("Lightning shoots our from its STAFF!\n");
        if (wears_effect(hero, 47) || spell_shield(hero))
            printf("Somehow, the magical bolt gets through all of your defenses! (Gasp!)\n");
        printf("You are shocked for %d hitpoints!\n", damage);
    }
    if (hero->foe_sleep != 0) return hero->hp < 1 ? -1 : 0;
    if (has_ability(enemy, 10)) {
        damage = special_roll(enemy, hero, 15.0f);
        if (wears_effect(hero, 42)) {
            printf("The creature screaches a high-pitched SONIC SCREAM!  Although you hear it,\n");
            printf("it doesn't seem to affect you.  You are NOT impressed.\n");
        } else if (damage > 7) {
            lose_hp(hero, damage);
            printf("You clutch your ears as the creature emits a high - pitched SONIC SCREAM!\n");
            printf("Your brain is pierced for %d hitpoints!\n", damage);
        }
    }
    if (spell_shield(hero)) return hero->hp < 1 ? -1 : 0;
    if (has_ability(enemy, 1) && attacker_lands(enemy->tier, magic_resist(hero), 1)) {
        printf("%s casts a sickness spell!\n", who);
        if (wears_effect(hero, 46)) {
            printf("The spell approaches you, then fizzles.\n");
        } else {
            printf("You don't feel so good!\n");
            hero->sickness++;
        }
    }
    if (has_ability(enemy, 7) && hero->down == 0) {
        int held = attacker_lands(enemy->tier, magic_resist(hero), 1);
        if (wears_effect(hero, 41) || wears_effect(hero, 48)) {
            printf("%s looks deeply into your eyes and tries to paralyze you!\n", who);
            printf("You see the pupil, the iris, and several rods and cones.\n");
        } else if (held) {
            printf("%s looks deeply into your eyes.  You're paralyzed!\n", who);
            hero->down = enemy->tier;
            if (enemy->to_hit == 0) {
                printf("The monster wanders off\n");
                return 1;
            }
        }
    }
    if (has_ability(enemy, 9)) {
        damage = special_roll(enemy, hero, 17.0f);
        if (wears_effect(hero, 44)) {
            printf("%s sends an ice cone your way!  You fight the near-overpowering urge to start\n", who);
            printf("building a snowman.\n");
        } else if (damage > 10) {
            lose_hp(hero, damage);
            printf("%s sends an ice cone your way!  You are frozen for %d hitpoints!\n", who, damage);
        }
    }
    if (has_ability(enemy, 11) && attacker_lands(enemy->tier, magic_resist(hero), 1)) {
        printf("%s tries to come over to his side!  His persuasion is magically overwelming!\n", who);
        if (wears_effect(hero, 48)) {
            printf("Still, you have to laugh. 'Come over to YOUR SIDE?  BWAA-HA-HA-HA-HA'\n");
        } else if (++*charmed < 3) {
            printf("You begin to see the monster's point of view!\n");
        } else {
            printf("You become the monster's willing slave!  It looks like the mission is over for you!\n");
            printf("(So is your life!!!)\n");
            hero->hp = 0;
            return -1;
        }
    }
    if (has_ability(enemy, 29)) {
        damage = special_roll(enemy, hero, 23.0f);
        if (wears_effect(hero, 47)) {
            printf("%s rolls a ball of lightning your way!\n", who);
            printf("You get a charge out of it.  (Get it?  BWAA-HA-HA-HA-HA)\n");
            printf("Lightning doesn't seem to affect you.\n");
        } else if (damage > 13) {
            lose_hp(hero, damage);
            printf("%s rolls a ball of lightning your way. You are shocked for %d hitpoints!\n", who, damage);
        }
    }
    if (has_ability(enemy, 12)) {
        damage = special_roll(enemy, hero, 20.0f);
        if (wears_effect(hero, 43)) {
            printf("%s emits a stream of fire!  (And YOU forgot the marshmallows!)\n", who);
        } else if (damage > 13) {
            lose_hp(hero, damage);
            printf("%s emits a stream of fire!  You are burned for %d hitpoints!\n", who, damage);
        }
    }
    if (has_ability(enemy, 5) && attacker_lands(enemy->tier, magic_resist(hero), 1)) {
        printf("%s stares at you with a stony glance!\n", who);
        if (wears_effect(hero, 41)) {
            printf("You've seen ugly in your time, but this is UGLY! (Kinda reminds you of your\n");
            printf("last date. BWAA-HA-HA-HA)\n");
        } else if (hero->level >= ++*stoned) {
            printf("You stiffen up!\n");
        } else {
            printf("You turn completely to stone!\n");
            hero->hp = 0;
            return -1;
        }
    }
    return hero->hp < 1 ? -1 : 0;
}

static int monster_hits_pet(const Monster *enemy, Hero *hero);

/* proc_1E1BB. One roll over you, the pet, and the wolf picks the target.
   A spellcaster ([0x198]) never goes for the pet, and on that roll does nothing. */
static int monster_attack(Hero *hero, Monster *enemy) {
    int has_pet = hero->pet && hero->pet_hp > 0;
    int targets = 1 + has_pet + (hero->dream_wolf == 1);
    int pick = basic_int(basic_rnd() * (float)targets);
    int caster = casting.caster;
    if (pick == 1) {
        if (has_pet && !caster) monster_hits_pet(enemy, hero);
        else if (!caster) wolf_swipe(enemy, hero);
        return hero->hp;
    }
    if (pick == 2) {
        wolf_swipe(enemy, hero);
        return hero->hp;
    }
    return monster_strike(enemy, hero);
}

/* Sleep is checked before the attack. Waking up takes the whole turn.
   Ability 17 (only the white dragon lair sets it) never wakes. */
static int foe_turn(Hero *hero, Monster *enemy) {
    if (hero->foe_sleep > 0) {
        int roll = basic_int(basic_rnd() * (float)hero->foe_sleep);
        if (has_ability(enemy, 17)) {
            printf("This creature will sleep for a while!\n");
        } else if (roll == 1) {
            hero->foe_sleep = 0;
            printf("This creature starts to awaken!\n");
        } else {
            printf("This creature is still sleeping!\n");
        }
        return hero->hp;
    }
    return monster_attack(hero, enemy);
}

static int monster_hits_pet(const Monster *enemy, Hero *hero) {
    int connected = attacker_lands(enemy->to_hit, hero->pet_defense, 1);
    int damage = roll_damage(enemy->to_damage, hero->pet_armor);
    if (connected && damage > 0) {
        hero->pet_hp -= damage;
        printf("%s hit your %s for %d hitpoints!\n", enemy->name, hero->pet_name, damage);
        if (hero->pet_hp < 1) {
            hero->pet_hp = 0;
            hero->pet = 0;
            printf("Your %s has died!\n", hero->pet_name);
        }
    } else if (!connected) {
        printf("%s missed your %s.\n", enemy->name, hero->pet_name);
    } else {
        printf("The blow glanced off your %s.\n", hero->pet_name);
    }
    return hero->hp;
}

static int pet_strike(Hero *hero, const Monster *enemy, int *hp) {
    int phased = attacker_lands(enemy->defense, hero->pet_to_hit, 1);
    int blocked = attacker_lands(enemy->defense, hero->pet_to_hit, 1);
    int damage = (int)rintf((float)roll_damage(hero->pet_to_damage, enemy->armor));
    const char *whom = enemy->gender == 1 ? "him" : enemy->gender == 2 ? "her" : "it ";
    char name[21];
    int n;
    snprintf(name, sizeof name, "%.20s", hero->pet_name);
    for (n = (int)strlen(name); n > 0 && name[n - 1] == ' '; n--) name[n - 1] = 0;
    if (has_ability(enemy, 2) && phased) {
        printf("The monster phases as your %s hits %s!!\n", name, whom);
    } else if (has_ability(enemy, 24)) {
        printf("As your %s's blow bounces off, you realize \n", name);
        printf("that a magic weapon is needed to hit this monster\n");
    } else if (damage > 0 && !blocked) {
        printf("Your %s hits %s for %d hitpoints!\n", name, whom, damage);
        *hp -= damage;
        return 1;
    } else if (blocked) {
        printf("Your %s missed.\n", name);
    } else {
        printf("Your %s's blow glanced off the monster.\n", name);
    }
    return 0;
}

/* fields_like_they_used_to_12B8D: [0x23A] max is the larger of the record's
   minimum hitpoints and what the foe has left, [0x23C] starts at the minimum. */
static void take_pet(Hero *hero, const Monster *foe, int foe_hp) {
    strncpy(hero->pet_name, foe->name, 20);
    hero->pet_name[20] = 0;
    hero->pet_hp = foe->hp_lo > 0 ? foe->hp_lo : 1;
    hero->pet_max_hp = foe->hp_lo > foe_hp ? foe->hp_lo : foe_hp;
    hero->pet_extra = foe->speech;
    hero->pet_to_hit = foe->to_hit;
    hero->pet_to_damage = foe->to_damage;
    hero->pet_defense = foe->defense;
    hero->pet_armor = foe->armor;
    hero->pet_speed = foe->speed;
    hero->pet = 1;
}

static const char *object3(const Monster *m);

/* then_takes_a_208DD. 1 means the fight is over ([0x15C]). */
static int monster_talk(Hero *hero, const Monster *enemy) {
    if (enemy->disposition < 0) {
        if (enemy->speech == 1) {
            printf("'I come in peace!' you shout to the monster.  'That's really rich' the \n");
            printf("creature chuckles.  'The bleeding heart wants to talk.' %s then takes a\n", pronoun3(enemy));
            printf("swipe at you! There's just no talking to some monsters!\n");
        } else {
            printf("You speak to the monster in a soothing voice.  The monster growls back in a\n");
            printf("harsh voice, while trying to bite you. %s doesn't seem to understand you, nor\n", pronoun3(enemy));
            printf("would care what you have to say.\n");
        }
        return 0;
    }
    if (enemy->disposition > 0) {
        if (enemy->speech == 1) {
            talk_success(hero, enemy, enemy->lair);
            return 1;
        }
        printf("You put your hand out to the creature in a sign of friendship. The creature\n");
        printf("then cuddles up to you as you start to pet %s. After a while, you both go\n", object3(enemy));
        printf("your separate ways.\n");
        return 1;
    }
    if (attacker_lands(hero->to_charm, enemy->tier, 1)) {
        if (enemy->speech == 1) {
            talk_success(hero, enemy, enemy->lair);
            return 1;
        }
        printf("There are a couple tense moments as you speak soothingly to the\n");
        printf("creature. Then as your eyes lock, a special bond develops as the\n");
        printf("creature almost seems to understand you. You both go your own ways.\n");
        return 1;
    }
    if (enemy->speech == 1) {
        printf("'Look,' you say. 'You don't want to kill me, and I really don't\n");
        printf("want to die. Why don't we just go our own ways?' The creature thinks\n");
        printf("but then replies 'Nah. What's in it for me?'\n");
        return 0;
    }
    printf("You speak soothingly to the animal, but to no avail!  As the monster\n");
    printf("maintains the attack, you realize how hard dungeon life must be to\n");
    printf("turn a nice animal into such a beast. You vow to pay the sorcerer back.\n");
    return 0;
}

static int make_wish(Hero *hero, const Monster *foe, int allyn);
static int sing_song(Hero *hero);
static int pick_key(void);
static int inventory_menu(Hero *hero, unsigned char *base, int *x, int *y, const Monster *foe, int *foe_hp);
static int cast_spell(Hero *hero, unsigned char *base, int *x, int *y, const Monster *foe, int *foe_hp);

/* The fixed 3-character string at 0x1B3. */
static const char *object3(const Monster *m) {
    if (m->gender == 1) return "him";
    if (m->gender == 2) return "her";
    return "it ";
}

/* The 16-bit product of the hitpoints left and the tier, plus the record's
   life. Overkill leaves the hitpoints negative, so it lowers the prize. */
static void kill_xp(Hero *hero, const Monster *enemy, int foe_hp) {
    long life = enemy->prize > 0 ? enemy->prize : enemy->life;
    hero->xp += (int16_t)(foe_hp * enemy->tier) + life;
}

/* 1A65:1C96. Ability 28 is a spore cloud. */
static int foe_killed(Hero *hero, const Monster *enemy, int foe_hp) {
    kill_xp(hero, enemy, foe_hp);
    if (has_ability(enemy, 28)) {
        int damage = basic_int(basic_rnd() * 10.0f) + 1;
        printf("%s was really a SPORE CLOUD.  It exploded when you hit it!\n", pronoun3(enemy));
        printf("You have been damaged for %d hitpoints!\n", damage);
        hero->hp -= damage;
        if (hero_died(hero, enemy->name)) return end_encounter(0);
    } else {
        printf("You've killed %s!!\n", object3(enemy));
    }
    return end_encounter(2);
}

/* is_voided_out_202C6, at the top of every tick. Ability 15 is an illusion,
   16 an animated monster. Anti-magic is dispel or a worn effect-24 item. */
static int voided_out(Hero *hero, const Monster *enemy, int foe_hp) {
    if (!spell_shield(hero)) return 0;
    if (has_ability(enemy, 15)) {
        printf("The monster slowly starts fading away. The fiercesome beast was only\n");
        printf("an illusion after all.  (It sure looked and fought real, though.)\n");
        kill_xp(hero, enemy, foe_hp);
        return 1;
    }
    if (has_ability(enemy, 16)) {
        printf("The monster writhes in pain as the magic that animated %s is voided out!\n", object3(enemy));
        printf("%s turns to dust on the floor!\n", pronoun3(enemy));
        kill_xp(hero, enemy, foe_hp);
        return 2;
    }
    return 0;
}

/* 1A65:2D11. With the Staff of Power ([0x208]) a swing at a friendly or a
   much weaker monster is called off. */
static int staff_conscience(const Hero *hero, const Monster *enemy) {
    if (hero->staff_power != 1) return 0;
    if (enemy->disposition >= 0) {
        printf("As you are about to attack, your staff starts to glow.  You are appalled\n");
        printf("that you would even THINK of attacking such a noble creature.  (Of course\n");
        printf("NOW is the perfect time for an attack of consience.)\n");
        return 1;
    }
    if (2 * hero->level - 10 > enemy->tier) {
        printf("As you are about to attack, your staff starts to glow.  OH MY GOD! HOW\n");
        printf("could you even THINK of attacking such a weak and pathetic creature.\n");
        printf("(Hmmm. You also find it odd that such one-sidedness never used to bother you\n");
        printf("at all.)\n");
        return 1;
    }
    return 0;
}

/* After every hero action except a paralyzed one. */
static int staff_bolt(const Hero *hero, const Monster *enemy, int *foe) {
    int damage;
    if (hero->staff_power != 1 || enemy->disposition != -1 || 2 * hero->level - 10 >= enemy->tier) return 0;
    if (basic_int(basic_rnd() * 2.0f) != 1) return 0;
    damage = (int)rintf((float)basic_int(basic_rnd() * 10.0f + 50.0f));
    printf("Lightning bolts shoot out of your STAFF OF POWER and damages the monster\n");
    printf("for %d hitpoints!\n", damage);
    *foe -= damage;
    return 1;
}

/* you_ve_killed_1D25D, after a blow that landed. Ability 19 teleports away,
   ability 18 gets back up unless the dispel spell is up. Returns 1 when it
   is dead, 2 when it is gone, else 0. */
static int foe_down(const Hero *hero, const Monster *m, int foe, int *risen) {
    if (foe >= 1) return 0;
    if (has_ability(m, 19)) {
        printf("Having enough, the monster teleports away!\n");
        return 2;
    }
    if (has_ability(m, 18) && !hero->dispel) {
        printf("You've killed %s. %s then resurrected!\n", object3(m), pronoun3(m));
        *risen = 1;
        return 0;
    }
    return 1;
}

/* 1A65:28CA. The contest is rolled before anything else is checked. */
static int run_away(const Hero *hero, const Monster *enemy) {
    int won = attacker_lands(run_rating(hero), enemy->guard, 1);
    int boots = worn_bonus(hero, 9);
    if (boots < 0) {
        printf("Your boots won't let you run!\n");
        return 0;
    }
    if (enemy->disposition == 1) {
        printf("You run as fast as your feet will take you!  You get away!\n");
        return 1;
    }
    if (won || boots > 0) {
        if (enemy->speech == 1)
            printf("'Come back, you sniveling coward!' You will live to fight another day!\n");
        else
            printf("A brave man dies but once, but once is enough! You escape with your life!\n");
        return 1;
    }
    printf("You cannot get away!\n");
    return 0;
}

/* 1A65:2D11 and its tick loop. Each tick every side adds its speed; whoever
   reaches the fastest speed acts (you, then the monster, then the pet) and
   starts over. A friendly monster gives you the first tick to yourself. */
static void match_row(const char *mine, const char *label, const char *theirs) {
    printf("%-29s%-30s%s\n", mine, label, theirs);
}

static void match_nums(const char *label, int mine, int theirs) {
    char a[16];
    char b[16];
    snprintf(a, sizeof a, "%d", mine);
    snprintf(b, sizeof b, "%d", theirs);
    match_row(a, label, b);
}

/* character_monster_match_up_1A696, the fight menu (M). Takes no turn. */
static void match_up(const Hero *hero, const Monster *m) {
    char num[16];
    int i;
    printf("\nCHARACTER/MONSTER MATCH UP\n\n");
    printf("Throughout your earlier travels and conversations, you can recall certain\n");
    printf("characteristics of the being that now faces you.\n\n");
    match_row(hero->name, "", m->name);
    match_nums("Level", hero->level, m->tier);
    match_nums("Ability to hit", hero->to_hit, m->to_hit);
    match_nums("Magic resistance", magic_resist(hero), m->magic);
    match_nums("To damage", hero->to_damage, m->to_damage);
    match_nums("To avoid dam", hero->defense, m->defense);
    match_nums("Speed", hero_speed(hero), m->speed);
    snprintf(num, sizeof num, "%d", m->hp_lo);
    match_row("", "Minimum hitpoints", num);
    match_nums("Maximum hitpoints", hero->max_hp, m->hp_hi);
    snprintf(num, sizeof num, "%d", run_rating(hero));
    match_row(num, "Ability to run", "");
    snprintf(num, sizeof num, "%d", m->guard);
    match_row("", "Ability to stop your running", num);
    printf("\n");
    for (i = 0; i < 2; i++) printf("%s\n", m->desc[i]);
    hold_message();
}

static void fight_panel(const Hero *hero, const Monster *m);
static void fight_screen(const Hero *hero, const Monster *m);
static int fight_menu_live(void);

static int fight_monster(Hero *hero, const Monster *enemy, int *charmed_out, int *stoned_out) {
    Monster m = *enemy;
    int foe;
    int tick = 0;
    int acc_h = 0, acc_m = 0, acc_p = 0;
    int *charmed = charmed_out, *stoned = stoned_out;
    int auto_fight = 0;
    int risen = 0;
    int down;
    char line[64];
    hero->dispel = 0;
    hero->foe_sleep = 0;
    casting.hasted = 0;
    memset(&onhit, 0, sizeof onhit);
    if (has_ability(&m, 27)) {
        if (!m.lair) ready_caster(&m);
        casting.caster = 1;
    } else {
        casting.caster = 0;
    }
    if (m.lair == 20) foe = m.hp_hi;
    else foe = roll_between(m.hp_lo, m.hp_hi);
    if (foe < 1) foe = 1;
    fight_screen(hero, &m);
    printf("You encounter a %s\n", m.name);
    for (;;) {
        int pet_up = hero->pet && hero->pet_hp > 0;
        int first = tick == 0 && m.disposition > -1;
        int top;
        if (live && win_top != 3) fight_screen(hero, &m);
        else if (tick) fight_panel(hero, &m);
        tick++;
        {
            int voided = voided_out(hero, &m, foe);
            if (voided == 1) return end_encounter(1);
            if (voided == 2) return foe_killed(hero, &m, foe);
        }
        if (tick > 1) {
            int special = monster_specials(hero, &m, charmed, stoned);
            if (stays_dead(hero, special < 0, m.name)) return end_encounter(0);
            if (special > 0) return end_encounter(1);
        }
        acc_h += hero_speed(hero);
        acc_p += pet_up ? hero->pet_speed : 0;
        acc_m += m.speed;
        top = hero_speed(hero);
        if (m.speed > top) top = m.speed;
        if (pet_up && hero->pet_speed > top) top = hero->pet_speed;
        printf("Round %d\n", tick);
        if (acc_h >= top || first) {
            acc_h = 0;
            if (worn_bonus(hero, 4) == 1 && hero->max_hp > hero->hp) hero->hp++;
            if (hero->down > 0) {
                printf("You are incapacitated!\n");
                if (basic_int(basic_rnd() * 2.0f) == 0) {
                    printf("You start to move again!\n");
                    hero->down = 0;
                }
            } else {
                int acted = 0;
                while (!acted) {
                    /* [0xBE]: a worn effect-35 item forces (K) unless Gilcrest is active. */
                    if (wears_effect(hero, 35)) {
                        if (hero->staff_power == 1) printf("It appears that Gilcrest is blocking your BAZERKER curse!\n");
                        else auto_fight = 1;
                    }
                    if (auto_fight) {
                        line[0] = 'F';
                    } else {
                        /* f_fight_1C730 */
                        if (live) {
                            line[0] = (char)fight_menu_live();
                            line[1] = 0;
                        } else {
                            printf("(F) Fight\n(K) Kill\n(T) Talk\n(R) Run\n(M) Monster info\n"
                                   "(C) Cast\n(S) Sing\n(I) Inventory\n(W) Wish\n(H) Help\n");
                            read_line(line, sizeof line);
                        }
                        if (input_eof) return 1;
                    }
                    acted = 1;
                    if (line[0] == 'c' || line[0] == 'C') {
                        int cast = cast_spell(hero, NULL, NULL, NULL, &m, &foe);
                        if (stays_dead(hero, cast < 0, m.name)) return end_encounter(0);
                        if (cast == 3) return end_encounter(1);
                        if (cast == 2 || (foe < 1 && !risen)) return foe_killed(hero, &m, foe);
                        if (cast == 0) acted = 0;
                    } else if (line[0] == 'w' || line[0] == 'W') {
                        if (make_wish(hero, &m, 0)) return foe_killed(hero, &m, foe);
                    } else if (line[0] == 's' || line[0] == 'S') {
                        sing_song(hero);
                    } else if (line[0] == 'i' || line[0] == 'I') {
                        int used = inventory_menu(hero, NULL, NULL, NULL, &m, &foe);
                        if (stays_dead(hero, used < 0, m.name)) return end_encounter(0);
                        if (used == 3) return end_encounter(1);
                        if (used == 2 || (foe < 1 && !risen)) return foe_killed(hero, &m, foe);
                    } else if (line[0] == 'h' || line[0] == 'H') {
                        show_help("HELPFIGHT");
                    } else if (line[0] == 'm' || line[0] == 'M') {
                        match_up(hero, &m);
                        acted = 0;
                    } else if (line[0] == 't' || line[0] == 'T') {
                        if (tick == 1) {
                            int talked = monster_talk(hero, &m);
                            if (stays_dead(hero, talked < 0, m.name)) return end_encounter(0);
                            if (talked > 0) return end_encounter(1);
                        } else {
                            printf("It's too late for talking!\n");
                        }
                    } else if (line[0] == 'r' || line[0] == 'R') {
                        if (run_away(hero, &m)) return end_encounter(1);
                    } else if (line[0] == 'f' || line[0] == 'F' || line[0] == 'k' || line[0] == 'K') {
                        if (line[0] == 'k' || line[0] == 'K') auto_fight = 1;
                        if (staff_conscience(hero, &m)) {
                            auto_fight = 0;
                        } else if (player_strike(hero, &m, &foe, &auto_fight)) {
                            down = foe_down(hero, &m, foe, &risen);
                            if (down == 2) return end_encounter(1);
                            if (down == 1) return foe_killed(hero, &m, foe);
                        }
                    } else {
                        printf("Unknown key was hit.  Hit 'H' for help.\n");
                        hold_message();
                        acted = 0;
                    }
                }
                if (staff_bolt(hero, &m, &foe)) {
                    down = foe_down(hero, &m, foe, &risen);
                    if (down == 2) return end_encounter(1);
                    if (down == 1) return foe_killed(hero, &m, foe);
                }
            }
        }
        if (acc_m >= top && !first) {
            acc_m = 0;
            foe_turn(hero, &m);
            if (hero_died(hero, m.name)) return end_encounter(0);
            if (onhit.left) return end_encounter(1);
        }
        if (pet_up && hero->pet && hero->pet_hp > 0 && acc_p >= top && !first) {
            acc_p = 0;
            if (pet_strike(hero, &m, &foe)) {
                down = foe_down(hero, &m, foe, &risen);
                if (down == 2) return end_encounter(1);
                if (down == 1) return foe_killed(hero, &m, foe);
            }
        }
    }
}

/* she_1B3FD. Charm and stone counts that are still up wear off after the fight. */
static int encounter(Hero *hero, const Monster *enemy) {
    int charmed = 0, stoned = 0;
    int result = fight_monster(hero, enemy, &charmed, &stoned);
    if (result && (charmed > 0 || stoned > 0)) {
        printf("You feel much better now.\n");
        hold_message();
    }
    return result;
}

#define FLOOR_W 78
#define FLOOR_H 13
#define FLOOR_BYTES (FLOOR_W * FLOOR_H)

static int map_door(unsigned char tile) {
    return tile == 186 || tile == 205;
}

static int map_wall(unsigned char tile) {
    switch (tile) {
    case 179: case 196:
    case 218: case 191: case 192: case 217:
    case 194: case 193: case 195: case 180:
    case 197:
        return 1;
    default:
        return 0;
    }
}

static char map_char(unsigned char tile) {
    switch (tile) {
    case 179: case 186: return '|';
    case 196: case 205: return '-';
    case 218: case 191: case 192: case 217:
    case 194: case 193: case 195: case 180:
    case 197: case 210: return '+';
    case 16: case 17: case 18: case 19: return 'D';
    case 20: return 'W';
    case 24: case 14: return '^';
    case 25: case 13: return 'v';
    case 46: return '.';
    case 32: return ' ';
    default: return (tile >= 33 && tile < 127) ? (char)tile : '?';
    }
}

static void fmt_num(char *out, size_t cap, int width, float x);

static void row_put(char *row, int col, const char *s) {
    int i;
    for (i = 0; s[i] && col - 1 + i < 80; i++) row[col - 1 + i] = s[i];
}

static void blank_rows(char rows[8][81]) {
    int i;
    for (i = 0; i < 8; i++) {
        memset(rows[i], ' ', 80);
        rows[i][80] = 0;
    }
}

static void put_stat(char *row, int col, const char *label, int width, float value) {
    char num[32];
    char text[64];
    fmt_num(num, sizeof num, width, value);
    snprintf(text, sizeof text, "%s%s", label, num);
    row_put(row, col, text);
}

/* name_1C5C5: row 18 has the hero at column 1 and hitpoints at 40, row 19 the foe. */
static void fight_panel(const Hero *hero, const Monster *m) {
    char row[81];
    char hp[16];
    char max[16];
    char text[64];
    int n = 80;
    memset(row, ' ', 80);
    row[80] = 0;
    snprintf(text, sizeof text, "NAME - %s", hero->name);
    row_put(row, 1, text);
    fmt_num(hp, sizeof hp, 3, (float)hero->hp);
    fmt_num(max, sizeof max, 3, (float)hero->max_hp);
    snprintf(text, sizeof text, "HITPOINTS - %s/%s", hp, max);
    row_put(row, 40, text);
    if (live) {
        scr_cells(18, 1, row, 80, attr_of(15, 0));
        snprintf(text, sizeof text, "MONSTER YOU ARE CURRENTLY FIGHTING - %s", m->name);
        scr_blank(19, 1, 80);
        scr_cells(19, 1, text, (int)strlen(text), attr_of(15, 0));
        return;
    }
    while (n > 0 && row[n - 1] == ' ') row[--n] = 0;
    printf("%s\n", row);
    printf("MONSTER YOU ARE CURRENTLY FIGHTING - %s\n", m->name);
}

/* proc_1C494: the foe's name centered at 40 - INT(LEN / 2), a rule on row 17, then the panel.
   The messages run in rows 3 to 16. */
static void fight_screen(const Hero *hero, const Monster *m) {
    int i;
    if (live) {
        char rule[80];
        int n = (int)strlen(m->name);
        memset(rule, 0xCD, sizeof rule);
        scr_clear(1, 24);
        scr_cells(1, 40 - n / 2, m->name, n, attr_of(0, 6));
        scr_cells(17, 1, rule, 80, attr_of(6, 0));
        fight_panel(hero, m);
        mouse_buttons(13, "ENTER", 'R', "RUN");
        scr_region(3, 16, 1, 80);
        return;
    }
    printf("\n%*s%s\n", 39 - (int)strlen(m->name) / 2, "", m->name);
    for (i = 0; i < 80; i++) putchar(0xCD);
    putchar('\n');
    fight_panel(hero, m);
}

/* f_fight_1C730: menu_choice of the ten, five to a row from row 22. */
static int fight_menu_live(void) {
    static const char *const item[10] = {"(F) Fight", "(K) Kill", "(T) Talk", "(R) Run", "(M) Monster info",
                                         "(C) Cast", "(S) Sing", "(I) Inventory", "(W) Wish", "(H) Help"};
    return menu_choice(item, 10, 5, 1, 22, "");
}

/* name_0AF8B: screen rows 2..9, columns 2 and 30 (29 for WISH and SICK). */
static void status_rows(const Hero *h, int floor, char rows[8][81]) {
    char text[64];
    char hp[16];
    char max[16];
    blank_rows(rows);
    snprintf(text, sizeof text, "NAME  - %-20s", h->name);
    row_put(rows[0], 2, text);
    put_stat(rows[0], 30, "STR - ", 2, (float)h->str);
    snprintf(text, sizeof text, "RACE/CLASS - %-5.5s/%-7.7s", h->race, h->class_name);
    row_put(rows[1], 2, text);
    put_stat(rows[1], 30, "INT - ", 2, (float)h->intel);
    put_stat(rows[2], 2, "LEVEL - ", 2, (float)h->level);
    put_stat(rows[2], 30, "CON - ", 2, (float)h->con);
    fmt_num(hp, sizeof hp, 3, (float)h->hp);
    fmt_num(max, sizeof max, 3, (float)h->max_hp);
    snprintf(text, sizeof text, "HITPOINTS  -    %s/%s", hp, max);
    row_put(rows[3], 2, text);
    put_stat(rows[3], 30, "DEX - ", 2, (float)h->dex);
    put_stat(rows[4], 2, "EXPERIENCE - ", 10, (float)h->xp);
    put_stat(rows[4], 30, "CHR - ", 2, (float)h->chr);
    put_stat(rows[5], 2, "GOLD       - ", 10, (float)h->gold);
    put_stat(rows[5], 30, "LCK - ", 2, (float)h->lck);
    if (h->pet_hp > 0) {
        snprintf(text, sizeof text, "PET - %s", h->pet_name);
        row_put(rows[6], 2, text);
    }
    if (h->wishes > 0) put_stat(rows[6], 29, "WISH - ", 2, (float)h->wishes);
    if (floor > 0) put_stat(rows[7], 2, "DUNGEON LEV - ", 2, (float)floor);
    if (h->sickness > 0) put_stat(rows[7], 29, "SICK - ", 2, (float)h->sickness);
}

/* magic_resist_0B7DE: screen rows 2..9, columns 42 and 62. */
static void extended_rows(const Hero *h, char rows[8][81]) {
    int alert = scaled_stat(6 * h->intel + h->dex + h->lck, guard_scale(h), h->level) - (h->song > 0);
    blank_rows(rows);
    put_stat(rows[0], 42, "Magic resist  - ", 2, (float)magic_resist(h));
    put_stat(rows[0], 62, "To hit       - ", 2, (float)h->to_hit);
    put_stat(rows[1], 42, "Magic tools   - ", 2, (float)item_power(h));
    put_stat(rows[1], 62, "To damage    - ", 2, (float)h->to_damage);
    put_stat(rows[2], 42, "Magic ability - ", 2, (float)spell_power(h));
    put_stat(rows[2], 62, "To avoid dam - ", 2, (float)h->defense);
    put_stat(rows[3], 42, "To charm      - ", 2, (float)h->to_charm);
    put_stat(rows[3], 62, "To withstand - ", 2, (float)h->armor);
    put_stat(rows[4], 42, "To avoid trap - ", 2, (float)special_guard(h));
    put_stat(rows[4], 62, "Alertness    - ", 2, (float)alert);
    put_stat(rows[5], 42, "To hide       - ", 2, (float)run_rating(h));
    if (h->shield > 0) row_put(rows[6], 42, "SHIELD");
    if (h->haste > 0) row_put(rows[6], 52, "HASTE");
    if (h->dream_wolf == 1) row_put(rows[6], 62, "DREAM-WOLF");
    if (h->blind == 1) row_put(rows[7], 42, "BLIND");
    if (h->invisible >= 1 || wears_effect(h, 7)) row_put(rows[7], 52, "INVISIBLE");
    if (h->trap_ward == 1 || wears_effect(h, 8)) row_put(rows[7], 62, "NO-TRAP");
}

static void print_rows(char rows[8][81], int from, int to) {
    int i;
    for (i = 0; i < 8; i++) {
        char line[81];
        int n = to - from + 1;
        memcpy(line, rows[i] + from - 1, (size_t)n);
        line[n] = 0;
        while (n > 0 && line[n - 1] == ' ') line[--n] = 0;
        printf("%s\n", line);
    }
}

/* Set by X; the extended panel stays in the window until the next key. */
static int extended_up;

/* proc_0D0CF frames the screen (colour 6), proc_0C32E prints the 13 map rows
   at row 11 in colour 11 and name_0AF8B the panel; proc_0C3FC puts the
   CHR$(157) marker at (y + 10, x + 1) in colour 15 on 1. The right panel,
   rows 2 to 9 from column 42, is the window messages go in. */
static void draw_frame(int floor, const Hero *hero) {
    static const char top[] = "\xc9\xcd\xcb\xbb", mid[] = "\xcc\xcd\xca\xb9", bottom[] = "\xc8\xcd\xcd\xbc";
    char line[81];
    char rows[8][81];
    int r;
    scr_clear(1, 24);
    for (r = 0; r < 3; r++) {
        const char *edge = r == 0 ? top : r == 1 ? mid : bottom;
        memset(line, edge[1], 80);
        line[0] = edge[0];
        if (r < 2) line[39] = edge[2];
        line[79] = edge[3];
        scr_cells(r == 0 ? 1 : r == 1 ? 10 : 24, 1, line, 80, attr_of(6, 0));
    }
    for (r = 2; r <= 23; r++) {
        if (r == 10) continue;
        scr_cells(r, 1, "\xba", 1, attr_of(6, 0));
        if (r < 10) scr_cells(r, 40, "\xba", 1, attr_of(6, 0));
        scr_cells(r, 80, "\xba", 1, attr_of(6, 0));
    }
    status_rows(hero, floor, rows);
    for (r = 0; r < 8; r++) scr_cells(r + 2, 2, rows[r] + 1, 38, attr_of(15, 0));
}

/* The town screens (lerend_014BF, kiera_090AD): the frame and panel, the text from 11,3 in 11. */
static void town_frame(const Hero *hero) {
    if (!live) return;
    draw_frame(0, hero);
    scr_region(11, 23, 3, 78);
    scr_color(11, 0);
}

static void draw_live(const unsigned char *view, int x, int y, int floor, const Hero *hero) {
    char rows[8][81];
    int r;
    draw_frame(floor, hero);
    for (r = 0; r < FLOOR_H && !hero->blind; r++) scr_cells(r + 11, 2, (const char *)view + r * FLOOR_W, FLOOR_W, attr_of(11, 0));
    if (extended_up) {
        extended_rows(hero, rows);
        for (r = 0; r < 8; r++) scr_cells(r + 2, 42, rows[r] + 41, 38, attr_of(14, 0));
    }
    scr_cells(y + 10, x + 1, "\x9d", 1, attr_of(15, 1));
    if (!extended_up) stay_grid();
    mouse_show();
    scr_region(2, 9, 42, 79);
}

static void show_floor(const unsigned char *view, int x, int y, int floor, const Hero *hero) {
    char rows[8][81];
    int row;
    int col;
    if (live) {
        draw_live(view, x, y, floor, hero);
        return;
    }
    status_rows(hero, floor, rows);
    print_rows(rows, 1, 39);
    if (extended_up) {
        extended_rows(hero, rows);
        print_rows(rows, 42, 79);
    }
    for (row = 0; row < FLOOR_H; row++) {
        for (col = 0; col < FLOOR_W; col++) {
            if (hero->blind) putchar(' ');
            else if (col == x - 1 && row == y - 1) putchar('@');
            else putchar(map_char(view[row * FLOOR_W + col]));
        }
        putchar('\n');
    }
}

#define FLOOR_REC (4 + FLOOR_BYTES * 2)

static int find_tile(const unsigned char *view, int tile, int *x, int *y) {
    int i;
    for (i = 0; i < FLOOR_BYTES; i++) {
        if (view[i] == tile) {
            *x = (i % FLOOR_W) + 1;
            *y = (i / FLOOR_W) + 1;
            return 1;
        }
    }
    return 0;
}

static int load_floor(const Hero *hero, int floor, unsigned char *view, unsigned char *base, int *x, int *y) {
    char path[64];
    FILE *f;
    unsigned char rec[4 + FLOOR_BYTES * 2];
    if (floor < 1) return 0;
    snprintf(path, sizeof path, "%s.DUN", hero->file);
    f = fopen(path, "rb");
    if (!f) return 0;
    if (fseek(f, (long)(floor - 1) * FLOOR_REC, SEEK_SET) != 0 || fread(rec, 1, sizeof rec, f) != sizeof rec) {
        fclose(f);
        return 0;
    }
    fclose(f);
    *x = (int16_t)(rec[0] | (rec[1] << 8));
    *y = (int16_t)(rec[2] | (rec[3] << 8));
    if (*x < 1) *x = 1;
    if (*y < 1) *y = 1;
    if (*x > FLOOR_W) *x = FLOOR_W;
    if (*y > FLOOR_H) *y = FLOOR_H;
    memcpy(view, rec + 4, FLOOR_BYTES);
    memcpy(base, rec + 4 + FLOOR_BYTES, FLOOR_BYTES);
    return 1;
}

static void store_i16(unsigned char *p, int value) {
    p[0] = (unsigned char)(value & 255);
    p[1] = (unsigned char)((value >> 8) & 255);
}

static void store_i32(unsigned char *p, int value) {
    int i;
    for (i = 0; i < 4; i++) p[i] = (unsigned char)((value >> (8 * i)) & 255);
}

static void save_hero(const Hero *hero) {
    FILE *f;
    unsigned char rec[CHAR_RECORD];
    char path[64];
    int i;
    if (!hero->save_path[0]) return;
    f = fopen(hero->save_path, "rb+");
    if (!f) return;
    if (fseek(f, (long)hero->save_slot * CHAR_RECORD, SEEK_SET) != 0 ||
        fread(rec, 1, CHAR_RECORD, f) != CHAR_RECORD) {
        fclose(f);
        return;
    }
    store_i16(rec + 40, hero->level);
    store_i16(rec + 42, hero->hp);
    store_i16(rec + 44, hero->max_hp);
    store_i16(rec + 46, hero->str);
    store_i16(rec + 48, hero->intel);
    store_i16(rec + 50, hero->con);
    store_i16(rec + 52, hero->dex);
    store_i16(rec + 54, hero->chr);
    store_i16(rec + 56, hero->lck);
    store_i16(rec + 58, hero->run_mode ? 1 : 0);
    store_i16(rec + 60, hero->floor);
    store_i16(rec + 82, hero->sickness);
    store_i16(rec + 72, hero->staff_gold);
    store_i16(rec + 74, hero->staff_red);
    store_i16(rec + 76, hero->staff_black);
    store_i16(rec + 78, hero->staff_white);
    store_i16(rec + 80, hero->staff_power);
    store_i16(rec + 84, hero->wishes);
    store_i16(rec + 96, hero->song);
    store_i32(rec + 100, hero->xp);
    store_i32(rec + 104, hero->gold);
    memset(rec + 108, ' ', 20);
    memcpy(rec + 108, hero->pet_name, strlen(hero->pet_name) < 20 ? strlen(hero->pet_name) : 20);
    store_i16(rec + 128, hero->pet);
    store_i16(rec + 130, hero->pet_max_hp);
    store_i16(rec + 132, hero->pet_hp);
    store_i16(rec + 134, hero->pet_armor);
    store_i16(rec + 136, hero->pet_extra);
    store_i16(rec + 138, hero->pet_speed);
    store_i16(rec + 140, hero->pet_to_hit);
    store_i16(rec + 142, hero->pet_to_damage);
    store_i16(rec + 144, hero->pet_defense);
    if (fseek(f, (long)hero->save_slot * CHAR_RECORD, SEEK_SET) != 0 ||
        fwrite(rec, 1, CHAR_RECORD, f) != CHAR_RECORD) {
        fclose(f);
        return;
    }
    fclose(f);
    snprintf(path, sizeof path, "%s.INV", hero->file);
    f = fopen(path, "wb");
    if (!f) return;
    for (i = 0; i < hero->inv_n; i++) {
        if (fwrite(hero->inv[i], 1, 68, f) != 68) break;
    }
    fclose(f);
}

static void save_floor(const Hero *hero, int floor, const unsigned char *view, const unsigned char *base, int x, int y) {
    char path[64];
    FILE *f;
    unsigned char rec[4 + FLOOR_BYTES * 2];
    long at;
    if (floor < 1 || !hero->name[0]) return;
    snprintf(path, sizeof path, "%s.DUN", hero->file);
    f = fopen(path, "rb+");
    if (!f) return;
    at = (long)(floor - 1) * FLOOR_REC;
    if (fseek(f, 0, SEEK_END) != 0 || ftell(f) < at + FLOOR_REC ||
        fseek(f, at, SEEK_SET) != 0 || fread(rec, 1, FLOOR_REC, f) != FLOOR_REC) {
        fclose(f);
        return;
    }
    store_i16(rec, x);
    store_i16(rec + 2, y);
    memcpy(rec + 4, view, FLOOR_BYTES);
    memcpy(rec + 4 + FLOOR_BYTES, base, FLOOR_BYTES);
    if (fseek(f, at, SEEK_SET) == 0) fwrite(rec, 1, FLOOR_REC, f);
    fclose(f);
}

static void save_visit(Hero *hero, int floor, const unsigned char *view, const unsigned char *base, int x, int y, int have_map) {
    if (have_map) save_floor(hero, floor, view, base, x, y);
    save_hero(hero);
}

static int read_dungeon_key(void) {
    int c;
    if (!live) {
        char line[64];
        read_line(line, sizeof line);
        return (unsigned char)line[0];
    }
    c = read_key();
    if (c >= 256) {
        int scan = c - 256;
        if (scan == 72) return '8';
        if (scan == 80) return '2';
        if (scan == 75) return '4';
        if (scan == 77) return '6';
        if (scan == 71) return '7';
        if (scan == 73) return '9';
        if (scan == 79) return '1';
        if (scan == 81) return '3';
        if (scan == 76) return '5';
        return 0;
    }
    return c;
}

static int pick_key(void) {
    int key = read_dungeon_key();
    if (key >= 'a' && key <= 'z') key -= 32;
    return key;
}

static int direction_of(int key, int *dx, int *dy) {
    switch (key) {
    case '8': *dx = 0; *dy = -1; return 1;
    case '2': *dx = 0; *dy = 1; return 1;
    case '4': *dx = -1; *dy = 0; return 1;
    case '6': *dx = 1; *dy = 0; return 1;
    case '7': *dx = -1; *dy = -1; return 1;
    case '9': *dx = 1; *dy = -1; return 1;
    case '1': *dx = -1; *dy = 1; return 1;
    case '3': *dx = 1; *dy = 1; return 1;
    case '5': *dx = 0; *dy = 0; return 1;
    default: return 0;
    }
}

static int append_floor(const char *name, int floor);

/* 14 and 24 go up. 13 and 25 go down. 13 and 14 are a stub: the generator never places them. */
static int stair_dir(unsigned char tile) {
    if (tile == 14 || tile == 24) return -1;
    if (tile == 13 || tile == 25) return 1;
    return 0;
}

static int yes_no(void);
static int yes_no_at(int row, int col);

static int take_stairs(Hero *hero, int *floor, int dir, unsigned char *view, unsigned char *base, int *x, int *y) {
    unsigned char next_view[FLOOR_BYTES];
    unsigned char next_base[FLOOR_BYTES];
    int next = *floor + dir;
    int nx = 1;
    int ny = 1;
    printf("You have found some stairs going\n%s.  Do you wish to take them?\n", dir < 0 ? "up" : "down");
    if (yes_no() != 'Y') return 1;
    save_floor(hero, *floor, view, base, *x, *y);
    if (next < 1) {
        *floor = 0;
        return 0;
    }
    if (!load_floor(hero, next, next_view, next_base, &nx, &ny)) {
        if (next > 30 || !append_floor(hero->file, next) ||
            !load_floor(hero, next, next_view, next_base, &nx, &ny)) return 1;
    }
    find_tile(next_base, dir < 0 ? 25 : 24, &nx, &ny);
    memcpy(view, next_view, FLOOR_BYTES);
    memcpy(base, next_base, FLOOR_BYTES);
    *floor = next;
    *x = nx;
    *y = ny;
    return 1;
}

static void refresh_ratings(Hero *hero) {
    check_song(hero);
    rate_hero(hero);
    apply_worn_gear(hero);
}

static int change_stat(int *stat, int delta) {
    if (delta < 0 && *stat <= 1) return 0;
    if (delta > 0 && *stat >= 21) return 0;
    *stat += delta;
    return 1;
}

/* lips_1388C: four message lines at rows 4, 5, 7 and 8; the window stays up. */
static void drink_fountain(Hero *hero) {
    const char *l[4] = {"", "", "", ""};
    int roll;
    int i;
    printf("You see a fountain before you. Do you\n");
    printf("wish to drink from it? ('Y' or 'N')\n");
    if (yes_no() != 'Y') return;
    roll = basic_int(basic_rnd() * 24.0f) - 12;
    if (roll == -6) {
        l[0] = "The water glowed when it hit your";
        l[1] = "lips!";
        l[2] = change_stat(&hero->str, -1) ? "The radiation makes you weaker!" : "You are too weak already!";
    } else if (roll == -5) {
        l[0] = "The water was tainted with lithium!";
        if (change_stat(&hero->intel, -1)) {
            l[2] = "You now cannot think as clearly!";
        } else {
            l[2] = "(But you are already too stupid";
            l[3] = "to realize that!)";
        }
    } else if (roll == -4) {
        l[0] = "YECH!  ACID!";
        if (change_stat(&hero->con, -1)) {
            l[2] = "You are internally damaged!";
        } else {
            l[2] = "However, compared to some of the junk";
            l[3] = "you've ingested, this isn't so bad!";
        }
    } else if (roll == -3) {
        l[0] = "This tastes like booze, only stronger!";
        if (change_stat(&hero->dex, -1)) {
            l[2] = "You begin to stumble!";
        } else {
            l[2] = "Nothing like a good, stiff drink to";
            l[3] = "take your mind off your bad dexterity!";
        }
    } else if (roll == -2) {
        l[0] = "MM! Chocolate covered frog broth!";
        l[2] = change_stat(&hero->chr, -1) ? "You break out in warts!" : "The new warts cover the old ones!";
    } else if (roll == -1) {
        l[0] = "ACH! PHEW! Black cat furball stew!";
        if (change_stat(&hero->lck, -1)) {
            l[2] = "If you think this was a bad break,";
            l[3] = "just stick around for worse!";
        } else {
            l[2] = "If it wasn't for bad luck, you'd";
            l[3] = "have no luck at all!";
        }
    } else if (roll == 1) {
        l[0] = "MM! Rabbit foot stew!";
        l[2] = change_stat(&hero->lck, 1) ? "What a lucky find!" : "You're already a lucky guy.";
    } else if (roll == 2) {
        l[0] = "Fine wine!";
        l[2] = change_stat(&hero->chr, 1) ? "Nothing enhances an image more!" : "Your image is dashing enough.";
    } else if (roll == 3) {
        l[0] = "BALLETBREW, the drink of dance stars!";
        l[2] = change_stat(&hero->dex, 1) ? "You feel more graceful!" : "You are graceful enough.";
    } else if (roll == 4) {
        l[0] = "Liquid iron supplements?";
        if (change_stat(&hero->con, 1)) {
            l[2] = "You feel healthier inside!";
        } else {
            l[2] = "What possible good could extra iron";
            l[3] = "do for you?";
        }
    } else if (roll == 5) {
        l[0] = "Mnemonade! You remember more!";
        if (change_stat(&hero->intel, 1)) l[2] = "Your intelligence greatly benefits!";
        else l[3] = "You seem to know it all already.";
    } else if (roll == 6) {
        l[0] = "Spinach juice!";
        l[2] = change_stat(&hero->str, 1) ? "You feel stronger now!" : "You don't feel any affects.";
    } else {
        hero->sickness = 0;
        hero->hp = hero->max_hp;
        l[0] = "MM! Nothing refreshes quite like a";
        l[1] = "moutain stream!";
    }
    for (i = 0; i < 4; i++) printf("%s\n", l[i]);
    refresh_ratings(hero);
}

static int chest_avoid(const Hero *hero) {
    float scale = 0.75f;
    if (strcmp(hero->class_name, "BARD") == 0) scale = 3.0f;
    else if (strcmp(hero->class_name, "MAGE") == 0) scale = 0.85f;
    return basic_int((float)(4 * hero->dex + hero->lck) * scale * 20.0f) + 1;
}

static void take_chest_item(Hero *hero);

/* Open path at image 0x51C2. A 1-in-10 roll is trapped. The coins are
   INT((RND*15+1)*(floor/5+1)), then gold, silver, or platinum.
   The other roll, at image 0x56A4, is one item from ITEMFILE.DAT. */
/* enter_04E23: a chest, or with pouch set the pouch a slain monster
   carried. Leaving it puts a chest ('$') where you stand. */
static int treasure_chest(Hero *hero, int floor, unsigned char *view, unsigned char *base, int *x, int *y, int pouch) {
    char line[64];
    int at;
    int pieces;
    int kind;
    int worth;
    int guard;
    float rate;
    const char *metal;
    for (;;) {
        at = (*y - 1) * FLOOR_W + (*x - 1);
        if (!live) {
            printf("%s\n", pouch ? "The monster was carrying a pouch!" : "You have found a treasure chest.");
            printf("What do you wish to do?\n");
            printf("(O) Open it\n(Q) Leave it\n(C) Cast spell\n(I) Inventory management\n");
            read_line(line, sizeof line);
            if (line[0] == 'c' || line[0] == 'C') {
                if (cast_spell(hero, base, x, y, NULL, NULL) < 0) return -1;
            } else if (line[0] == 'i' || line[0] == 'I') {
                if (inventory_menu(hero, base, x, y, NULL, NULL) < 0) return -1;
            } else if (line[0] == 'q' || line[0] == 'Q' || line[0] == 27) {
                base[at] = 36;
                view[at] = 36;
                return 0;
            } else if (line[0] == 'o' || line[0] == 'O') {
                break;
            } else {
                printf("That was not a valid choice. Please retype!\n");
                hold_message();
            }
        } else {
            static const char *const chest_item[4] = {"(O) Open it", "(Q) Leave it", "(C) Cast spell", "(I) Inventory management"};
            const char *found = pouch ? "The monster was carrying a pouch!" : "You have found a treasure chest.";
            /* QB enter_04E23: redraw dungeon after a fight, open right panel (proc_0AA39),
               prompts at 2/3,42; menu_choice at col 42, row 5. */
            if (view && base && x && y) show_floor(view, *x, *y, floor, hero);
            mouse_buttons(13, "ENTER", 27, "ESCAPE");
            panel_open();
            scr_put(2, 42, found, attr_of(15, 0));
            scr_put(3, 42, "What do you wish to do?", attr_of(15, 0));
            int ch = menu_choice(chest_item, 4, 1, 42, 5, "");
            if (ch == 'Q' || ch == 27) {
                base[at] = 36;
                view[at] = 36;
                return 0;
            } else if (ch == 'C') {
                if (cast_spell(hero, base, x, y, NULL, NULL) < 0) return -1;
            } else if (ch == 'I') {
                if (inventory_menu(hero, base, x, y, NULL, NULL) < 0) return -1;
            } else if (ch == 'O') {
                break;
            } else {
                scr_status("That was not a valid choice. Please retype!");
                alarm();
            }
        }
    }
    if (basic_int(basic_rnd() * 10.0f) == 1) {
        int stat = chest_avoid(hero);
        if (live) panel_open();
        if (live) scr_put(2, 42, "It was trapped!", attr_of(15, 0));
        else printf("It was trapped!\n");
        if (basic_rnd() > (float)stat / (float)(stat + 40) && !hero->trap_ward && !wears_effect(hero, 8)) {
            int armor = hero->armor < 1 ? 1 : hero->armor;
            int damage = basic_int(basic_rnd() * (float)floor / (float)armor * 35.0f) + 1;
            char dmg[64];
            hero->hp -= damage;
            if (live) {
                snprintf(dmg, sizeof dmg, "You've been damaged for %d hitpoints", damage);
                scr_put(4, 41, dmg, attr_of(15, 0));
            } else {
                printf("You've been damaged for %d hitpoints\n", damage);
            }
            if (hero_died(hero, "TRAPPED CHEST")) return -1;
        } else {
            if (live) scr_put(4, 42, "Fortunately, you sidestepped it!", attr_of(15, 0));
            else printf("Fortunately, you sidestepped it!\n");
        }
        hold_message();
    }
    guard = 2 * floor;
    if (basic_rnd() <= (float)guard / (float)(guard + 30)) {
        take_chest_item(hero);
    } else {
        char msg[80];
        pieces = basic_int((basic_rnd() * 15.0f + 1.0f) * ((float)floor / 5.0f + 1.0f));
        if (pieces < 1) pieces = 1;
        kind = basic_int(basic_rnd() * 3.0f);
        metal = "gold";
        rate = 1.0f;
        if (kind == 1) {
            metal = "silver";
            rate = 0.1f;
        } else if (kind == 2) {
            metal = "platinum";
            rate = 3.0f;
        }
        worth = basic_int((float)pieces * rate) + 1;
        if (live) {
            panel_open();
            snprintf(msg, sizeof msg, "You have found %d pieces of", pieces);
            scr_put(2, 42, msg, attr_of(15, 0));
            snprintf(msg, sizeof msg, "%s.", metal);
            scr_put(3, 42, msg, attr_of(15, 0));
            if (kind == 0) {
                snprintf(msg, sizeof msg, "It's worth %d gold pieces.", worth);
                scr_put(5, 42, msg, attr_of(15, 0));
            }
        } else {
            printf("You have found %d pieces of\n", pieces);
            printf("%s.\n", metal);
            if (kind == 0) printf("It's worth %d gold pieces.\n", worth);
        }
        hero->gold += worth;
    }
    base[at] = 32;
    view[at] = 46;
    printf("Hit any key to continue\n");
    read_dungeon_key();
    return hero_died(hero, "TRAPPED TREASURE CHEST") ? -1 : 0;
}

static void drop_unworn(Hero *hero) {
    int i;
    for (i = hero->inv_n - 1; i >= 0; i--) {
        if (field_i16(hero->inv[i] + 64) == 1) continue;
        memmove(hero->inv[i], hero->inv[i + 1], (size_t)(hero->inv_n - i - 1) * 68);
        hero->inv_n--;
    }
}

/* Tile 209 rolls INT(RND*11)-5. Tile 208 skips the roll and lands on 0.
   Sitting on 209 stores 208 in the base, so the next sit is the insult. */
static int sit_throne(Hero *hero, unsigned char *base, int x, int y) {
    int at = (y - 1) * FLOOR_W + (x - 1);
    int fresh = base[at] == 209;
    int roll;
    int loss;
    printf("You see a throne before you. Do you\n");
    printf("wish to sit on it? ('Y' or 'N')\n");
    if (!yes_no()) return 0;
    roll = fresh ? basic_int(basic_rnd() * 11.0f) - 5 : 0;
    if (fresh) base[at] = 208;
    if (roll == -5) {
        printf("A Styxian haze surrounds the chair!\n");
        printf("You feel it draining you of energy!\n");
        printf("You wake with less experience and\n");
        printf("hitpoints\n");
        hero->xp = level_floor_xp(hero) - 1000;
    } else if (roll == -4) {
        printf("As you sit down, a kobold grabs your\n");
        printf("gold pouch and runs!\n");
        if (hero->gold == 0) printf("Good thing you didn't own anything!\n");
        hero->gold = 0;
    } else if (roll == -3) {
        loss = basic_int(basic_rnd() * (float)hero->con * class_scale(hero->class_name) * 0.3f) + (hero->level - 1);
        printf("An electric shock runs through you!\n");
        printf("Your body is permanently damaged!\n");
        hero->max_hp -= loss;
        hero->hp -= loss;
    } else if (roll == -2) {
        loss = hero->con > 0 ? basic_int(basic_rnd() * 100.0f / (float)hero->con) : 0;
        printf("You cut yourself DEEPLY on one of\n");
        printf("the rusty springs in the cushion!\n");
        printf("You don't feel so good!\n");
        hero->hp -= loss;
        if (wears_effect(hero, 46)) printf("(At least you didn't get sick!)\n");
        else hero->sickness += 1;
    } else if (roll == -1) {
        printf("The local denizens, realizing you are\n");
        printf("not their king, beat you to a bloody\n");
        printf("pulp and take all you own!  (At least\n");
        printf("they let you keep what you have on!)\n");
        hero->gold = 0;
        hero->hp = basic_int((float)hero->hp * 0.25f) - 1;
        drop_unworn(hero);
    } else if (roll == 1) {
        printf("A djinni appears.  Mistaking you for\n");
        printf("the king, it grants you a wish, then\n");
        printf("disappears in a cloud of smoke!\n");
        hero->wishes += 1;
    } else if (roll == 2) {
        printf("A healing mist rises from the\n");
        printf("cushion!  The mist makes you\n");
        printf("feel very good!\n");
        hero->hp = hero->max_hp;
        hero->sickness = 0;
    } else if (roll == 3) {
        int gain = basic_int(basic_rnd() * 5.0f);
        printf("A warm massage runs through you!\n");
        printf("You body feels that it could take\n");
        printf("more abuse than before!\n");
        hero->max_hp += gain;
        hero->hp += gain;
    } else if (roll == 4) {
        int gain = basic_int(basic_rnd() * 1000.0f) + 500;
        printf("The local denizens, mistaking you for\n");
        printf("their king, start throwing gold!\n");
        printf("You manage to pick it all up.\n");
        hero->gold += gain;
    } else if (roll == 5) {
        int gain = basic_int(basic_rnd() * 10000.0f) + 5000;
        printf("A Mnemonadian haze surrounds the\n");
        printf("chair! You realize things you never\n");
        printf("knew!\n");
        hero->xp += gain;
    } else {
        printf("Oh sure. No big deal. Go ahead and\n");
        printf("rest. It's only the entire realm at\n");
        printf("stake. I wouldn't want you miss your\n");
        printf("beauty sleep! (Jeez! All the heroes\n");
        printf("in the world and we get a schmutz!)\n");
    }
    printf("Hit any key to continue\n");
    read_dungeon_key();
    return hero_died(hero, "THRONE") ? -1 : 0;
}

/* Tile 21 rolls INT(RND*10)+1. Each number is a different trap.
   The same avoid check used by the falling head picks the kinder line
   for the traps that share it. A sprung trap becomes tile 210. */
static int trap_avoid(const Hero *hero) {
    float scale = 0.75f;
    int sum;
    int stat;
    if (strcmp(hero->class_name, "BARD") == 0) scale = 3.0f;
    else if (strcmp(hero->class_name, "MAGE") == 0) scale = 0.85f;
    sum = 4 * hero->dex + hero->lck;
    stat = basic_int((float)sum * scale * 20.0f) + 1;
    if (stat < 1) stat = 1;
    return basic_rnd() <= (float)stat / (float)(stat + 10);
}

static int find_worn(const Hero *hero, int armor) {
    int i;
    for (i = 0; i < hero->inv_n; i++) {
        int type = field_i16(hero->inv[i] + 54);
        int worn = field_i16(hero->inv[i] + 64) == 1;
        int match = armor ? type == 2 : (type == 1 || type == 35 || type == 36);
        if (worn && match) return i;
    }
    return -1;
}

static void remove_inv(Hero *hero, int i) {
    if (i < 0 || i >= hero->inv_n) return;
    memmove(hero->inv[i], hero->inv[i + 1], (size_t)(hero->inv_n - i - 1) * 68);
    hero->inv_n--;
}

static void wake_elsewhere(const unsigned char *base, int *x, int *y) {
    int i;
    for (i = 0; i < 200; i++) {
        int nx = basic_int(basic_rnd() * (float)FLOOR_W) + 1;
        int ny = basic_int(basic_rnd() * (float)FLOOR_H) + 1;
        unsigned char tile = base[(ny - 1) * FLOOR_W + (nx - 1)];
        if (tile == 32 || tile == 46) {
            *x = nx;
            *y = ny;
            return;
        }
    }
}

static int spring_trap(Hero *hero, int floor, unsigned char *view, const unsigned char *base, int *x, int *y) {
    int which = basic_int(basic_rnd() * 10.0f) + 1;
    int good = trap_avoid(hero);
    int slot;
    char name[28];
    if (hero->trap_ward) {
        printf("May no trap befall you (for a\nwhile, anyway)\n");
        hold_message();
        return 0;
    }
    if (which == 1) {
        int damage;
        printf("An Easter Island head falls from the\n");
        printf("sky. While admiring its beauty, you\n");
        printf("can't help thinking how uncomfortable\n");
        printf("it would be if it landed on you.\n");
        if (good) {
            printf("Fortunately, you avoid it.\n");
        } else {
            printf("Well, you're about to find out!\n");
            damage = basic_int(basic_rnd() * (float)floor * 2.0f);
            hero->hp -= damage;
            printf("You've been hit for %d hitpoints.\n", damage);
            if (hero_died(hero, "FALLING ROCK")) return -1;
        }
    } else if (which == 2) {
        printf("Gas starts seeping up from the ground.\n");
        printf("As you breath it, all your troubles\n");
        printf("seem to fade.  You begin to feel\n");
        printf("like Dorthy surronded by poppies.\n");
        if (good) {
            printf("Somehow, you stay awake.\n");
        } else {
            printf("You doze off.\n");
            hero->down = basic_int(basic_rnd() * (float)floor) + 1;
        }
    } else if (which == 3) {
        printf("Three TROLLS, a STONE GOLEM, two\n");
        printf("MINOTAURS, four OGRES, and a\n");
        printf("LAND GIANT ambush you and force\n");
        printf("you to read a BOOK OF LIES!\n");
        if (good) {
            printf("Miraculously, you escape!\n");
        } else {
            printf("You awake with less experience!\n");
            hero->xp = level_floor_xp(hero) - 1000;
        }
    } else if (which == 4) {
        printf("While meandering around, a light rain\n");
        printf("starts to fall.\n");
        slot = find_worn(hero, 0);
        if (slot < 0) {
            printf("It glistens off your hands.\n");
        } else {
            item_name(name, (int)sizeof name, hero->inv[slot]);
            if (field_i16(hero->inv[slot] + 62) >= 1) {
                printf("It glistens off your %s\n", name);
            } else {
                printf("You notice the rain changing your\n");
                printf("%s's color!\n", name);
                printf("You quickly sheath your %s\n", name);
                printf("Your %s turns to rust!\n", name);
                remove_inv(hero, slot);
            }
        }
    } else if (which == 5) {
        printf("You find yourself stuck in the mire.\n");
        printf("After screaming for help, a nymph\n");
        printf("appears.  She agrees to help you\n");
        printf("for a fee. You feel obligated to agree.\n");
        if (good) {
            printf("She ends up refusing your money.\n");
        } else if (hero->gold <= 0) {
            printf("Finding no money on you, she leaves\n");
        } else {
            int left = basic_int(basic_rnd() * (float)hero->gold);
            if (left < 1) {
                hero->gold = 0;
                printf("She takes all of your money.\n");
            } else {
                hero->gold = left;
                printf("She takes most of your money.\n");
            }
        }
    } else if (which == 6) {
        printf("You see a bright light.  A voice in\n");
        printf("the background becons you to move\n");
        printf("toward the light.  As you start\n");
        printf("to move, the light gets more intense.\n");
        printf("%s\n", good ? "You stop moving forward." : "Now you can't see anything.");
        if (!good) hero->blind = 1;
    } else if (which == 7) {
        printf("You hit a trip wire.  50 darts fire\n");
        printf("at you.  The first 23 go to your\n");
        printf("left. The next 19 go to your right.\n");
        printf("7 hit the ground in front of you.\n");
        if (good) {
            printf("You dodge the last one.\n");
        } else if (wears_effect(hero, 46) || wears_effect(hero, 45)) {
            printf("The last one hits! It has no effect!\n");
        } else {
            printf("The last one hits! You're sick.\n");
            hero->sickness += 1;
        }
    } else if (which == 8) {
        printf("You find a magnifying glass. Thinking\n");
        printf("it would help you see your map\n");
        printf("better, you hold it over the map.\n");
        printf("As light intensifies, your map ignites!\n");
        if (good) {
            printf("You put it out.\n");
        } else {
            printf("There'll always be other maps.\n");
            memset(view, 32, FLOOR_BYTES);
        }
    } else if (which == 9) {
        printf("Dark clouds gather as a heavy rain\n");
        printf("falls.  The rain is foul-smelling.\n");
        slot = find_worn(hero, 1);
        if (slot < 0) {
            printf("You weather the storm.\n");
        } else if (field_i16(hero->inv[slot] + 62) >= 1) {
            printf("Your armor is unaffected! (Whew!)\n");
        } else {
            printf("You notice a smoke raising from\n");
            printf("your armor!\n");
            printf("You quickly find shelter.\n");
            printf("Your armor disintigrates!\n");
            remove_inv(hero, slot);
        }
    } else {
        printf("You see an floating orb drifting by. It\n");
        printf("emits some strange kind of ray.  You\n");
        printf("feel an internal wrenching and more\n");
        printf("than a little nauseous\n");
        if (good) {
            printf("The feeling seems to pass.\n");
        } else {
            printf("You wake up in a strange place.\n");
            wake_elsewhere(base, x, y);
        }
    }
    hold_message();
    return 1;
}

static int reveal_around(Hero *hero, unsigned char *view, unsigned char *base, int x, int y, int dx, int dy, int step);

/* Tiles 16-19 are the four dragons. Tile 20 is Lodi. Shared dragon
   ratings are to hit 42, to damage 42, armor 32, defense 32.
   A kill pays the flat experience stored for that fight. */
static void set_boss(Monster *m, const char *name, int lo, int hi, int tier, int prize) {
    memset(m, 0, sizeof *m);
    strncpy(m->name, name, NAME_LEN);
    m->hp_lo = lo;
    m->hp_hi = hi < lo ? lo : hi;
    m->to_hit = 42;
    m->to_damage = 42;
    m->defense = 32;
    m->armor = 32;
    m->tier = tier;
    m->prize = prize;
    m->speech = 1;
    m->disposition = -1;
    m->magic = 55;
    m->guard = 55;
    m->speed = 4;
    m->verbs = 15;
    m->ability[0] = 7;
    m->ability[1] = 12;
    m->ability[2] = 24;
}

static int boss_lair(Hero *hero, int tile, unsigned char *view, unsigned char *base, int x, int y) {
    Monster foe;
    int result;
    int lodi_staff = 0;
    if (tile >= 16 && tile <= 19) {
        print_sb_key("DRAGONSLAIR");
        hold_message();
    } else if (hero->staff_power == 1) {
        /* sorcererslair_204A2: the staffs vanish, [0x208] = 2. */
        print_sb_key("SORCERERSLAIR");
        hero->staff_power = 2;
    } else {
        /* The SORCERERAGAIN branch tests an unset local against 0, so it never runs. */
        print_sb_key("SORCERERNOSTAFF");
        lodi_staff = 1;
    }
    if (tile == 16) {
        printf("A red dragon is the weakest of all dragons, but it still packs a wallop\n");
        printf("in a fight. For some reason, no mage has ever survived a fight with one.\n");
        set_boss(&foe, "RED DRAGON", 65, 85, 29, 3000);
        foe.ability[3] = 26;
    } else if (tile == 17) {
        printf("A gold dragon is a very tough monster, even for a dragon!  Probably, it is\n");
        printf("the most reasonable of all dragons, but for a dragon, that's not saying much.\n");
        set_boss(&foe, "GOLD DRAGON", 130, 140, 29, 3000);
        foe.disposition = 0;
        foe.ability[3] = 27;
        foe.ability[4] = 21;
    } else if (tile == 18) {
        printf("A white dragon is a dragon from the bitter arctic.  It has powers over cold,\n");
        printf("and a cold heart to match.  Be careful around this one.\n");
        set_boss(&foe, "WHITE DRAGON", 85, 95, 29, 3000);
        foe.ability[3] = 9;
        foe.ability[4] = 17;
    } else if (tile == 19) {
        printf("A phase dragon is a dragon from the outer planes.  Be careful with this one.\n");
        printf("Phase dragons are the toughest of all dragons!\n");
        set_boss(&foe, "PHASE DRAGON", 130, 140, 29, 3000);
        foe.ability[3] = 9;
        foe.ability[4] = 29;
        foe.ability[5] = 2;
    } else {
        static const int codes[] = {1, 7, 24, 26, 9, 27, 0, 0};
        float scale = class_scale(hero->class_name);
        float k = 0.75f;
        int hp = hero->max_hp < 1 ? 1 : hero->max_hp;
        if (strcmp(hero->class_name, "MAGE") == 0) k = 0.85f;
        else if (strcmp(hero->class_name, "BARD") == 0) k = 3.0f;
        printf("This is it. The sorcerer is the most powerful entity in the entire dungeon.\n");
        printf("Good luck against this one, because you'll need it!\n");
        set_boss(&foe, "LODI THE SORCERER", hp, hp, 30, 6000);
        foe.to_hit = scaled_stat(2 * hero->str + 4 * hero->dex + hero->intel + hero->lck, scale, hero->level) + 20;
        foe.to_damage = scaled_stat(7 * hero->str + hero->lck, scale, hero->level) + 20;
        foe.defense = scaled_stat(5 * hero->dex + hero->str + hero->intel + hero->lck, scale, hero->level) + 35;
        foe.armor = scaled_stat(7 * hero->con + hero->lck, scale, hero->level) + 35;
        foe.magic = scaled_stat(5 * hero->intel + 2 * hero->dex + hero->lck, magic_scale(hero->class_name), hero->level) + 35;
        foe.guard = scaled_stat(6 * hero->dex + hero->intel + hero->lck, k, hero->level) + 20;
        foe.speed = 3;
        foe.verbs = 16;
        foe.gender = 1;
        foe.staff = lodi_staff;
        memcpy(foe.ability, codes, sizeof codes);
    }
    foe.lair = tile;
    printf("Hit any key to continue\n");
    read_dungeon_key();
    result = encounter(hero, &foe);
    if (result == 0) return -1;
    if (result == 2) {
        int at = (y - 1) * FLOOR_W + (x - 1);
        base[at] = 32;
        view[at] = 46;
        if (!hero->staff_power) {
            if (tile == 16 && !hero->staff_red) {
                printf("You pick up the red quarterstaff\n");
                hero->staff_red = 1;
            } else if (tile == 19 && !hero->staff_black) {
                printf("You pick up the black quarterstaff\n");
                hero->staff_black = 1;
            } else if (tile == 18 && !hero->staff_white) {
                printf("You pick up the white quarterstaff\n");
                hero->staff_white = 1;
            }
            assemble_staff(hero);
        }
        if (tile == 20) {
            print_sb_key("WINGAME");
            hold_message();
            return -1;
        }
    }
    return 0;
}

static int inventory_menu(Hero *hero, unsigned char *base, int *x, int *y, const Monster *foe, int *foe_hp);
static void fill_spells(Hero *hero);

/* loss_of_str_007A9. Ten sickness ends the run. */
static int sickness_kills(Hero *hero) {
    return hero->sickness >= 10 && hero_died(hero, "SICKNESS");
}

/* The step routine after its experience point: a damaging item, healing every
   INT(150/CON) steps (every step with regeneration and no sickness; the song
   of healing counts level+1 steps at a time and heals level points), and one
   spell back every INT(400/spell power) steps. That counter restarts at 1. */
static int step_recovery(Hero *hero, int *heal_steps, int *spell_steps, int *pet_steps) {
    int regen = worn_bonus(hero, 4);
    int power = spell_power(hero);
    int i;
    /* experience_170C7: the pet gets 1 hp every INT(150 / [0x23E]) steps. */
    if (hero->pet > 0 && hero->pet_armor > 0) {
        (*pet_steps)++;
        if (*pet_steps >= basic_int(150.0f / (float)hero->pet_armor)) {
            if (hero->pet_max_hp > hero->pet_hp) hero->pet_hp++;
            *pet_steps = 0;
        }
    }
    if (regen < 0) {
        hero->hp--;
        if (hero_died(hero, "DAMAGING MAGIC ITEM")) return 0;
    }
    if (hero->max_hp > hero->hp) {
        int need = hero->con > 0 ? basic_int(150.0f / (float)hero->con) : 0;
        int amount = 1;
        if (regen > 0 && hero->sickness == 0) {
            *heal_steps = need;
        } else if (hero->song == 1 && hero->sickness == 0) {
            amount = hero->level;
            *heal_steps += hero->level + 1;
        } else if (hero->sickness == 0 || hero->song == 1 || regen > 0) {
            (*heal_steps)++;
        }
        if (*heal_steps >= need) {
            hero->hp += amount;
            if (hero->hp > hero->max_hp) hero->hp = hero->max_hp;
            *heal_steps = 0;
        }
    }
    if (power > 0) {
        (*spell_steps)++;
        if (*spell_steps >= basic_int(400.0f / (float)power)) {
            for (i = 0; i < 5; i++) {
                if (hero->spell_left[i] < hero->spell_max[i]) {
                    hero->spell_left[i]++;
                    break;
                }
            }
            *spell_steps = 1;
        }
    }
    return 1;
}

/* [0x1F2], kept in the character record. */
static void toggle_run(Hero *hero) {
    hero->run_mode = !hero->run_mode;
    printf(hero->run_mode ? "You start running.\n" : "You slow your pace to a walk.\n");
}

/* sing_a_song_108A6. The last menu line overwrites the song at that slot;
   with five songs known the fifth slot is blank. Returns 1 when it leaves
   a message up without waiting for a key. */
static int sing_song(Hero *hero) {
    char item[7][40] = {"", "HYPOCRITA - The song of healing", "BAZERKER  - The song of ferocity",
                        "ASSUAGEO  - The song of soothing", "DISPELLIA - The song of dispelling", "", ""};
    int known;
    int i;
    int key;
    int pick;
    if (live) {
        /* sing_a_song_108A6: the panel cleared, the title at 2,54, the text from 4,42. */
        panel_open();
        scr_put(2, 54, "SING A SONG", attr_of(15, 0));
        scr_at(4, 42);
    }
    if (strcmp(hero->class_name, "BARD") != 0) {
        printf("You start singing, but it\n");
        printf("has no effect. If only you\n");
        printf("were a bard!\n");
        hold_message();
        return 0;
    }
    known = basic_int((float)hero->level / 3.0f) + song_power(hero);
    if (known == 0) {
        printf("You start singing a pleasant\n");
        printf("song, but it has no effect.\n");
        printf("You will learn songs of\n");
        printf("power starting at level 3 or\n");
        printf("when wielding an instrument\n");
        return 1;
    }
    if (known > 5) known = 5;
    if (known >= 0) snprintf(item[known + 1], sizeof item[0], "Do not sing anything");
    if (live) {
        /* The singing line at 3,42, the question at 4,42, the songs from 5,42. */
        char text[7][48];
        const char *shown[7];
        if (hero->song == 0) snprintf(text[0], sizeof text[0], "You are currently not singing");
        else snprintf(text[0], sizeof text[0], "You are singing the %.9s.", hero->song >= 0 && hero->song < 7 ? item[hero->song] : "");
        scr_put(3, 42, text[0], attr_of(15, 0));
        scr_put(4, 42, "Which song do you wish to sing?", attr_of(15, 0));
        for (i = 1; i <= known + 1; i++) {
            snprintf(text[i], sizeof text[i], "(%d) %s", i, item[i]);
            shown[i - 1] = text[i];
        }
        key = panel_choose(shown, known + 1, 5);
    } else {
        for (i = 1; i <= known + 1; i++) printf("(%d) %s\n", i, item[i]);
        if (hero->song == 0) printf("You are currently not singing\n");
        else printf("You are singing the %.9s.\n", hero->song >= 0 && hero->song < 7 ? item[hero->song] : "");
        printf("Which song do you wish to sing?\n");
        key = pick_key();
    }
    if (key == 'Q' || key == 27) return 0;
    pick = key - '0';
    if (pick < 1 || pick > known + 1) return 0;
    hero->song = pick == known + 1 ? 0 : pick;
    rate_from_pack(hero);
    printf("%s\n", item[pick]);
    return 1;
}

static void show_attributes(Hero *hero, int floor);
static void experience_menu(void);

/* r_toggle_run_mode_on_off_16F5D, the M menu while walking. */
static int dungeon_options(Hero *hero, unsigned char *base, int *x, int *y) {
    static const char *const item[8] = {"(R) TOGGLE RUN MODE ON/OFF", "(X) DISPLAY EXTENDED ATTRIBUTES", "(H) HELP",
                                        "(S) SING A SONG", "(C) CAST A SPELL", "(W) MAKE A WISH",
                                        "(I) INVENTORY MAINTENANCE", "(Q or ESC) CONTINUE RUNNING"};
    int key;
    int i;
    if (live) {
        panel_open();
        key = panel_choose(item, 8, 2);
    } else {
        for (i = 0; i < 8; i++) printf("%s\n", item[i]);
        key = pick_key();
    }
    if (key == 'R') {
        toggle_run(hero);
    } else if (key == 'X') {
        extended_up = 1;
    } else if (key == 'H') {
        show_help("HELPRUN");
    } else if (key == 'S') {
        if (sing_song(hero)) hold_message();
    } else if (key == 'C') {
        int cast = cast_spell(hero, base, x, y, NULL, NULL);
        if (cast < 0) return -1;
        if (cast > 0) hold_message();
    } else if (key == 'W') {
        make_wish(hero, NULL, 0);
    } else if (key == 'I') {
        if (inventory_menu(hero, base, x, y, NULL, NULL) < 0) return -1;
    } else if (key != 'Q' && key != 27) {
        printf("UNKNOWN KEY WAS HIT \n");
        hold_message();
    }
    return 0;
}

static void dungeon(Hero *hero, const Monster *monsters, int count) {
    unsigned char view[FLOOR_BYTES];
    unsigned char base[FLOOR_BYTES];
    int x = 1;
    int y = 1;
    int floor = hero->floor > 0 ? hero->floor : 1;
    int auto_key = 0;
    int running = 0;
    int asleep = 0;
    int stop;
    int have_map;
    int heal_steps = 0;
    int spell_steps = 0;
    int pet_steps = 0;
    /* proc_166EF refills the spells only on a fresh start; a resumed floor keeps what is left. */
    if (hero->floor > 0) {
        int left[5];
        memcpy(left, hero->spell_left, sizeof left);
        fill_spells(hero);
        memcpy(hero->spell_left, left, sizeof left);
    } else {
        fill_spells(hero);
    }
    have_map = load_floor(hero, floor, view, base, &x, &y) ||
               (append_floor(hero->file, floor) && load_floor(hero, floor, view, base, &x, &y));
    if (!have_map) return;
    for (;;) {
        int key;
        int dx = 0;
        int dy = 0;
        int nx;
        int ny;
        int at;
        unsigned char tile;
        if (sickness_kills(hero)) break;
        reveal_around(hero, view, base, x, y, 0, 0, 0);
        mouse_left = 13;
        mouse_left_name = "MENU";
        mouse_right = 27;
        mouse_right_name = "ESCAPE";
        show_floor(view, x, y, floor, hero);
        extended_up = 0;
        running = auto_key != 0 || asleep;
        if (asleep) {
            key = '5';
            asleep = 0;
        } else if (running) {
            key = auto_key;
            auto_key = 0;
        } else {
            /* stay_12801: the arrow grid, STAY in the middle, then (M)enu (Q)uit (H)elp. */
            if (!live) printf(" \\  ^  /\n <  STAY  >\n /  v  \\\n(M)enu (Q)uit (H)elp\n");
            key = read_dungeon_key();
            if (live && key == 13) key = "789456123MQH"[stay_sel - 1];
            if (live) {
                const char *at_key = key ? strchr("789456123", key) : NULL;
                if (at_key) stay_sel = (int)(at_key - "789456123") + 1;
                scr_window(2, 9, 42, 79);
            }
        }
        if (time_up) break;
        if (key == 'r' || key == 'R' || key == '0') {
            toggle_run(hero);
            continue;
        }
        if (key == 'm' || key == 'M') {
            if (dungeon_options(hero, base, &x, &y) < 0) break;
            continue;
        }
        if (key == 's' || key == 'S') {
            if (sing_song(hero)) hold_message();
            continue;
        }
        if (key == 'c' || key == 'C') {
            int cast = cast_spell(hero, base, &x, &y, NULL, NULL);
            if (cast < 0) break;
            if (cast > 0) hold_message();
            continue;
        }
        if (key == 'i' || key == 'I') {
            if (inventory_menu(hero, base, &x, &y, NULL, NULL) < 0) break;
            continue;
        }
        /* dun_1A58C: the floor is saved and the character stays on it. */
        if (key == 'q' || key == 'Q' || key == 27) break;
        if (key == 'x' || key == 'X') {
            extended_up = 1;
            continue;
        }
        if (key == 'h' || key == 'H') {
            show_help("HELPRUN");
            continue;
        }
        if (key == 'w' || key == 'W') {
            make_wish(hero, NULL, 0);
            continue;
        }
        if (!direction_of(key, &dx, &dy)) {
            if (live) {
                scr_status("UNKNOWN KEY WAS HIT ");
                alarm();
                continue;
            }
            printf("UNKNOWN KEY WAS HIT \n");
            hold_message();
            continue;
        }
        nx = x + dx;
        ny = y + dy;
        {
            /* experience_170C7: off the map or into a wall, the step is dropped. */
            int outside = nx < 1 || ny < 1 || nx > FLOOR_W || ny > FLOOR_H;
            int dest = outside ? 0 : (ny - 1) * FLOOR_W + (nx - 1);
            int secret = !outside && (base[dest] == 11 || base[dest] == 12);
            if (outside || (map_wall(view[dest]) && !secret)) continue;
        }
        at = (ny - 1) * FLOOR_W + (nx - 1);
        x = nx;
        y = ny;
        hero->xp += 1;
        if (!step_recovery(hero, &heal_steps, &spell_steps, &pet_steps)) break;
        /* experience_170C7 order: the sight scan (and blindness), the wandering monster, the tile, the wear-offs, sleep. */
        stop = reveal_around(hero, view, base, x, y, dx, dy, 1);
        tile = base[at];
        if (meet_on_step(hero->level, floor)) {
            const Monster *met = pick_monster(monsters, count, floor);
            int fought = encounter(hero, met);
            if (!fought || !check_level(hero)) break;
            if (fought == 2 && met->speech == 1 && (met->gender != 0 || met->verbs > 15) &&
                treasure_chest(hero, floor, view, base, &x, &y, 1) < 0) break;
            stop = 1;
        }
        if (tile == 145) {
            drink_fountain(hero);
            stop = 1;
        } else if (tile == 209 || tile == 208) {
            if (sit_throne(hero, base, x, y) < 0) break;
            stop = 1;
        } else if (tile >= 16 && tile <= 20) {
            if (boss_lair(hero, tile, view, base, x, y) < 0 || !check_level(hero)) break;
            stop = 1;
        } else if (tile == 21 && hero->down == 0) {
            int sprung = spring_trap(hero, floor, view, base, &x, &y);
            if (sprung != 0) {
                base[at] = 210;
                view[at] = 210;
            }
            if (sprung < 0) break;
            stop = 1;
        } else if (tile == 36) {
            if (treasure_chest(hero, floor, view, base, &x, &y, 0) < 0) break;
            stop = 1;
        } else if (tile == 210) {
            printf("You see the remnants of an\n");
            printf("already-sprung trap.  Ah yes,\n");
            printf("you remember it well.\n");
            hold_message();
        } else if ((tile == 11 || tile == 12) && !map_door(view[at])) {
            printf("You have found a secret door!\n");
            view[at] = (unsigned char)(tile == 11 ? 186 : 205);
            hold_message();
        } else if (stair_dir(tile)) {
            if (!take_stairs(hero, &floor, stair_dir(tile), view, base, &x, &y)) break;
            stop = 1;
        }
        if (hero->shield > 0 && basic_int(basic_rnd() * (float)hero->shield * 10.0f) == 0) {
            hero->shield = 0;
            printf("You air shield drops!\n");
            hold_message();
            rate_from_pack(hero);
        }
        if (hero->haste >= 1 && basic_int(basic_rnd() * 100.0f) == 0) {
            hero->haste--;
            printf("You feel yourself slowing down!\n");
            hold_message();
        }
        if (hero->trap_ward == 1 && basic_int(basic_rnd() * 100.0f) == 0) {
            hero->trap_ward = 0;
            if (!wears_effect(hero, 8)) {
                printf("Your no-trap protection has worn off!\n");
                hold_message();
            }
        }
        if (hero->invisible > 0 && basic_int(basic_rnd() * (float)hero->invisible) == 0) {
            hero->invisible = 0;
            printf("You start to turn visible again!\n");
            hold_message();
            rate_from_pack(hero);
        }
        /* The sleeper stays put and the step repeats until INT(RND*(sleep+1)) = 0. */
        if (hero->down > 0) {
            if (basic_int(basic_rnd() * (float)(hero->down + 1)) == 0) {
                printf("You start to wake up\n");
                hero->down = 0;
                hold_message();
            } else {
                printf("You are sleeping\n");
                asleep = 1;
            }
            continue;
        }
        if (!stop && hero->run_mode && tile == 32) auto_key = key;
    }
    if (hero->hp <= 0) {
        hero->death_floor = floor;
        hero->floor = 0;
    } else {
        hero->floor = floor;
    }
    save_visit(hero, floor, view, base, x, y, have_map);
    if (hero->hp > 0 && floor == 0) {
        printf("You've escaped the dungeon! Have fun in town. (Hit any key to continue.)\n");
        read_dungeon_key();
    }
}

static void list_inventory(const Hero *hero, int display, const char *verb);

/* character_attributes_0F9E0. floor 0 is town. */
static void show_attributes(Hero *hero, int floor) {
    char hp[24];
    int alert;
    int i;
    rate_from_pack(hero);
    if (floor == 0) fill_spells(hero);
    alert = scaled_stat(6 * hero->intel + hero->dex + hero->lck, guard_scale(hero), hero->level) - (hero->song > 0);
    snprintf(hp, sizeof hp, "%d/%d", hero->hp, hero->max_hp);
    if (live) {
        /* Title 1,30 in 15; rows 3-5 and 7-8 at columns 1, 30, 57 in 10; the extended
           title 10,30 in 15, rows 12-15 at 1, 26, 57 in 14; spells from 17,22. */
        char cell[3][48];
        WORD a = attr_of(10, 0);
        int r, c;
        scr_clear(1, 24);
        at_print(1, 30, 15, 0, "CHARACTER ATTRIBUTES");
        for (r = 0; r < 5; r++) {
            switch (r) {
            case 0:
                snprintf(cell[0], 48, "Name  -  %s", hero->name);
                snprintf(cell[1], 48, "Level      -  %d", hero->level);
                snprintf(cell[2], 48, "Hitpoints    -  %s", hp);
                break;
            case 1:
                snprintf(cell[0], 48, "Race  -  %s", hero->race);
                snprintf(cell[1], 48, "Experience -  %d", hero->xp);
                snprintf(cell[2], 48, "Wishes       -  %d", hero->wishes);
                break;
            case 2:
                snprintf(cell[0], 48, "Class -  %s", hero->class_name);
                snprintf(cell[1], 48, "Gold       -  %d", hero->gold);
                snprintf(cell[2], 48, "Sick level   -  %d", hero->sickness);
                break;
            case 3:
                snprintf(cell[0], 48, "Strength  -  %d", hero->str);
                snprintf(cell[1], 48, "Intelligence -  %d", hero->intel);
                snprintf(cell[2], 48, "Constitution -  %d", hero->con);
                break;
            default:
                snprintf(cell[0], 48, "Dexterity -  %d", hero->dex);
                snprintf(cell[1], 48, "Charisma     -  %d", hero->chr);
                snprintf(cell[2], 48, "Luck         -  %d", hero->lck);
            }
            for (c = 0; c < 3; c++) scr_put(r < 3 ? 3 + r : 4 + r, c == 0 ? 1 : c == 1 ? 30 : 57, cell[c], a);
        }
        scr_put(10, 30, "EXTENDED ATTRIBUTES", attr_of(15, 0));
        a = attr_of(14, 0);
        for (r = 0; r < 4; r++) {
            switch (r) {
            case 0:
                snprintf(cell[0], 48, "Hitting ability  -  %d", hero->to_hit);
                snprintf(cell[1], 48, "Magical ability        -  %d", spell_power(hero));
                snprintf(cell[2], 48, "Ability to hide   -  %d", run_rating(hero));
                break;
            case 1:
                snprintf(cell[0], 48, "Ability to damage-  %d", hero->to_damage);
                snprintf(cell[1], 48, "Magical resistance     -  %d", magic_resist(hero));
                snprintf(cell[2], 48, "Alertness         -  %d", alert);
                break;
            case 2:
                snprintf(cell[0], 48, "Evading ability  -  %d", hero->defense);
                snprintf(cell[1], 48, "Magical tool aptitude  -  %d", item_power(hero));
                snprintf(cell[2], 48, "Trap avoidance    -  %d", special_guard(hero));
                break;
            default:
                snprintf(cell[0], 48, "Fortitude        -  %d", hero->armor);
                snprintf(cell[1], 48, "Ability to charm       -  %d", hero->to_charm);
                if (floor == 0) snprintf(cell[2], 48, "Currently in town");
                else snprintf(cell[2], 48, "Adventuring on level %d", floor);
            }
            for (c = 0; c < 3; c++) scr_put(12 + r, c == 0 ? 1 : c == 1 ? 26 : 57, cell[c], a);
        }
        if (spell_power(hero) > 0) {
            scr_put(17, 22, "SPELLS AVAILABLE (CURRENT / MAXIMUM)", attr_of(15, 0));
            for (i = 0; i < 5 && hero->spell_max[i]; i++) {
                snprintf(cell[0], 48, "Level %d spells - %2d/%d", i + 1, hero->spell_left[i], hero->spell_max[i]);
                scr_put(18 + i, 22, cell[0], attr_of(11, 0));
            }
        }
        scr_at(24, 1);
        hold_message();
        if (hero->inv_n > 0) {
            list_inventory(hero, 1, NULL);
            hold_message();
        }
        return;
    }
    printf("\nCHARACTER ATTRIBUTES\n");
    printf("Name  -  %-16s Level      -  %-8d Hitpoints    -  %s\n", hero->name, hero->level, hp);
    printf("Race  -  %-16s Experience -  %-8d Wishes       -  %d\n", hero->race, hero->xp, hero->wishes);
    printf("Class -  %-16s Gold       -  %-8d Sick level   -  %d\n", hero->class_name, hero->gold, hero->sickness);
    printf("Strength  -  %-12d Intelligence -  %-6d Constitution -  %d\n", hero->str, hero->intel, hero->con);
    printf("Dexterity -  %-12d Charisma     -  %-6d Luck         -  %d\n", hero->dex, hero->chr, hero->lck);
    printf("\nEXTENDED ATTRIBUTES\n");
    printf("Hitting ability  -  %-6d Magical ability        -  %-6d Ability to hide   -  %d\n",
           hero->to_hit, spell_power(hero), run_rating(hero));
    printf("Ability to damage-  %-6d Magical resistance     -  %-6d Alertness         -  %d\n",
           hero->to_damage, magic_resist(hero), alert);
    printf("Evading ability  -  %-6d Magical tool aptitude  -  %-6d Trap avoidance    -  %d\n",
           hero->defense, item_power(hero), special_guard(hero));
    printf("Fortitude        -  %-6d Ability to charm       -  %d\n", hero->armor, hero->to_charm);
    if (floor == 0) printf("Currently in town\n");
    else printf("Adventuring on level %d\n", floor);
    if (spell_power(hero) > 0) {
        printf("\nSPELLS AVAILABLE (CURRENT / MAXIMUM)\n");
        for (i = 0; i < 5 && hero->spell_max[i]; i++)
            printf("Level %d spells - %2d/%d\n", i + 1, hero->spell_left[i], hero->spell_max[i]);
    }
    hold_message();
    if (hero->inv_n > 0) {
        list_inventory(hero, 1, NULL);
        hold_message();
    }
}

/* then_asks_for_a_donation_01266. CINT(VAL) of the answer. A gift of 0 or
   less costs a sickness point; with no gold at all the gift is kept whole. */
static int ask_donation(Hero *hero) {
    char line[64];
    double value;
    int donation;
    printf("He calmly diagnoses your problems with some type of magical artifact. He\n");
    printf("then asks for a donation.\n");
    printf("How much would you like to give\n");
    read_line(line, sizeof line);
    value = atof(line);
    if (value > 32767.0) value = 32767.0;
    if (value < -32768.0) value = -32768.0;
    donation = (int)lrint(value);
    if (donation <= 0) {
        print_sb_key("ACLERICBADDONATE");
        if (wears_effect(hero, 46))
            printf("\n(It appears that this cleric is more powerful than your magic items!)\n");
        hero->sickness++;
    } else if (hero->gold == 0) {
        print_sb_key("ACLERICNOGOLD");
    } else if (donation > hero->gold) {
        donation = hero->gold;
        hero->gold = 0;
        print_sb_key("ACLERICALLGOLD");
    } else {
        hero->gold -= donation;
    }
    return donation;
}

static void lift_curse(Hero *hero);

/* enter_00E6E with lerend_014BF. A gift of 0 or less ends the visit. */
static void visit_cleric(Hero *hero, const char *who) {
    static const char *const item[6] = {"(C) Cure wounds", "(I) Inventory management", "(S) cure Sickness",
                                        "(H) Help", "(R) Remove a cursed item", "(Q or ESC) leave the cleric"};
    for (;;) {
        int donation;
        int key;
        town_frame(hero);
        print_sb_key(strcmp(who, "Lerend") == 0 ? "ACLERICLEREND" : "ACLERICWANDERER");
        printf("\n");
        at_print(18, 3, 11, 0, "Choose what you wish to do:");
        {
            int ch = menu_choice(item, 6, 2, 3, 20, "");
            key = ch;
        }
        if (key == 'Q' || key == 27 || feof(stdin)) return;
        if (key == 'I') {
            if (inventory_menu(hero, NULL, NULL, NULL, NULL, NULL) < 0) return;
            continue;
        }
        if (key == 'H') {
            show_help("HELPCLERIC");
            continue;
        }
        if (key == 'C') {
            donation = ask_donation(hero);
            hero->hp += basic_int((float)donation / (float)hero->level);
            if (hero->hp > hero->max_hp) hero->hp = hero->max_hp;
        } else if (key == 'S') {
            donation = ask_donation(hero);
            if (hero->sickness > 0) {
                if (donation < 200) {
                    print_sb_key("ACLERICSTAYSICK");
                } else {
                    hero->sickness -= basic_int((float)donation / 200.0f);
                    if (hero->sickness < 0) hero->sickness = 0;
                    print_sb_key("ACLERICCURESICKNESS");
                }
            }
        } else if (key == 'R') {
            donation = ask_donation(hero);
            if (donation < 50 * hero->level) print_sb_key("ACLERICNOREMOVE");
            else lift_curse(hero);
        } else {
            if (live) {
                scr_status("He doesn't understand you.  Please retype.");
                alarm();
            } else {
                printf("He doesn't understand you.  Please retype.\n");
            }
            continue;
        }
        if (donation <= 0) return;
        printf("He thanks you for your donation.\n");
        hold_message();
    }
}

static int sell_offer(const Hero *hero, int price) {
    return basic_int((float)price * (float)hero->to_charm / 30.0f);
}

static int buy_price(const Hero *hero, int base) {
    if (hero->to_charm < 1) return base * 15;
    return basic_int((float)base * 15.0f / (float)hero->to_charm);
}

static int carry_cap(const Hero *hero) {
    int cap = hero->level + hero->str;
    if (cap > 34) cap = 34;
    if (cap < 0) cap = 0;
    return cap;
}

static int service_cost(const Hero *hero, int base) {
    if (hero->to_charm < 1) return base;
    return basic_int((float)base / (float)hero->to_charm);
}

static void put_i16(unsigned char *p, int value) {
    p[0] = (unsigned char)(value & 0xFF);
    p[1] = (unsigned char)((value >> 8) & 0xFF);
}

static int shop_base(const unsigned char *shop) {
    double price;
    memcpy(&price, shop + 34, sizeof price);
    return (int)price;
}

static void take_purchase(Hero *hero, const unsigned char *shop) {
    unsigned char *dst = hero->inv[hero->inv_n];
    int base = shop_base(shop);
    int i;
    memset(dst, 0, 68);
    memcpy(dst, shop, 26);
    for (i = 0; i < 26; i++) dst[26 + i] = (unsigned char)(shop[i] + (128 % (i + 1)) + 128);
    put_i16(dst + 52, field_i16(shop + 26));
    put_i16(dst + 54, field_i16(shop + 28));
    put_i16(dst + 56, field_i16(shop + 30));
    put_i16(dst + 58, field_i16(shop + 30));
    put_i16(dst + 60, 1);
    put_i16(dst + 62, field_i16(shop + 32));
    put_i16(dst + 64, 0);
    put_i16(dst + 66, base);
    hero->inv_n++;
}

static const char *item_kind(int kind) {
    static const char *name[] = {
        "item", "weapon", "instrument", "helmet", "shield", "armor",
        "gauntlets", "boots", "cloak", "ring", "wand", "potion", "book", "lenses"
    };
    if (kind < 1 || kind > 13) return name[0];
    return name[kind];
}

static const char *item_article(int kind) {
    if (kind == 5 || kind == 6 || kind == 7 || kind == 13) return "some ";
    if (kind == 2) return "an ";
    return "a ";
}

/* near_056A4. INT(RND * records) + 1, then the kind name, not the real one. */
static void take_chest_item(Hero *hero) {
    FILE *f;
    unsigned char rec[44];
    unsigned char *dst;
    int count;
    int index;
    int kind;
    const char *kind_name;
    f = fopen("ITEMFILE.DAT", "rb");
    if (!f) {
        printf("NO ITEM FILE (ITEMFILE.DAT) PRESENT. GAME TERMINATED\n");
        return;
    }
    if (fseek(f, 0, SEEK_END) != 0) {
        fclose(f);
        return;
    }
    count = (int)(ftell(f) / 44);
    if (count < 1) {
        fclose(f);
        printf("NO ITEM FILE (ITEMFILE.DAT) PRESENT. GAME TERMINATED\n");
        return;
    }
    index = basic_int(basic_rnd() * (float)count) + 1;
    if (fseek(f, (long)(index - 1) * 44, SEEK_SET) != 0 || fread(rec, 1, 44, f) != 44) {
        fclose(f);
        return;
    }
    fclose(f);
    kind = field_i16(rec + 26);
    kind_name = item_kind(kind);
    if (live) {
        char msg[80];
        /* QB near_056A4: panel_open, locate 2/3,42, y_yes at 5,42. */
        panel_open();
        snprintf(msg, sizeof msg, "You have found %s%s.", item_article(kind), kind_name);
        scr_put(2, 42, msg, attr_of(15, 0));
        scr_put(3, 42, "Do you wish to pick it up?", attr_of(15, 0));
        if (yes_no_at(5, 42) != 'Y') return;
        panel_open();
        if (hero->inv_n >= MAX_INV || hero->inv_n + 1 > carry_cap(hero)) {
            scr_put(2, 42, "You load is too heavy to lift it.", attr_of(15, 0));
            return;
        }
        take_purchase(hero, rec);
        dst = hero->inv[hero->inv_n - 1];
        memset(dst, 32, 26);
        memcpy(dst, kind_name, strlen(kind_name));
        put_i16(dst + 60, 0);
        snprintf(msg, sizeof msg, "You pick up the %s.", kind_name);
        scr_put(2, 42, msg, attr_of(15, 0));
        if (wears_effect(hero, 3)) {
            char real[28];
            memcpy(dst, rec, 26);
            put_i16(dst + 60, 1);
            item_name(real, (int)sizeof real, dst);
            scr_put(3, 42, "Your RING OF IDENTIFY starts glowing!", attr_of(15, 0));
            scr_put(4, 42, "As knowledge is imparted to you,", attr_of(15, 0));
            scr_put(5, 42, "You realize that it is a", attr_of(15, 0));
            scr_put(6, 42, real, attr_of(15, 0));
        }
    } else {
        printf("You have found %s%s.\n", item_article(kind), kind_name);
        printf("Do you wish to pick it up?\n");
        if (yes_no() != 'Y') return;
        if (hero->inv_n >= MAX_INV || hero->inv_n + 1 > carry_cap(hero)) {
            printf("You load is too heavy to lift it.\n");
            return;
        }
        take_purchase(hero, rec);
        dst = hero->inv[hero->inv_n - 1];
        memset(dst, 32, 26);
        memcpy(dst, kind_name, strlen(kind_name));
        put_i16(dst + 60, 0);
        printf("You pick up the %s.\n", kind_name);
        if (wears_effect(hero, 3)) {
            char real[28];
            memcpy(dst, rec, 26);
            put_i16(dst + 60, 1);
            item_name(real, (int)sizeof real, dst);
            printf("Your RING OF IDENTIFY starts glowing!\n");
            printf("As knowledge is imparted to you,\n");
            printf("You realize that it is a\n");
            printf("%s\n", real);
        }
    }
}

/* 00_25D94, the number with thousands commas. */
static void fmt_commas(char *out, int cap, long n) {
    char digits[24];
    char buf[32];
    int len;
    int i;
    int o = 0;
    snprintf(digits, sizeof digits, "%ld", n < 0 ? -n : n);
    len = (int)strlen(digits);
    if (n < 0) buf[o++] = '-';
    for (i = 0; i < len; i++) {
        if (i > 0 && (len - i) % 3 == 0) buf[o++] = ',';
        buf[o++] = digits[i];
    }
    buf[o] = 0;
    snprintf(out, (size_t)cap, "%s", buf);
}

/* [0x153]: the last MONSTER.DAT record with tier under 21, no speech, and
   a disposition of 0 or more. The pet wish copies it. */
static Monster wish_pet;
static int have_wish_pet;

static void find_wish_pet(const Monster *monsters, int count) {
    int i;
    have_wish_pet = 0;
    for (i = 0; i < count; i++) {
        if (monsters[i].tier < 21 && monsters[i].speech == 0 && monsters[i].disposition >= 0) {
            wish_pet = monsters[i];
            have_wish_pet = 1;
        }
    }
}

/* The S gosub of monster_dat_19049. Plus 2; over 20 is left as is, under 16 becomes 16. */
static int wish_stat(Hero *hero) {
    static const char *word[] = {"strength", "intelligence", "constitution", "dexterity", "charisma", "luck"};
    static const char *feel[] = {"stronger", "more intelligent", "sturdier", "more graceful", "more beautiful", "luckier"};
    int *stat[6];
    int which;
    stat[0] = &hero->str;
    stat[1] = &hero->intel;
    stat[2] = &hero->con;
    stat[3] = &hero->dex;
    stat[4] = &hero->chr;
    stat[5] = &hero->lck;
    if (live) {
        /* QB: title at 11,32; question at 13,3; menu_choice 7/1 at col 8, row 15 */
        scr_clear(1, 24);
        at_print(11, 32, 15, 0, "RAISE A STATISTIC");
        scr_put(13, 3, "Which statistic would you like to raise?", attr_of(15, 0));
    } else {
        printf("RAISE A STATISTIC\n");
        printf("Which statistic would you like to raise?\n");
    }
    for (;;) {
        int key;
        if (live) {
            static const char *const stat_item[7] = {
                "(S) Strength", "(I) Intelligence", "(C) Constitution", "(D) Dexterity",
                "(R) Charisma", "(L) Luck", "(Q) Quit"};
            key = menu_choice(stat_item, 7, 1, 8, 15, "");
        } else {
            printf("(S) Strength\n(I) Intelligence\n(C) Constitution\n(D) Dexterity\n(R) Charisma\n(L) Luck\n(Q) Quit\n");
            key = pick_key();
        }
        if (key == 'Q' || key == 27) return 0;
        which = key == 'S' ? 0 : key == 'I' ? 1 : key == 'C' ? 2 : key == 'D' ? 3 : key == 'R' ? 4 : key == 'L' ? 5 : -1;
        if (which >= 0) break;
        printf("What was that again?\n");
        hold_message();
    }
    *stat[which] += 2;
    if (*stat[which] > 20) {
        printf("Your %s is at maximum!\n", word[which]);
    } else if (*stat[which] < 16) {
        *stat[which] = 16;
        printf("You feel MUCH %s now!\n", feel[which]);
    } else {
        printf("You feel %s now!\n", feel[which]);
    }
    hero->wishes--;
    return 1;
}

/* The M gosub. Any ITEMFILE record with byte 32 set and a price, identified. */
static int wish_item(Hero *hero) {
    FILE *f;
    unsigned char recs[128][44];
    int index[128];
    int n = 0;
    int total = 0;
    int pick;
    int i;
    char line[64];
    printf("WISH FOR A MAGIC ITEM\n");
    if (hero->inv_n >= 34) {
        printf("You are carrying too much inventory.  Drop something first.\n");
        return 0;
    }
    f = fopen("ITEMFILE.DAT", "rb");
    if (!f) {
        printf("NO ITEM FILE (ITEMFILE.DAT) PRESENT. GAME TERMINATED\n");
        return 0;
    }
    while (total < 128 && fread(recs[total], 1, 44, f) == 44) total++;
    fclose(f);
    printf("You may choose an item.  Which item do you want? \n");
    printf("(Use the arrow keys to select, ENTER to choose, Q to quit.)\n");
    for (i = 0; i < total; i++) {
        double price;
        char name[28];
        memcpy(&price, recs[i] + 34, sizeof price);
        if (field_i16(recs[i] + 32) == 0 || !(price > 0.0)) continue;
        item_name(name, (int)sizeof name, recs[i]);
        index[n++] = i;
        printf("%s\n", name);
    }
    read_line(line, sizeof line);
    pick = atoi(line);
    if (line[0] == 'q' || line[0] == 'Q' || pick < 1 || pick > n) return 0;
    if (hero->inv_n >= MAX_INV || hero->inv_n + 1 > carry_cap(hero)) {
        printf("You load is too heavy to lift it.\n");
        return 0;
    }
    {
        const unsigned char *rec = recs[index[pick - 1]];
        unsigned char *dst = hero->inv[hero->inv_n];
        char name[28];
        take_purchase(hero, rec);
        item_name(name, (int)sizeof name, dst);
        hero->wishes--;
        printf("You pick up the %s\n", name);
    }
    return 1;
}

/* monster_dat_19049. In town (floor 0) Allyn answers instead of the djinni.
   Returns 1 when the djinni kills foe. */
static int make_wish(Hero *hero, const Monster *foe, int allyn) {
    int killed = 0;
    int shown = 1;
    if (live) {
        /* The frame and panel, the title at 11,34 in 15, the text from 12,3 in 11. */
        draw_frame(hero->floor, hero);
        scr_region(11, 23, 3, 78);
        scr_put(11, 34, "MAKE A WISH", attr_of(15, 0));
        scr_at(12, 3);
        scr_color(11, 0);
    } else {
        printf("MAKE A WISH\n");
    }
    printf("You picture what you want in your mind's eye and concentrate REAL hard.\n");
    if (hero->wishes == 0) {
        if (allyn) {
            printf("After a while, Allyn appears in a cloud of smoke!\n");
            printf("'Look,' he chuckles, 'you can stand there all day with that constipated\n");
            printf("look on your face, but until you have a wish granted to you by some of the\n");
            printf("characters in the dungeon, or by certain magical items, you're just out of\n");
            printf("luck!'\n");
        } else {
            printf("After a while a djinni appears in a cloud of smoke!\n");
            printf("'Strange one' the djinni booms. 'Get on with your adventure!  It is\n");
            printf("obvious that you should leave the deep concentratration to those with\n");
            printf("intelligence.  You cannot make a wish until one is granted to you by\n");
            printf("one of the dungeon inhabitants or by certain magical items.'\n");
        }
        printf("You feel foolish as he disappears.\n");
        hold_message();
        return 0;
    }
    if (allyn) {
        printf("After a while, Allyn appears in a cloud of smoke!  After a fit of coughing\n");
        printf("and muttering something about never finding a djinni when you need one, you\n");
        printf("catch his attention.  After a look of consternation, he finally speaks.\n");
        printf("'Now where were we? Oh yes. Ahem! I AM THE MIGHTY ALLYN!' he bellows. 'What\n");
        printf("is it you wish?'\n");
    } else {
        printf("After a while a djinni appears in a cloud of smoke! 'Oh mighty one' the\n");
        printf("djinni booms. 'What is your wish?'\n");
    }
    for (;;) {
        int key;
        char text[32];
        if (live) {
            /* QB: menu_choice 1 col at col 8; row 18 (Allyn) or 15 (djinni). */
            char pet_line[64];
            const char *wish_item[8];
            int n = 0;
            int wish_row = allyn ? 18 : 15;
            if (shown) hold_message();
            shown = 1;
            scr_window(11, 23, 3, 78);
            scr_put(11, 34, "MAKE A WISH", attr_of(15, 0));
            scr_color(7, 0);
            wish_item[n++] = "(S) Raise 1 statistic";
            wish_item[n++] = "(M) Magic items";
            wish_item[n++] = "(H) More hitpoints and totally healed";
            wish_item[n++] = "(E) More experience";
            wish_item[n++] = "(G) Gold";
            if (have_wish_pet) {
                snprintf(pet_line, sizeof pet_line, "(P) A pet %s and a dreamwolf to fight with", wish_pet.name);
                wish_item[n++] = pet_line;
            } else {
                wish_item[n++] = "(P) A dreamwolf to fight with";
            }
            if (foe) wish_item[n++] = "(K) Kill the monster you are fighting now.";
            wish_item[n++] = "(Q) Quit";
            key = menu_choice(wish_item, n, 1, 8, wish_row, "");
            scr_window(11, 23, 3, 78);
            scr_color(11, 0);
        } else {
            printf("(S) Raise 1 statistic\n(M) Magic items\n(H) More hitpoints and totally healed\n");
            printf("(E) More experience\n(G) Gold\n");
            if (have_wish_pet) printf("(P) A pet %s and a dreamwolf to fight with\n", wish_pet.name);
            else printf("(P) A dreamwolf to fight with\n");
            if (foe) printf("(K) Kill the monster you are fighting now.\n");
            printf("(Q) Quit\n");
            key = pick_key();
        }
        if (key == 'Q' || key == 27) return 0;
        if (key == 'S') {
            wish_stat(hero);
        } else if (key == 'M') {
            wish_item(hero);
        } else if (key == 'H') {
            int i;
            if (hero->max_hp > 150) {
                printf("You have too many hitpoints already to add any more, but now you're\n");
                printf("totally restored, anyway!\n");
            } else {
                int gain = basic_int(basic_rnd() * 10.0f) + 5;
                hero->max_hp += gain;
                fmt_commas(text, (int)sizeof text, gain);
                printf("You have gained %s experience points and are totally healed!\n", text);
            }
            hero->wishes--;
            hero->hp = hero->max_hp;
            hero->sickness = 0;
            for (i = 0; i < 5; i++) hero->spell_left[i] = hero->spell_max[i];
        } else if (key == 'E') {
            hero->wishes--;
            if (hero->level > 8) {
                printf("You are too experienced already to wish for more!\n");
            } else {
                int gain = basic_int(basic_rnd() * 10000.0f) + 5000;
                hero->xp += gain;
                fmt_commas(text, (int)sizeof text, gain);
                printf("You have gained %s experience points!\n", text);
            }
        } else if (key == 'G') {
            hero->wishes--;
            if (hero->gold > 10000) {
                printf("A HUGE gold bar appears before you. Unfortunately, you cannot carry more.\n");
            } else {
                int gain = basic_int(basic_rnd() * 1000.0f) + 500;
                hero->gold += gain;
                fmt_commas(text, (int)sizeof text, gain);
                printf("A gold bar worth %sappears before you. You pick it up.\n", text);
            }
        } else if (key == 'P') {
            if (have_wish_pet) {
                strncpy(hero->pet_name, wish_pet.name, 20);
                hero->pet_name[20] = 0;
                hero->pet_hp = hero->pet_max_hp = wish_pet.hp_hi;
                hero->pet_extra = wish_pet.speech;
                hero->pet_to_hit = wish_pet.to_hit;
                hero->pet_to_damage = wish_pet.to_damage;
                hero->pet_defense = wish_pet.defense;
                hero->pet_armor = wish_pet.armor;
                hero->pet_speed = wish_pet.speed;
                hero->pet = 1;
            }
            hero->dream_wolf = 1;
        } else if (key == 'K' && foe) {
            hero->wishes--;
            if (foe->tier < 8) {
                printf("The battle seems rather one sided as the djinni rips the %-20s\n", foe->name);
                printf("to shreads\n");
                killed = 1;
            } else if (foe->tier < 16) {
                printf("After a fierce and drawn-out battle, the djinni rips the %-20s\n", foe->name);
                printf("to shreads\n");
                killed = 1;
            } else {
                printf("After a quick examination of your opponent, the djinni runs in terror!\n");
            }
        } else if (live) {
            scr_status("I don't understand. Please retype");
            alarm();
            shown = 0;
            continue;
        } else {
            printf("I don't understand. Please retype\n");
            hold_message();
            continue;
        }
        break;
    }
    rate_from_pack(hero);
    hold_message();
    return killed;
}

static void reveal_item(unsigned char *rec, char *shown, int cap) {
    unsigned char decoded[26];
    int i;
    memcpy(decoded, rec + 26, 26);
    for (i = 0; i < 26; i++) {
        int val = rec[26 + i] - ((128 % (i + 1)) + 128);
        if (val < 0) break;
        decoded[i] = (unsigned char)val;
    }
    memcpy(rec, decoded, 26);
    put_i16(rec + 60, 1);
    item_name(shown, cap, rec);
}

/* itemfile_dat_08828. The list stays up until Q or ESC. */
static void buy_stock(Hero *hero) {
    FILE *f;
    unsigned char rec[44];
    int slot_of[128];
    int n = 0;
    int file_index = 0;
    int bought = 0;
    char line[64];
    char name[28];
    f = fopen("ITEMFILE.DAT", "rb");
    if (!f) {
        printf("NO ITEM FILE (ITEMFILE.DAT) PRESENT. GAME TERMINATED\n");
        return;
    }
    while (n < 128 && fread(rec, 1, 44, f) == 44) {
        if (field_i16(rec + 32) == 0) slot_of[n++] = file_index;
        file_index++;
    }
    fclose(f);
    if (!n) return;
    printf("'Which item would you like?' she asks nicely\n");
    for (;;) {
        int pick;
        int base;
        int cost;
        int i;
        if (!live) {
            f = fopen("ITEMFILE.DAT", "rb");
            if (!f) return;
            for (i = 0; i < n; i++) {
                if (fseek(f, slot_of[i] * 44, SEEK_SET) != 0 || fread(rec, 1, 44, f) != 44) break;
                item_name(name, (int)sizeof name, rec);
                printf("  %d  %s - %d\n", i + 1, name, buy_price(hero, shop_base(rec)));
            }
            read_line(line, sizeof line);
            if (line[0] == 'q' || line[0] == 'Q' || line[0] == 27 || feof(stdin)) {
                fclose(f);
                break;
            }
            pick = atoi(line);
            if (pick < 1 || pick > n || fseek(f, slot_of[pick - 1] * 44, SEEK_SET) != 0 || fread(rec, 1, 44, f) != 44) {
                fclose(f);
                continue;
            }
            fclose(f);
        } else {
            /* live mode: build menu items and use menu_choice with paging */
            char labels[128][64];
            const char *items[128];
            f = fopen("ITEMFILE.DAT", "rb");
            if (!f) return;
            for (i = 0; i < n; i++) {
                if (fseek(f, slot_of[i] * 44, SEEK_SET) != 0 || fread(rec, 1, 44, f) != 44) break;
                item_name(name, (int)sizeof name, rec);
                snprintf(labels[i], sizeof labels[i], "(%d) %s", i + 1, name);
                items[i] = labels[i];
            }
            fclose(f);
            int ch = menu_choice(items, n, 1, 3, 5, "");
            if (ch == 27) break;
            if (ch >= 1 && ch <= n) pick = ch;
            else if (ch >= '0' && ch <= '9') pick = ch - '0';
            else continue;
        }
        base = shop_base(rec);
        cost = buy_price(hero, base);
        item_name(name, (int)sizeof name, rec);
        if (cost > hero->gold) {
            printf("Sorry, chum, but you don't have enough gold\n");
            continue;
        }
        if (hero->inv_n >= MAX_INV || hero->inv_n + 1 > carry_cap(hero)) {
            printf("Try as you might, you cannot lift the item. You have to drop something first\n");
            continue;
        }
        hero->gold -= cost;
        take_purchase(hero, rec);
        bought = 1;
    }
    if (bought && hero->level < 3) show_help("WEARWIELD");
}

/* in_gold_to_08D9C. Returns 1 when the price is paid. */
static int shop_offer(Hero *hero, int base, const char *verb) {
    char title[32];
    char text[24];
    int cost = service_cost(hero, base);
    int len = (int)strlen(verb);
    int i;
    for (i = 0; i <= len && i < (int)sizeof title - 1; i++) title[i] = (char)toupper((unsigned char)verb[i]);
    title[sizeof title - 1] = 0;
    fmt_commas(text, (int)sizeof text, cost);
    printf("\n%*s%s\n\n", 39 - len / 2, "", title);
    printf("You feel like a fish in a fishbowl as she appears to be appraising you.\n");
    printf("She then gives you another warm smile and says 'For anyone else, I would\n");
    printf("charge twice this much, but for you it will cost %s in gold to \n", text);
    printf("%s.  Do you wish to %s\n\n", verb, verb);
    if (yes_no() != 'Y') {
        print_sb_key("ASHOPNOBUY");
        hold_message();
        return 0;
    }
    if (cost > hero->gold) {
        print_sb_key("ASHOPNOGOLD");
        hold_message();
        return 0;
    }
    hero->gold -= cost;
    printf("She smiles as she takes your money.  It seems that you both feel pretty\n");
    printf("good about the deal.\n");
    hold_message();
    return 1;
}

static int pick_inventory(const Hero *hero, const char *verb) {
    char line[64];
    char name[28];
    int pick;
    int i;
    if (!hero->inv_n) {
        printf("You have no inventory\n");
        return 0;
    }
    if (live) {
        /* live: show a light-bar menu with paging; allow numeric picks too */
        char labels[MAX_INV][64];
        const char *items[MAX_INV];
        int i;
        list_inventory(hero, 0, verb); /* menu_choice will redraw, but keep for context */
        for (i = 0; i < hero->inv_n; i++) {
            item_name(name, (int)sizeof name, hero->inv[i]);
            snprintf(labels[i], sizeof labels[i], "(%d) %s", i + 1, name);
            items[i] = labels[i];
        }
        {
            int ch = menu_choice(items, hero->inv_n, 1, 3, 5, "");
            if (ch == 27) return 0;
            if (ch >= 1 && ch <= hero->inv_n) pick = ch;
            else if (ch >= '0' && ch <= '9') pick = ch - '0';
            else return 0;
            return pick >= 1 && pick <= hero->inv_n ? pick : 0;
        }
    }
    printf("Which item would you like to %s\n", verb);
    for (i = 0; i < hero->inv_n; i++) {
        item_name(name, (int)sizeof name, hero->inv[i]);
        printf("  %d  %s\n", i + 1, name);
    }
    read_line(line, sizeof line);
    pick = atoi(line);
    return pick >= 1 && pick <= hero->inv_n ? pick : 0;
}

/* text_092A2. Identified items with a price; it asks again until Q or ESC. */
static void sell_stock(Hero *hero) {
    char line[64];
    for (;;) {
        int index[MAX_INV];
        int n = 0;
        int slot;
        int pick;
        int price;
        int offer;
        char name[28];
        for (slot = 0; slot < hero->inv_n && n < MAX_INV; slot++) {
            price = field_i16(hero->inv[slot] + 66);
            if (field_i16(hero->inv[slot] + 60) == 1 && price > 0) {
                item_name(name, (int)sizeof name, hero->inv[slot]);
                index[n++] = slot;
                printf("  %d  %s - %d\n", n, name, sell_offer(hero, price));
            }
        }
        if (!n) {
            printf("You have no non-cursed identified items to sell\n");
            return;
        }
        printf("'Which item do you want to sell?' she asks nicely\n");
        if (!live) {
            read_line(line, sizeof line);
            if (line[0] == 'q' || line[0] == 'Q' || line[0] == 27 || feof(stdin)) return;
            pick = atoi(line);
            if (pick < 1 || pick > n) continue;
            slot = index[pick - 1];
        } else {
            char labels[MAX_INV][64];
            const char *items[MAX_INV];
            int i;
            for (i = 0; i < n; i++) {
                item_name(name, (int)sizeof name, hero->inv[index[i]]);
                snprintf(labels[i], sizeof labels[i], "(%d) %s", i + 1, name);
                items[i] = labels[i];
            }
            int ch = menu_choice(items, n, 1, 3, 5, "");
            if (ch == 27) return;
            if (ch >= 1 && ch <= n) pick = ch;
            else if (ch >= '0' && ch <= '9') pick = ch - '0';
            else continue;
            slot = index[pick - 1];
        }
        if (field_i16(hero->inv[slot] + 64) == 1) {
            printf("You must remove the item before selling it\n");
            continue;
        }
        price = field_i16(hero->inv[slot] + 66);
        offer = sell_offer(hero, price);
        item_name(name, (int)sizeof name, hero->inv[slot]);
        hero->gold += offer;
        memmove(hero->inv[slot], hero->inv[slot + 1], (size_t)(hero->inv_n - slot - 1) * 68);
        hero->inv_n--;
        printf("She gladly takes the item off of your hands\n");
        if (!hero->inv_n) return;
    }
}

/* enter_08320 with kiera_090AD. */
static void visit_shop(Hero *hero, const char *who) {
    static const char *const item[7] = {"(B) Buy an item", "(I) Inventory management", "(S) Sell an item", "(H) Help",
                                        "(K) identify an item", "(Q or ESC) Quit shopping", "(R) Recharge a wand"};
    char line[64];
    rate_from_pack(hero);
    for (;;) {
        int key;
        int pick;
        town_frame(hero);
        print_sb_key(strcmp(who, "Kiera") == 0 ? "ASHOPKIERA" : "ASHOPTRAVELER");
        printf("\n");
        at_print(18, 3, 11, 0, "Choose what you wish to do:");
        {
            int ch = menu_choice(item, 7, 2, 3, 20, "");
            key = ch;
        }
        if (key == 'Q' || key == 27 || feof(stdin)) return;
        if (key == 'I') {
            if (inventory_menu(hero, NULL, NULL, NULL, NULL, NULL) < 0) return;
        } else if (key == 'H') {
            show_help("HELPSHOP");
        } else if (key == 'K') {
            if (shop_offer(hero, 1500, "identify an item") && (pick = pick_inventory(hero, "IDENTIFY")) > 0) {
                char name[28];
                reveal_item(hero->inv[pick - 1], name, (int)sizeof name);
                printf("It was a %s. Hit any key to continue.\n", name);
                read_line(line, sizeof line);
            }
        } else if (key == 'R') {
            if (shop_offer(hero, 7000, "recharge a wand") && (pick = pick_inventory(hero, "RECHARGE")) > 0) {
                unsigned char *rec = hero->inv[pick - 1];
                put_i16(rec + 56, field_i16(rec + 58));
                print_sb_key("ASHOPRECHARGE");
                hold_message();
            }
        } else if (key == 'B') {
            buy_stock(hero);
        } else if (key == 'S') {
            sell_stock(hero);
        } else if (live) {
            char text[96];
            snprintf(text, sizeof text, "%s smiles and says 'I don't understand. What was that?'", who);
            scr_status(text);
            alarm();
        } else {
            printf("%s smiles and says 'I don't understand. What was that?'\n", who);
        }
    }
}

static int stat_gone(Hero *hero, int *stat, const char *msg, const char *cause) {
    if (*stat > 21) *stat = 21;
    if (*stat >= 0) return 1;
    hero->hp = 0;
    set_killer(hero, cause);
    printf("%s\n", msg);
    hold_message();
    return 0;
}

static int bump_stats(Hero *hero, int delta) {
    hero->str += delta;
    hero->intel += delta;
    hero->con += delta;
    hero->dex += delta;
    hero->chr += delta;
    hero->lck += delta;
    if (!stat_gone(hero, &hero->str, "Your strength is gone. You die!", "LOSS OF STR")) return 0;
    if (!stat_gone(hero, &hero->intel, "You've gone brain dead. You die!", "LOSS OF INT")) return 0;
    if (!stat_gone(hero, &hero->con, "You wither away and die!", "LOSS OF CON")) return 0;
    if (!stat_gone(hero, &hero->dex, "You trip and kill yourself!", "LOSS OF DEX")) return 0;
    if (!stat_gone(hero, &hero->chr, "You're so ugly, you wish you could\ncurl up and die. Your wish has been\ngranted.  You curl up and die!", "LOSS OF CHR")) return 0;
    if (!stat_gone(hero, &hero->lck, "Your luck just ran out. You die!", "LOSS OF LCK")) return 0;
    refresh_ratings(hero);
    return 1;
}

/* remove_08227. Takes the chosen item off, including one the curse will not let go. */
static void lift_curse(Hero *hero) {
    char line[64];
    int pick;
    if (hero->inv_n < 1) {
        scr_clear(1, 24);
        printf("\n");
        at_print(1, 30, 15, 0, "INVENTORY MANAGEMENT");
        printf("You have no inventory\n");
        hold_message();
        return;
    }
    list_inventory(hero, 0, "REMOVE");
    read_line(line, sizeof line);
    if (line[0] == 'q' || line[0] == 'Q' || line[0] == 27) return;
    pick = line[0] >= '0' && line[0] <= '9' ? atoi(line) : 1;
    if (pick < 1 || pick > hero->inv_n) return;
    put_i16(hero->inv[pick - 1] + 64, 0);
    rate_from_pack(hero);
    printf("The item has been removed.  Hit any key to continue.\n");
    read_dungeon_key();
}

/* fields_like_they_used_to_12B8D. Using an item calls this.
   Casting a spell will call it with that spell's effect code. */
static int adjust_magic_stat(Hero *hero, int *stat, int amount, const char *up, const char *down,
                             const char *dead, const char *cause) {
    *stat += amount;
    printf("%s\n", amount < 0 ? down : up);
    if (!stat_gone(hero, stat, dead, cause)) return -1;
    refresh_ratings(hero);
    return 0;
}

static int apply_magic(Hero *hero, int effect, int amount, int power, unsigned char *base, int *x, int *y, const Monster *foe, int *foe_hp) {
    /* Rolled for every effect, before the dispatch. */
    int roll = (int)rintf(basic_rnd() * 10.0f + ((float)(amount * 10) - 9.0f));
    if (effect >= 20 && effect <= 24) {
        if (!foe || !foe_hp) {
            printf("That was certainly a waste of magic\n");
            return 0;
        }
        if (effect == 21) {
            if (roll > 0) {
                printf(" The monster breaks through your force\nfield!  (I guess they don't make force\nfields like they used to.)\n");
                return 0;
            }
            printf("An invisible wall appears between you\nand the monster.  After trying to get\nthrough, the monster leaves.\n");
            return 3;
        }
        if (effect == 23) {
            if (foe->disposition < 1 && foe->speech == 1) {
                printf("The monster chuckles as it easily\nshakes off your spell.  'Can you\nbelieve this guy' it says to itself.\nHe wants ME for a pet.  Whatta maroon.'\n");
                return 0;
            }
            if (foe->disposition < 0) {
                printf("The monster snarls as it shakes off\nyour spell.  Maybe you ought to\nconsider your choice in pets!\n");
                return 0;
            }
            if (foe->speech == 1) {
                printf("Although the good creature is not\ntrying to harm you, you try to take\ncontrol of its mind.  It is insulted\nthat you would even think of trying\nto tame it!\n");
                return 0;
            }
            if (foe->tier < 21) {
                take_pet(hero, foe, foe_hp ? *foe_hp : foe->hp_lo);
                printf("The creature cuddles up to you.  You\ngive it a doggie biscuit.\n");
                return 3;
            }
            printf("The creature stops fighting you, but\nthen wanders off.  It is obviously\ntoo used to doing things its own way\nto be anyone's pet\n");
            return 3;
        }
        if (effect == 24) {
            printf("The area becomes devoid of all magic\nthat is directed at you (with the\nexception of your own, of course) AND\nall animation magic! (What a bonus!)\n");
            hero->dispel = 1;
            return 0;
        }
        if (hero->staff_power == 1 && foe->disposition >= 0) {
            printf("As you are about to attack, your\nstaff starts to glow. You are\nappalled that you would even\n");
            printf("THINK of attacking such a noble\ncreature. (Of course NOW is the\nperfect time for a new consience.)\n");
            return 0;
        }
        if (hero->staff_power == 1 && 2 * hero->level - 10 > foe->tier) {
            printf("As you are about to attack, your staff\nstarts to glow.  OH MY GOD! HOW could\nyou even THINK of attacking such a\n");
            printf("weak pathetic creature. (Hmm. You also\nfind it odd that such one-sidedness\nnever used to bother you at all.)\n");
            return 0;
        }
        if (has_ability(foe, 26)) {
            printf("The spell begins to work, but then\nfizzles when it approaches your\nopponent!\n");
            return 0;
        }
        if (!attacker_lands(power, foe->magic, 1) || roll == 0) {
            printf("The monster dodges your blast!\n");
            return 0;
        }
        if (effect == 22) {
            if (roll == 0) {
                printf("The monster starts to get groggy,\nbut then shakes it off!\n");
                return 0;
            }
            printf("The monster starts dreaming of\nhelpless adventurers to eat.\n");
            hero->foe_sleep = roll;
            return 0;
        }
        *foe_hp -= roll;
        printf("You've damaged it for %d hitpoints\n", roll);
        if (*foe_hp < 1) {
            *foe_hp = 0;
            printf("You've killed it!!\n");
            return 2;
        }
        return 0;
    }
    if (effect == 10) return adjust_magic_stat(hero, &hero->str, amount, "You feel like you could bend\nsteel with your bear hands!", "You feel so much weaker!", "Your strength is gone. You die!", "LOSS OF STR");
    if (effect == 11) return adjust_magic_stat(hero, &hero->intel, amount, "Newton? Einstein? Shakespeare?\nThey seem so childlike now!", "Newton? Einstein? Shakespeare?\nWho the heck are they?", "You've gone brain dead. You die!", "LOSS OF INT");
    if (effect == 12) return adjust_magic_stat(hero, &hero->con, amount, "You feel like you could take\nan extra punch or two!", "Your glass jaw starts spreading!", "You wither away and die!", "LOSS OF CON");
    if (effect == 13) return adjust_magic_stat(hero, &hero->dex, amount, "You start to leap like a ballarina!", "Have a nice trip!", "You trip and kill yourself!", "LOSS OF DEX");
    if (effect == 14) return adjust_magic_stat(hero, &hero->chr, amount, "Sometimes, don't you feel that\nyou get better looking each day.", "You feel like you've been beaten\nwith an ugly stick.", "You're so ugly, you wish you could\ncurl up and die. Your wish has been\ngranted.  You curl up and die!", "LOSS OF CHR");
    if (effect == 15) return adjust_magic_stat(hero, &hero->lck, amount, "One thousand rabits sever their\nfeet in your honor!", "Your four-leave clover just lost\na leaf!", "Your luck just ran out. You die!", "LOSS OF LCK");
    if (effect == 16) {
        printf("%s\n", amount > 0 ? "All of your statistics go up!  You\nfeel great!" : "All of your statistics go down!  You\nfeel really lousy!");
        return bump_stats(hero, amount) ? 0 : -1;
    }
    if (effect == 17) {
        int gain;
        if (amount < 0) {
            gain = amount;
            if (hero->xp + gain < 0) gain = -hero->xp;
            hero->xp += gain;
            printf("You lose %d experience points\n", -gain);
            return 0;
        }
        if (hero->level >= 9) {
            printf("You are too experienced to gain\nfrom this book. (Time to use the\nold fashioned way.)\n");
            return 0;
        }
        gain = basic_int(basic_rnd() * (float)(amount > 0 ? amount : 1));
        hero->xp += gain;
        printf("You gain %d experience points\n", gain);
        return 0;
    }
    if (effect == 18) {
        if (basic_int(basic_rnd() * 2.0f) == 0) {
            hero->gold = 0;
            printf("All your gold is destroyed!\n");
        } else {
            hero->gold += 200 * item_power(hero);
            printf("You feel richer for the experience!\n");
        }
        return 0;
    }
    if (effect == 19) {
        printf("With a bright flash and a puff of\n");
        printf("smoke, a Djinni appears.\n");
        printf("'I am the mighty FLEMBAD! You are\n");
        printf("granted a wish.' He then disappears.\n");
        hero->wishes += 1;
        return 0;
    }
    if (effect == 25) {
        printf("You feel an internal wrenching.  You\n");
        printf("appear in strange place.\n");
        if (base && x && y) wake_elsewhere(base, x, y);
        return 0;
    }
    if (effect == 26) {
        printf("You feel sooo much better.\n");
        if (hero->max_hp > hero->hp) {
            hero->hp += basic_int(basic_rnd() * (float)power / 5.0f) + 1;
            if (hero->hp > hero->max_hp) hero->hp = hero->max_hp;
        }
        hero->sickness = 0;
        return 0;
    }
    if (effect == 31) {
        int damage = basic_int(basic_rnd() * (float)(amount > 0 ? amount : 1));
        hero->hp -= damage;
        printf("You are hurt for %d hitpoints!\n", damage);
        if (hero_died(hero, "CURSED WAND")) return -1;
        return 0;
    }
    if (effect == 32) {
        int nap = basic_int(basic_rnd() * (float)(amount > 0 ? amount : 1));
        if (nap > 0) {
            printf("You doze off for a while\n");
            hero->down += nap;
        } else {
            printf("You shake off its affects\n");
        }
        return 0;
    }
    if (effect == 33 && hero->inv_n > 0) {
        int slot = basic_int(basic_rnd() * (float)hero->inv_n);
        char name[28];
        if (slot < 0) slot = 0;
        if (slot >= hero->inv_n) slot = hero->inv_n - 1;
        item_name(name, (int)sizeof name, hero->inv[slot]);
        printf("A flare emits from your wand as\n");
        printf("your %s\n", name);
        printf("is destroyed\n");
        remove_inv(hero, slot);
        return 0;
    }
    if (effect == 34) {
        if (wears_effect(hero, 46)) {
            printf("It doesn't seem to affect you\n");
            return 0;
        }
        printf("All of a sudden, you don't feel so\ngood\n");
        hero->sickness += 1;
        return sickness_kills(hero) ? -1 : 0;
    }
    if (effect == 38) {
        hero->wishes = 0;
        return 0;
    }
    if (effect == 27) {
        lift_curse(hero);
        return 0;
    }
    if (effect == 51) {
        hero->shield = amount > 0 ? basic_int(basic_rnd() * (float)amount * 10.0f) : 0;
        printf("You see the air solidify in front\n");
        printf("of you, forming a floating shield\n");
        rate_from_pack(hero);
        return 0;
    }
    if (effect == 52) {
        hero->invisible = amount > 0 ? basic_int(basic_rnd() * (float)amount * 10.0f) : 0;
        printf("You have turned invisible!\n");
        if (hero->chr < 12) printf("All the mirrors in the dungeon\nbreath a sigh of relief.\n");
        else printf("All the fair young admirers will\ncertainly be disappointed.\n");
        rate_from_pack(hero);
        return 0;
    }
    if (effect == 53) {
        hero->trap_ward = 1;
        printf("May no trap befall you (for a\nwhile, anyway)\n");
        return 0;
    }
    if (effect == 54) {
        hero->haste += 1;
        printf("You feel yourself speed up!\n");
        return 0;
    }
    if (effect == 55) {
        hero->dream_wolf = 1;
        printf("A ferocious wolf appears at your\n");
        printf("side. Upon closer inspection, you\n");
        printf("realize that it's only an illusion.\n");
        return 0;
    }
    /* fields_like_they_used_to_12B8D has no case for 37 (WAND OF TRAP CREATION)
       or 8: it only blanks the message lines. */
    return 0;
}

/* The worn slots [0x13B]..[0x151], each an inventory number from 1 or 0. */
enum {
    SLOT_FLOAT, SLOT_MUSIC, SLOT_ARMOR, SLOT_HAND, SLOT_HELMET, SLOT_SHIELD,
    SLOT_GAUNTLETS, SLOT_BOOTS, SLOT_CLOAK, SLOT_RING, SLOT_RING2, SLOT_LENSES, SLOT_COUNT
};

/* proc_00A98 putting an item on. Returns 1 when its slot is taken. A floating
   weapon (effect 36) floats when the hand is free or it is identified, else
   it goes in the hand. A flying instrument (effect 40) floats, but only
   while the hand is free. */
static int take_slot(int *slot, const Hero *hero, int index) {
    const unsigned char *rec = hero->inv[index];
    int kind = field_i16(rec + 52);
    int effect = field_i16(rec + 54);
    int n = index + 1;
    int *s;
    switch (kind) {
    case 1:
        if (effect == 36) {
            if ((slot[SLOT_HAND] == 0 || field_i16(rec + 60) == 1) && slot[SLOT_FLOAT] == 0) slot[SLOT_FLOAT] = n;
            else if (slot[SLOT_FLOAT] != 0 && slot[SLOT_HAND] == 0) slot[SLOT_HAND] = n;
            else return 1;
            return 0;
        }
        s = &slot[SLOT_HAND];
        break;
    case 2:
        if (slot[SLOT_HAND] != 0) return 1;
        if (effect == 40 && slot[SLOT_MUSIC] == 0) slot[SLOT_MUSIC] = n;
        else slot[SLOT_HAND] = n;
        return 0;
    case 3: s = &slot[SLOT_HELMET]; break;
    case 4: s = &slot[SLOT_SHIELD]; break;
    case 5: s = &slot[SLOT_ARMOR]; break;
    case 6: s = &slot[SLOT_GAUNTLETS]; break;
    case 7: s = &slot[SLOT_BOOTS]; break;
    case 8: s = &slot[SLOT_CLOAK]; break;
    case 9:
        if (slot[SLOT_RING] == 0) slot[SLOT_RING] = n;
        else if (slot[SLOT_RING2] == 0) slot[SLOT_RING2] = n;
        else return 1;
        return 0;
    case 13: s = &slot[SLOT_LENSES]; break;
    default: return 0;
    }
    if (*s != 0) return 1;
    *s = n;
    return 0;
}

/* proc_0670C rebuilds the slots from the worn items. */
static void fill_slots(const Hero *hero, int *slot) {
    int i;
    memset(slot, 0, SLOT_COUNT * sizeof *slot);
    for (i = 0; i < hero->inv_n; i++) {
        if (field_i16(hero->inv[i] + 64) == 1) take_slot(slot, hero, i);
    }
}

/* mage_0C4A1's [0xF8]. The floating weapon counts when magical, or cursed
   with a bonus over 1. The weapon in hand counts when magical, or when its
   effect equals a float the routine never sets, so effect 0 counts too. */
static int magic_weapon(const Hero *hero) {
    int slot[SLOT_COUNT];
    const unsigned char *rec;
    fill_slots(hero, slot);
    if (slot[SLOT_FLOAT] > 0) {
        rec = hero->inv[slot[SLOT_FLOAT] - 1];
        if (field_i16(rec + 62) == 1 || (field_i16(rec + 62) == -1 && field_i16(rec + 56) > 1)) return 1;
    }
    if (slot[SLOT_HAND] > 0) {
        rec = hero->inv[slot[SLOT_HAND] - 1];
        if (field_i16(rec + 62) == 1 || field_i16(rec + 54) == 0) return 1;
    }
    return 0;
}

static int weapon_in_hand(const Hero *hero) {
    int slot[SLOT_COUNT];
    fill_slots(hero, slot);
    return slot[SLOT_HAND] != 0;
}

/* near_0726D. Returns 1 when nothing was used, else apply_magic's result. */
static int use_item(Hero *hero, int index, unsigned char *base, int *x, int *y, const Monster *foe, int *foe_hp) {
    unsigned char *rec = hero->inv[index];
    int kind = field_i16(rec + 52);
    int effect = field_i16(rec + 54);
    int amount = field_i16(rec + 56);
    int dead;
    char name[28];
    item_name(name, (int)sizeof name, rec);
    if (kind != 10 && kind != 11 && kind != 12) {
        printf("That item needs to be Worn, not used.\n");
        return 1;
    }
    if (kind == 10) {
        if (weapon_in_hand(hero)) {
            printf("You CANNOT use a wand while wielding something else!! (Jeez!! All this, and\n");
            printf("NOW you think you're a juggler, too!  I think you've been adventuring too\n");
            printf("long!!!)\n");
            return 0;
        }
        amount -= 1;
        put_i16(rec + 56, amount);
        printf("You zap with a %s\n", name);
        dead = apply_magic(hero, effect, amount, item_power(hero), base, x, y, foe, foe_hp);
        if (amount <= 1) {
            remove_inv(hero, index);
            printf("The worn out wand begins to shudder.  After expending its last charge,\n");
            printf("the wand crumbles to dust.\n");
        }
        return dead;
    }
    printf("%s %s\n", kind == 11 ? "You drink a" : "You read a", name);
    remove_inv(hero, index);
    return apply_magic(hero, effect, amount, item_power(hero), base, x, y, foe, foe_hp);
}

/* fighting_02AD5, the I key. Effects past 48 have no name. */
static void item_info(const Hero *hero, int index) {
    static const char *attribute[49] = {
        "", "FIGHTING", "PROTECTION", "IDENTIFICATION", "REGENERATION", "SIGHT", "SPEED",
        "INVISIBILITY", "TRAP AVOIDANCE", "EVADING", "STRENGTH", "INTELLIGENCE", "CONSTITUTION",
        "DEXTERITY", "CHARISMA", "LUCK", "STATISTICS", "EXPERIENCE", "WEALTH", "WISHING", "DAMAGE",
        "SANCTURARY", "SLEEP", "TAMING", "DISPELLING", "TELEPORTATION", "HEALING", "ITEM REMOVAL",
        "TRAP GENERATION", "SUMMONING", "MAGIC NULL USER", "HURT USER", "USER SLEEP", "DESTROY ITEM",
        "SICKNESS", "BAZERKER", "FLOATING WEAPON", "SPELL INCREASE", "DESTROY WISHES", "ENHANCE MUSIC",
        "FLOATING MUSIC", "SIGHT FILTERING", "SONIC/PROTECTION", "FIRE/PROTECTION", "COLD/PROTECTION",
        "POISON RESIST", "DISEASE RESIST", "LIGHTNING/PROT", "CLEAR MIND"
    };
    const unsigned char *rec = hero->inv[index];
    int kind = field_i16(rec + 52);
    int effect = field_i16(rec + 54);
    int magic = field_i16(rec + 62);
    char name[28];
    char amount[32];
    item_name(name, (int)sizeof name, rec);
    printf("ITEM INFORMATION\n");
    printf("%-31s%s\n", "Name:", name);
    printf("%-31s%s\n", "Item type:", kind >= 1 && kind <= 13 ? item_kind(kind) : "");
    if (field_i16(rec + 60) == 1) {
        printf("%-31s%s\n", "Attribute affected:", effect >= 0 && effect <= 48 ? attribute[effect] : "");
        printf("%-31s%s\n", "Magical properties:",
               magic == -1 ? "CURSED" : magic == 0 ? "NONE" : magic == 1 ? "MAGICALLY ENHANCED" : "");
        if (kind != 10) {
            fmt_commas(amount, (int)sizeof amount, field_i16(rec + 56));
            printf("%-31s%s\n", "Amount attribute is affected:", amount);
        }
    } else {
        printf("%-31s%s\n", "Attribute affected:", "*UNKNOWN");
        printf("%-31s%s\n", "Magical properties:", "*UNKNOWN");
        if (kind != 10) printf("%-31s%s\n", "Amount attribute is affected:", "*UNKNOWN");
        printf("\n*Item needs to be identified first\n");
    }
    hold_message();
}

/* wield_0684E, the W key. Wearing decodes the real name and identifies it. */
static void wear_item(Hero *hero, int index) {
    static const char *full[14] = {
        "", "You must not wield anything while taking a weapon from its sheath",
        "You must not wield anything while taking an instrument from its sheath",
        "You can only wear one helmet at a time. Take one off first.",
        "You can only wear one shield at a time. Take one off first.",
        "You can't wear two suits of armor at one time. Remove one set first.",
        "You can't wear two sets of gauntlets at one time. Remove one set first.",
        "You can't wear two pairs of boots at one time. Remove one set first.",
        "You can only wear one cloak at a time.  Take off the old one first.",
        "You can only wear two rings at once.  Take one off first.",
        "", "", "",
        "You can't wear two sets of lenses at one time. Remove one set first."
    };
    unsigned char *rec = hero->inv[index];
    int kind = field_i16(rec + 52);
    int slot[SLOT_COUNT];
    char name[28];
    if (field_i16(rec + 64) == 1) {
        printf("You are already wearing this item \n");
        return;
    }
    if (kind == 10 || kind == 11 || kind == 12) {
        printf("This item needs to be used in the dungeon, not worn.\n");
        return;
    }
    fill_slots(hero, slot);
    if (take_slot(slot, hero, index)) {
        if (kind >= 1 && kind <= 13 && full[kind][0]) printf("%s\n", full[kind]);
        return;
    }
    if (rec[26] >= 128) reveal_item(rec, name, (int)sizeof name);
    put_i16(rec + 64, 1);
    put_i16(rec + 60, 1);
    item_name(name, (int)sizeof name, rec);
    printf("You %s the %s\n", kind == 1 || kind == 2 ? "wield" : "wear", name);
}

/* The T key. A cursed item (byte 62 at -1) stays on. */
static void take_off_item(Hero *hero, int index) {
    unsigned char *rec = hero->inv[index];
    char name[28];
    item_name(name, (int)sizeof name, rec);
    if (field_i16(rec + 64) == 0) {
        printf("This item is not being worn, hence it cannot be taken off\n");
    } else if (field_i16(rec + 62) != -1) {
        printf("You put the %s back in inventory\n", name);
        put_i16(rec + 64, 0);
    } else {
        printf("Struggle as you might, you cannot dislodge the cursed item.\n");
    }
}

/* item_menu_07841, ENTER on an item. Q or ESC gives back no key. */
static int item_menu(const Hero *hero, int index) {
    char name[28];
    char labels[6][64];
    const char *item[6];
    item_name(name, (int)sizeof name, hero->inv[index]);
    scr_clear(1, 24);
    at_print(1, 35, 15, 0, "ITEM MENU");
    printf("What do you wish to do with the %s?\n", name);
    snprintf(labels[0], sizeof labels[0], "(W) Wear the %s", name);
    snprintf(labels[1], sizeof labels[1], "(U) Use the %s", name);
    snprintf(labels[2], sizeof labels[2], "(T) Take the %s off", name);
    snprintf(labels[3], sizeof labels[3], "(D) Drop the %s", name);
    snprintf(labels[4], sizeof labels[4], "(I) Find out information about the %s", name);
    snprintf(labels[5], sizeof labels[5], "(Q or ESC) Return to the inventory screen");
    item[0] = labels[0]; item[1] = labels[1]; item[2] = labels[2];
    item[3] = labels[3]; item[4] = labels[4]; item[5] = labels[5];
    for (;;) {
        int key;
        if (live) {
            /* QB item_menu_07841: menu_choice 6 items, 1 col, col 5, row 5 */
            key = menu_choice(item, 6, 1, 5, 5, "");
        } else {
            int i;
            for (i = 0; i < 6; i++) printf("%s\n", item[i]);
            key = pick_key();
        }
        if (key == 'Q' || key == 27) return 0;
        if (key && strchr("WUTDI", key)) return key;
        printf("INVALID KEY WAS HIT\n");
    }
}

/* inventory_management_05F8E. verb is NULL for the W/U/T/D/I screen. */
static void list_inventory(const Hero *hero, int display, const char *verb) {
    int parts = hero->staff_red + hero->staff_black + hero->staff_white + hero->staff_gold;
    int i;
    if (live) {
        /* Title at 1,30; rows 2-4 a 1 on 7 bar with the keys and the legend; the items two
           to a row from row 6 (menu_choice 2, 1, 6); the staff line at 23,1 in 12. */
        char text[96];
        WORD bar = attr_of(1, 7);
        scr_clear(1, 24);
        at_print(1, 30, 15, 0, display ? "INVENTORY" : "INVENTORY MANAGEMENT");
        for (i = 2; i <= 4; i++) scr_cells(i, 1, "                                                                                ", 80, bar);
        if (!display && !verb) {
            scr_put(2, 1, "W-Wear     U-Use     T-Take off     D-Drop     I-Item Info     Q or ESC-return", bar);
            scr_put(3, 1, "(Use arrows or mouse to move around, ENTER for menu, or ESC to quit)", bar);
        } else if (!display) {
            snprintf(text, sizeof text, "Which item would you like to %s", verb);
            scr_put(2, 1, text, bar);
            scr_put(3, 1, "(Use arrows or mouse to move around, ENTER to choose, or ESC to quit)", bar);
        }
        scr_put(4, 1, "* - CURRENTLY BEING WORN    \x06 - CURSED       \x01 - MAGICALLY ENHANCED", bar);
        for (i = 0; i < hero->inv_n; i++) {
            const unsigned char *rec = hero->inv[i];
            int known = field_i16(rec + 60) == 1;
            int magic = field_i16(rec + 62);
            char name[28];
            item_name(name, (int)sizeof name, rec);
            snprintf(text, sizeof text, "%c%c%2d) %s", field_i16(rec + 64) == 1 ? '*' : ' ',
                     known && magic == -1 ? '\x06' : known && magic == 1 ? '\x01' : ' ', i + 1, name);
            scr_put(6 + i / 2, 1 + (i % 2) * 39, text, 7);
        }
        if (parts == 4) snprintf(text, sizeof text, "You currently possess the STAFF OF POWER!!");
        else if (parts > 0) snprintf(text, sizeof text, "You currently possess %d out of 4 parts of the STAFF OF POWER", parts);
        if (parts > 0) scr_put(23, 1, text, attr_of(12, 0));
        scr_at(5, 1);
        return;
    }
    printf(display ? "\nINVENTORY\n" : "\nINVENTORY MANAGEMENT\n");
    if (!display && !verb) {
        printf("W-Wear     U-Use     T-Take off     D-Drop     I-Item Info     Q or ESC-return\n");
        printf("(Use arrows or mouse to move around, ENTER for menu, or ESC to quit)\n");
    } else if (!display) {
        printf("Which item would you like to %s\n", verb);
        printf("(Use arrows or mouse to move around, ENTER to choose, or ESC to quit)\n");
    }
    printf("* - CURRENTLY BEING WORN    \x06 - CURSED       \x01 - MAGICALLY ENHANCED\n");
    for (i = 0; i < hero->inv_n; i++) {
        const unsigned char *rec = hero->inv[i];
        int known = field_i16(rec + 60) == 1;
        int magic = field_i16(rec + 62);
        char name[28];
        item_name(name, (int)sizeof name, rec);
        printf("%c%c%2d) %s\n", field_i16(rec + 64) == 1 ? '*' : ' ',
               known && magic == -1 ? '\x06' : known && magic == 1 ? '\x01' : ' ', i + 1, name);
    }
    if (parts == 4) printf("You currently possess the STAFF OF POWER!!\n");
    else if (parts > 0) printf("You currently possess %d out of 4 parts of the STAFF OF POWER\n", parts);
}

/* wield_0684E. Using an item ends the screen; in a fight foe and foe_hp
   are set. Returns -1 when the hero dies, else what the item did. */
static int inventory_menu(Hero *hero, unsigned char *base, int *x, int *y, const Monster *foe, int *foe_hp) {
    char line[64];
    if (!hero->inv_n) {
        scr_clear(1, 24);
        printf("\n");
        at_print(1, 30, 15, 0, "INVENTORY MANAGEMENT");
        printf("You have no inventory\n");
        hold_message();
        return 0;
    }
    for (;;) {
        int key;
        int pick;
        const char *rest = line;
        list_inventory(hero, 0, NULL);
        read_line(line, sizeof line);
        if (line[0] >= '0' && line[0] <= '9') {
            pick = atoi(line);
            if (pick < 1 || pick > hero->inv_n) continue;
            key = item_menu(hero, pick - 1);
        } else {
            key = toupper((unsigned char)line[0]);
            if (key == 'Q' || key == 27 || !key) {
                rate_from_pack(hero);
                return 0;
            }
            if (!strchr("WUTDI", key)) {
                printf("UNKNOWN KEY WAS HIT\n");
                continue;
            }
            while (*rest && !(*rest >= '0' && *rest <= '9')) rest++;
            /* The highlight starts on the first item. */
            pick = *rest ? atoi(rest) : 1;
            if (pick < 1 || pick > hero->inv_n) continue;
        }
        if (key == 'W') {
            wear_item(hero, pick - 1);
        } else if (key == 'U') {
            int used = use_item(hero, pick - 1, base, x, y, foe, foe_hp);
            if (used == 1) continue;
            if (used < 0) return -1;
            hold_message();
            rate_from_pack(hero);
            return used;
        } else if (key == 'I') {
            item_info(hero, pick - 1);
        } else if (key == 'T') {
            take_off_item(hero, pick - 1);
        } else if (key == 'D') {
            if (field_i16(hero->inv[pick - 1] + 64) == 0) {
                remove_inv(hero, pick - 1);
                printf("You drop the item.\n");
                if (!hero->inv_n) return 0;
            } else {
                printf("You cannot drop something you are wearing\n");
            }
        } else {
            printf("UNKNOWN KEY WAS HIT\n");
        }
    }
}

static void fill_spells(Hero *hero) {
    int n;
    for (n = 1; n <= 5; n++) {
        int count = 0;
        if (strcmp(hero->class_name, "MAGE") == 0) {
            count = n == 1 ? hero->level + 1 : hero->level - 3 * n + 3;
            if (count < 0) count = 0;
        }
        hero->spell_max[n - 1] = count;
        hero->spell_left[n - 1] = count;
    }
}

static int spell_name(int level, int which, char *name, int cap, int *effect) {
    FILE *f;
    unsigned char rec[66];
    int index = (level - 1) * 4 + (which - 1);
    int i;
    int len = 0;
    if (level < 1 || level > 5 || which < 1 || which > 4) return 0;
    f = fopen("SPELLS.DAT", "rb");
    if (!f) return 0;
    if (fseek(f, (long)index * 66, SEEK_SET) != 0 || fread(rec, 1, 66, f) != 66) {
        fclose(f);
        return 0;
    }
    fclose(f);
    if (cap < 1) return 0;
    for (i = 0; i < 18 && rec[i] >= 32 && rec[i] < 127 && len < cap - 1; i++) name[len++] = (char)rec[i];
    while (len > 0 && name[len - 1] == ' ') len--;
    name[len] = 0;
    *effect = field_i16(rec + 18);
    return 1;
}

static int cast_spell(Hero *hero, unsigned char *base, int *x, int *y, const Monster *foe, int *foe_hp) {
    char line[64];
    int magic = spell_power(hero);
    if (!live) printf("\nCAST A SPELL\n");
    if (strcmp(hero->class_name, "MAGE") != 0) {
        printf("You try to cast a spell, but\nit has no effect. If only you\nwere a mage!\n");
        hold_message();
        return 0;
    }
    for (;;) {
        int level;
        int which;
        int effect = 0;
        int cast;
        int i;
        char name[20];
        if (live) {
            /* cast_a_spell_096A0: the title at 2,54, the question at 3,42, the levels from 4,42. */
            char text[6][24];
            const char *item[6];
            int n = 0;
            panel_open();
            scr_put(2, 54, "CAST A SPELL", attr_of(15, 0));
            scr_put(3, 42, "Which spell level do you wish to cast?", attr_of(15, 0));
            for (i = 0; i < 5; i++) {
                if (hero->spell_max[i] < 1) continue;
                snprintf(text[n], sizeof text[n], "Level %d - %d/%d", i + 1, hero->spell_left[i], hero->spell_max[i]);
                item[n] = text[n];
                n++;
            }
            item[n++] = "Don't cast a spell";
            line[0] = (char)panel_choose(item, n, 4);
            line[1] = 0;
        } else {
            printf("Which spell level do you wish to cast?\n");
            for (i = 0; i < 5; i++) {
                if (hero->spell_max[i] < 1) continue;
                printf("Level %d - %d/%d\n", i + 1, hero->spell_left[i], hero->spell_max[i]);
            }
            printf("Don't cast a spell\n");
            read_line(line, sizeof line);
        }
        if (line[0] == 'q' || line[0] == 'Q' || line[0] == 27 || line[0] == '0') return 0;
        level = atoi(line);
        if (level < 1 || level > 5 || hero->spell_max[level - 1] < 1) continue;
        if (hero->spell_left[level - 1] < 1) {
            printf("You have none of those spells left!\n");
            hold_message();
            continue;
        }
        if (live) {
            /* don_t_cast_a_spell_09A0F: the title at 2,44, the question at 4,42, the spells from 5,42. */
            char text[4][24];
            char title[40];
            const char *item[5];
            int n = 0;
            panel_open();
            snprintf(title, sizeof title, "SPELL NUMBERS FOR SPELL LEVEL %d", level);
            scr_put(2, 44, title, attr_of(15, 0));
            scr_put(4, 42, "Which spell do you wish to cast?", attr_of(15, 0));
            for (which = 1; which <= 4; which++) {
                if (!spell_name(level, which, text[n], (int)sizeof text[n], &effect)) continue;
                item[n] = text[n];
                n++;
            }
            item[n++] = "Don't cast a spell";
            line[0] = (char)panel_choose(item, n, 5);
            line[1] = 0;
        } else {
            printf("SPELL NUMBERS FOR SPELL LEVEL %d\n", level);
            printf("Which spell do you wish to cast?\n");
            for (which = 1; which <= 4; which++) {
                if (!spell_name(level, which, name, (int)sizeof name, &effect)) continue;
                printf("%s\n", name);
            }
            printf("Don't cast a spell\n");
            read_line(line, sizeof line);
        }
        if (line[0] == 'q' || line[0] == 'Q' || line[0] == 27 || line[0] == '0') continue;
        which = atoi(line);
        if (which < 1 || which > 4 || !spell_name(level, which, name, (int)sizeof name, &effect)) continue;
        hero->spell_left[level - 1]--;
        printf("%s\n", name);
        if (magic > 1 && basic_int(basic_rnd() * (float)magic) == 1) {
            printf("You lost concentration! Your\nspell failed!\n");
            return 1;
        }
        cast = apply_magic(hero, effect, level, magic, base, x, y, foe, foe_hp);
        if (cast < 0) return -1;
        if (cast == 2 || cast == 3) return cast;
        return 1;
    }
}

static int cut_card(char *dst, int cap) {
    static const char *suit[] = {" OF SPADES", " OF DIAMONDS", " OF CLUBS", " OF HEARTS"};
    int rank = basic_int(basic_rnd() * 13.0f) + 1;
    int face = basic_int(basic_rnd() * 4.0f);
    const char *name;
    char num[8];
    if (rank < 1) rank = 1;
    if (rank > 13) rank = 13;
    if (face < 0) face = 0;
    if (face > 3) face = 3;
    if (rank == 1) name = "DUECE";
    else if (rank == 10) name = "JACK";
    else if (rank == 11) name = "QUEEN";
    else if (rank == 12) name = "KING";
    else if (rank == 13) name = "ACE";
    else {
        snprintf(num, sizeof num, "%d", rank + 1);
        name = num;
    }
    snprintf(dst, (size_t)cap, "%s%s", name, suit[face]);
    return rank;
}

static int draw_many_things(Hero *hero) {
    int card = basic_int(basic_rnd() * 10.0f);
    if (card < 0) card = 0;
    if (card > 9) card = 9;
    if (card == 0) {
        print_sb_key("CARD0");
        hero->sickness = 0;
        hero->hp = hero->max_hp;
    } else if (card == 1) {
        print_sb_key("CARD1");
        hero->gold = 0;
        hero->inv_n = 0;
    } else if (card == 2) {
        print_sb_key("CARD2");
        hero->wishes += 3;
    } else if (card == 3) {
        print_sb_key("CARD3");
        if (!bump_stats(hero, 2)) return 0;
    } else if (card == 4) {
        print_sb_key("CARD4");
        if (!bump_stats(hero, -2)) return 0;
    } else if (card == 5) {
        print_sb_key("CARD5");
        hero->con *= 2;
        if (hero->con > 21) hero->con = 21;
        refresh_ratings(hero);
    } else if (card == 6) {
        print_sb_key("CARD6");
        hero->con /= 2;
        if (hero->con < 1) hero->con = 1;
        refresh_ratings(hero);
    } else if (card == 7) {
        print_sb_key("CARD7");
        hero->max_hp += 10;
        hero->hp += 10;
    } else if (card == 8) {
        print_sb_key("CARD8");
        hero->max_hp -= 10;
        hero->hp -= 10;
        if (hero->max_hp < 1) hero->max_hp = 1;
        if (hero_died(hero, "DECK OF CARDS")) return 0;
    } else {
        print_sb_key("CARD9");
        hero->str *= 2;
        if (!stat_gone(hero, &hero->str, "Your strength is gone. You die!", "LOSS OF STR")) return 0;
        refresh_ratings(hero);
    }
    return 1;
}

static int wager_gambler(Hero *hero) {
    char line[64];
    char yours[40];
    char theirs[40];
    char gold[24];
    /* deck_13DE3: the Y/N comes back after every round; GAMBLERTRY only asks. */
    print_sb_key("GAMBLER");
    for (;;) {
        int bet;
        int mine;
        int his;
        if (yes_no() != 'Y') return 1;
        fmt_num(gold, sizeof gold, 0, (float)hero->gold);
        printf("You currently have %s\n", gold);
        printf("How much would you like to gamble?\n");
        read_line(line, sizeof line);
        bet = atoi(line);
        if (bet <= 0) {
            print_sb_key("GAMBLERNOBET");
            hold_message();
            return 1;
        }
        if (bet > hero->gold) {
            print_sb_key("GAMBLERNOGOLD");
        } else {
            mine = cut_card(yours, (int)sizeof yours);
            his = cut_card(theirs, (int)sizeof theirs);
            printf("The gambler deftly shuffles the cards.  You end up cutting a %s", yours);
            printf(".  The gambler then reshuffles and cuts a %s\n", theirs);
            if (mine == his) {
                print_sb_key("GAMBLERTIES");
            } else if (mine < his) {
                print_sb_key("GAMBLERWINS");
                hero->gold -= bet;
            } else {
                print_sb_key("GAMBLERLOOSES");
                hero->gold += bet;
            }
        }
        print_sb_key("GAMBLERTRY");
    }
}

/* deck_13DE3: INT(RND*10) <> 1 meets the gambler; otherwise one card from the deck. */
static int visit_deck(Hero *hero) {
    if (basic_int(basic_rnd() * 10.0f) != 1) return wager_gambler(hero);
    print_sb_key("DECK");
    if (yes_no() == 'N') return 1;
    return draw_many_things(hero);
}

static int16_t rec_i16(const unsigned char *p) {
    return (int16_t)(p[0] | (p[1] << 8));
}

static int32_t rec_i32(const unsigned char *p) {
    return (int32_t)((uint32_t)p[0] | ((uint32_t)p[1] << 8) | ((uint32_t)p[2] << 16) | ((uint32_t)p[3] << 24));
}

/* 00_25D94: commas every three digits, right-justified in width.
   A width of -1 leaves the commas out. Each group is LTRIM$(STR$(r)). */
static void fmt_num(char *out, size_t cap, int width, float x) {
    float a = fabsf(x);
    char s[64];
    char t[64];
    s[0] = 0;
    if (a == 0.0f) snprintf(s, sizeof s, "0");
    while (a > 0.0f) {
        float q = floorf(a / 1000.0f);
        float r = a - q * 1000.0f;
        char g[32];
        snprintf(g, sizeof g, "%.7g", (double)r);
        a = q;
        if (a > 0.0f && width != -1) {
            snprintf(t, sizeof t, "%s%s%s", r < 10.0f ? ",00" : r < 100.0f ? ",0" : ",", g, s);
        } else {
            snprintf(t, sizeof t, "%s%s", g, s);
        }
        snprintf(s, sizeof s, "%s", t);
    }
    if (x < 0.0f) {
        snprintf(t, sizeof t, "-%s", s);
        snprintf(s, sizeof s, "%s", t);
    }
    snprintf(out, cap, "%*s", width > 0 ? width : 0, s);
}

static int read_hero_record(const Hero *hero, unsigned char *rec) {
    FILE *f = fopen(hero->save_path, "rb");
    int ok;
    if (!f) return 0;
    ok = fseek(f, (long)hero->save_slot * CHAR_RECORD, SEEK_SET) == 0 &&
         fread(rec, 1, CHAR_RECORD, f) == CHAR_RECORD;
    fclose(f);
    return ok;
}

static void exit_screen(void);

/* The ON ERROR GOTO handler at 0x9D9F, set around the lock opens and the
   file test in proc_245DD: a count that is never reset, SLEEP 1, RESUME
   NEXT. The 11th error ends the program. */
static int file_errors;
static void file_error(void) {
    if (++file_errors > 10) {
        printf("FILES ARE IN USE.  COME BACK LATER\n");
        hold_message();
        exit_screen();
        exit(0);
    }
    Sleep(1000);
}

/* OPEN FOR RANDOM ... LOCK READ WRITE (mode 0x1004): DOS refuses a second
   open while the first is held. SHARED (0x4004) is never refused. */
static HANDLE open_lock(const char *name, int shared) {
    DWORD share = shared ? FILE_SHARE_READ | FILE_SHARE_WRITE : 0;
    return CreateFileA(name, GENERIC_READ | GENERIC_WRITE, share, NULL, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
}

static HANDLE take_lock(const char *name) {
    HANDLE h = open_lock(name, 0);
    if (h == INVALID_HANDLE_VALUE) file_error();
    return h;
}

/* CLOSE, then KILL under the handler at 0x9E56, which ignores the error. */
static void drop_lock(HANDLE h, const char *name) {
    if (h != INVALID_HANDLE_VALUE) CloseHandle(h);
    DeleteFileA(name);
}

/* #16, RTRIM$(+70) + ".SBL" at DS 0x123, held for the whole session. */
static HANDLE party_lock = INVALID_HANDLE_VALUE;
static char party_lock_path[16];

static int blank_killer(const unsigned char *rec) {
    int i;
    for (i = 0; i < 20; i++)
        if (rec[146 + i] != ' ') return 0;
    return 1;
}

static void get_hall(FILE *f, long i, unsigned char *rec) {
    memset(rec, 0, CHAR_RECORD);
    if (fseek(f, (i - 1) * CHAR_RECORD, SEEK_SET) == 0) fread(rec, 1, CHAR_RECORD, f);
}

/* hallfame_dat_10E6E. HALLFAME.DAT holds whole character records, most
   experience first. The record replaces its own living entry (same file
   name at +20, blank killer at +146) or goes in front of the first entry
   with less experience. The copy runs while fewer than 16 are out; a
   newcomer is only added at the end of a list shorter than 15. */
static void write_hall(const unsigned char *me) {
    HANDLE lock = take_lock("HALLLOCK.SBL");
    FILE *in = fopen("HALLFAME.DAT", "rb");
    FILE *out;
    unsigned char t[CHAR_RECORD];
    float n = 0.0f;
    long i = 1;
    long outn = 0;
    int written = 0;
    int32_t my_xp = rec_i32(me + 100);
    if (in && fseek(in, 0, SEEK_END) == 0) n = (float)ftell(in) / 166.0f;
    remove("WRITHALL.SBT");
    out = fopen("WRITHALL.SBT", "wb");
    if (!out) {
        if (in) fclose(in);
        drop_lock(lock, "HALLLOCK.SBL");
        return;
    }
    if (n > 0.0f) {
        get_hall(in, i, t);
        do {
            if (memcmp(t + 20, me + 20, 8) == 0 && blank_killer(t)) {
                if (!written) {
                    fwrite(me, 1, CHAR_RECORD, out);
                    outn++;
                    written = 1;
                }
                get_hall(in, ++i, t);
            } else if (my_xp > rec_i32(t + 100) && !written) {
                fwrite(me, 1, CHAR_RECORD, out);
                outn++;
                written = 1;
            } else {
                fwrite(t, 1, CHAR_RECORD, out);
                outn++;
                get_hall(in, ++i, t);
            }
        } while ((float)i <= n && outn <= 15);
    }
    if (n < 15.0f && my_xp > 0 && !written) fwrite(me, 1, CHAR_RECORD, out);
    if (in) fclose(in);
    remove("HALLFAME.DAT");
    fclose(out);
    rename("WRITHALL.SBT", "HALLFAME.DAT");
    drop_lock(lock, "HALLLOCK.SBL");
}

/* The record in memory as the Hall of Fame sees it: var_01F4 (+60) is the
   floor, 0 in town, and +146 the killer, blank while alive. */
static void hall_from_hero(const Hero *hero, int floor, const char *killer) {
    unsigned char rec[CHAR_RECORD];
    size_t n = strlen(killer);
    if (!read_hero_record(hero, rec)) return;
    store_i16(rec + 60, floor);
    memset(rec + 146, ' ', 20);
    memcpy(rec + 146, killer, n < 20 ? n : 20);
    write_hall(rec);
}

/* dun_0E905 on a death: the killer goes in, and the Hall of Fame is
   rewritten when there is any experience. The save is kept here. */
static void hero_left_dead(Hero *hero) {
    save_hero(hero);
    if (hero->xp != 0) hall_from_hero(hero, hero->death_floor, hero->killer);
}

/* hallfame_dat_0BE69: the list on screen, and the same list in
   HALLFAME.TXT as PRINT #14, USING "##) && ##  " writes it. */
static void show_hall(void) {
    HANDLE lock;
    FILE *f;
    FILE *txt;
    unsigned char rec[CHAR_RECORD];
    long size;
    int n;
    int i;
    if (party_lock != INVALID_HANDLE_VALUE) CloseHandle(party_lock);
    party_lock = INVALID_HANDLE_VALUE;
    lock = open_lock("HALLLOCK.SBL", 1);
    f = fopen("HALLFAME.DAT", "rb");
    if (!f) {
        drop_lock(lock, "HALLLOCK.SBL");
        return;
    }
    fseek(f, 0, SEEK_END);
    size = ftell(f);
    if (size <= 0) {
        fclose(f);
        drop_lock(lock, "HALLLOCK.SBL");
        return;
    }
    n = (int)lrintf((float)size / 166.0f);
    txt = fopen("HALLFAME.TXT", "wb");
    printf("\n%25s%s\n\n", "", "SORCERER'S BANE HALL OF FAME");
    printf("   NAME                CLASS   LEV\n");
    for (i = 1; i <= n; i++) {
        char num[16];
        char lev[16];
        int level;
        int floor;
        get_hall(f, i, rec);
        level = rec_i16(rec + 40);
        floor = rec_i16(rec + 60);
        fmt_num(num, sizeof num, 2, (float)i);
        fmt_num(lev, sizeof lev, 3, (float)level);
        printf("%s) ", num);
        sb_write(rec, 20);
        sb_write(rec + 28, 7);
        printf("%s", lev);
        if (txt) {
            fprintf(txt, "%2d) ", i);
            fwrite(rec, 1, 20, txt);
            fwrite(rec + 28, 1, 7, txt);
            fprintf(txt, " %2d  ", level);
        }
        if (floor > 30) {
            printf(" WON THE GAME!!!\n");
            if (txt) fprintf(txt, " WON THE GAME!!!\r\n");
        } else if (!blank_killer(rec)) {
            fmt_num(num, sizeof num, 0, (float)floor);
            printf(" killed on %s by a ", num);
            sb_write(rec + 146, 20);
            printf("\n");
            if (txt) {
                fprintf(txt, " killed on %2d by a ", floor);
                fwrite(rec + 146, 1, 20, txt);
                fprintf(txt, "\r\n");
            }
        } else if (floor == 0) {
            printf(" currently adventuring in town\n");
            if (txt) fprintf(txt, " currently adventuring in town\r\n");
        } else {
            fmt_num(num, sizeof num, 0, (float)floor);
            printf(" currently adventuring on level %s\n", num);
            if (txt) fprintf(txt, " currently adventuring on level %s%d \r\n", floor < 0 ? "" : " ", floor);
        }
    }
    if (txt) fclose(txt);
    fclose(f);
    drop_lock(lock, "HALLLOCK.SBL");
    hold_message();
}

/* LPRINT. With no printer the stream is appended, byte for byte, to this
   file: CR LF after each statement, TAB(n) padding to column n. */
#define PRINTER_FILE "LPRINT.TXT"
#define LF "\n"
#define CR "\r"
#define FF "\f"

static FILE *lprint_file;
static int lprint_col;

static void lprint(const char *s) {
    if (!lprint_file) return;
    for (; *s; s++) {
        fputc(*s, lprint_file);
        lprint_col = (*s == '\r' || *s == '\n') ? 0 : lprint_col + 1;
    }
}

static void lprint_tab(int n) {
    if (lprint_col > n - 1) lprint("\r\n");
    while (lprint_col < n - 1) lprint(" ");
}

static void lprint_line(const char *s) {
    lprint(s);
    lprint("\r\n");
}

/* doshareware_25421. An empty device shows the order screen; anything
   else prints the invoice. */
static void do_shareware(const char *company, const char *street, const char *city, const char *phone,
                         const char *device, const char *const *desc, const float *price, int count) {
    char rule[41];
    char cost[32];
    char line[256];
    int i;
    if (device[0] == 0) {
        print_sb_key("DOSHAREWARE");
        hold_message();
        for (i = 1; i <= count; i++) {
            fmt_num(cost, sizeof cost, 0, price[i - 1]);
            snprintf(line, sizeof line, "end %s for %s", cost, desc[i - 1]);
            if (i == 1) printf("S%s or\n", line);
            else if (i == count) printf("s%s to:" LF "\n", line);
            else printf("s%s or\n", line);
        }
        printf("%s\n%s\n%s\n", company, street, city);
        if (phone[0]) {
            printf(LF "(Send an additional $4.00 if you are ordering C.O.D. for S+H)\n");
            printf(LF "If you have any questions, bugs, or comments, call at:" LF "\n");
            printf("%s\n", phone);
            printf(LF "You can also use the phone to order C.O.D. for an additional $4.00 S&H.\n");
            printf("(Phone message space is limited, so please be discretionary about calling.)" LF "\n");
        }
        return;
    }
    memset(rule, '_', 40);
    rule[40] = 0;
    lprint_tab(35); lprint("INVOICE"); lprint_line(LF);
    lprint("Remit to:"); lprint_tab(40); lprint("From:"); lprint(LF); lprint_line(LF);
    lprint(company); lprint_tab(40); lprint_line(rule);
    lprint_line(street);
    lprint(city); lprint_tab(40); lprint_line(rule);
    lprint_line(phone);
    lprint_tab(40); lprint(rule); lprint_line(LF);
    lprint_tab(40); lprint(rule); lprint(LF); lprint_line(LF);
    lprint_tab(40); lprint("Attention to (contact name):"); lprint(LF); lprint_line(LF);
    lprint_tab(40); lprint(rule); lprint_line(LF);
    lprint_tab(40); lprint(rule); lprint(LF); lprint_line(LF);
    lprint("QTY"); lprint_tab(55); lprint("UNIT PRICE"); lprint_tab(69); lprint("TOTAL"); lprint(LF); lprint_line(LF);
    for (i = 1; i <= count; i++) {
        snprintf(line, sizeof line, "___ %s", desc[i - 1]);
        lprint(line);
        fmt_num(cost, sizeof cost, 0, price[i - 1]);
        lprint_tab(55); lprint(cost); lprint_tab(69); lprint("__________"); lprint_line(LF);
    }
    lprint_line("    C.O.D. shipping and handling (C.O.D. ORDERS ONLY!)");
    lprint("    put $4.00 here for entire order");
    fmt_num(cost, sizeof cost, 0, 4.0f);
    lprint_tab(55); lprint(cost); lprint_tab(69); lprint("__________"); lprint_line(LF);
    lprint(LF); lprint(LF); lprint_tab(55); lprint("TOTAL"); lprint_tab(69); lprint("__________"); lprint(LF); lprint_line(LF);
    lprint("I use 5 1/4 __________     3 1/2 __________  disks"); lprint_line(LF);
}

static const char *const sb_company = "WOOD SOFTWARE DEVELOPMENT";
static const char *const sb_street = "P.O. BOX 50681";
static const char *const sb_city = "INDIANAPOLIS, IN 46250";
static const char *const sb_phone = "317-470-8085";
static const float sb_price[2] = {19.95f, 99.95f};

/* wood_software_development_0EAE8, (P) PRINT THE REGISTRATION FORM. */
static void print_registration(void) {
    static const char *const desc[2] = {
        "Standard SB Registration with GAME MASTER",
        "Extended SB Registration with GAME MASTER," CR "    BASWOOD BASIC tools, source code, and manuals",
    };
    lprint_file = fopen(PRINTER_FILE, "ab");
    if (!lprint_file) return;
    lprint_col = 0;
    do_shareware(sb_company, sb_street, sb_city, sb_phone, "STDOUT", desc, sb_price, 2);
    lprint_line("Your registration fee entitles you to use all software received on a single");
    lprint_line("computer, make as many backups as you wish, and/or transfer all rights to");
    lprint_line("the software to another individual.  Although you cannot use the source code");
    lprint_line("for SB or GM for distribution without written expressed permission of the");
    lprint_line("holder of the copyright, you can use the BASWOOD utilities to make and");
    lprint_line("distribute your own software ALONG WITH the BASWOOD.LIB that will come with");
    lprint_line("the 99.95 registration.  Site licenses are also available; call for details." LF);
    lprint_line("Check or money order only (No cash please, for my sake as well as yours,");
    lprint_line("and all checks must be drawn against U.S. banks.)  Make all checks out for");
    lprint_line("$19.95 for each SB regular registration and 99.95 for each SB extended");
    lprint_line("registration.  Most corporate P.O.s also accepted.  Allow 6 weeks for");
    lprint_line("delivery on personal checks.  Money orders and corporate P.O.s allow 1");
    lprint_line("week for delivery." FF);
    fclose(lprint_file);
    lprint_file = NULL;
}

/* wood_software_development_0D2B8, the way out of the game. */
static void exit_screen(void) {
    static const char *const desc[2] = {
        "Standard SB Registration with the Game Master program (GM)",
        "Extended SB Registration with GM, BASWOOD tools, and source",
    };
    show_hall();
    if (party_lock_path[0]) drop_lock(party_lock, party_lock_path);
    party_lock = INVALID_HANDLE_VALUE;
    do_shareware(sb_company, sb_street, sb_city, sb_phone, "", desc, sb_price, 2);
    printf(LF "Thanks for playing SB.  Don't forget to register and tell your friends about it!\n");
}

/* sorcerer_s_bane_17F3F and no_212EF. The settings sit at +78 of this
   user's 87-byte USER.SBS record: color, sound, mouse and mouse
   description words, then the error alarm byte (CHR$(7) on, CHR$(0) off).
   This console has no color, music, beep or mouse, so they are only kept;
   with no mouse ([0x64] = 0) the mouse words are saved as 0. */
typedef struct {
    int color;
    int sound;
    int mouse;
    int mouse_desc;
    unsigned char alarm;
} Defaults;

/* charactr_0F56E: GET #7, n */
static int get_user_record(long n) {
    FILE *f = fopen("USER.SBS", "rb");
    int ok = f && fseek(f, (n - 1) * 87, SEEK_SET) == 0 && fread(user_rec, 1, 87, f) == 87;
    if (f) fclose(f);
    if (ok) user_no = n;
    return ok;
}

/* PUT #7, var_0096 */
static void put_user(void) {
    FILE *f = fopen("USER.SBS", "rb+");
    if (!f) f = fopen("USER.SBS", "wb");
    if (!f) return;
    if (fseek(f, (user_no - 1) * 87, SEEK_SET) == 0) fwrite(user_rec, 1, 87, f);
    fclose(f);
}

/* The user record's setup: color +78, sound +80, mouse +82, the description +84, the alarm byte +86. */
static void apply_defaults(void) {
    color_on = rec_i16(user_rec + 78) == 1;
    sound_on = rec_i16(user_rec + 80) == 1;
    mouse_on = live && GetSystemMetrics(SM_MOUSEPRESENT) && rec_i16(user_rec + 82) == 1;
    mouse_desc = mouse_on && rec_i16(user_rec + 84) == 1;
    alarm_on = user_rec[86] == 7;
}

static void defaults_menu(void) {
    static const char *const yes_no[2] = {"NO ", "YES"};
    const int mouse_present = live && GetSystemMetrics(SM_MOUSEPRESENT);
    unsigned char *rec = user_rec;
    Defaults d;
    char line[64];
    d.color = rec_i16(rec + 78);
    d.sound = rec_i16(rec + 80);
    d.mouse = rec_i16(rec + 82);
    d.mouse_desc = rec_i16(rec + 84);
    d.alarm = rec[86];
    for (;;) {
        scr_clear(1, 24);
        printf("\n");
        at_print(1, 27, 15, 0, "DEFAULTS IN SORCERER'S BANE");
        printf("\n");
        printf("Current setup\n");
        printf("%29s%-20s%s\n", "", "Color:", yes_no[d.color == 1]);
        printf("%29s%-20s%s\n", "", "Sound (music):", yes_no[d.sound == 1]);
        printf("%29s%-20s%s\n", "", "Error Alarm:", yes_no[d.alarm == 7]);
        if (mouse_present) {
            printf("%29s%-20s%s\n", "", "Mouse:", yes_no[d.mouse == 1]);
            if (d.mouse == 1) printf("%29s%-20s%s\n", "", "Mouse description:", yes_no[d.mouse_desc == 1]);
            else {
                d.mouse_desc = 0;
                printf("\n");
            }
        } else {
            d.mouse = 0;
            d.mouse_desc = 0;
            printf("\n\n");
        }
        printf("\nSetup menu options\n");
        {
            char labels[7][64];
            const char *opts[7];
            int n = 0;
            int ch;
            snprintf(labels[n], sizeof labels[n], "%s", d.color == 1 ? "(C) Turn the color off" : "(C) Turn the color on ");
            opts[n] = labels[n]; n++;
            snprintf(labels[n], sizeof labels[n], "%s", d.sound == 1 ? "(S) Turn the sound (music) off" : "(S) Turn the sound (music) on ");
            opts[n] = labels[n]; n++;
            snprintf(labels[n], sizeof labels[n], "%s", d.alarm == 7 ? "(E) Turn the error alarm off" : "(E) Turn the error alarm on ");
            opts[n] = labels[n]; n++;
            if (mouse_present) {
                snprintf(labels[n], sizeof labels[n], "%s", d.mouse == 1 ? "(M) Turn the mouse off" : "(M) Turn the mouse on ");
                opts[n] = labels[n]; n++;
            }
            if (d.mouse == 1) {
                snprintf(labels[n], sizeof labels[n], "%s", d.mouse_desc == 1 ? "(D) Turn the mouse button description off" : "(D) Turn the mouse button description on ");
                opts[n] = labels[n]; n++;
            }
            opts[n++] = "(H) Help ";
            opts[n++] = "(Q or ESC) Save and go to the Main or previous Menu";
            if (live) {
                /* QB defaults: menu_choice 1 col at col 20, row 15 */
                ch = menu_choice(opts, n, 1, 20, 15, "");
            } else {
                int i;
                for (i = 0; i < n; i++) printf("%s\n", opts[i]);
                read_line(line, sizeof line);
                ch = toupper((unsigned char)line[0]);
            }
            if (ch == 'Q' || ch == 27) break;
            if (ch == 'H') show_help("HELPDEFAULTS");
            else if (ch == 'C') d.color = d.color == 1 ? 0 : 1;
            else if (ch == 'S') d.sound = d.sound == 1 ? 0 : 1;
            else if (ch == 'E') d.alarm = d.alarm == 7 ? 0 : 7;
            else if (ch == 'M' && mouse_present) d.mouse = d.mouse == 1 ? 0 : 1;
            else if (ch == 'D' && d.mouse == 1) d.mouse_desc = d.mouse_desc == 1 ? 0 : 1;
            else printf("An unknown key was hit\n");
        }
    }
    store_i16(rec + 78, d.color);
    store_i16(rec + 80, d.sound);
    store_i16(rec + 82, d.mouse);
    store_i16(rec + 84, d.mouse_desc);
    rec[86] = d.alarm;
    if (user_no > 0) put_user();
    apply_defaults();
}

/* character_menu_03522. */
static int character_menu(const Hero *hero) {
    static const char *const item[11] = {
        "(R) RUN IN THE DUNGEON", "(F) FIND EACH LEVEL'S EXPERIENCE", "(A) ATTRIBUTES/INVENTORY MANAGEMENT",
        "(I) INTRODUCTION", "(S) VISIT THE SHOP", "(H) HELP", "(C) VISIT THE CLERIC", "(D) CHANGE SYSTEM DEFAULTS",
        "(W) MAKE A WISH", "(P) PRINT THE REGISTRATION FORM", "(Q or ESC) SAVE AND RETURN TO MAIN MENU"};
    scr_clear(1, 24);
    if (live) at_print(1, 35, 15, 0, "CHARACTER MENU");
    else printf("\n%34sCHARACTER MENU\n\n", "");
    scr_color(11, 0);
    scr_at(3, 1);
    printf("A young, scruffy-looking man appears before you.  Although he looks clean,\n");
    printf("his cloths are wrinkled and he appears to have a couple of days growth on\n");
    printf("his face.  He is wearing what appear to be blue jeans, a T-shirt, tennis \n");
    printf("shoes and a baseball cap.  Although definitely not the type to model men's\n");
    printf("underwear in a department store catalogue, he seems likable enough.\n\n");
    printf("'Hi!' he says casually. 'My name is Allyn, and I'm the dungeon master around\n");
    printf("here, until they can find somebody to replace me.  (It's a dull job, but\n");
    printf("somebody's gotta do it.)  What do you wish to do today?'\n\n");
    printf("Choose what you wish to do.\n\n");
    scr_color(4, 7);
    scr_at(15, 1);
    printf("CURRENTLY USING %s\n\n", hero->name);
    scr_color(7, 0);
    return menu_choice(item, 11, 2, 1, 17, "");
}

/* lerend_07BA0. */
static void town(Hero *hero, const Monster *monsters, int count) {
    for (;;) {
        int key = time_up ? 'Q' : character_menu(hero);
        if (key == 'Q' || key == 27) {
            /* proc_09BED saves, then hallfame_dat_10E6E. */
            save_hero(hero);
            hall_from_hero(hero, hero->floor, "");
            return;
        }
        if ((key == 'C' || key == 'S') && hero->floor > 0) {
            printf("%s cannot visit the %s until he/she leaves the dungeon!\n",
                   hero->name, key == 'C' ? "cleric" : "shop");
            continue;
        }
        if (key == 'R') {
            dungeon(hero, monsters, count);
        } else if (key == 'D') {
            defaults_menu();
        } else if (key == 'F') {
            experience_menu();
        } else if (key == 'A') {
            show_attributes(hero, hero->floor);
        } else if (key == 'C') {
            visit_cleric(hero, "Lerend");
        } else if (key == 'S') {
            visit_shop(hero, "Kiera");
        } else if (key == 'P') {
            print_registration();
        } else if (key == 'H') {
            show_help("HELPMAIN");
        } else if (key == 'I') {
            show_help("INTRODUCTION");
        } else if (key == 'W') {
            make_wish(hero, NULL, hero->floor == 0);
        } else {
            printf("'Look', Allyn says, 'I'm a DM, not a mind reader! Enter a VALID choice!'\n");
            continue;
        }
        if (hero->hp <= 0) {
            hero_left_dead(hero);
            return;
        }
    }
}

/* character_choice_menu_05BB4: NAME RACE CLASS and where each one is;
   any verb but "" (play) asks "Who do you want to <verb>?". */
static int choose_character(Hero *heroes, const char *verb) {
    char line[64];
    int n = load_heroes(heroes, MAX_HEROES);
    int i;
    int pick;
    /* Cleared, the title at 1,28 in 15, the prompt at 3,1 in 11, the list from 5,2. */
    scr_clear(1, 24);
    printf("\n");
    at_print(1, 28, 15, 0, "CHARACTER CHOICE MENU");
    scr_color(11, 0);
    scr_at(3, 1);
    if (!n) {
        printf("There are no characters created. \nPlease create one first.\n");
        scr_color(7, 0);
        hold_message();
        return 0;
    }
    if (*verb) printf("Who do you want to %s?\n", verb);
    scr_color(7, 0);
    for (i = 0; i < n; i++) {
        scr_at(5 + i, 1);
        printf("  %d  %-20s %-5s %-7s", i + 1, heroes[i].name, heroes[i].race, heroes[i].class_name);
        if (heroes[i].floor == 0) printf(" Currently in town\n");
        else printf(" Adventuring on level %d\n", heroes[i].floor);
    }
    read_line(line, sizeof line);
    pick = atoi(line);
    return pick >= 1 && pick <= n ? pick : 0;
}

static void use_character(const Monster *monsters, int count) {
    Hero heroes[MAX_HEROES];
    int pick = choose_character(heroes, "");
    if (pick) town(&heroes[pick - 1], monsters, count);
}

static void list_characters(void) {
    WIN32_FIND_DATAA data;
    HANDLE found = FindFirstFileA("*.SBC", &data);
    int shown = 0;
    scr_clear(1, 24);
    printf("\n");
    at_print(1, 28, 15, 0, "CHARACTER CHOICE MENU");
    scr_at(3, 1);
    if (found == INVALID_HANDLE_VALUE) {
        printf("There are no characters created.\nPlease create one first.\n");
        return;
    }
    do {
        if (data.nFileSizeLow == 0) continue;
        printf("  %s\n", data.cFileName);
        shown++;
    } while (FindNextFileA(found, &data));
    FindClose(found);
    if (!shown) printf("There are no characters created.\nPlease create one first.\n");
}

static void trim_line(char *line) {
    int n = (int)strlen(line);
    while (n > 0 && (line[n - 1] == '\n' || line[n - 1] == '\r' || line[n - 1] == ' ')) line[--n] = 0;
}

static void pad_field(unsigned char *dst, int n, const char *src) {
    int i;
    memset(dst, ' ', (size_t)n);
    for (i = 0; i < n && src[i]; i++) dst[i] = (unsigned char)src[i];
}

static void put_i32(unsigned char *p, int v) {
    int i;
    for (i = 0; i < 4; i++) p[i] = (unsigned char)((v >> (8 * i)) & 255);
}

/* Each stat is INT(RND*6)+INT(RND*6)+8, which is 2d6+6, range 8 through 18. */
static int roll_stat(void) {
    return basic_int(basic_rnd() * 6.0f) + basic_int(basic_rnd() * 6.0f) + 8;
}

static void roll_stats(int *stat) {
    int i;
    for (i = 0; i < 6; i++) stat[i] = roll_stat();
}

static void show_roll(const int *stat) {
    at_print(14, 30, 11, 0, "STR INT CON DEX CHR LCK");
    at_print(15, 30, 11, 0, "=== === === === === ===");
    scr_at(16, 30);
    printf("%3d %3d %3d %3d %3d %3d\n", stat[0], stat[1], stat[2], stat[3], stat[4], stat[5]);
}

static void apply_race(int *stat, int race) {
    static const int mod[5][6] = {
        {0, 0, 0, 0, 0, 0},
        {-1, 1, -1, 1, 1, -1},
        {2, -2, 2, 2, -2, -2},
        {-1, 1, 1, 1, -1, -1},
        {-2, 1, -1, 1, -1, 2},
    };
    int i;
    for (i = 0; i < 6; i++) stat[i] += mod[race][i];
}

/* [0xB6], the positive worn effect-5 (sight) bonuses. */
static int sight_bonus(const Hero *h) {
    int i;
    int sum = 0;
    for (i = 0; i < h->inv_n; i++) {
        const unsigned char *rec = h->inv[i];
        if (field_i16(rec + 64) == 1 && field_i16(rec + 54) == 5 && field_i16(rec + 56) > 0) sum += field_i16(rec + 56);
    }
    return sum;
}

/* you_can_see_again_147F8. The range is 2 with sight, 1 without and 0 while blind.
   Sight or sight filtering ([0xC0]) shows the tiles under 22; otherwise they look like floor.
   Returns 1 when something new comes into view, a secret door lies straight ahead or the
   cell underfoot is not plain floor; that stops a run. A worn trap generator ([0xD0])
   lays a trap on plain floor. The map redraw paints the changes. */
static int reveal_around(Hero *hero, unsigned char *view, unsigned char *base, int x, int y, int dx, int dy, int step) {
    int range = sight_bonus(hero) > 0 ? 2 : 1;
    int sharp = range > 1 || wears_effect(hero, 41);
    int found = 0;
    int x0, y0, x1, y1, row, col, at;
    unsigned char t;
    if (hero->blind == 1) {
        if (step && basic_int(basic_rnd() * 20.0f) == 1) {
            hero->blind = 0;
            printf("You can see again\n");
            hold_message();
        } else {
            range = 0;
        }
    }
    x0 = x - range < 1 ? 1 : x - range;
    y0 = y - range < 1 ? 1 : y - range;
    x1 = x + range > FLOOR_W ? FLOOR_W : x + range;
    y1 = y + range > FLOOR_H ? FLOOR_H : y + range;
    for (row = y0; row <= y1; row++) {
        for (col = x0; col <= x1; col++) {
            unsigned char was;
            unsigned char glyph;
            at = (row - 1) * FLOOR_W + (col - 1);
            was = view[at];
            t = base[at];
            glyph = was;
            if (sharp && t < 22) {
                glyph = t == 11 ? 186 : t == 12 ? 205 : t == 13 ? 24 : t == 14 ? 25 :
                        (t >= 16 && t <= 19) ? 'D' : t == 20 ? 'W' : t;
                if (glyph != was) found = 1;
            } else if (was == 32 || t == 194 || t == 193 || t == 210) {
                if (t == 11) glyph = 196;
                else if (t == 12) glyph = 179;
                else if (t == 194) glyph = (row < y1 || was == 194) ? 194 : 196;
                else if (t == 193) glyph = (row > y0 || was == 193) ? 193 : 196;
                else if (t == 32 || t < 22) glyph = 46;
                else glyph = t;
            }
            if (was != glyph || t == 193 || t == 194 || was == 32) {
                view[at] = glyph;
                if (t != 193 && t != 194 && glyph != 179 && glyph != 196 && t != 218 && t != 191 &&
                    t != 192 && t != 217 && glyph != 46) found = 1;
            }
            if (((glyph == 196 && t == 11) || (glyph == 179 && t == 12)) && row - y == dy && col - x == dx) found = 1;
        }
    }
    if (!step) return found;
    at = (y - 1) * FLOOR_W + (x - 1);
    t = base[at];
    if (t == 32) {
        if (wears_effect(hero, 28)) base[at] = 21;
        return found;
    }
    switch (t) {
    case 11: view[at] = 186; break;
    case 12: view[at] = 205; break;
    case 14: view[at] = 24; break;
    case 13: view[at] = 25; break;
    case 208: view[at] = 209; break;
    case 16: case 17: case 18: case 19: view[at] = 'D'; break;
    case 20: view[at] = 'W'; break;
    case 186: case 205: case 145: case 209: case 25: case 21: view[at] = t; break;
    default: break;
    }
    return 1;
}

static void poke_cell(unsigned char *map, int col, int row, int tile) {
    if (col < 0 || row < 0 || col >= FLOOR_W || row >= FLOOR_H) return;
    map[row * FLOOR_W + col] = (unsigned char)tile;
}

static int rooms_overlap(int left, int right, int top, int bottom, const int *L, const int *R, const int *T, const int *B, int n) {
    int i;
    for (i = 0; i < n; i++) {
        if (right < L[i] || left > R[i] || bottom < T[i] || top > B[i]) continue;
        return 1;
    }
    return 0;
}

static void draw_room(unsigned char *base, int left, int right, int top, int bottom) {
    int c;
    int r;
    poke_cell(base, left, top - 1, 218);
    poke_cell(base, right, top - 1, 191);
    poke_cell(base, left, bottom - 1, 192);
    poke_cell(base, right, bottom - 1, 217);
    for (c = left + 1; c <= right - 1; c++) {
        poke_cell(base, c, top - 1, 196);
        poke_cell(base, c, bottom - 1, 196);
    }
    for (r = top + 1; r <= bottom - 1; r++) {
        poke_cell(base, left, r - 1, 179);
        poke_cell(base, right, r - 1, 179);
    }
}

static void cut_door(unsigned char *base, int left, int right, int top, int bottom) {
    int side = basic_int(basic_rnd() * 4.0f) + 1;
    int which = basic_int(basic_rnd() * 2.0f);
    int span;
    int offset;
    if (side == 2 || side == 4) {
        span = right - left - 2;
        if (span < 1) return;
        offset = basic_int(basic_rnd() * (float)span) + 1;
        poke_cell(base, left + offset, (side == 4 ? bottom : top) - 1, which == 1 ? 186 : 11);
    } else {
        span = bottom - top - 1;
        if (span < 1) return;
        offset = basic_int(basic_rnd() * (float)span) + 1;
        poke_cell(base, side == 3 ? right : left, top - 1 + offset, which == 1 ? 12 : 205);
    }
}

static int place_on_space(unsigned char *base, int tile, int *sx, int *sy) {
    int guard;
    for (guard = 0; guard < 4000; guard++) {
        int x = basic_int(basic_rnd() * 77.0f) + 1;
        int y = basic_int(basic_rnd() * 12.0f) + 1;
        if (base[(y - 1) * FLOOR_W + x] != 32) continue;
        base[(y - 1) * FLOOR_W + x] = (unsigned char)tile;
        if (sx) {
            *sx = x + 1;
            *sy = y;
        }
        return 1;
    }
    return 0;
}

static void place_many(unsigned char *base, int n, int tile) {
    int i;
    for (i = 0; i < n; i++) place_on_space(base, tile, NULL, NULL);
}

static void dig_rooms(unsigned char *base) {
    int L[35], R[35], T[35], B[35];
    int tries;
    int rooms = 0;
    int i;
    tries = basic_int(basic_rnd() * 15.0f) + 20;
    for (i = 0; i < tries && rooms < 35; i++) {
        int left = basic_int(basic_rnd() * 70.0f) + 2;
        int right = basic_int(basic_rnd() * (float)(72 - left) / 4.0f) + 6 + left;
        int top = basic_int(basic_rnd() * 9.0f) + 2;
        int bottom = basic_int(basic_rnd() * (float)(11 - top)) + 2 + top;
        int doors;
        int d;
        if (right >= FLOOR_W || bottom > FLOOR_H) continue;
        if (rooms_overlap(left, right, top, bottom, L, R, T, B, rooms)) continue;
        draw_room(base, left, right, top, bottom);
        doors = basic_int(basic_rnd() * 4.0f) + 1;
        for (d = 0; d < doors; d++) cut_door(base, left, right, top, bottom);
        L[rooms] = left;
        R[rooms] = right;
        T[rooms] = top;
        B[rooms] = bottom;
        rooms++;
    }
}

/* proc_15774, floor 30. Every even row is wall; short walls split the odd
   rows, and each wall run gets one secret door. Positions are 1-based. */
static void dig_maze(unsigned char *base) {
    int r;
    int i;
    int n;
    for (r = 1; r <= 13; r += 2) {
        memset(base + (r - 1) * FLOOR_W, 32, FLOOR_W);
        if (r < 13) memset(base + r * FLOOR_W, 196, FLOOR_W);
    }
    n = basic_int(basic_rnd() * 50.0f) + 50;
    for (i = 1; i <= n; i++) {
        int a = basic_int(basic_rnd() * 7.0f) + 1;
        int b = basic_int(basic_rnd() * 68.0f) + 5;
        int pos = a * 156 - 156 + b;
        int found = 0;
        int c;
        for (c = a - 1; c <= a + 1 && !found; c++) {
            int col;
            if (c <= 0) continue;
            for (col = b - 2; col <= b + 2; col++) {
                int p = (c - 1) * 156 + col;
                if (p >= 1 && p <= FLOOR_BYTES && base[p - 1] == 179) {
                    found = 1;
                    break;
                }
            }
        }
        if (found) continue;
        base[pos - 1] = 179;
        if (a > 1) base[pos - 79] = 194;
        if (a < 7) base[pos + 77] = 193;
    }
    for (r = 2; r <= 12; r += 2) {
        int prev = 1;
        int col;
        for (col = 1; col <= 78; col++) {
            int p = 78 * r + col - 78;
            if (base[p - 1] != 196) {
                int b = basic_int(basic_rnd() * (float)(col - prev - 1)) + prev;
                int at = p - col + b;
                if (at >= 1 && at <= FLOOR_BYTES) base[at - 1] = 11;
                prev = col + 1;
            }
        }
        {
            int b = basic_int(basic_rnd() * (float)(78 - prev - 1)) + prev;
            base[78 * r - 78 + b - 1] = 11;
        }
    }
}

/* proc_1557C. Floor 30 keeps the lair instead of a down stair.
   Floor 29 also gets one of each dragon. */
static void stock_hall(unsigned char *base, int floor, int *sx, int *sy) {
    int extra;
    if (floor >= 30) place_on_space(base, 20, NULL, NULL);
    else place_on_space(base, 25, NULL, NULL);
    if (floor == 29) {
        place_on_space(base, 16, NULL, NULL);
        place_on_space(base, 17, NULL, NULL);
        place_on_space(base, 18, NULL, NULL);
        place_on_space(base, 19, NULL, NULL);
    }
    place_on_space(base, 24, sx, sy);
    place_many(base, basic_int(basic_rnd() * 3.0f), 21);
    place_many(base, basic_int(basic_rnd() * 2.0f), 145);
    extra = basic_int(basic_rnd() * 5.0f) - 3;
    if (extra > 0) place_many(base, extra, 209);
    place_many(base, basic_int(basic_rnd() * 21.0f) + 10, 36);
}

/* proc_15C0B rooms, then proc_1557C stairs, traps, fountains, and treasure. */
static int append_floor(const char *name, int floor) {
    unsigned char rec[4 + FLOOR_BYTES * 2];
    unsigned char *view = rec + 4;
    unsigned char *base = view + FLOOR_BYTES;
    int sx = 2;
    int sy = 2;
    char path[64];
    FILE *f;
    long size;
    if (floor < 1 || floor > 30) return 0;
    snprintf(path, sizeof path, "%s.DUN", name);
    f = fopen(path, "ab");
    if (!f) return 0;
    if (fseek(f, 0, SEEK_END) != 0) {
        fclose(f);
        return 0;
    }
    size = ftell(f);
    if (size != (long)(floor - 1) * (4 + FLOOR_BYTES * 2)) {
        fclose(f);
        return 0;
    }
    memset(rec, 32, sizeof rec);
    if (floor < 30) dig_rooms(base);
    else dig_maze(base);
    stock_hall(base, floor, &sx, &sy);
    put_i16(rec, sx);
    put_i16(rec + 2, sy);
    if (fwrite(rec, 1, sizeof rec, f) != sizeof rec) {
        fclose(f);
        return 0;
    }
    fclose(f);
    return 1;
}

/* proc_245DD. The name without spaces, dots and commas; while that name
   with the extension opens, try it again cut to fit an added 1, 2, 3 ...
   in 8 characters. DOS opens only the first 8 of a longer name, so the
   test here does the same. */
static void file_base(char *out, const char *name, const char *ext) {
    char n[64];
    char f[64];
    char path[16];
    char num[12];
    int i, j = 0, k = 0, room;
    FILE *t;
    for (i = 0; name[i] && j < 63; i++)
        if (name[i] != ' ' && name[i] != '.' && name[i] != ',') n[j++] = name[i];
    n[j] = 0;
    snprintf(f, sizeof f, "%s", n);
    for (;;) {
        snprintf(path, sizeof path, "%.8s.%.3s", f, ext);
        t = fopen(path, "rb");
        if (!t) {
            file_error();
            break;
        }
        fclose(t);
        snprintf(num, sizeof num, "%d", ++k);
        room = 8 - (int)strlen(num);
        if ((int)strlen(n) <= room) snprintf(f, sizeof f, "%s%s", n, num);
        else snprintf(f, sizeof f, "%.*s%s", room, n, num);
    }
    snprintf(out, 9, "%.8s", f);
}

/* proc_23059, on the 10 characters LSET into the record:
   MID$(s, i, 1) = CHR$(ASC(MID$(s, i, 1)) + (128 MOD i) + 128) */
static void encode_password(unsigned char *s) {
    int i;
    for (i = 1; i <= 10; i++) s[i - 1] = (unsigned char)(s[i - 1] + 128 % i + 128);
}

static void read_upper(char *line, int cap) {
    int i;
    read_line(line, cap);
    trim_line(line);
    for (i = 0; line[i]; i++) line[i] = (char)toupper((unsigned char)line[i]);
}

/* y_yes_26031: QB uses menu_choice of (Y)/(N) at an optional LOCATE. */
static int yes_no_at(int row, int col) {
    char line[64];
    for (;;) {
        int key;
        if (live) {
            static const char *const yn[2] = {"(Y) YES", "(N) NO"};
            int r = row, c = col;
            if (c < 1) c = win_left > 0 ? win_left : 1;
            if (r < 1) {
                if (!at_fresh && cur_col > win_left) printf("\n");
                r = cur_row;
            }
            if (r < win_top) r = win_top;
            if (r > win_bot - 1) r = win_bot - 1;
            if (r < 1) r = 1;
            /* Clear leftover chest/pouch lines under the bar. */
            scr_blank(r, c, 81 - c);
            scr_blank(r + 1, c, 81 - c);
            key = menu_choice(yn, 2, 1, c, r, "");
        } else {
            printf("(Y) YES\n(N) NO\n");
            read_upper(line, sizeof line);
            if (feof(stdin)) return 0;
            key = (unsigned char)line[0];
        }
        if (key == 'Y' || key == 'N') return key;
        if (key == 27) return 'N';
        printf("Y or N only, please\n");
        hold_message();
    }
}

static int yes_no(void) {
    return yes_no_at(0, 0);
}

static long user_count(void) {
    FILE *f = fopen("USER.SBS", "rb");
    long n;
    if (!f) return 0;
    fseek(f, 0, SEEK_END);
    n = ftell(f) / 87;
    fclose(f);
    return n;
}

/* proc_009F2: the record with this name, or 0. */
static long find_user(const char *name) {
    FILE *f = fopen("USER.SBS", "rb");
    unsigned char rec[87];
    char have[61];
    long n = 0;
    if (!f) return 0;
    while (fread(rec, 1, 87, f) == 87) {
        n++;
        copy_field(have, 61, rec, 60);
        if (strcmp(have, name) == 0) {
            fclose(f);
            return n;
        }
    }
    fclose(f);
    return 0;
}

/* createuser_0AA99. 0 means the program ends. */
static int create_user(void) {
    char name[64];
    char pass[64];
    char again[64];
    unsigned char check[10];
    char base[9];
    print_sb_key("CREATEUSER");
    for (;;) {
        printf("PLAYER NAME: ");
        read_upper(name, sizeof name);
        if (!name[0] || name[0] == 27 || feof(stdin)) {
            exit_screen();
            return 0;
        }
        name[60] = 0;
        if (user_count() > 0 && find_user(name)) {
            printf("This player already exists\n");
            continue;
        }
        break;
    }
    memset(user_rec, 0, sizeof user_rec);
    pad_field(user_rec, 60, name);
    file_base(base, name, "SBC");
    pad_field(user_rec + 70, 8, base);
    store_i16(user_rec + 78, 1);
    store_i16(user_rec + 80, 1);
    user_rec[86] = 7;
    user_no = user_count() + 1;
    for (;;) {
        printf("What is the player's password?\n");
        read_upper(pass, sizeof pass);
        printf("Please reenter your password for verification\n");
        read_upper(again, sizeof again);
        pass[10] = again[10] = 0;
        pad_field(user_rec + 60, 10, pass);
        pad_field(check, 10, again);
        if (memcmp(user_rec + 60, check, 10) == 0) break;
        printf("Your passwords did not match up.  Please reenter it.\n");
    }
    encode_password(user_rec + 60);
    printf("FINAL VERIFICATION: Is the above information correct? ");
    if (yes_no() != 'Y') {
        exit_screen();
        return 0;
    }
    defaults_menu();
    show_help("INTRODUCTION");
    return 1;
}

/* getuser_0DA5B. 0 means the program ends. */
static int get_user(const unsigned char *sys) {
    char line[64];
    unsigned char pass[10];
    long n = user_count();
    long max = rec_i16(sys + 1);
    long i, pick;
    int answer;
    print_sb_key("GETUSER");
    printf("Have you played SB at this installation before? ");
    answer = yes_no();
    if (!answer) return 0;
    if (answer == 'N' || n == 0) {
        if (max > n || max <= 0) return create_user();
        print_sb_key("NOMOREUSERS");
        hold_message();
        exit_screen();
        return 0;
    }
    for (;;) {
        printf("Who are you?\n");
        for (i = 1; i <= n; i++) {
            char who[61];
            if (!get_user_record(i)) break;
            copy_field(who, 61, user_rec, 60);
            printf("  %ld  %s\n", i, who);
        }
        read_upper(line, sizeof line);
        if (line[0] == 'Q' || line[0] == 27) {
            exit_screen();
            return 0;
        }
        pick = atol(line);
        if (pick >= 1 && pick <= n && get_user_record(pick)) break;
    }
    copy_field(line, 61, user_rec, 60);
    printf("You are %s (at least according to you!)\n", line);
    printf("What is the your password?\n");
    read_upper(line, sizeof line);
    line[10] = 0;
    pad_field(pass, 10, line);
    encode_password(pass);
    if (memcmp(pass, user_rec + 60, 10) != 0 &&
        (memcmp(pass, sys + 11, 10) != 0 || memcmp(sys + 11, "          ", 10) == 0)) {
        printf("That was an incorrect password! The program is ending. Hit any key to continue\n");
        read_dungeon_key();
        exit_screen();
        return 0;
    }
    return 1;
}

static int put_system(const unsigned char *sys) {
    FILE *f = fopen("SYSTEM.SBS", "wb");
    if (!f) return 0;
    fwrite(sys, 1, 21, f);
    fclose(f);
    return 1;
}

/* maximum_users_allowed_186AA: the SYSTEM SCREEN form, edited once, then
   "Is this the correct system setup?"; anything but Y leaves SB. Blank
   numbers are 0. The password is LSET into 10 and encoded, so a blank one
   is stored as encoded spaces, not as SPACE$(10). */
static int system_screen(unsigned char *sys) {
    static const struct {
        const char *label;
        const char *help;
        int max;
    } field[5] = {
        {"MAXIMUM USERS ALLOWED:", "The maximum number of users SB can allocate (Blank or zero for unlimited)", 999},
        {"MAX (LIVE) CHARACTERS:", "The number of live characters each user can have (Blank or zero for unlimited)", 99},
        {"STARTING BLOCKED HOUR:", "The starting hour that SB is blocked on this system (Blank or zero for none)", 23},
        {"HOURS BLOCKED:", "The number of hours you wish to block out (Blank or zero for none)", 23},
        {"MAX MINUTES OF PLAY:", "The number of minutes a character can play SB (Blank or zero for unlimited)", 1440},
    };
    char line[80];
    int value[5];
    int i, j;
    printf("\n%33s%s\n\n", "", "SYSTEM SCREEN");
    for (i = 0; i < 5; i++) {
        for (;;) {
            printf("%s\n%s ", field[i].help, field[i].label);
            read_upper(line, sizeof line);
            if (feof(stdin)) {
                exit_screen();
                return 0;
            }
            for (j = 0; line[j] >= '0' && line[j] <= '9'; j++) {}
            value[i] = atoi(line);
            if (!line[j] && j <= 4 && value[i] <= field[i].max) break;
            printf("NUMBER MUST BE BETWEEN  0 AND  %d\n", field[i].max);
        }
    }
    printf("Enter the SB ADMINISTRATOR'S PASSWORD (Blank for none)\nSB SYSTEM PASSWORD: ");
    read_upper(line, sizeof line);
    line[10] = 0;
    printf("Is this the correct system setup? ");
    if (yes_no() != 'Y') {
        exit_screen();
        return 0;
    }
    for (i = 0; i < 5; i++) store_i16(sys + 1 + 2 * i, value[i]);
    pad_field(sys + 11, 10, line);
    encode_password(sys + 11);
    return put_system(sys);
}

/* setup_0F632, when SYSTEM.SBS is empty: the system type goes in byte 0. */
static int system_setup(unsigned char *sys) {
    char line[64];
    memset(sys, 0, 21);
    show_help("SETUP");
    for (;;) {
        printf("\n%29s%s\n\n", "", "SB SYSTEM SETUP");
        printf("Enter your type of system\n");
        printf("(S) Single-user (for one computer and no password protection)\n");
        printf("(M) Multi-user (for networks or single systems needing password protection)\n");
        printf("(Q or ESC) Leave SB\n");
        read_upper(line, sizeof line);
        sys[0] = (unsigned char)line[0];
        if (line[0] == 'S') {
            printf("You have elected to install SB in the single-user mode.\n");
            printf("Is this what you intended to do? ");
            if (yes_no() != 'Y') {
                exit_screen();
                return 0;
            }
            return put_system(sys);
        }
        if (line[0] == 'Q' || line[0] == 27 || feof(stdin)) {
            exit_screen();
            return 0;
        }
        if (line[0] == 'M') break;
        printf("B, M, S, Q, or ESC only, please\n");
    }
    show_help("MULTIUSERINFO");
    return system_screen(sys);
}

/* 0E540-0E6E7. A time limit ends the session that many minutes from now.
   Blocked hours run from the starting hour for so many hours; the test is
   the original's, whose middle "now before the end" term also blocks every
   minute from midnight up to the end. Outside them, the session also ends
   when the next block starts. */
static int hours_open(const unsigned char *sys) {
    int now = minutes_now();
    int start = rec_i16(sys + 5);
    int hours = rec_i16(sys + 7);
    int limit = rec_i16(sys + 9);
    float s, e;
    if (limit > 0) session_end = limit + now;
    if (start <= 0) return 1;
    s = (float)(60 * start);
    e = (float)(hours + start);
    if (e > 23.0f) e += -24.0f;
    e *= 60.0f;
    if ((s < e && now >= s && now < e) || now < e || (s > e && now >= s)) {
        print_sb_key("HOURSBLOCKED");
        hold_message();
        exit_screen();
        return 0;
    }
    if ((float)now > s) s += 1440.0f;
    if (session_end == 0 || (float)session_end > s) session_end = (int)lrintf(s);
    return 1;
}

/* The end of the startup at 0E6EA. SYSTEM.SBS byte 0 is 'S' for a single
   user ("Single User", CHARACTR); otherwise getuser picks the USER.SBS
   record. The party file is RTRIM$ of +70 with .SBC, and RTRIM$ of +70
   with .SBL is opened LOCK READ WRITE as #16 until the exit screen. */
static int login(void) {
    unsigned char *sys = sys_rec;
    char base[9];
    FILE *f = fopen("SYSTEM.SBS", "rb");
    int single;
    size_t got = 0;
    memset(sys, 0, sizeof sys_rec);
    if (f) {
        got = fread(sys, 1, sizeof sys_rec, f);
        fclose(f);
    }
    if (got == 0 && !system_setup(sys)) return 0;
    if (!hours_open(sys)) return 0;
    single = sys[0] == 'S';
    if (single) {
        memset(user_rec, 0, sizeof user_rec);
        pad_field(user_rec, 60, "Single User");
        pad_field(user_rec + 70, 8, "CHARACTR");
        user_no = 1;
    } else if (!get_user(sys)) {
        return 0;
    }
    if (user_count() == 0) {
        put_user();
        if (single) {
            defaults_menu();
            show_help("INTRODUCTION");
        }
    } else if (single) {
        get_user_record(1);
    }
    apply_defaults();
    copy_field(base, 9, user_rec + 70, 8);
    snprintf(party_lock_path, sizeof party_lock_path, "%s.SBL", base);
    snprintf(party_path, sizeof party_path, "%s.SBC", base);
    party_lock = take_lock(party_lock_path);
    f = fopen(party_path, "ab");
    if (f) fclose(f);
    return 1;
}

static int append_character(const unsigned char *rec) {
    FILE *f;
    if (!party_path[0]) return 0;
    f = fopen(party_path, "ab");
    if (!f) return 0;
    if (fwrite(rec, 1, CHAR_RECORD, f) != CHAR_RECORD) {
        fclose(f);
        return 0;
    }
    fclose(f);
    return 1;
}

static void create_character(void) {
    char line[64];
    char name[21];
    char file[9];
    int base[6];
    int prev[6];
    int stat[6];
    int race = -1;
    int klass = -1;
    float scale;
    int hp;
    int gold;
    unsigned char rec[CHAR_RECORD];
    char inv_path[64];
    FILE *inv;
    static const char *race_name[] = {"HUMAN", "ELF", "TROLL", "DWARF", "GNOME"};
    static const char *class_name[] = {"FIGHTER", "MAGE", "BARD"};
    {
        /* inv_016B3: [0xA7D] max live characters against var_0131, LOF(3) / 166 */
        int max = rec_i16(sys_rec + 3);
        FILE *party = fopen(party_path, "rb");
        long have = 0;
        if (party) {
            fseek(party, 0, SEEK_END);
            have = ftell(party) / CHAR_RECORD;
            fclose(party);
        }
        if (max <= have && max != 0) {
            print_sb_key("NOMORECHARS");
            hold_message();
            return;
        }
    }
    printf("\nCREATE A CHARACTER\n");
    for (;;) {
        int i;
        int ok = 1;
        printf("What is the name of the character that you want to create?\n");
        read_line(line, sizeof line);
        trim_line(line);
        if (!line[0]) {
            printf("You must enter a character name.\n");
            continue;
        }
        if (strlen(line) > 20) {
            printf("You must enter a character name.\n");
            continue;
        }
        for (i = 0; line[i]; i++) {
            if (line[i] >= 'a' && line[i] <= 'z') line[i] = (char)(line[i] - 'a' + 'A');
            if (line[i] < 'A' || line[i] > 'Z') ok = 0;
        }
        if (!ok) {
            printf("You must enter a character name.\n");
            continue;
        }
        snprintf(name, sizeof name, "%s", line);
        break;
    }
    roll_stats(base);
    memcpy(prev, base, sizeof prev);
    for (;;) {
        show_roll(base);
        {
            static const char *const roll_item[5] = {"(R) ROLL AGAIN", "(B) BACK 1 ROLL", "(S) SAVE ROLL", "(Q) QUIT", "(H) HELP"};
            int ch = menu_choice(roll_item, 5, 1, 1, 22, "");
            if (ch == 'Q' || ch == 27) return;
            if (ch == 'H') { show_help("HELPSTATS"); continue; }
            if (ch == 'R') { memcpy(prev, base, sizeof prev); roll_stats(base); continue; }
            if (ch == 'B') { memcpy(base, prev, sizeof base); continue; }
            if (ch == 'S') break;
        }
    }
    printf("What race do you wish to belong to?\n");
    for (;;) {
        {
            static const char *const race_item[7] = {"(M) - HUMAN", "(E) - ELF", "(T) - TROLL", "(D) - DWARF", "(G) - GNOME", "(H) - HELP", "(Q) - QUIT"};
            int ch = menu_choice(race_item, 7, 1, 15, 5, "  ");
            if (ch == 'Q' || ch == 27) return;
            if (ch == 'H') { show_help("HELPRACE"); continue; }
            if (ch == 'M') race = 0;
            else if (ch == 'E') race = 1;
            else if (ch == 'T') race = 2;
            else if (ch == 'D') race = 3;
            else if (ch == 'G') race = 4;
            else { printf("What was that again?\n"); continue; }
        }
        break;
    }
    memcpy(stat, base, sizeof stat);
    apply_race(stat, race);
    printf("What class do you wish to belong to?\n");
    for (;;) {
        {
            static const char *const class_item[5] = {"(F) - FIGHTER", "(M) - MAGIC USER", "(B) - BARD", "(H) - HELP", "(Q) - QUIT"};
            int ch = menu_choice(class_item, 5, 1, 32, 16, "  ");
            if (ch == 'Q' || ch == 27) return;
            if (ch == 'H') { show_help("HELPCLASS"); continue; }
            if (ch == 'F') klass = 0;
            else if (ch == 'M') klass = 1;
            else if (ch == 'B') klass = 2;
            else { printf("What was that again?\n"); continue; }
        }
        break;
    }
    scale = klass == 1 ? 0.75f : klass == 2 ? 1.0f : 1.25f;
    hp = basic_int((float)stat[2] * scale);
    if (hp < 1) hp = 1;
    gold = 15 * stat[4];
    printf("%s %s   level 1\n", race_name[race], class_name[klass]);
    show_roll(stat);
    printf("Hitpoints %d/%d\n", hp, hp);
    printf("Gold %d\n", gold);
    printf("Do you wish to save this character?\n");
    if (!yes_no()) return;
    memset(rec, 0, sizeof rec);
    pad_field(rec, 20, name);
    file_base(file, name, "INV");
    pad_field(rec + 20, 8, file);
    pad_field(rec + 28, 7, class_name[klass]);
    pad_field(rec + 35, 5, race_name[race]);
    pad_field(rec + 146, 20, "");
    put_i16(rec + 40, 1);
    put_i16(rec + 42, hp);
    put_i16(rec + 44, hp);
    put_i16(rec + 46, stat[0]);
    put_i16(rec + 48, stat[1]);
    put_i16(rec + 50, stat[2]);
    put_i16(rec + 52, stat[3]);
    put_i16(rec + 54, stat[4]);
    put_i16(rec + 56, stat[5]);
    put_i32(rec + 100, 0);
    put_i32(rec + 104, gold);
    if (!append_character(rec)) return;
    snprintf(inv_path, sizeof inv_path, "%s.INV", file);
    inv = fopen(inv_path, "wb");
    if (inv) fclose(inv);
}

/* experience_level_menu_0D47B */
static void experience_menu(void) {
    for (;;) {
        const char *cls;
        double base;
        long value;
        int i;
        static const char *const item[4] = {"(F) - FIGHTER", "(M) - MAGE", "(B) - BARD", "(Q) - QUIT"};
        scr_clear(1, 24);
        printf("\n");
        at_print(1, 29, 15, 0, "EXPERIENCE LEVEL MENU");
        at_print(3, 10, 11, 0, "What class do you wish to find the experience for?");
        {
        int ch = menu_choice(item, 4, 1, 15, 5, "  ");
        switch (ch) {
        case 'f': case 'F': cls = "FIGHTER"; base = 2500.0; break;
        case 'm': case 'M': cls = "MAGE"; base = 3000.0; break;
        case 'b': case 'B': cls = "BARD"; base = 2800.0; break;
        case 'q': case 'Q': case 27: return;
        default:
            if (feof(stdin)) return;
            printf("INVALID CLASS. PLEASE ENTER A VALID ONE.\n");
            hold_message();
            continue;
        }
        scr_clear(1, 24);
        printf("\n");
        scr_color(15, 0);
        scr_at(1, 10);
        printf("EXPERIENCE NEEDED FOR EACH LEVEL FOR A %s\n", cls);
        scr_color(11, 0);
        scr_at(3, 1);
        printf("          LEVEL  1 -         0\n");
        value = lrint(base);
        printf("          LEVEL  2 - %9ld\n", value);
        for (i = 3; i <= 15; i++) {
            if (value > 120000L) {
                value += 120000L;
            } else {
                value = lrint(floor(pow(2.0, (double)(i - 1) * (double)0.85f) * base));
                value = lrint((double)(value + 49) / 100.0) * 100;
            }
            printf("          LEVEL %2d - %9ld\n", i, value);
        }
        if (live) scr_at(19, 10);
        scr_color(15, 0);
        printf("LEVEL 15 IS THE HIGHEST YOU CAN GO\n");
        scr_color(7, 0);
        hold_message();
        }
    }
}

/* dun_0E905. The killer goes in at +146 and, with any experience, the
   Hall of Fame is rewritten. RTRIM$ of the file name at +20 gives the
   .DUN and .INV to delete, and every record without that file name is
   copied through KILLCHAR.SBC, which then replaces the party file. */
static void kill_record(const char *party, unsigned char *me, const char *killer) {
    unsigned char rec[CHAR_RECORD];
    char base[9];
    char path[32];
    size_t n = strlen(killer);
    FILE *in;
    FILE *out;
    HANDLE lock = take_lock("KILLLOCK.SBL");
    memset(me + 146, ' ', 20);
    memcpy(me + 146, killer, n < 20 ? n : 20);
    copy_field(base, 9, me + 20, 8);
    snprintf(path, sizeof path, "%s.DUN", base);
    remove(path);
    snprintf(path, sizeof path, "%s.INV", base);
    remove(path);
    if (rec_i32(me + 100) != 0) write_hall(me);
    in = fopen(party, "rb");
    out = in ? fopen("KILLCHAR.SBC", "wb") : NULL;
    if (out) {
        while (fread(rec, 1, CHAR_RECORD, in) == CHAR_RECORD)
            if (memcmp(rec + 20, me + 20, 8) != 0) fwrite(rec, 1, CHAR_RECORD, out);
        fclose(out);
        fclose(in);
        remove(party);
        rename("KILLCHAR.SBC", party);
    } else if (in) {
        fclose(in);
    }
    drop_lock(lock, "KILLLOCK.SBL");
}

/* (K) KILL AN EXISTING CHARACTER: choice("kill"), then dun_0E905("player"). */
static void kill_character(void) {
    Hero heroes[MAX_HEROES];
    unsigned char rec[CHAR_RECORD];
    int pick = choose_character(heroes, "kill");
    if (!pick) return;
    if (!read_hero_record(&heroes[pick - 1], rec)) return;
    kill_record(heroes[pick - 1].save_path, rec, "player");
}

static void maintenance_menu(const Monster *monsters, int count) {
    static const char *const maint_item[11] = {
        "(U) USE AN EXISTING CHARACTER", "(C) CREATE A NEW CHARACTER", "(L) LIST ALL CHARACTERS",
        "(A) SHOW SOMEONE'S ATTRIBUTES/INVENTORY", "(F) FIND THE EXPERIENCE FOR A LEVEL",
        "(K) KILL AN EXISTING CHARACTER", "(D) CHANGE SYSTEM DEFAULTS", "(H) HELP", "(I) INTRODUCTION",
        "(P) PRINT THE REGISTRATION FORM", "(Q or ESC) QUIT THE GAME"};
    if (!login()) return;
    printf("SORCERER'S BANE\n");
    for (;;) {
        if (time_up) {
            print_sb_key("TIMESUP");
            hold_message();
            exit_screen();
            return;
        }
        scr_clear(1, 24);
        printf("\n");
        at_print(1, 28, 15, 0, "MAINTENANCE MENU");
        scr_color(11, 0);
        scr_at(3, 1);
        printf("You need to pick a character to run in the game.  This character can already\n");
        printf("exist or can be created.  Please choose what you wish to do:\n");
        scr_color(7, 0);
        {
        int ch = menu_choice(maint_item, 11, 1, 22, 6, "  ");
        switch (ch) {
        case 'U': use_character(monsters, count); break;
        case 'L': list_characters(); break;
        case 'A': {
            Hero heroes[MAX_HEROES];
            char pick_line[64];
            int heroes_n = load_heroes(heroes, MAX_HEROES);
            int pick;
            int hi;
            scr_clear(1, 24);
            printf("\n");
            at_print(1, 30, 15, 0, "CHARACTER ATTRIBUTES");
            scr_at(3, 1);
            if (!heroes_n) {
                printf("There are no characters created.\n");
                break;
            }
            for (hi = 0; hi < heroes_n; hi++)
                printf("  %d  %s\n", hi + 1, heroes[hi].name);
            read_line(pick_line, sizeof pick_line);
            pick = atoi(pick_line);
            if (pick >= 1 && pick <= heroes_n) show_attributes(&heroes[pick - 1], heroes[pick - 1].floor);
            break;
        }
        case 'C': create_character(); break;
        case 'H': show_help("HELPMAIN"); break;
        case 'I': show_help("INTRODUCTION"); break;
        case 'F': experience_menu(); break;
        case 'K': kill_character(); break;
        case 'Q': case 27: exit_screen(); return;
        case 'D': defaults_menu(); break;
        case 'P': print_registration(); break;
        default:
            printf("That was not a valid choice!  Please re-enter!\n");
            break;
        }
        }
    }
}

static long file_records(const char *path, long len) {
    FILE *f = fopen(path, "rb");
    long size;
    if (!f) return 0;
    fseek(f, 0, SEEK_END);
    size = ftell(f);
    fclose(f);
    return size / len;
}

/* itemfile_dat_0DF9B: an empty data file ends the game through the exit screen. */
static int data_files_present(void) {
    static const struct { const char *path; long len; const char *msg; } need[] = {
        {"ITEMFILE.DAT", 44, "NO ITEM FILE (ITEMFILE.DAT) PRESENT. GAME TERMINATED"},
        {"MONSTER.DAT", RECORD, "NO MONSTER FILE (MONSTER.DAT) PRESENT. GAME TERMINATED"},
        {"SPELLS.DAT", 66, "NO SPELLS FILE (SPELLS.DAT) PRESENT. GAME TERMINATED"},
        {"SB.DAT", 1, "NO TEXT FILE (SB.DAT) PRESENT. GAME TERMINATED"},
    };
    int i;
    for (i = 0; i < 4; i++) {
        if (file_records(need[i].path, need[i].len) > 0) continue;
        printf("%s\n", need[i].msg);
        hold_message();
        exit_screen();
        return 0;
    }
    return 1;
}

int main(void) {
    Monster monsters[MAX_MONSTERS];
    int count;
    if (!_isatty(_fileno(stdout))) setvbuf(stdout, NULL, _IONBF, 0);
    live_start();
    if (!data_files_present()) return 0;
    count = load_monsters("MONSTER.DAT", monsters, MAX_MONSTERS);
    find_wish_pet(monsters, count);
    maintenance_menu(monsters, count);
    return 0;
}
