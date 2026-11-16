' Sorcerer's Bane
' Lifted from SB.EXE (compiled Microsoft BASIC).
' This is not the original source. Names of procedures are inferred.
' OPEN/GET/CLOSE are translated. Other calls keep the runtime address.
' local_N and arg_N are stack slots. var_NNNN is near data.
' Procedures: 150. String literals: 1416.

' ---- index ----
' cast_a_spell_00423  ' CAST A SPELL | You try to cast a spell, but | it has no effect. If only you
' loss_of_str_007A9  ' Your strength is gone. You die! | LOSS OF STR | Youve gone brain dead. You die!
' proc_009F2
' proc_00A98
' enter_00E6E  ' ENTER | ESCAPE | HELPCLERIC
' then_asks_for_a_donation_01266  ' He calmly diagnoses your problems with s | then asks for a donation. | How much would you like to give
' lerend_014BF  ' Lerend | ACLERICLEREND | ACLERICWANDERER
' inv_016B3  ' NOMORECHARS | CREATE A CHARACTER | What is the name of the character that y
' fighting_02AD5  ' FIGHTING | PROTECTION | IDENTIFICATION
' character_menu_03522  ' CHARACTER MENU | A young, scruffy-looking man appears bef | his cloths are wrinkled and he appears t
' maintenance_menu_0392D  ' MAINTENANCE MENU | You need to pick a character to run in t | exist or can be created.  Please choose 
' fortunately_you_avoid_it_03BA4  ' An Easter Island head falls from the | sky. While admiring its beauty, you | cant help thinking how uncomfortable
' proc_04D9D
' enter_04E23  ' ENTER | ESCAPE | The monster was carrying a pouch!
' character_choice_menu_05BB4  ' CHARACTER CHOICE MENU | There are no characters created.  | Please create one first.
' inventory_management_05F8E  ' INVENTORY MANAGEMENT | You have no inventory | DISPLAY
' proc_0670C
' itemfile_dat_067B5  ' ITEMFILE.DAT
' wield_0684E  ' You are already wearing this item  | This item needs to be used in the dungeo | wield
' item_menu_07841  ' ITEM MENU | What do you wish to do with the  | (W) Wear the 
' lerend_07BA0  '  cannot visit the cleric until he/she le | Lerend |  cannot visit the shop until he/she leav
' proc_07F08
' proc_0800C
' inv_080AB  ' .INV
' itemfile_dat_0816C  ' ITEMFILE.DAT
' spells_dat_081BA  ' SPELLS.DAT
' remove_08227  ' REMOVE | The item has been removed.  Hit any key 
' enter_08320  ' ENTER | ESCAPE | HELPSHOP
' itemfile_dat_08828  ' ITEMFILE.DAT |  -  | Which item would you like? she asks nice
' in_gold_to_08D9C  ' You feel like a fish in a fishbowl as sh | She then gives you another warm smile an | charge twice this much, but for you it w
' kiera_090AD  ' Kiera | ASHOPKIERA | ASHOPTRAVELER
' text_092A2  '  -  | You have no non-cursed identified items  | Which item do you want to sell? she asks
' cast_a_spell_096A0  ' CAST A SPELL | Which spell level do you wish to cast? | ENTER
' don_t_cast_a_spell_09A0F  ' SPELL NUMBERS FOR SPELL LEVEL  | Which spell do you wish to cast? | Dont cast a spell
' proc_09BED
' inv_09C77  ' .INV | FILES ARE IN USE.  COME BACK LATER
' proc_09E62
' fighter_09F8B  ' FIGHTER | BARD    | MAGE   
' proc_0A5C4
' proc_0A9DA
' proc_0AA39
' createuser_0AA99  ' CREATEUSER | PLAYER NAME:  | SBC
' name_0AF8B  ' NAME  -  | STR -  | RACE/CLASS - 
' magic_resist_0B7DE  ' Magic resist  -  | To hit       -  | Magic tools   - 
' hallfame_dat_0BE69  ' HALLLOCK.SBL | HALLFAME.DAT | HALLFAME.TXT
' proc_0C32E
' proc_0C3FC
' mage_0C4A1  ' MAGE    | BARD    | You put all of your staffs together to
' proc_0D0CF
' wood_software_development_0D2B8  ' Standard SB Registration with the Game M | Extended SB Registration with GM, BASWOO | WOOD SOFTWARE DEVELOPMENT
' experience_level_menu_0D47B  ' EXPERIENCE LEVEL MENU | What class do you wish to find the exper | (F) - FIGHTER
' getuser_0DA5B  ' GETUSER | Have you played SB at this installation  | NOMOREUSERS
' itemfile_dat_0DF9B  ' weapon | instrument | helmet
' dun_0E905  ' KILLLOCK.SBL | .DUN | .INV
' wood_software_development_0EAE8  ' Standard SB Registration with GAME MASTE | Extended SB Registration with GAME MASTE |     BASWOOD BASIC tools, source code, an
' monster_dat_0ED1E  ' MONSTER.DAT
' charactr_0F56E  ' CHARACTR
' setup_0F632  ' SETUP | SB SYSTEM SETUP | Enter your type of system
' character_attributes_0F9E0  ' CHARACTER ATTRIBUTES | Name  -  | Level      - 
' sing_a_song_108A6  ' SING A SONG | BARD    | You start singing, but it
' proc_10DF0
' hallfame_dat_10E6E  ' HALLLOCK.SBL | HALLFAME.DAT | WRITHALL.SBT
' proc_127B6
' stay_12801  ' STAY | (M)enu | (Q)uit
' fields_like_they_used_to_12B8D  ' That was certainly a waste of magic |  The monster breaks through your force | field!  (I guess they dont make force
' lips_1388C  ' You see a fountain before you. Do you | wish to drink from it? (Y or N) | The water glowed when it hit your
' deck_13DE3  ' DECK | CARD0 | CARD1
' of_spades_1464F  '  OF SPADES |  OF DIAMONDS |  OF CLUBS
' you_can_see_again_147F8  ' You can see again
' proc_1557C
' proc_15774
' proc_15C0B
' proc_1643A
' resurrection_16562  ' RESURRECTION | RESURRNOGOLD | RESURRNOCON
' proc_166EF  ' Youve escaped the dungeon! Have fun in t
' menu_167F6  ' MENU | ESCAPE | You start running.
' r_toggle_run_mode_on_off_16F5D  ' (R) TOGGLE RUN MODE ON/OFF | (X) DISPLAY EXTENDED ATTRIBUTES | (H) HELP
' experience_170C7  ' EXPERIENCE -  | DAMAGING MAGIC ITEM | You see the remnants of an
' dun_17C4C  ' .DUN
' down_17D7E  ' You have found some stairs going | up | down
' sorcerer_s_bane_17F3F  ' SORCERERS BANE
' hitpoints_17FE5  ' You see a throne before you. Do you | wish to sit on it? (Y or N) | A Styxian haze surrounds the chair!
' maximum_users_allowed_186AA  ' MAXIMUM USERS ALLOWED: | The maximum number of users SB can alloc | MAX (LIVE) CHARACTERS:
' monster_dat_19049  ' ALLYN | MAKE A WISH | You picture what you want in your minds 
' dun_1A58C  ' .DUN
' character_monster_match_up_1A696  ' CHARACTER/MONSTER MATCH UP | Throughout your earlier travels and conv | characteristics of the being that now fa
' proc_1B043
' dragonslair_1B091  ' DRAGONSLAIR | RED DRAGON | A red dragon is the weakest of all drago
' she_1B3FD  ' It | He | She
' proc_1C140  ' The monster swipes at your DREAMWOLF | As the blades passes through the wolf, t | cant phase, this must be an illusion! As
' you_have_been_damaged_for_1C2E6  '  was really a SPORE CLOUD.  It exploded  | You have been damaged for  |  hitpoints!
' proc_1C494
' name_1C5C5  ' NAME -  | HITPOINTS -  | MONSTER YOU ARE CURRENTLY FIGHTING - 
' f_fight_1C730  ' (F) Fight | (K) Kill | (T) Talk
' you_hit_1C8BF  ' The monster phases as you hit  | !! | As you miss, you realize that you need a
' hit_your_1CC25  '  hit your  |  for  |  hitpoints!
' round_1CE5C  ' Round 
' you_cannot_get_away_1CF1A  ' Your boots wont let you run! | You run as fast as your feet will take y | Come back, you sniveling coward! You wil
' proc_1D0B6
' proc_1D0EC
' proc_1D11B  ' You pick up the red quarterstaff | You pick up the black quarterstaff | You pick up the white quarterstaff
' you_ve_killed_1D25D  ' Having enough, the monster teleports awa | Youve killed  | . 
' stabbed_1D361  '  stabbed |  tail-stung |  bit
' golddragon_1DD25  ' GOLDDRAGON |  was impressed with your courage, tact,  | has granted,
' proc_1E1BB  ' This creature will sleep for a while! | This creature starts to awaken! | This creature is still sleeping!
' you_are_shocked_for_1E3C3  ' Lightning shoots our from its STAFF! | Somehow, the magical bolt gets through a | You are shocked for 
' this_monster_is_diseased_1F18C  ' This monster is diseased! | Just thinking about this filthy monster  | You dont feel so good!
' the_monster_phases_as_your_1FFAD  ' The monster phases as your  |  hits  | !!
' is_voided_out_202C6  ' The monster slowly starts fading away. T | an illusion after all.  (It sure looked  | The monster writhes in pain as the magic
' sorcererslair_204A2  ' SORCERERSLAIR | SORCERERNOSTAFF | SORCERERAGAIN
' then_takes_a_208DD  ' I come in peace! you shout to the monste | creature chuckles.  The bleeding heart w |  then takes a
' proc_20E6B
' proc_21194
' proc_21210
' no_212EF  ' NO  | YES | DEFAULTS IN 
' print_more_21DB9
' locate_print_21DEA
' sb_dat_21E13  ' SB.DAT |    | not found.  Hit any key to continue
' proc_22430
' proc_2255D
' menu_choice_225B8  ' Unknown key was hit
' proc_23059
' proc_2311E
' proc_231C8
' invalid_key_was_hit_23200  ' Invalid key was hit
' number_must_be_between_23A06  ' NUMBER MUST BE BETWEEN  |  AND 
' proc_24259
' hit_any_key_to_continue_2434A  ' Hit any key to continue
' proc_243D9  '   
' proc_245DD
' proc_2482E
' left_mouse_button_is_24897  ' LEFT MOUSE BUTTON IS  | RIGHT MOUSE BUTTON IS  | ; 
' proc_249CF
' proc_24B05
' proc_24C43
' proc_24CA6
' mnt120_24D5C  ' MNT120 | MBL16O1G#O2C#EG#C#EG#AEG#AO3EO2G#O3C#E | MBL16O3G#C#EF#O4C#O3EG#O4C#EO3G#O4C#EL8G
' proc_2515F
' proc_251B9
' color_25283
' proc_253B3
' doshareware_25421  ' DOSHAREWARE | end  |  for 
' proc_25C7F
' proc_25CF7
' proc_25D42
' 00_25D94  ' ,00 | ,0
' proc_25F90
' proc_25FE5
' proc_2600C
' y_yes_26031  ' (Y) YES | (N) NO | Y or N only, please

SUB cast_a_spell_00423  ' image &H423, locals 104
  ' strings: CAST A SPELL | You try to cast a spell, but | it has no effect. If only you | were a mage! | You lost concentration! Your | spell failed!
    cx = 104
    CALL frame_enter()
    CALL proc_0AA39()
    local_C = 15
    local_E = 0
    CALL color_25283(addr(local_C), addr(local_E))
    local_10 = 2
    local_12 = 54
    local_16 = "CAST A SPELL"
    local_18 = 0
    CALL locate_print_21DEA(addr(local_10), addr(local_12), addr(local_16), addr(local_18))
    CALL free_string(addr(local_16))
    IF var_00A2 < 1 THEN GOTO label_00487
    GOTO label_00543
  label_00487:
    local_1A = 11
    local_1C = 0
    CALL color_25283(addr(local_1A), addr(local_1C))
    local_1E = 4
    local_20 = 42
    local_24 = "You try to cast a spell, but"
    local_26 = 0
    CALL locate_print_21DEA(addr(local_1E), addr(local_20), addr(local_24), addr(local_26))
    CALL free_string(addr(local_24))
    local_28 = 5
    local_2A = 42
    local_2E = "it has no effect. If only you"
    local_30 = 0
    CALL locate_print_21DEA(addr(local_28), addr(local_2A), addr(local_2E), addr(local_30))
    CALL free_string(addr(local_2E))
    local_32 = 6
    local_34 = 42
    local_38 = "were a mage!"
    local_3A = 0
    CALL locate_print_21DEA(addr(local_32), addr(local_34), addr(local_38), addr(local_3A))
    CALL free_string(addr(local_38))
    GOTO label_00783
  label_00543:
    CALL cast_a_spell_096A0()
    local_3E = ax
    local_42 = addr(local_3E)
    CALL proc_0AA39()
    CALL RT_2732_6130(addr(local_42), &H16D0)
    ax = 0
    IF var_00A2 == 1 THEN GOTO label_00571
    ax = ax - 1
  label_00571:
    bx = ax
    ax = 74
    local_48 = bx
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_42))
    ax = 0
    IF var_00A2 == 1 THEN GOTO label_00594
    ax = ax - 1
  label_00594:
    ' and ax,[bp-0x48]
    ' and ax,ax
    IF var_00A2 <> 1 THEN GOTO label_0059E
    GOTO label_00783
  label_0059E:
    CALL don_t_cast_a_spell_09A0F()
    local_46 = ax
    local_42 = addr(local_46)
    CALL proc_0AA39()
    CALL RT_2732_6130(addr(local_42), &H16D0)
    ax = 0
    IF var_00A2 == 1 THEN GOTO label_005CC
    ax = ax - 1
  label_005CC:
    bx = ax
    ax = 74
    local_4A = bx
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_42))
    ax = 0
    IF var_00A2 == 1 THEN GOTO label_005EF
    ax = ax - 1
  label_005EF:
    ' and ax,[bp-0x4a]
    ' and ax,ax
    IF var_00A2 <> 1 THEN GOTO label_005F9
    GOTO label_00783
  label_005F9:
    si = var_0BC0
    si = si * 2
    var_1584[si] = var_1584[si] - 1
    local_4C = si
    CALL spells_dat_081BA()
    local_4E = 2
    local_50 = 42
    ax = &HBAC
    CALL RT_2732_63DF(DS, &HBAC, 18)
    local_54 = ax
    local_56 = 0
    CALL locate_print_21DEA(addr(local_4E), addr(local_50), addr(local_54), addr(local_56))
    ax = addr(local_54)
    PUSH DS
    PUSH addr(local_54)
    ' xor ax,ax
    ax = &HBAC
    CALL RT_2732_6404(addr(local_54), DS, &HBAC, 18)
    CALL free_string(addr(local_54))
    ax = var_00A2
    CALL RT_2F00_0558()
    CALL RT_2732_79CA()
    si = ax
    ' float_D8
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00A2 == 1 THEN GOTO label_006A2
    GOTO label_00711
  label_006A2:
    local_58 = 3
    local_5A = 42
    local_5E = "You lost concentration! Your"
    local_60 = 0
    CALL locate_print_21DEA(addr(local_58), addr(local_5A), addr(local_5E), addr(local_60))
    CALL free_string(addr(local_5E))
    local_66 = 4
    local_68 = 42
    local_6C = "spell failed!"
    local_6E = 0
    CALL locate_print_21DEA(addr(local_66), addr(local_68), addr(local_6C), addr(local_6E))
    CALL free_string(addr(local_6C))
    GOTO label_0075E
  label_00711:
    ax = &HBC8
    CALL RT_2732_63DF(DS, &HBC8, 38)
    local_72 = ax
    CALL fields_like_they_used_to_12B8D(&HBC0, 162, &HBBE, arg_6, addr(local_72))
    ax = addr(local_72)
    PUSH DS
    PUSH addr(local_72)
    ' xor ax,ax
    ax = &HBC8
    CALL RT_2732_6404(addr(local_72), DS, &HBC8, 38)
    CALL free_string(addr(local_72))
  label_0075E:
    si = arg_6
    ax = 0
    IF [si] <> 1 THEN GOTO label_0076A
    ax = ax - 1
  label_0076A:
    cx = 0
    IF var_015A <> 0 THEN GOTO label_00775
    cx = cx - 1
  label_00775:
    ' and cx,ax
    ' and cx,cx
    IF var_015A <> 0 THEN GOTO label_0077E
    GOTO label_00783
  label_0077E:
    CALL hit_any_key_to_continue_2434A()
  label_00783:
    CALL free_string(addr(local_46))
    CALL free_string(addr(local_3E))
    CALL free_string(addr(local_42))
    PROC_EXIT
    RETURN
    GOTO label_009EF
END SUB

SUB loss_of_str_007A9  ' image &H7A9, locals 26
  ' strings: Your strength is gone. You die! | LOSS OF STR | You've gone brain dead. You die! | LOSS OF INT | You wither away and die! | LOSS OF CON
    cx = 26
    CALL frame_enter()
    IF var_01E6 > 21 THEN GOTO label_007BB
    GOTO label_007C1
  label_007BB:
    var_01E6 = 21
  label_007C1:
    IF var_01E8 > 21 THEN GOTO label_007CB
    GOTO label_007D1
  label_007CB:
    var_01E8 = 21
  label_007D1:
    IF var_01EA > 21 THEN GOTO label_007DB
    GOTO label_007E1
  label_007DB:
    var_01EA = 21
  label_007E1:
    IF var_01EC > 21 THEN GOTO label_007EB
    GOTO label_007F1
  label_007EB:
    var_01EC = 21
  label_007F1:
    IF var_01EE > 21 THEN GOTO label_007FB
    GOTO label_00801
  label_007FB:
    var_01EE = 21
  label_00801:
    IF var_01F0 > 21 THEN GOTO label_0080B
    GOTO label_00811
  label_0080B:
    var_01F0 = 21
  label_00811:
    IF var_01E6 < 0 THEN GOTO label_0081B
    GOTO label_00830
  label_0081B:
    local_E = "Your strength is gone. You die!"
    local_12 = "LOSS OF STR"
    GOTO label_00956
  label_00830:
    IF var_01E8 < 0 THEN GOTO label_0083A
    GOTO label_0084F
  label_0083A:
    local_E = "You've gone brain dead. You die!"
    local_12 = "LOSS OF INT"
    GOTO label_00956
  label_0084F:
    IF var_01EA < 0 THEN GOTO label_00859
    GOTO label_0086E
  label_00859:
    local_E = "You wither away and die!"
    local_12 = "LOSS OF CON"
    GOTO label_00956
  label_0086E:
    IF var_01EC < 0 THEN GOTO label_00878
    GOTO label_0088D
  label_00878:
    local_E = "You trip and kill yourself!"
    local_12 = "LOSS OF DEX"
    GOTO label_00956
  label_0088D:
    IF var_01EE < 0 THEN GOTO label_00897
    GOTO label_008BE
  label_00897:
    local_E = "You're so ugly, you wish you could"
    local_16 = "curl up and die. Your wish has been"
    local_1A = "granted.  You curl up and die!"
    local_12 = "LOSS OF CHR"
    GOTO label_00956
  label_008BE:
    IF var_01F0 < 0 THEN GOTO label_008C8
    GOTO label_008DD
  label_008C8:
    local_E = "Your luck just ran out. You die!"
    local_12 = "LOSS OF LCK"
    GOTO label_00956
  label_008DD:
    PUSH var_021E
    PUSH var_021C
    ' xor ax,ax
    ' cwd
    CALL RT_2732_7413(DX, ax)
    IF var_01F0 < 0 THEN GOTO label_008F4
    GOTO label_00909
  label_008F4:
    local_E = "Experience?  You don't need no stinkin' experience! You're dead!"
    local_12 = "LOSS OF EXPERIENCE"
    GOTO label_00956
  label_00909:
    IF var_020A >= 10 THEN GOTO label_00913
    GOTO label_00928
  label_00913:
    local_E = "You're too sick to go on.  You die!"
    local_12 = "SICKNESS"
    GOTO label_00956
  label_00928:
    IF var_01E2 < 1 THEN GOTO label_00932
    GOTO label_00956
  label_00932:
    CALL resurrection_16562(arg_6)
    IF var_01E2 < 1 THEN GOTO label_00944
    GOTO label_00956
  label_00944:
    local_E = "You die!"
    local_12 = arg_6
  label_00956:
    CALL RT_2732_6130(addr(local_12), &H16F4)
    IF var_01E2 > 1 THEN GOTO label_00968
    GOTO label_009C3
  label_00968:
    CALL hit_any_key_to_continue_2434A()
    local_1C = 1
    local_1E = 25
    CALL proc_21194(addr(local_1C), addr(local_1E))
    local_20 = 1
    CALL print_more_21DB9(addr(local_E), addr(local_20))
    local_22 = 1
    CALL print_more_21DB9(addr(local_16), addr(local_22))
    local_24 = 1
    CALL print_more_21DB9(addr(local_1A), addr(local_24))
    CALL dun_0E905(addr(local_12))
  label_009C3:
    CALL free_string(addr(local_12))
    CALL free_string(addr(local_1A))
    CALL free_string(addr(local_16))
    CALL free_string(addr(local_E))
    PROC_EXIT
    RETURN
    GOTO label_00A95
END SUB

SUB proc_009F2  ' image &H9F2, locals 8
    cx = 8
    CALL frame_enter()
    CALL file_ah4(7)
    CALL RT_2F00_0559()
    ' float_DC
    ' float_D9
    PUSH DS
    PUSH arg_6
    ' xor ax,ax
    ax = &HA90
    CALL RT_2732_6404(7, DS, &HA90, 60)
    ax = &HA90
    PUSH DS
    PUSH &HA90
    PUSH 60
    PUSH DS
    PUSH arg_6
    ' xor ax,ax
    CALL RT_2732_6404(60)
    ' float_D9
    CALL RT_2F00_056C()
    local_C = ax
    ax = 1
    GOTO label_00A85
  label_00A50:
    CALL charactr_0F56E(addr(local_12))
    ax = &HA90
    CALL RT_2732_63DF(DS, &HA90, 60)
    CALL RT_2732_6130(60, arg_6)
    IF ? == ? THEN GOTO label_00A75
    GOTO label_00A7B
  label_00A75:
    GOTO label_00A8D
    GOTO label_00A81
  label_00A7B:
    var_0096 = 0
  label_00A81:
    ax = local_12
    ax = ax + 1
  label_00A85:
    local_12 = ax
    IF ax <= local_C THEN GOTO label_00A50
  label_00A8D:
    PROC_EXIT
    RETURN
    GOTO label_00E6B
END SUB

SUB proc_00A98  ' image &HA98, locals 8
    cx = 8
    CALL frame_enter()
    ' float_D9
    ' float_D9
    si = arg_8
    IF [si] == 1 THEN GOTO label_00AB6
    GOTO label_00AD5
  label_00AB6:
    si = arg_A
    ax = [si]
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    ax = ax + 64
    si = ax
    [si] = 0
    CALL proc_0670C()
    GOTO label_00E54
  label_00AD5:
    si = arg_A
    ax = [si]
    cx = 68
    bx = ax
    ' imul cx
    ax = ax + &HBEE
    dx = ax
    ax = ax + 52
    si = ax
    ax = [si]
    local_10 = ax
    IF local_10 == 1 THEN GOTO label_00AFA
    GOTO label_00BBB
  label_00AFA:
    cx = dx
    dx = dx + 54
    si = dx
    IF [si] == 36 THEN GOTO label_00B09
    GOTO label_00B85
  label_00B09:
    ' or bx,bx
    ax = 0
    IF [si] <> 36 THEN GOTO label_00B11
    ax = ax - 1
  label_00B11:
    dx = 0
    IF var_013B <> 0 THEN GOTO label_00B1C
    dx = dx - 1
  label_00B1C:
    cx = cx + 60
    si = cx
    cx = 0
    IF [si] <> 1 THEN GOTO label_00B2A
    cx = cx - 1
  label_00B2A:
    local_12 = ax
    ax = 0
    IF var_0141 <> 0 THEN GOTO label_00B38
    ax = ax - 1
  label_00B38:
    ' or ax,cx
    ' and ax,dx
    ' or ax,[bp-0x12]
    ' and ax,ax
    IF var_0141 <> 0 THEN GOTO label_00B46
    GOTO label_00B4D
  label_00B46:
    var_013B = bx
    GOTO label_00B82
  label_00B4D:
    ax = 0
    IF var_013B == 0 THEN GOTO label_00B58
    ax = ax - 1
  label_00B58:
    cx = 0
    IF var_0141 <> 0 THEN GOTO label_00B63
    cx = cx - 1
  label_00B63:
    ' and cx,ax
    ' and cx,cx
    IF var_0141 <> 0 THEN GOTO label_00B6C
    GOTO label_00B77
  label_00B6C:
    si = arg_A
    ax = [si]
    var_0141 = ax
    GOTO label_00B82
  label_00B77:
    ' float_D9
    ' float_D9
  label_00B82:
    GOTO label_00BB8
  label_00B85:
    ax = 0
    IF var_0141 <> 0 THEN GOTO label_00B90
    ax = ax - 1
  label_00B90:
    si = arg_A
    cx = 0
    IF [si] <> 0 THEN GOTO label_00B9C
    cx = cx - 1
  label_00B9C:
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 0 THEN GOTO label_00BA5
    GOTO label_00BAD
  label_00BA5:
    ax = [si]
    var_0141 = ax
    GOTO label_00BB8
  label_00BAD:
    ' float_D9
    ' float_D9
  label_00BB8:
    GOTO label_00E54
  label_00BBB:
    IF local_10 == 2 THEN GOTO label_00BC4
    GOTO label_00C34
  label_00BC4:
    ax = 0
    IF var_0141 <> 0 THEN GOTO label_00BCF
    ax = ax - 1
  label_00BCF:
    si = arg_A
    cx = 0
    IF [si] <> 0 THEN GOTO label_00BDB
    cx = cx - 1
  label_00BDB:
    bx = cx
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 0 THEN GOTO label_00BE6
    GOTO label_00C26
  label_00BE6:
    ax = 68
    ' imul word [si]
    ax = ax + &HBEE
    ax = ax + 54
    di = ax
    cx = 0
    IF [di] <> 40 THEN GOTO label_00BFD
    cx = cx - 1
  label_00BFD:
    ax = 0
    IF var_013D <> 0 THEN GOTO label_00C08
    ax = ax - 1
  label_00C08:
    ' or ax,bx
    ' and ax,cx
    ' and ax,ax
    IF var_013D <> 0 THEN GOTO label_00C13
    GOTO label_00C1B
  label_00C13:
    ax = [si]
    var_013D = ax
    GOTO label_00C23
  label_00C1B:
    si = arg_A
    ax = [si]
    var_0141 = ax
  label_00C23:
    GOTO label_00C31
  label_00C26:
    ' float_D9
    ' float_D9
  label_00C31:
    GOTO label_00E54
  label_00C34:
    IF local_10 == 3 THEN GOTO label_00C3D
    GOTO label_00C73
  label_00C3D:
    ax = 0
    IF var_0143 <> 0 THEN GOTO label_00C48
    ax = ax - 1
  label_00C48:
    si = arg_A
    cx = 0
    IF [si] <> 0 THEN GOTO label_00C54
    cx = cx - 1
  label_00C54:
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 0 THEN GOTO label_00C5D
    GOTO label_00C65
  label_00C5D:
    ax = [si]
    var_0143 = ax
    GOTO label_00C70
  label_00C65:
    ' float_D9
    ' float_D9
  label_00C70:
    GOTO label_00E54
  label_00C73:
    IF local_10 == 4 THEN GOTO label_00C7C
    GOTO label_00CB2
  label_00C7C:
    ax = 0
    IF var_0145 <> 0 THEN GOTO label_00C87
    ax = ax - 1
  label_00C87:
    si = arg_A
    cx = 0
    IF [si] <> 0 THEN GOTO label_00C93
    cx = cx - 1
  label_00C93:
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 0 THEN GOTO label_00C9C
    GOTO label_00CA4
  label_00C9C:
    ax = [si]
    var_0145 = ax
    GOTO label_00CAF
  label_00CA4:
    ' float_D9
    ' float_D9
  label_00CAF:
    GOTO label_00E54
  label_00CB2:
    IF local_10 == 5 THEN GOTO label_00CBB
    GOTO label_00CF1
  label_00CBB:
    ax = 0
    IF var_013F <> 0 THEN GOTO label_00CC6
    ax = ax - 1
  label_00CC6:
    si = arg_A
    cx = 0
    IF [si] <> 0 THEN GOTO label_00CD2
    cx = cx - 1
  label_00CD2:
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 0 THEN GOTO label_00CDB
    GOTO label_00CE3
  label_00CDB:
    ax = [si]
    var_013F = ax
    GOTO label_00CEE
  label_00CE3:
    ' float_D9
    ' float_D9
  label_00CEE:
    GOTO label_00E54
  label_00CF1:
    IF local_10 == 6 THEN GOTO label_00CFA
    GOTO label_00D30
  label_00CFA:
    ax = 0
    IF var_0147 <> 0 THEN GOTO label_00D05
    ax = ax - 1
  label_00D05:
    si = arg_A
    cx = 0
    IF [si] <> 0 THEN GOTO label_00D11
    cx = cx - 1
  label_00D11:
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 0 THEN GOTO label_00D1A
    GOTO label_00D22
  label_00D1A:
    ax = [si]
    var_0147 = ax
    GOTO label_00D2D
  label_00D22:
    ' float_D9
    ' float_D9
  label_00D2D:
    GOTO label_00E54
  label_00D30:
    IF local_10 == 7 THEN GOTO label_00D39
    GOTO label_00D6F
  label_00D39:
    ax = 0
    IF var_0149 <> 0 THEN GOTO label_00D44
    ax = ax - 1
  label_00D44:
    si = arg_A
    cx = 0
    IF [si] <> 0 THEN GOTO label_00D50
    cx = cx - 1
  label_00D50:
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 0 THEN GOTO label_00D59
    GOTO label_00D61
  label_00D59:
    ax = [si]
    var_0149 = ax
    GOTO label_00D6C
  label_00D61:
    ' float_D9
    ' float_D9
  label_00D6C:
    GOTO label_00E54
  label_00D6F:
    IF local_10 == 8 THEN GOTO label_00D78
    GOTO label_00DAE
  label_00D78:
    ax = 0
    IF var_014B <> 0 THEN GOTO label_00D83
    ax = ax - 1
  label_00D83:
    si = arg_A
    cx = 0
    IF [si] <> 0 THEN GOTO label_00D8F
    cx = cx - 1
  label_00D8F:
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 0 THEN GOTO label_00D98
    GOTO label_00DA0
  label_00D98:
    ax = [si]
    var_014B = ax
    GOTO label_00DAB
  label_00DA0:
    ' float_D9
    ' float_D9
  label_00DAB:
    GOTO label_00E54
  label_00DAE:
    IF local_10 == 9 THEN GOTO label_00DB7
    GOTO label_00E15
  label_00DB7:
    ax = 0
    IF var_014D <> 0 THEN GOTO label_00DC2
    ax = ax - 1
  label_00DC2:
    si = arg_A
    cx = 0
    IF [si] <> 0 THEN GOTO label_00DCE
    cx = cx - 1
  label_00DCE:
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 0 THEN GOTO label_00DD7
    GOTO label_00DDF
  label_00DD7:
    ax = [si]
    var_014D = ax
    GOTO label_00E12
  label_00DDF:
    ax = 0
    IF var_014F <> 0 THEN GOTO label_00DEA
    ax = ax - 1
  label_00DEA:
    si = arg_A
    cx = 0
    IF [si] <> 0 THEN GOTO label_00DF6
    cx = cx - 1
  label_00DF6:
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 0 THEN GOTO label_00DFF
    GOTO label_00E07
  label_00DFF:
    ax = [si]
    var_014F = ax
    GOTO label_00E12
  label_00E07:
    ' float_D9
    ' float_D9
  label_00E12:
    GOTO label_00E54
  label_00E15:
    IF local_10 == 13 THEN GOTO label_00E1E
    GOTO label_00E54
  label_00E1E:
    ax = 0
    IF var_0151 <> 0 THEN GOTO label_00E29
    ax = ax - 1
  label_00E29:
    si = arg_A
    cx = 0
    IF [si] <> 0 THEN GOTO label_00E35
    cx = cx - 1
  label_00E35:
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 0 THEN GOTO label_00E3E
    GOTO label_00E46
  label_00E3E:
    ax = [si]
    var_0151 = ax
    GOTO label_00E51
  label_00E46:
    ' float_D9
    ' float_D9
  label_00E51:
    GOTO label_00E54
  label_00E54:
    ' float_D9
    si = arg_6
    ' float_D9
    ax = arg_6
    PROC_EXIT
    RETURN
    GOTO label_01263
END SUB

SUB enter_00E6E  ' image &HE6E, locals 78
  ' strings: ENTER | ESCAPE | HELPCLERIC | ACLERICSTAYSICK | ACLERICCURESICKNESS | ACLERICNOREMOVE
    cx = 78
    CALL frame_enter()
    local_C = 1
    local_E = 25
    CALL proc_21194(addr(local_C), addr(local_E))
    CALL proc_0D0CF()
  label_00E92:
    CALL proc_0A9DA()
    ax = 72
    ax = 112
    CALL RT_2732_6404(DS, 72, 1, DS, 112, 2)
    ax = 74
    ax = 114
    CALL RT_2732_6404(DS, 74, 1, DS, 114, 2)
    ax = "ENTER"
    PUSH DS
    PUSH "ENTER"
    ' xor ax,ax
    ax = 116
    CALL RT_2732_6404("ENTER", DS, 116, 10)
    ax = "ESCAPE"
    PUSH DS
    PUSH "ESCAPE"
    ' xor ax,ax
    ax = 126
    CALL RT_2732_6404("ESCAPE", DS, 126, 10)
  label_00EF1:
    CALL magic_resist_0B7DE()
    CALL name_0AF8B()
    CALL lerend_014BF(arg_6, addr(local_18))
    local_12 = ax
    local_1C = addr(local_12)
    local_16 = addr(local_1C)
    CALL RT_2732_6130(addr(local_16), &H16D0)
    IF ? <> ? THEN GOTO label_00F33
    GOTO label_00F50
  label_00F33:
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_16))
    IF ? == ? THEN GOTO label_00F50
    GOTO label_00F56
  label_00F50:
    GOTO label_01240
    GOTO label_011D6
  label_00F56:
    CALL RT_2732_6130(addr(local_16), &H1750)
    IF ? == ? THEN GOTO label_00F68
    GOTO label_00F7E
  label_00F68:
    local_1E = 0
    CALL wield_0684E(addr(local_1E))
    CALL proc_0D0CF()
    GOTO label_00EF1
  label_00F7E:
    CALL RT_2732_6130(addr(local_16), &H173A)
    IF ? == ? THEN GOTO label_00F90
    GOTO label_00FB8
  label_00F90:
    local_22 = "HELPCLERIC"
    CALL sb_dat_21E13(addr(local_22))
    CALL free_string(addr(local_22))
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0D0CF()
    GOTO label_00EF1
  label_00FB8:
    CALL RT_2732_6130(addr(local_16), &H16D6)
    IF ? == ? THEN GOTO label_00FCA
    GOTO label_01017
  label_00FCA:
    CALL then_asks_for_a_donation_01266()
    local_24 = ax
    ax = local_24
    local_26 = ax
    ax = var_01E2
    CALL RT_2F00_0558()
    ax = local_26
    CALL RT_2F00_0558()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_DE
    CALL RT_2F00_056C()
    var_01E2 = ax
    ax = var_01E4
    IF ax < var_01E2 THEN GOTO label_01011
    GOTO label_01014
  label_01011:
    var_01E2 = ax
  label_01014:
    GOTO label_011D6
  label_01017:
    CALL RT_2732_6130(addr(local_16), &H1A62)
    IF ax == var_01E2 THEN GOTO label_01029
    GOTO label_010EE
  label_01029:
    CALL then_asks_for_a_donation_01266()
    local_28 = ax
    ax = local_28
    local_26 = ax
    IF var_020A > 0 THEN GOTO label_01041
    GOTO label_010EB
  label_01041:
    ' float_D9
    ' float_D9
    local_2A = 16
    local_2C = 3
    CALL proc_253B3(addr(local_2A), addr(local_2C))
    ' float_D9
    ax = local_26
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ' jc 0x107b
    GOTO label_01099
  label_0107B:
    local_34 = "ACLERICSTAYSICK"
    CALL sb_dat_21E13(addr(local_34))
    CALL free_string(addr(local_34))
    GOTO label_010EB
  label_01099:
    ax = var_020A
    CALL RT_2F00_0558()
    ax = local_26
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_DE
    CALL RT_2F00_056C()
    var_020A = ax
    IF var_020A < 0 THEN GOTO label_010CA
    GOTO label_010D0
  label_010CA:
    var_020A = 0
  label_010D0:
    local_38 = "ACLERICCURESICKNESS"
    CALL sb_dat_21E13(addr(local_38))
    CALL free_string(addr(local_38))
  label_010EB:
    GOTO label_011D6
  label_010EE:
    CALL RT_2732_6130(addr(local_16), &H1A98)
    IF var_020A == 0 THEN GOTO label_01100
    GOTO label_0117F
  label_01100:
    CALL then_asks_for_a_donation_01266()
    local_3A = ax
    ax = local_3A
    local_26 = ax
    ax = 50
    ' imul word [0x1e0]
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ax = local_26
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ' jc 0x1138
    GOTO label_0116D
  label_01138:
    local_3C = 16
    local_3E = 3
    CALL proc_253B3(addr(local_3C), addr(local_3E))
    local_42 = "ACLERICNOREMOVE"
    CALL sb_dat_21E13(addr(local_42))
    CALL free_string(addr(local_42))
    GOTO label_0117C
  label_0116D:
    CALL remove_08227()
    CALL proc_0D0CF()
    CALL name_0AF8B()
  label_0117C:
    GOTO label_011D6
  label_0117F:
    local_46 = "He doesn't understand you.  Please retype."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_4A = ax
    CALL proc_2311E(addr(local_46), addr(local_4A))
    ax = addr(local_4A)
    PUSH DS
    PUSH addr(local_4A)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_4A), DS, 79, 1)
    CALL free_string(addr(local_46))
    CALL free_string(addr(local_4A))
    GOTO label_00EF1
  label_011D6:
    local_4C = 11
    local_4E = 0
    CALL color_25283(addr(local_4C), addr(local_4E))
    IF local_26 > 0 THEN GOTO label_011F6
    GOTO label_01239
  label_011F6:
    local_50 = 22
    local_52 = 3
    local_56 = "He thanks you for your donation."
    local_58 = 0
    CALL locate_print_21DEA(addr(local_50), addr(local_52), addr(local_56), addr(local_58))
    CALL free_string(addr(local_56))
    CALL name_0AF8B()
    CALL hit_any_key_to_continue_2434A()
    GOTO label_0123C
  label_01239:
    GOTO label_01240
  label_0123C:
    GOTO label_00E92
  label_01240:
    CALL free_string(addr(local_16))
    CALL free_string(addr(local_12))
    CALL free_string(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_014BC
END SUB

SUB then_asks_for_a_donation_01266  ' image &H1266, locals 82
  ' strings: He calmly diagnoses your problems with some type of magical artifact. He | then asks for a donation. | How much would you like to give | ACLERICBADDONATE | (It appears that this cleric is more powerful than your magic items!) | ACLERICNOGOLD
    cx = 82
    CALL frame_enter()
    CALL proc_0A9DA()
    local_C = 11
    local_E = 0
    CALL color_25283(addr(local_C), addr(local_E))
    local_10 = 11
    local_12 = 3
    local_16 = "He calmly diagnoses your problems with some type of magical artifact. He"
    local_18 = 0
    CALL locate_print_21DEA(addr(local_10), addr(local_12), addr(local_16), addr(local_18))
    CALL free_string(addr(local_16))
    local_1A = 12
    local_1C = 3
    local_20 = "then asks for a donation."
    local_22 = 0
    CALL locate_print_21DEA(addr(local_1A), addr(local_1C), addr(local_20), addr(local_22))
    CALL free_string(addr(local_20))
    local_24 = 14
    local_26 = 3
    local_28 = 9
    local_2C = "How much would you like to give"
    local_2E = 1
    local_30 = 0
    local_32 = 0
    CALL invalid_key_was_hit_23200(addr(local_24), addr(local_26), addr(local_28), addr(local_2C), addr(local_3E), addr(local_2E), addr(local_30), addr(local_32))
    local_36 = ax
    CALL free_string(addr(local_2C))
    local_42 = addr(local_36)
    CALL RT_2732_76EA(addr(local_3E))
    si = ax
    ' float_DD
    CALL RT_2F00_056C()
    local_44 = ax
    local_38 = 16
    local_3A = 3
    CALL proc_253B3(addr(local_38), addr(local_3A))
    IF local_44 <= 0 THEN GOTO label_01392
    GOTO label_013F4
  label_01392:
    local_48 = "ACLERICBADDONATE"
    CALL sb_dat_21E13(addr(local_48))
    CALL free_string(addr(local_48))
    IF var_00CC == 1 THEN GOTO label_013B7
    GOTO label_013ED
  label_013B7:
    local_4A = 19
    local_4C = 3
    local_50 = "(It appears that this cleric is more powerful than your magic items!)"
    local_52 = 0
    CALL locate_print_21DEA(addr(local_4A), addr(local_4C), addr(local_50), addr(local_52))
    CALL free_string(addr(local_50))
  label_013ED:
    var_020A = var_020A + 1
    GOTO label_01490
  label_013F4:
    PUSH var_0222
    PUSH var_0220
    ' xor ax,ax
    ' cwd
    CALL RT_2732_7413(DX, addr(local_50))
    IF var_00CC == 1 THEN GOTO label_0140B
    GOTO label_01429
  label_0140B:
    local_56 = "ACLERICNOGOLD"
    CALL sb_dat_21E13(addr(local_56))
    CALL free_string(addr(local_56))
    GOTO label_01490
  label_01429:
    CALL RT_2732_7413(long(local_44), var_0222, var_0220)
    IF var_00CC > 1 THEN GOTO label_01441
    GOTO label_01476
  label_01441:
    ax = var_0220
    local_44 = ax
    var_0220 = 0
    var_0222 = 0
    local_5A = "ACLERICALLGOLD"
    CALL sb_dat_21E13(addr(local_5A))
    CALL free_string(addr(local_5A))
    CALL name_0AF8B()
    GOTO label_01490
  label_01476:
    ax = local_44
    ' cwd
    ax = ax - var_0220
    ' sbb dx,[0x222]
    ax = -ax
    ' adc dx,0x0
    dx = -dx
    var_0220 = ax
    var_0222 = dx
  label_01490:
    ax = local_44
    local_5C = ax
    CALL free_string(addr(local_36))
    CALL free_string(addr(local_42))
    CALL free_string(addr(local_3E))
    ax = local_5C
    PROC_EXIT
    RETURN
    GOTO label_016B0
END SUB

SUB lerend_014BF  ' image &H14BF, locals 70
  ' strings: Lerend | ACLERICLEREND | ACLERICWANDERER | Choose what you wish to do: | (C) Cure wounds | (I) Inventory management
    cx = 70
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 6, 4, &H8001, addr(local_1C))
    local_1E = 11
    local_20 = 3
    CALL proc_253B3(addr(local_1E), addr(local_20))
    CALL RT_2732_6130(arg_8, "Lerend")
    IF ? == ? THEN GOTO label_01507
    GOTO label_01525
  label_01507:
    local_24 = "ACLERICLEREND"
    CALL sb_dat_21E13(addr(local_24))
    CALL free_string(addr(local_24))
    GOTO label_01540
  label_01525:
    local_28 = "ACLERICWANDERER"
    CALL sb_dat_21E13(addr(local_28))
    CALL free_string(addr(local_28))
  label_01540:
    local_2A = 11
    local_2C = 0
    CALL color_25283(addr(local_2A), addr(local_2C))
    local_2E = 18
    local_30 = 3
    local_34 = "Choose what you wish to do:"
    local_36 = 0
    CALL locate_print_21DEA(addr(local_2E), addr(local_30), addr(local_34), addr(local_36))
    CALL free_string(addr(local_34))
    local_38 = 7
    local_3A = 0
    CALL color_25283(addr(local_38), addr(local_3A))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(C) Cure wounds"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(I) Inventory management"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(S) cure Sickness"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "(H) Help"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "(R) Remove a cursed item"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(6, 1)
    si = bx
    di = "(Q or ESC) leave the cleric"
    CALL near_00033()
    local_3C = 6
    local_3E = 2
    local_40 = 3
    local_42 = 20
    local_44 = 2
    local_46 = 0
    local_48 = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_3C), addr(local_3E), addr(local_40), addr(local_42), addr(local_44), addr(local_46), arg_6, addr(local_48))
    local_4C = ax
    local_50 = addr(local_4C)
    CALL free_string(addr(local_4C))
    CALL erase_array(addr(local_1C))
    CALL RT_2732_64F5(addr(local_50))
    PROC_EXIT
    RETURN
    GOTO label_02AD2
END SUB

SUB inv_016B3  ' image &H16B3, locals 412
  ' strings: NOMORECHARS | CREATE A CHARACTER | What is the name of the character that you want to create? | You must enter a character name. | INV | (R) ROLL AGAIN
    cx = 412
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 7, 4, &H8001, addr(local_1C))
    local_1E = 1
    local_20 = 25
    CALL proc_21194(addr(local_1E), addr(local_20))
    ax = var_0A7D
    cx = 0
    IF ax > var_0131 THEN GOTO label_016F7
    cx = cx - 1
  label_016F7:
    ' or ax,ax
    dx = 0
    IF ax == var_0131 THEN GOTO label_016FF
    dx = dx - 1
  label_016FF:
    ' and dx,cx
    ' and dx,dx
    IF ax <> var_0131 THEN GOTO label_01708
    GOTO label_01741
  label_01708:
    local_24 = "NOMORECHARS"
    CALL sb_dat_21E13(addr(local_24))
    CALL free_string(addr(local_24))
    CALL hit_any_key_to_continue_2434A()
    ax = &H178E
    PUSH DS
    PUSH &H178E
    ' xor ax,ax
    ax = 440
    CALL RT_2732_6404(&H178E, DS, 440, 20)
    GOTO label_02A00
  label_01741:
    local_26 = 15
    local_28 = 0
    CALL color_25283(addr(local_26), addr(local_28))
    local_2A = 1
    local_2C = 33
    local_30 = "CREATE A CHARACTER"
    local_32 = 0
    CALL locate_print_21DEA(addr(local_2A), addr(local_2C), addr(local_30), addr(local_32))
    CALL free_string(addr(local_30))
    local_34 = 3
    local_36 = 1
    local_38 = 20
    local_3C = "What is the name of the character that you want to create?"
    local_3E = 0
    local_40 = 0
    local_42 = 0
    CALL invalid_key_was_hit_23200(addr(local_34), addr(local_36), addr(local_38), addr(local_3C), addr(local_54), addr(local_3E), addr(local_40), addr(local_42))
    local_46 = ax
    CALL free_string(addr(local_3C))
    local_58 = addr(local_46)
    CALL RT_2732_6374(addr(local_54))
    CALL RT_2732_6130(addr(local_54), &H16F4)
    IF ax == var_0131 THEN GOTO label_0180C
    GOTO label_01860
  label_0180C:
    local_48 = 15
    local_4A = 10
    local_4E = "You must enter a character name."
    local_50 = 0
    CALL locate_print_21DEA(addr(local_48), addr(local_4A), addr(local_4E), addr(local_50))
    CALL free_string(addr(local_4E))
    CALL hit_any_key_to_continue_2434A()
    ax = &H178E
    PUSH DS
    PUSH &H178E
    ' xor ax,ax
    ax = 440
    CALL RT_2732_6404(&H178E, DS, 440, 20)
    GOTO label_02A00
  label_01860:
    ax = addr(local_54)
    PUSH DS
    PUSH addr(local_54)
    ' xor ax,ax
    ax = 440
    CALL RT_2732_6404(addr(local_54), DS, 440, 20)
    local_5C = "INV"
    CALL proc_245DD(addr(local_54), addr(local_5C))
    local_60 = ax
    CALL free_string(addr(local_5C))
    ax = addr(local_60)
    PUSH DS
    PUSH addr(local_60)
    ' xor ax,ax
    ax = 460
    CALL RT_2732_6404(addr(local_60), DS, 460, 8)
    var_01E0 = 1
    ax = &H16F4
    PUSH DS
    PUSH &H16F4
    ' xor ax,ax
    ax = 468
    CALL RT_2732_6404(&H16F4, DS, 468, 7)
    ax = &H16F4
    PUSH DS
    PUSH &H16F4
    ' xor ax,ax
    ax = 475
    CALL RT_2732_6404(&H16F4, DS, 475, 5)
    var_0220 = 0
    var_0222 = 0
    var_021C = 0
    var_021E = 0
    var_020C = 0
    var_01E2 = 0
    var_01E4 = 0
    var_01E6 = 0
    var_01E8 = 0
    var_01EA = 0
    var_01EC = 0
    var_01EE = 0
    var_01F0 = 0
    var_01F4 = 0
    var_01F2 = 0
    var_020E = 0
    var_0210 = 0
    var_0212 = 0
    var_0216 = 0
    var_0218 = 0
    var_0238 = 0
    var_021A = 0
    var_0200 = 0
    var_0202 = 0
    var_0206 = 0
    var_0204 = 0
    var_0208 = 0
    ax = &H16F4
    PUSH DS
    PUSH &H16F4
    ' xor ax,ax
    ax = 586
    CALL RT_2732_6404(&H16F4, DS, 586, 20)
    var_020A = 0
    var_00B4 = 0
    var_00B6 = 0
    var_00D2 = 0
    var_00B2 = 0
    var_010E = 0
    var_0110 = 0
    var_010A = 0
    var_010C = 0
    var_0112 = 0
    var_012F = 0
    CALL near_0288D()
  label_019E2:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax > var_0131 THEN GOTO label_019F7
    GOTO label_019FA
  label_019F7:
    CALL near_029A6()
  label_019FA:
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_01E6 = ax
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_01E8 = ax
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_01EA = ax
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_01EC = ax
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_01EE = ax
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_01F0 = ax
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == var_0131 THEN GOTO label_01B77
    GOTO label_01B7A
  label_01B77:
    CALL near_029A6()
  label_01B7A:
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(R) ROLL AGAIN"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(B) BACK 1 ROLL"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(S) SAVE ROLL"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "(Q) QUIT"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "(H) HELP"
    CALL near_00033()
  label_01BEF:
    local_66 = 13
    local_68 = 0
    CALL color_25283(addr(local_66), addr(local_68))
    local_6A = 16
    local_6C = 29
    local_6E = 4
    CALL proc_25D42(addr(local_6E), 486)
    local_72 = ax
    local_74 = 4
    CALL proc_25D42(addr(local_74), 488)
    local_78 = ax
    local_7A = 4
    CALL proc_25D42(addr(local_7A), 490)
    local_7E = ax
    local_80 = 4
    CALL proc_25D42(addr(local_80), 492)
    local_84 = ax
    local_86 = 4
    CALL proc_25D42(addr(local_86), 494)
    local_8A = ax
    local_8C = 4
    CALL proc_25D42(addr(local_8C), 496)
    local_90 = ax
    ax = addr(local_72) + addr(local_78)
    ax = ax + addr(local_7E)
    ax = ax + addr(local_84)
    ax = ax + addr(local_8A)
    ax = ax + addr(local_90)
    local_94 = ax
    local_96 = 0
    CALL locate_print_21DEA(addr(local_6A), addr(local_6C), addr(local_94), addr(local_96))
    CALL free_string(addr(local_94))
    local_98 = 5
    local_9A = 3
    local_9C = 10
    local_9E = 18
    local_A0 = 2
    local_A2 = 0
    local_A4 = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_98), addr(local_9A), addr(local_9C), addr(local_9E), addr(local_A0), addr(local_A2), addr(local_AE), addr(local_A4))
    local_A8 = ax
    local_58 = addr(local_A8)
    local_AC = addr(local_58)
    CALL RT_2732_6130(addr(local_AC), &H16D0)
    IF ax <> var_0131 THEN GOTO label_01D9A
    GOTO label_01DB8
  label_01D9A:
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_AC))
    IF ax == var_0131 THEN GOTO label_01DB8
    GOTO label_01DD4
  label_01DB8:
    ax = &H178E
    PUSH DS
    PUSH &H178E
    ' xor ax,ax
    ax = 440
    CALL RT_2732_6404(&H178E, DS, 440, 20)
    GOTO label_02A00
    GOTO label_01E8C
  label_01DD4:
    CALL RT_2732_6130(addr(local_AC), &H1A62)
    IF ax == var_0131 THEN GOTO label_01DE7
    GOTO label_01DEA
  label_01DE7:
    GOTO label_01E8C
  label_01DEA:
    CALL RT_2732_6130(addr(local_AC), &H173A)
    IF ax == var_0131 THEN GOTO label_01DFD
    GOTO label_01E26
  label_01DFD:
    local_B2 = "HELPSTATS"
    CALL sb_dat_21E13(addr(local_B2))
    CALL free_string(addr(local_B2))
    CALL hit_any_key_to_continue_2434A()
    CALL near_0288D()
    GOTO label_01BEF
  label_01E26:
    CALL RT_2732_6130(addr(local_AC), &H1DE8)
    IF ax == var_0131 THEN GOTO label_01E39
    GOTO label_01E89
  label_01E39:
    ' float_D9
    CALL RT_2F00_056C()
    var_01E6 = ax
    ' float_D9
    CALL RT_2F00_056C()
    var_01E8 = ax
    ' float_D9
    CALL RT_2F00_056C()
    var_01EA = ax
    ' float_D9
    CALL RT_2F00_056C()
    var_01EC = ax
    ' float_D9
    CALL RT_2F00_056C()
    var_01EE = ax
    ' float_D9
    CALL RT_2F00_056C()
    var_01F0 = ax
    GOTO label_01BEF
  label_01E89:
    GOTO label_019E2
  label_01E8C:
    CALL proc_0A9DA()
    CALL name_0AF8B()
    local_C8 = 15
    local_CA = 0
    CALL color_25283(addr(local_C8), addr(local_CA))
    local_CC = 11
    local_CE = 33
    local_D2 = "CREATE A CHARACTER"
    local_D4 = 0
    CALL locate_print_21DEA(addr(local_CC), addr(local_CE), addr(local_D2), addr(local_D4))
    CALL free_string(addr(local_D2))
    local_D6 = 11
    local_D8 = 0
    CALL color_25283(addr(local_D6), addr(local_D8))
    local_DA = 14
    local_DC = 25
    local_E0 = "What race do you wish to belong to?"
    local_E2 = 0
    CALL locate_print_21DEA(addr(local_DA), addr(local_DC), addr(local_E0), addr(local_E2))
    CALL free_string(addr(local_E0))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(M) - HUMAN"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(E) - ELF"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(T) - TROLL"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "(D) - DWARF"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "(G) - GNOME"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(6, 1)
    si = bx
    di = "(H) - HELP"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(7, 1)
    si = bx
    di = "(Q) - QUIT"
    CALL near_00033()
  label_01FEF:
    local_E4 = 7
    local_E6 = 1
    local_E8 = 32
    local_EA = 16
    local_EC = 2
    local_EE = 0
    local_F0 = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_E4), addr(local_E6), addr(local_E8), addr(local_EA), addr(local_EC), addr(local_EE), addr(local_FA), addr(local_F0))
    local_F4 = ax
    local_58 = addr(local_F4)
    local_F8 = addr(local_58)
    CALL RT_2732_6130(addr(local_F8), &H16D0)
    IF ax <> var_0131 THEN GOTO label_0207A
    GOTO label_02098
  label_0207A:
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_F8))
    IF ax == var_0131 THEN GOTO label_02098
    GOTO label_020B4
  label_02098:
    ax = &H178E
    PUSH DS
    PUSH &H178E
    ' xor ax,ax
    ax = 440
    CALL RT_2732_6404(&H178E, DS, 440, 20)
    GOTO label_02A00
    GOTO label_02292
  label_020B4:
    CALL RT_2732_6130(addr(local_F8), &H173A)
    IF ax == var_0131 THEN GOTO label_020C7
    GOTO label_020F7
  label_020C7:
    local_FE = "HELPRACE"
    CALL sb_dat_21E13(addr(local_FE))
    CALL free_string(addr(local_FE))
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0D0CF()
    CALL name_0AF8B()
    GOTO label_01E8C
  label_020F7:
    CALL RT_2732_6130(addr(local_F8), &H1EA2)
    IF ax == var_0131 THEN GOTO label_0210A
    GOTO label_02123
  label_0210A:
    ax = "HUMAN"
    PUSH DS
    PUSH "HUMAN"
    ' xor ax,ax
    ax = 475
    CALL RT_2732_6404("HUMAN", DS, 475, 5)
    GOTO label_02292
  label_02123:
    CALL RT_2732_6130(addr(local_F8), &H1EB2)
    IF ax == var_0131 THEN GOTO label_02136
    GOTO label_02167
  label_02136:
    ax = "ELF  "
    PUSH DS
    PUSH "ELF  "
    ' xor ax,ax
    ax = 475
    CALL RT_2732_6404("ELF  ", DS, 475, 5)
    var_01E6 = var_01E6 - 1
    var_01E8 = var_01E8 + 1
    var_01EA = var_01EA - 1
    var_01EC = var_01EC + 1
    var_01EE = var_01EE + 1
    var_01F0 = var_01F0 - 1
    GOTO label_02292
  label_02167:
    CALL RT_2732_6130(addr(local_F8), &H1EC2)
    IF ax == var_0131 THEN GOTO label_0217A
    GOTO label_021B1
  label_0217A:
    ax = "TROLL"
    PUSH DS
    PUSH "TROLL"
    ' xor ax,ax
    ax = 475
    CALL RT_2732_6404("TROLL", DS, 475, 5)
    var_01E6 = var_01E6 + 2
    var_01E8 = var_01E8 + &HFFFE
    var_01EA = var_01EA + 2
    var_01EC = var_01EC + 2
    var_01EE = var_01EE + &HFFFE
    var_01F0 = var_01F0 + &HFFFE
    GOTO label_02292
  label_021B1:
    CALL RT_2732_6130(addr(local_F8), &H1756)
    IF ax == var_0131 THEN GOTO label_021C4
    GOTO label_021F5
  label_021C4:
    ax = "DWARF"
    PUSH DS
    PUSH "DWARF"
    ' xor ax,ax
    ax = 475
    CALL RT_2732_6404("DWARF", DS, 475, 5)
    var_01E6 = var_01E6 - 1
    var_01E8 = var_01E8 + 1
    var_01EA = var_01EA + 1
    var_01EC = var_01EC + 1
    var_01EE = var_01EE - 1
    var_01F0 = var_01F0 - 1
    GOTO label_02292
  label_021F5:
    CALL RT_2732_6130(addr(local_F8), &H1EDC)
    IF ax == var_0131 THEN GOTO label_02208
    GOTO label_0223B
  label_02208:
    ax = "GNOME"
    PUSH DS
    PUSH "GNOME"
    ' xor ax,ax
    ax = 475
    CALL RT_2732_6404("GNOME", DS, 475, 5)
    var_01E6 = var_01E6 + &HFFFE
    var_01E8 = var_01E8 + 1
    var_01EA = var_01EA - 1
    var_01EC = var_01EC + 1
    var_01EE = var_01EE - 1
    var_01F0 = var_01F0 + 2
    GOTO label_02292
  label_0223B:
    local_100 = 23
    local_102 = 35
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    ax = "What was that again?" + ax
    local_106 = ax
    local_108 = 0
    CALL locate_print_21DEA(addr(local_100), addr(local_102), addr(local_106), addr(local_108))
    CALL free_string(addr(local_106))
    GOTO label_01FEF
  label_02292:
    CALL proc_0A9DA()
    CALL name_0AF8B()
    local_10A = 15
    local_10C = 0
    CALL color_25283(addr(local_10A), addr(local_10C))
    local_10E = 11
    local_110 = 33
    local_114 = "CREATE A CHARACTER"
    local_116 = 0
    CALL locate_print_21DEA(addr(local_10E), addr(local_110), addr(local_114), addr(local_116))
    CALL free_string(addr(local_114))
    local_118 = 11
    local_11A = 0
    CALL color_25283(addr(local_118), addr(local_11A))
    local_11C = 14
    local_11E = 25
    local_122 = "What class do you wish to belong to?"
    local_124 = 0
    CALL locate_print_21DEA(addr(local_11C), addr(local_11E), addr(local_122), addr(local_124))
    CALL free_string(addr(local_122))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(F) - FIGHTER"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(M) - MAGIC USER"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(B) - BARD"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "(H) - HELP"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "(Q) - QUIT"
    CALL near_00033()
  label_023C5:
    local_126 = 5
    local_128 = 1
    local_12A = 32
    local_12C = 16
    local_12E = 2
    local_130 = 0
    local_132 = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_126), addr(local_128), addr(local_12A), addr(local_12C), addr(local_12E), addr(local_130), addr(local_13C), addr(local_132))
    local_136 = ax
    local_58 = addr(local_136)
    local_13A = addr(local_58)
    CALL RT_2732_6130(addr(local_13A), &H16D0)
    IF ax <> var_0131 THEN GOTO label_02450
    GOTO label_0246E
  label_02450:
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_13A))
    IF ax == var_0131 THEN GOTO label_0246E
    GOTO label_0248A
  label_0246E:
    ax = &H178E
    PUSH DS
    PUSH &H178E
    ' xor ax,ax
    ax = 440
    CALL RT_2732_6404(&H178E, DS, 440, 20)
    GOTO label_02A00
    GOTO label_025D3
  label_0248A:
    CALL RT_2732_6130(addr(local_13A), &H173A)
    IF ax == var_0131 THEN GOTO label_0249D
    GOTO label_024CD
  label_0249D:
    local_140 = "HELPCLASS"
    CALL sb_dat_21E13(addr(local_140))
    CALL free_string(addr(local_140))
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0D0CF()
    CALL name_0AF8B()
    GOTO label_02292
  label_024CD:
    CALL RT_2732_6130(addr(local_13A), &H16F8)
    IF ax == var_0131 THEN GOTO label_024E0
    GOTO label_02505
  label_024E0:
    ax = "FIGHTER"
    PUSH DS
    PUSH "FIGHTER"
    ' xor ax,ax
    ax = 468
    CALL RT_2732_6404("FIGHTER", DS, 468, 7)
    ' float_D9
    ' float_D9
    GOTO label_025D3
  label_02505:
    CALL RT_2732_6130(addr(local_13A), &H1EA2)
    IF ax == var_0131 THEN GOTO label_02518
    GOTO label_0253D
  label_02518:
    ax = "MAGE   "
    PUSH DS
    PUSH "MAGE   "
    ' xor ax,ax
    ax = 468
    CALL RT_2732_6404("MAGE   ", DS, 468, 7)
    ' float_D9
    ' float_D9
    GOTO label_025D3
  label_0253D:
    CALL RT_2732_6130(addr(local_13A), &H1DE8)
    IF ax == var_0131 THEN GOTO label_02550
    GOTO label_02575
  label_02550:
    ax = "BARD   "
    PUSH DS
    PUSH "BARD   "
    ' xor ax,ax
    ax = 468
    CALL RT_2732_6404("BARD   ", DS, 468, 7)
    ' float_D9
    ' float_D9
    GOTO label_025D3
  label_02575:
    local_144 = "What was that again?"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_148 = ax
    CALL proc_2311E(addr(local_144), addr(local_148))
    ax = addr(local_148)
    PUSH DS
    PUSH addr(local_148)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_148), DS, 79, 1)
    CALL free_string(addr(local_144))
    CALL free_string(addr(local_148))
    GOTO label_023C5
  label_025D3:
    ax = var_01EA
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    var_01E4 = ax
    ax = var_01E4
    var_01E2 = ax
    CALL mage_0C4A1()
    IF var_00A2 > 0 THEN GOTO label_02604
    GOTO label_026B6
  label_02604:
    ax = var_01F6
    var_1586 = ax
    ax = var_01F8
    var_1588 = ax
    ax = var_01FA
    var_158A = ax
    ax = var_01FC
    var_158C = ax
    ax = var_01FE
    var_158E = ax
    ax = 1
    GOTO label_0268F
  label_02628:
    cx = var_01E0
    cx = cx - ax
    cx = cx + 1
    ax = cx
    CALL RT_2F00_0558()
    ax = local_14A
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    si = local_14A
    si = si * 2
    var_1578[si] = ax
    IF local_14A == 1 THEN GOTO label_02662
    GOTO label_02666
  label_02662:
    var_1578[si] = var_1578[si] + 1
  label_02666:
    si = local_14A
    si = si * 2
    IF var_1578[si] < 0 THEN GOTO label_02676
    GOTO label_0267C
  label_02676:
    var_1578[si] = 0
  label_0267C:
    si = local_14A
    si = si * 2
    ax = var_1578[si]
    var_1584[si] = ax
    ax = local_14A
    ax = ax + 1
  label_0268F:
    local_14A = ax
    IF ax <= 5 THEN GOTO label_02628
    ax = var_1586
    var_01F6 = ax
    ax = var_1588
    var_01F8 = ax
    ax = var_158A
    var_01FA = ax
    ax = var_158C
    var_01FC = ax
    ax = var_158E
    var_01FE = ax
  label_026B6:
    ax = 15
    ' imul word [0x1ee]
    ' cwd
    var_0220 = ax
    var_0222 = dx
    CALL proc_0A9DA()
    CALL name_0AF8B()
    local_14C = 15
    local_14E = 0
    CALL color_25283(addr(local_14C), addr(local_14E))
    local_150 = 11
    local_152 = 33
    local_156 = "CREATE A CHARACTER"
    local_158 = 0
    CALL locate_print_21DEA(addr(local_150), addr(local_152), addr(local_156), addr(local_158))
    CALL free_string(addr(local_156))
    local_15A = 14
    local_15C = 23
    local_160 = "Do you wish to save this character?"
    local_162 = 0
    CALL locate_print_21DEA(addr(local_15A), addr(local_15C), addr(local_160), addr(local_162))
    CALL free_string(addr(local_160))
    local_164 = 16
    local_166 = 25
    local_168 = 1
    CALL y_yes_26031(addr(local_164), addr(local_166), addr(local_168))
    local_16C = ax
    local_58 = addr(local_16C)
    CALL RT_2732_6130(addr(local_58), &H2022)
    IF ax == 5 THEN GOTO label_027B3
    GOTO label_027CC
  label_027B3:
    ax = &H178E
    PUSH DS
    PUSH &H178E
    ' xor ax,ax
    ax = 440
    CALL RT_2732_6404(&H178E, DS, 440, 20)
    GOTO label_02A00
  label_027CC:
    ax = 440
    ax = addr(local_178)
    PUSH DS
    PUSH 440
    PUSH 20
    PUSH DS
    PUSH addr(local_178)
    ' xor ax,ax
    CALL RT_2732_6404(addr(local_178))
    local_170 = "INV"
    CALL proc_245DD(addr(local_178), addr(local_170))
    local_174 = ax
    CALL free_string(addr(local_170))
    ax = addr(local_174)
    PUSH DS
    PUSH addr(local_174)
    ' xor ax,ax
    ax = 460
    CALL RT_2732_6404(addr(local_174), DS, 460, 8)
    ax = 460
    CALL RT_2732_63DF(DS, 460, 8)
    CALL RT_2732_6374(8)
    ax = ax + ".INV"
    local_17C = ax
    OPEN addr(local_17C) FOR RANDOM AS #4 LEN = &HFFFF
    CLOSE #4
    local_178 = &H16F4
    ax = var_0131
    ax = ax + 1
    var_0098 = ax
    ax = var_0098
    var_0131 = ax
    CALL proc_09BED()
    GOTO label_02A00
    CALL proc_0D0CF()
    CALL name_0AF8B()
    local_17E = 15
    local_180 = 0
    CALL color_25283(addr(local_17E), addr(local_180))
    local_182 = 11
    local_184 = 33
    local_188 = "CREATE A CHARACTER"
    local_18A = 0
    CALL locate_print_21DEA(addr(local_182), addr(local_184), addr(local_188), addr(local_18A))
    CALL free_string(addr(local_188))
    local_18C = 11
    local_18E = 0
    CALL color_25283(addr(local_18C), addr(local_18E))
    local_190 = 14
    local_192 = 30
    local_196 = "STR INT CON DEX CHR LCK"
    local_198 = 0
    CALL locate_print_21DEA(addr(local_190), addr(local_192), addr(local_196), addr(local_198))
    CALL free_string(addr(local_196))
    local_19A = 15
    local_19C = 30
    local_1A0 = "=== === === === === ==="
    local_1A2 = 0
    CALL locate_print_21DEA(addr(local_19A), addr(local_19C), addr(local_1A0), addr(local_1A2))
    CALL free_string(addr(local_1A0))
    local_1A4 = 7
    local_1A6 = 0
    CALL color_25283(addr(local_1A4), addr(local_1A6))
    RETURN
    ax = var_01E6
    CALL RT_2F00_0558()
    ' float_D9
    ax = var_01E8
    CALL RT_2F00_0558()
    ' float_D9
    ax = var_01EA
    CALL RT_2F00_0558()
    ' float_D9
    ax = var_01EC
    CALL RT_2F00_0558()
    ' float_D9
    ax = var_01EE
    CALL RT_2F00_0558()
    ' float_D9
    ax = var_01F0
    CALL RT_2F00_0558()
    ' float_D9
    RETURN
  label_02A00:
    CALL free_string(addr(local_174))
    CALL free_string(addr(local_16C))
    CALL free_string(addr(local_13A))
    CALL free_string(addr(local_136))
    CALL free_string(addr(local_F8))
    CALL free_string(addr(local_F4))
    CALL free_string(addr(local_AC))
    CALL free_string(addr(local_A8))
    CALL free_string(addr(local_90))
    CALL free_string(addr(local_8A))
    CALL free_string(addr(local_84))
    CALL free_string(addr(local_7E))
    CALL free_string(addr(local_78))
    CALL free_string(addr(local_72))
    CALL free_string(addr(local_60))
    CALL free_string(addr(local_46))
    CALL free_string(addr(local_58))
    CALL free_string(addr(local_178))
    CALL free_string(addr(local_54))
    CALL erase_array(addr(local_1C))
    CALL free_string(addr(local_17C))
    PROC_EXIT
    RETURN
    GOTO label_0351F
END SUB

SUB fighting_02AD5  ' image &H2AD5, locals 216
  ' strings: FIGHTING | PROTECTION | IDENTIFICATION | REGENERATION | SIGHT | SPEED
    cx = 216
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 48, 4, &H8001, addr(local_1C))
    local_1E = 1
    local_20 = 25
    CALL proc_21194(addr(local_1E), addr(local_20))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "FIGHTING"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "PROTECTION"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "IDENTIFICATION"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "REGENERATION"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "SIGHT"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(6, 1)
    si = bx
    di = "SPEED"
    CALL near_00033()
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "INVISIBILITY"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(8, 1)
    si = bx
    di = "TRAP AVOIDANCE"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(9, 1)
    si = bx
    di = "EVADING"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(10, 1)
    si = bx
    di = "STRENGTH"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(11, 1)
    si = bx
    di = "INTELLIGENCE"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(12, 1)
    si = bx
    di = "CONSTITUTION"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(13, 1)
    si = bx
    di = "DEXTERITY"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(14, 1)
    si = bx
    di = "CHARISMA"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(15, 1)
    si = bx
    di = "LUCK"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(16, 1)
    si = bx
    di = "STATISTICS"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(17, 1)
    si = bx
    di = "EXPERIENCE"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(18, 1)
    si = bx
    di = "WEALTH"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(19, 1)
    si = bx
    di = "WISHING"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(20, 1)
    si = bx
    di = "DAMAGE"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(21, 1)
    si = bx
    di = "SANCTURARY"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(22, 1)
    si = bx
    di = "SLEEP"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(23, 1)
    si = bx
    di = "TAMING"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(24, 1)
    si = bx
    di = "DISPELLING"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(25, 1)
    si = bx
    di = "TELEPORTATION"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(26, 1)
    si = bx
    di = "HEALING"
    CALL near_00033()
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "ITEM REMOVAL"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(28, 1)
    si = bx
    di = "TRAP GENERATION"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(29, 1)
    si = bx
    di = "SUMMONING"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(30, 1)
    si = bx
    di = "MAGIC NULL USER"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(31, 1)
    si = bx
    di = "HURT USER"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(32, 1)
    si = bx
    di = "USER SLEEP"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(33, 1)
    si = bx
    di = "DESTROY ITEM"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(34, 1)
    si = bx
    di = "SICKNESS"
    CALL near_00033()
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "BAZERKER"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(36, 1)
    si = bx
    di = "FLOATING WEAPON"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(38, 1)
    si = bx
    di = "DESTROY WISHES"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(37, 1)
    si = bx
    di = "SPELL INCREASE"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(38, 1)
    si = bx
    di = "DESTROY WISHES"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(39, 1)
    si = bx
    di = "ENHANCE MUSIC"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(40, 1)
    si = bx
    di = "FLOATING MUSIC"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(41, 1)
    si = bx
    di = "SIGHT FILTERING"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(42, 1)
    si = bx
    di = "SONIC/PROTECTION"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(43, 1)
    si = bx
    di = "FIRE/PROTECTION"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(44, 1)
    si = bx
    di = "COLD/PROTECTION"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(45, 1)
    si = bx
    di = "POISON RESIST"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(46, 1)
    si = bx
    di = "DISEASE RESIST"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(47, 1)
    si = bx
    di = "LIGHTNING/PROT"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(48, 1)
    si = bx
    di = "CLEAR MIND"
    CALL near_00033()
    local_22 = 15
    local_24 = 0
    CALL color_25283(addr(local_22), addr(local_24))
    local_32 = 1
    local_34 = 25
    local_38 = "ITEM INFORMATION"
    local_3A = 0
    CALL locate_print_21DEA(addr(local_32), addr(local_34), addr(local_38), addr(local_3A))
    CALL free_string(addr(local_38))
    local_3C = 11
    local_3E = 0
    CALL color_25283(addr(local_3C), addr(local_3E))
    local_40 = 3
    local_42 = 1
    local_46 = "Name:"
    local_48 = 0
    CALL locate_print_21DEA(addr(local_40), addr(local_42), addr(local_46), addr(local_48))
    CALL free_string(addr(local_46))
    local_4A = 3
    local_4C = 32
    si = arg_6
    ax = [si]
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    bx = ax
    local_54 = bx
    CALL RT_2732_63DF(DS, ax, 26)
    local_50 = ax
    local_52 = 0
    CALL locate_print_21DEA(addr(local_4A), addr(local_4C), addr(local_50), addr(local_52))
    ax = addr(local_50)
    PUSH DS
    PUSH addr(local_50)
    ' xor ax,ax
    CALL RT_2732_6404(addr(local_50), DS, local_54, 26)
    CALL free_string(addr(local_50))
    local_56 = 4
    local_58 = 1
    local_5C = "Item type:"
    local_5E = 0
    CALL locate_print_21DEA(addr(local_56), addr(local_58), addr(local_5C), addr(local_5E))
    CALL free_string(addr(local_5C))
    local_60 = 4
    local_62 = 32
    local_64 = 1
    si = arg_6
    ax = [si]
    cx = 68
    PUSH addr(local_60)
    PUSH addr(local_62)
    ' imul cx
    ax = ax + &HBEE
    ax = ax + 52
    si = ax
    cx = [si]
    cx = cx * 2
    cx = cx * 2
    cx = cx + &H1590
    CALL locate_print_21DEA(CX, addr(local_64))
    local_66 = 5
    local_68 = 1
    local_6C = "Attribute affected:"
    local_6E = 0
    CALL locate_print_21DEA(addr(local_66), addr(local_68), addr(local_6C), addr(local_6E))
    CALL free_string(addr(local_6C))
    local_70 = 6
    local_72 = 1
    local_76 = "Magical properties:"
    local_78 = 0
    CALL locate_print_21DEA(addr(local_70), addr(local_72), addr(local_76), addr(local_78))
    CALL free_string(addr(local_76))
    si = arg_6
    ax = [si]
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    ax = ax + 52
    si = ax
    IF [si] <> 10 THEN GOTO label_031B0
    GOTO label_031E8
  label_031B0:
    local_7A = 7
    local_7C = 1
    local_80 = "Amount attribute is affected:"
    local_82 = 0
    CALL locate_print_21DEA(addr(local_7A), addr(local_7C), addr(local_80), addr(local_82))
    CALL free_string(addr(local_80))
  label_031E8:
    si = arg_6
    ax = [si]
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    bx = ax
    ax = ax + 60
    si = ax
    IF [si] == 1 THEN GOTO label_03205
    GOTO label_033DE
  label_03205:
    local_84 = 5
    local_86 = 32
    bx = bx + 54
    si = bx
    bx = addr(local_1C)
    CALL array_element([bx], 1)
    di = bx
    dx = si
    si = addr(local_8A)
    local_8E = dx
    CALL near_00033()
    local_8C = 0
    CALL locate_print_21DEA(addr(local_84), addr(local_86), addr(local_8A), addr(local_8C))
    si = local_8E
    bx = addr(local_1C)
    CALL array_element([si], 1)
    si = bx
    di = addr(local_8A)
    CALL near_00033()
    si = arg_6
    ax = [si]
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    ax = ax + 62
    si = ax
    ax = [si]
    local_90 = ax
    IF local_90 == &HFFFF THEN GOTO label_03290
    GOTO label_032D2
  label_03290:
    local_92 = 6
    local_94 = 32
    local_98 = "CURSED"
    local_9A = 1
    CALL locate_print_21DEA(addr(local_92), addr(local_94), addr(local_98), addr(local_9A))
    CALL free_string(addr(local_98))
    GOTO label_0336A
  label_032D2:
    IF local_90 == 0 THEN GOTO label_032DC
    GOTO label_0331E
  label_032DC:
    local_9C = 6
    local_9E = 32
    local_A2 = "NONE"
    local_A4 = 1
    CALL locate_print_21DEA(addr(local_9C), addr(local_9E), addr(local_A2), addr(local_A4))
    CALL free_string(addr(local_A2))
    GOTO label_0336A
  label_0331E:
    IF local_90 == 1 THEN GOTO label_03328
    GOTO label_0336A
  label_03328:
    local_A6 = 6
    local_A8 = 32
    local_AC = "MAGICALLY ENHANCED"
    local_AE = 1
    CALL locate_print_21DEA(addr(local_A6), addr(local_A8), addr(local_AC), addr(local_AE))
    CALL free_string(addr(local_AC))
    GOTO label_0336A
  label_0336A:
    si = arg_6
    ax = [si]
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    ax = ax + 52
    si = ax
    IF [si] <> 10 THEN GOTO label_03385
    GOTO label_033DB
  label_03385:
    local_B0 = 7
    local_B2 = 32
    local_B4 = 0
    si = arg_6
    ax = [si]
    cx = 68
    PUSH addr(local_B4)
    ' imul cx
    ax = ax + &HBEE
    ax = ax + 56
    CALL proc_25D42(ax)
    local_B8 = ax
    local_BA = 0
    CALL locate_print_21DEA(addr(local_B0), addr(local_B2), addr(local_B8), addr(local_BA))
  label_033DB:
    GOTO label_034F5
  label_033DE:
    local_BC = 5
    local_BE = 32
    local_C2 = "*UNKNOWN"
    local_C4 = 0
    CALL locate_print_21DEA(addr(local_BC), addr(local_BE), addr(local_C2), addr(local_C4))
    CALL free_string(addr(local_C2))
    local_C6 = 6
    local_C8 = 32
    local_CC = "*UNKNOWN"
    local_CE = 0
    CALL locate_print_21DEA(addr(local_C6), addr(local_C8), addr(local_CC), addr(local_CE))
    CALL free_string(addr(local_CC))
    si = arg_6
    ax = [si]
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    ax = ax + 52
    si = ax
    IF [si] <> 10 THEN GOTO label_03477
    GOTO label_034B6
  label_03477:
    local_D0 = 7
    local_D2 = 32
    local_D6 = "*UNKNOWN"
    local_D8 = 0
    CALL locate_print_21DEA(addr(local_D0), addr(local_D2), addr(local_D6), addr(local_D8))
    CALL free_string(addr(local_D6))
  label_034B6:
    local_DA = 9
    local_DC = 1
    local_E0 = "*Item needs to be identified first"
    local_E2 = 0
    CALL locate_print_21DEA(addr(local_DA), addr(local_DC), addr(local_E0), addr(local_E2))
    CALL free_string(addr(local_E0))
  label_034F5:
    CALL hit_any_key_to_continue_2434A()
    CALL free_string(addr(local_B8))
    CALL free_string(addr(local_8A))
    CALL erase_array(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_0392A
END SUB

SUB character_menu_03522  ' image &H3522, locals 144
  ' strings: CHARACTER MENU | A young, scruffy-looking man appears before you.  Although he looks clean, | his cloths are wrinkled and he appears to have a couple of days growth on | his face.  He is wearing what appear to be blue jeans, a T-shirt, tennis  | shoes and a baseball cap.  Although definitely not the type to model men's | underwear in a department store catalogue, he seems likable enough.
    cx = 144
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 12, 4, &H8001, addr(local_1C))
    local_1E = 15
    local_20 = 0
    CALL color_25283(addr(local_1E), addr(local_20))
    local_22 = 1
    local_24 = 35
    local_28 = "CHARACTER MENU"
    local_2A = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_24), addr(local_28), addr(local_2A))
    CALL free_string(addr(local_28))
    local_2C = 11
    local_2E = 0
    CALL color_25283(addr(local_2C), addr(local_2E))
    local_30 = 3
    local_32 = 1
    local_36 = "A young, scruffy-looking man appears before you.  Although he looks clean,"
    local_38 = 1
    CALL locate_print_21DEA(addr(local_30), addr(local_32), addr(local_36), addr(local_38))
    CALL free_string(addr(local_36))
    local_3C = "his cloths are wrinkled and he appears to have a couple of days growth on"
    local_3E = 1
    CALL print_more_21DB9(addr(local_3C), addr(local_3E))
    CALL free_string(addr(local_3C))
    local_42 = "his face.  He is wearing what appear to be blue jeans, a T-shirt, tennis "
    local_44 = 1
    CALL print_more_21DB9(addr(local_42), addr(local_44))
    CALL free_string(addr(local_42))
    local_48 = "shoes and a baseball cap.  Although definitely not the type to model men's"
    local_4A = 1
    CALL print_more_21DB9(addr(local_48), addr(local_4A))
    CALL free_string(addr(local_48))
    local_4E = "underwear in a department store catalogue, he seems likable enough."
    local_50 = 1
    CALL print_more_21DB9(addr(local_4E), addr(local_50))
    CALL free_string(addr(local_4E))
    local_52 = 9
    local_54 = 1
    local_58 = "'Hi!' he says casually. 'My name is Allyn, and I'm the dungeon master around"
    local_5A = 1
    CALL locate_print_21DEA(addr(local_52), addr(local_54), addr(local_58), addr(local_5A))
    CALL free_string(addr(local_58))
    local_5E = "here, until they can find somebody to replace me.  (It's a dull job, but"
    local_60 = 1
    CALL print_more_21DB9(addr(local_5E), addr(local_60))
    CALL free_string(addr(local_5E))
    local_64 = "somebody's gotta do it.)  What do you wish to do today?'"
    local_66 = 1
    CALL print_more_21DB9(addr(local_64), addr(local_66))
    CALL free_string(addr(local_64))
    local_68 = 13
    local_6A = 1
    local_6E = "Choose what you wish to do."
    local_70 = 1
    CALL locate_print_21DEA(addr(local_68), addr(local_6A), addr(local_6E), addr(local_70))
    CALL free_string(addr(local_6E))
    local_72 = 4
    local_74 = 7
    CALL color_25283(addr(local_72), addr(local_74))
    local_76 = 15
    local_78 = 1
    local_7C = "CURRENTLY USING "
    local_7E = 0
    CALL locate_print_21DEA(addr(local_76), addr(local_78), addr(local_7C), addr(local_7E))
    CALL free_string(addr(local_7C))
    local_80 = 0
    CALL print_more_21DB9(arg_8, addr(local_80))
    local_82 = 7
    local_84 = 0
    CALL color_25283(addr(local_82), addr(local_84))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(R) RUN IN THE DUNGEON"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(F) FIND EACH LEVEL'S EXPERIENCE"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(A) ATTRIBUTES/INVENTORY MANAGEMENT"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "(I) INTRODUCTION"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "(S) VISIT THE SHOP"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(6, 1)
    si = bx
    di = "(H) HELP"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(7, 1)
    si = bx
    di = "(C) VISIT THE CLERIC"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(8, 1)
    si = bx
    di = "(D) CHANGE SYSTEM DEFAULTS"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(9, 1)
    si = bx
    di = "(W) MAKE A WISH"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(10, 1)
    si = bx
    di = "(P) PRINT THE REGISTRATION FORM"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(11, 1)
    si = bx
    di = "(Q or ESC) SAVE AND RETURN TO MAIN MENU"
    CALL near_00033()
    local_86 = 11
    local_88 = 2
    local_8A = 1
    local_8C = 17
    local_8E = 2
    local_90 = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_86), addr(local_88), addr(local_8A), addr(local_8C), addr(local_8E), arg_6, addr(local_96), addr(local_90))
    local_94 = ax
    local_9A = addr(local_94)
    CALL free_string(addr(local_94))
    CALL erase_array(addr(local_1C))
    CALL RT_2732_64F5(addr(local_9A))
    PROC_EXIT
    RETURN
    GOTO label_03BA1
END SUB

SUB maintenance_menu_0392D  ' image &H392D, locals 78
  ' strings: MAINTENANCE MENU | You need to pick a character to run in the game.  This character can already | exist or can be created.  Please choose what you wish to do: | (U) USE AN EXISTING CHARACTER | (C) CREATE A NEW CHARACTER | (L) LIST ALL CHARACTERS
    cx = 78
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 11, 4, &H8001, addr(local_1C))
    local_1E = 15
    local_20 = 0
    CALL color_25283(addr(local_1E), addr(local_20))
    local_22 = 1
    local_24 = 28
    local_28 = "MAINTENANCE MENU"
    local_2A = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_24), addr(local_28), addr(local_2A))
    CALL free_string(addr(local_28))
    local_2C = 11
    local_2E = 0
    CALL color_25283(addr(local_2C), addr(local_2E))
    local_30 = 3
    local_32 = 1
    local_36 = "You need to pick a character to run in the game.  This character can already"
    local_38 = 1
    CALL locate_print_21DEA(addr(local_30), addr(local_32), addr(local_36), addr(local_38))
    CALL free_string(addr(local_36))
    local_3C = "exist or can be created.  Please choose what you wish to do:"
    local_3E = 0
    CALL print_more_21DB9(addr(local_3C), addr(local_3E))
    CALL free_string(addr(local_3C))
    local_40 = 7
    local_42 = 0
    CALL color_25283(addr(local_40), addr(local_42))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(U) USE AN EXISTING CHARACTER"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(C) CREATE A NEW CHARACTER"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(L) LIST ALL CHARACTERS"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "(A) SHOW SOMEONE'S ATTRIBUTES/INVENTORY"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "(F) FIND THE EXPERIENCE FOR A LEVEL"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(6, 1)
    si = bx
    di = "(K) KILL AN EXISTING CHARACTER"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(7, 1)
    si = bx
    di = "(D) CHANGE SYSTEM DEFAULTS"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(8, 1)
    si = bx
    di = "(H) HELP"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(9, 1)
    si = bx
    di = "(I) INTRODUCTION"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(10, 1)
    si = bx
    di = "(P) PRINT THE REGISTRATION FORM"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(11, 1)
    si = bx
    di = "(Q or ESC) QUIT THE GAME"
    CALL near_00033()
    local_44 = 11
    local_46 = 1
    local_48 = 22
    local_4A = 6
    local_4C = 2
    local_4E = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_44), addr(local_46), addr(local_48), addr(local_4A), addr(local_4C), arg_6, addr(local_54), addr(local_4E))
    local_52 = ax
    local_58 = addr(local_52)
    CALL free_string(addr(local_52))
    CALL erase_array(addr(local_1C))
    CALL RT_2732_64F5(addr(local_58))
    PROC_EXIT
    RETURN
    GOTO label_04D9A
END SUB

SUB fortunately_you_avoid_it_03BA4  ' image &H3BA4, locals 154
  ' strings: An Easter Island head falls from the | sky. While admiring its beauty, you | can't help thinking how uncomfortable | it would be if it landed on you. | Fortunately, you avoid it. | Well, you're about to find out!
    cx = 154
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 6, 40, 513, addr(local_1C))
    CALL proc_0AA39()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ax = 0
    IF var_0212 <> 1 THEN GOTO label_03BF5
    ax = ax - 1
  label_03BF5:
    cx = 0
    IF var_00BA <> 1 THEN GOTO label_03C00
    cx = cx - 1
  label_03C00:
    ' or cx,ax
    ' and cx,cx
    IF var_00BA <> 1 THEN GOTO label_03C09
    GOTO label_03C17
  label_03C09:
    ' float_D9
    ' float_D9
    GOTO label_03C37
  label_03C17:
    local_26 = 10
    CALL proc_25C7F(172, addr(local_26), addr(local_2A))
    ' float_D9
    ' float_D9
  label_03C37:
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00BA == 1 THEN GOTO label_03C56
    GOTO label_03DE4
  label_03C56:
    ax = "An Easter Island head falls from the"
    PUSH DS
    PUSH "An Easter Island head falls from the"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("An Easter Island head falls from the", 1, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "sky. While admiring its beauty, you"
    PUSH DS
    PUSH "sky. While admiring its beauty, you"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("sky. While admiring its beauty, you", 2, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "can't help thinking how uncomfortable"
    PUSH DS
    PUSH "can't help thinking how uncomfortable"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("can't help thinking how uncomfortable", 3, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "it would be if it landed on you."
    PUSH DS
    PUSH "it would be if it landed on you."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("it would be if it landed on you.", 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "Fortunately, you avoid it."
    PUSH DS
    PUSH "Fortunately, you avoid it."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("Fortunately, you avoid it.", 5, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "Well, you're about to find out!"
    PUSH DS
    PUSH "Well, you're about to find out!"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("Well, you're about to find out!", 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00BA == 1 THEN GOTO label_03D3A
    GOTO label_03DE1
  label_03D3A:
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_01F4
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_30 = ax
    var_01E2 = var_01E2 - ax
    CALL near_04A1B()
    local_34 = "FALLING ROCK"
    CALL loss_of_str_007A9(addr(local_34))
    CALL free_string(addr(local_34))
    local_36 = 0
    CALL proc_25D42(addr(local_36), addr(local_30))
    local_3A = ax
    ax = "You've been hit for " + addr(local_3A)
    ax = ax + " hitpoints"
    local_44 = ax
    local_3C = 9
    local_3E = 41
    local_40 = 0
    CALL locate_print_21DEA(addr(local_3C), addr(local_3E), addr(local_44), addr(local_40))
  label_03DE1:
    GOTO label_04A18
  label_03DE4:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00BA == 1 THEN GOTO label_03DF9
    GOTO label_03F11
  label_03DF9:
    ax = "Gas starts seeping up from the ground."
    PUSH DS
    PUSH "Gas starts seeping up from the ground."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("Gas starts seeping up from the ground.", 1, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "As you breath it, all your troubles"
    PUSH DS
    PUSH "As you breath it, all your troubles"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("As you breath it, all your troubles", 2, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "seem to fade.  You begin to feel"
    PUSH DS
    PUSH "seem to fade.  You begin to feel"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("seem to fade.  You begin to feel", 3, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "like Dorthy surronded by poppies."
    PUSH DS
    PUSH "like Dorthy surronded by poppies."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("like Dorthy surronded by poppies.", 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "Somehow, you stay awake."
    PUSH DS
    PUSH "Somehow, you stay awake."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("Somehow, you stay awake.", 5, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "You doze off."
    PUSH DS
    PUSH "You doze off."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You doze off.", 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00BA == 1 THEN GOTO label_03EDD
    GOTO label_03F0B
  label_03EDD:
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_01F4
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    var_00B0 = ax
  label_03F0B:
    CALL near_04A1B()
    GOTO label_04A18
  label_03F11:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00BA == 1 THEN GOTO label_03F26
    GOTO label_04024
  label_03F26:
    ax = "Three TROLLS, a STONE GOLEM, two"
    PUSH DS
    PUSH "Three TROLLS, a STONE GOLEM, two"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("Three TROLLS, a STONE GOLEM, two", 1, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "MINOTAURS, four OGRES, and a"
    PUSH DS
    PUSH "MINOTAURS, four OGRES, and a"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("MINOTAURS, four OGRES, and a", 2, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "LAND GIANT ambush you and force"
    PUSH DS
    PUSH "LAND GIANT ambush you and force"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("LAND GIANT ambush you and force", 3, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "you to read a BOOK OF LIES!"
    PUSH DS
    PUSH "you to read a BOOK OF LIES!"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("you to read a BOOK OF LIES!", 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "Miraculously, you escape!"
    PUSH DS
    PUSH "Miraculously, you escape!"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("Miraculously, you escape!", 5, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00BA == 1 THEN GOTO label_03FE7
    GOTO label_0401E
  label_03FE7:
    ax = "You awake with less experience!"
    PUSH DS
    PUSH "You awake with less experience!"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You awake with less experience!", 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = var_010E
    dx = var_0110
    ax = ax + &HFC18
    ' adc dx,0xffffffffffffffff
    var_021C = ax
    var_021E = dx
  label_0401E:
    CALL near_04A1B()
    GOTO label_04A18
  label_04024:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00BA == 1 THEN GOTO label_04039
    GOTO label_04236
  label_04039:
    ax = "While meandering around, a light rain"
    PUSH DS
    PUSH "While meandering around, a light rain"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("While meandering around, a light rain", 1, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "starts to fall."
    PUSH DS
    PUSH "starts to fall."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("starts to fall.", 2, 1)
    CALL RT_2732_6404(ES, BX, 40)
    IF var_0141 == 0 THEN GOTO label_04086
    GOTO label_040AC
  label_04086:
    ax = "It glistens off your hands."
    PUSH DS
    PUSH "It glistens off your hands."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("It glistens off your hands.", 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    GOTO label_04230
  label_040AC:
    ax = 68
    ' imul word [0x141]
    bx = ax
    ax = ax + &HBEE
    local_46 = bx
    CALL RT_2732_63DF(DS, ax, 26)
    CALL RT_2732_6374(26)
    local_4A = ax
    ax = local_46
    ax = ax + &HBEE
    bx = ax
    ax = ax + 62
    si = ax
    cx = 0
    IF [si] <> 1 THEN GOTO label_040EC
    cx = cx - 1
  label_040EC:
    bx = bx + 54
    si = bx
    ax = 0
    IF [bx] == 1 THEN GOTO label_040FA
    ax = ax - 1
  label_040FA:
    ' or ax,cx
    ' and ax,ax
    IF [bx] <> 1 THEN GOTO label_04103
    GOTO label_0414C
  label_04103:
    ax = "It glistens off your "
    PUSH DS
    PUSH "It glistens off your "
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("It glistens off your ", 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = addr(local_4A)
    PUSH DS
    PUSH addr(local_4A)
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(addr(local_4A), 5, 1)
    CALL RT_2732_6404(ES, BX, 40)
    GOTO label_04230
  label_0414C:
    ax = "You notice the rain changing your"
    PUSH DS
    PUSH "You notice the rain changing your"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You notice the rain changing your", 3, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = addr(local_4A) + "'s color!"
    PUSH DS
    PUSH 40
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(40, 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "You quickly sheath your " + addr(local_4A)
    PUSH DS
    PUSH 40
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(40, 5, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "Your " + addr(local_4A)
    ax = ax + " turns to rust!"
    PUSH DS
    PUSH 40
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(40, 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
    local_4C = 1
    CALL proc_00A98(321, addr(local_4C), addr(local_50))
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [bx] == 1 THEN GOTO label_04227
    GOTO label_04230
  label_04227:
    CALL proc_04D9D(addr(local_56))
  label_04230:
    CALL near_04A1B()
    GOTO label_04A18
  label_04236:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [bx] == 1 THEN GOTO label_0424B
    GOTO label_043EC
  label_0424B:
    ax = "You find yourself stuck in the mire."
    PUSH DS
    PUSH "You find yourself stuck in the mire."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You find yourself stuck in the mire.", 1, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "After screaming for help, a nymph"
    PUSH DS
    PUSH "After screaming for help, a nymph"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("After screaming for help, a nymph", 2, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "appears.  She agrees to help you"
    PUSH DS
    PUSH "appears.  She agrees to help you"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("appears.  She agrees to help you", 3, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "for a fee. You feel obligated to agree."
    PUSH DS
    PUSH "for a fee. You feel obligated to agree."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("for a fee. You feel obligated to agree.", 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "She ends up refusing your money."
    PUSH DS
    PUSH "She ends up refusing your money."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("She ends up refusing your money.", 5, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [bx] == 1 THEN GOTO label_0430C
    GOTO label_043E6
  label_0430C:
    PUSH var_0222
    PUSH var_0220
    ' xor ax,ax
    ' cwd
    CALL RT_2732_7413(DX, 40)
    IF [bx] == 1 THEN GOTO label_04323
    GOTO label_04349
  label_04323:
    ax = "Finding no money on you, she leaves"
    PUSH DS
    PUSH "Finding no money on you, she leaves"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("Finding no money on you, she leaves", 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
    GOTO label_043E6
  label_04349:
    ax = var_0220
    dx = var_0222
    CALL RT_2F00_0559()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_DE
    ' float_DC
    CALL RT_2F00_05DF()
    ' float_DC
    CALL RT_2F00_057D()
    var_0220 = ax
    var_0222 = dx
    PUSH var_0222
    PUSH var_0220
    ' xor ax,ax
    ' cwd
    CALL RT_2732_7413(DX, var_0220)
    IF [bx] <= 1 THEN GOTO label_04396
    GOTO label_043C3
  label_04396:
    var_0220 = ax
    var_0222 = dx
    ax = "She takes all of your money."
    PUSH DS
    PUSH "She takes all of your money."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("She takes all of your money.", 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
    GOTO label_043E6
  label_043C3:
    ax = "She takes most of your money."
    PUSH DS
    PUSH "She takes most of your money."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("She takes most of your money.", 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
  label_043E6:
    CALL near_04A1B()
    GOTO label_04A18
  label_043EC:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [bx] == 1 THEN GOTO label_04401
    GOTO label_044F1
  label_04401:
    ax = "You see a bright light.  A voice in"
    PUSH DS
    PUSH "You see a bright light.  A voice in"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You see a bright light.  A voice in", 1, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "the background becons you to move"
    PUSH DS
    PUSH "the background becons you to move"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("the background becons you to move", 2, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "toward the light.  As you start"
    PUSH DS
    PUSH "toward the light.  As you start"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("toward the light.  As you start", 3, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "to move, the light gets more intense."
    PUSH DS
    PUSH "to move, the light gets more intense."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("to move, the light gets more intense.", 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "You stop moving forward."
    PUSH DS
    PUSH "You stop moving forward."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You stop moving forward.", 5, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "Now you can't see anything."
    PUSH DS
    PUSH "Now you can't see anything."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("Now you can't see anything.", 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [bx] == 1 THEN GOTO label_044E5
    GOTO label_044EB
  label_044E5:
    var_0214 = 1
  label_044EB:
    CALL near_04A1B()
    GOTO label_04A18
  label_044F1:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [bx] == 1 THEN GOTO label_04506
    GOTO label_04639
  label_04506:
    ax = "You hit a trip wire.  50 darts fire"
    PUSH DS
    PUSH "You hit a trip wire.  50 darts fire"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You hit a trip wire.  50 darts fire", 1, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "at you.  The first 23 go to your"
    PUSH DS
    PUSH "at you.  The first 23 go to your"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("at you.  The first 23 go to your", 2, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "left. The next 19 go to your right."
    PUSH DS
    PUSH "left. The next 19 go to your right."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("left. The next 19 go to your right.", 3, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "7 hit the ground in front of you."
    PUSH DS
    PUSH "7 hit the ground in front of you."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("7 hit the ground in front of you.", 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "You dodge the last one."
    PUSH DS
    PUSH "You dodge the last one."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You dodge the last one.", 5, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = 0
    IF var_00CC <> 1 THEN GOTO label_045BD
    ax = ax - 1
  label_045BD:
    cx = 0
    IF var_00CA <> 1 THEN GOTO label_045C8
    cx = cx - 1
  label_045C8:
    ' or cx,ax
    ' and cx,cx
    IF var_00CA <> 1 THEN GOTO label_045D1
    GOTO label_045F7
  label_045D1:
    ax = "The last one hits! It has no effect!"
    PUSH DS
    PUSH "The last one hits! It has no effect!"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("The last one hits! It has no effect!", 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
    GOTO label_04633
  label_045F7:
    ax = "The last one hits! You're sick."
    PUSH DS
    PUSH "The last one hits! You're sick."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("The last one hits! You're sick.", 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00CA == 1 THEN GOTO label_0462F
    GOTO label_04633
  label_0462F:
    var_020A = var_020A + 1
  label_04633:
    CALL near_04A1B()
    GOTO label_04A18
  label_04639:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00CA == 1 THEN GOTO label_0464E
    GOTO label_0477E
  label_0464E:
    ax = "You find a magnifying glass. Thinking"
    PUSH DS
    PUSH "You find a magnifying glass. Thinking"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You find a magnifying glass. Thinking", 1, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "it would help you see your map"
    PUSH DS
    PUSH "it would help you see your map"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("it would help you see your map", 2, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "better, you hold it over the map."
    PUSH DS
    PUSH "better, you hold it over the map."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("better, you hold it over the map.", 3, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "As light intensifies, your map ignites!"
    PUSH DS
    PUSH "As light intensifies, your map ignites!"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("As light intensifies, your map ignites!", 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "You put it out."
    PUSH DS
    PUSH "You put it out."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You put it out.", 5, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "There'll always be other maps."
    PUSH DS
    PUSH "There'll always be other maps."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("There'll always be other maps.", 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00CA == 1 THEN GOTO label_04732
    GOTO label_04778
  label_04732:
    CALL RT_2732_62BC(&H3F6)
    PUSH DS
    PUSH &H3F6
    ' xor ax,ax
    ax = 654
    CALL RT_2732_6404(&H3F6, DS, 654, &H3F6)
    CALL proc_0C32E()
    local_58 = 0
    local_5A = 0
    CALL you_can_see_again_147F8(addr(local_58), addr(local_5A), addr(local_5E))
    ' float_D9
    ' float_D9
  label_04778:
    CALL near_04A1B()
    GOTO label_04A18
  label_0477E:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00CA == 1 THEN GOTO label_04793
    GOTO label_04914
  label_04793:
    ax = "Dark clouds gather as a heavy rain"
    PUSH DS
    PUSH "Dark clouds gather as a heavy rain"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("Dark clouds gather as a heavy rain", 1, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "falls.  The rain is foul-smelling."
    PUSH DS
    PUSH "falls.  The rain is foul-smelling."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("falls.  The rain is foul-smelling.", 2, 1)
    CALL RT_2732_6404(ES, BX, 40)
    IF var_013F == 0 THEN GOTO label_047E0
    GOTO label_04806
  label_047E0:
    ax = "You weather the storm."
    PUSH DS
    PUSH "You weather the storm."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You weather the storm.", 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    GOTO label_0490E
  label_04806:
    ax = 68
    ' imul word [0x13f]
    ax = ax + &HBEE
    ax = ax + 62
    si = ax
    IF [si] < 1 THEN GOTO label_0481E
    GOTO label_048EB
  label_0481E:
    ax = "You notice a smoke raising from"
    PUSH DS
    PUSH "You notice a smoke raising from"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You notice a smoke raising from", 3, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "your armor!"
    PUSH DS
    PUSH "your armor!"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("your armor!", 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "You quickly find shelter."
    PUSH DS
    PUSH "You quickly find shelter."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You quickly find shelter.", 5, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "Your armor disintigrates!"
    PUSH DS
    PUSH "Your armor disintigrates!"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("Your armor disintigrates!", 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [si] == 1 THEN GOTO label_048BF
    GOTO label_048E8
  label_048BF:
    local_64 = 1
    CALL proc_00A98(319, addr(local_64), addr(local_68))
    ' float_D9
    ' float_D9
    CALL proc_04D9D(addr(local_56))
  label_048E8:
    GOTO label_0490E
  label_048EB:
    ax = "Your armor is unaffected! (Whew!)"
    PUSH DS
    PUSH "Your armor is unaffected! (Whew!)"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("Your armor is unaffected! (Whew!)", 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
  label_0490E:
    CALL near_04A1B()
    GOTO label_04A18
  label_04914:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [si] == 1 THEN GOTO label_04929
    GOTO label_04A18
  label_04929:
    ax = "You see an floating orb drifting by. It"
    PUSH DS
    PUSH "You see an floating orb drifting by. It"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You see an floating orb drifting by. It", 1, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "emits some strange kind of ray.  You"
    PUSH DS
    PUSH "emits some strange kind of ray.  You"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("emits some strange kind of ray.  You", 2, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "feel an internal wrenching and more"
    PUSH DS
    PUSH "feel an internal wrenching and more"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("feel an internal wrenching and more", 3, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "than a little nauseous "
    PUSH DS
    PUSH "than a little nauseous "
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("than a little nauseous ", 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "The feeling seems to pass."
    PUSH DS
    PUSH "The feeling seems to pass."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("The feeling seems to pass.", 5, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ax = "You wake up in a strange place."
    PUSH DS
    PUSH "You wake up in a strange place."
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("You wake up in a strange place.", 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [si] == 1 THEN GOTO label_04A0D
    GOTO label_04A12
  label_04A0D:
    CALL proc_09E62()
  label_04A12:
    CALL near_04A1B()
    GOTO label_04A18
  label_04A18:
    GOTO label_04D6E
    local_6A = 2
    local_6C = 41
    bx = addr(local_1C)
    CALL array_element(1, 1)
    CALL RT_2732_63DF(ES, BX, 40)
    local_70 = ax
    local_72 = 1
    CALL locate_print_21DEA(addr(local_6A), addr(local_6C), addr(local_70), addr(local_72))
    ax = addr(local_70)
    PUSH DS
    PUSH addr(local_70)
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(addr(local_70), 1, 1)
    CALL RT_2732_6404(ES, BX, 40)
    CALL free_string(addr(local_70))
    local_74 = 3
    local_76 = 41
    bx = addr(local_1C)
    CALL array_element(2, 1)
    CALL RT_2732_63DF(ES, BX, 40)
    local_7A = ax
    local_7C = 1
    CALL locate_print_21DEA(addr(local_74), addr(local_76), addr(local_7A), addr(local_7C))
    ax = addr(local_7A)
    PUSH DS
    PUSH addr(local_7A)
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(addr(local_7A), 2, 1)
    CALL RT_2732_6404(ES, BX, 40)
    CALL free_string(addr(local_7A))
    local_7E = 4
    local_80 = 41
    bx = addr(local_1C)
    CALL array_element(3, 1)
    CALL RT_2732_63DF(ES, BX, 40)
    local_84 = ax
    local_86 = 1
    CALL locate_print_21DEA(addr(local_7E), addr(local_80), addr(local_84), addr(local_86))
    ax = addr(local_84)
    PUSH DS
    PUSH addr(local_84)
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(addr(local_84), 3, 1)
    CALL RT_2732_6404(ES, BX, 40)
    CALL free_string(addr(local_84))
    local_88 = 5
    local_8A = 41
    bx = addr(local_1C)
    CALL array_element(4, 1)
    CALL RT_2732_63DF(ES, BX, 40)
    local_8E = ax
    local_90 = 1
    CALL locate_print_21DEA(addr(local_88), addr(local_8A), addr(local_8E), addr(local_90))
    ax = addr(local_8E)
    PUSH DS
    PUSH addr(local_8E)
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(addr(local_8E), 4, 1)
    CALL RT_2732_6404(ES, BX, 40)
    CALL free_string(addr(local_8E))
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [si] == 1 THEN GOTO label_04C06
    GOTO label_04C86
  label_04C06:
    local_92 = 7
    local_94 = 41
    bx = addr(local_1C)
    CALL array_element(5, 1)
    CALL RT_2732_63DF(ES, BX, 40)
    local_98 = ax
    local_9A = 1
    CALL locate_print_21DEA(addr(local_92), addr(local_94), addr(local_98), addr(local_9A))
    ax = addr(local_98)
    PUSH DS
    PUSH addr(local_98)
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(addr(local_98), 5, 1)
    CALL RT_2732_6404(ES, BX, 40)
    CALL free_string(addr(local_98))
    GOTO label_04D03
  label_04C86:
    local_9C = 7
    local_9E = 41
    bx = addr(local_1C)
    CALL array_element(6, 1)
    CALL RT_2732_63DF(ES, BX, 40)
    local_A2 = ax
    local_A4 = 1
    CALL locate_print_21DEA(addr(local_9C), addr(local_9E), addr(local_A2), addr(local_A4))
    ax = addr(local_A2)
    PUSH DS
    PUSH addr(local_A2)
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(addr(local_A2), 6, 1)
    CALL RT_2732_6404(ES, BX, 40)
    CALL free_string(addr(local_A2))
  label_04D03:
    CALL hit_any_key_to_continue_2434A()
    CALL RT_2732_7413(var_021E, var_021C, var_0110, var_010E)
    ax = 0
    IF [si] >= 1 THEN GOTO label_04D23
    ax = ax - 1
  label_04D23:
    CALL RT_2732_7413(var_021E, var_021C, var_010C, var_010A)
    cx = 0
    IF [si] <= 1 THEN GOTO label_04D3E
    cx = cx - 1
  label_04D3E:
    ' or cx,ax
    ax = 0
    IF var_01E2 >= 0 THEN GOTO label_04D4B
    ax = ax - 1
  label_04D4B:
    ' or ax,cx
    ' and ax,ax
    IF var_01E2 <> 0 THEN GOTO label_04D54
    GOTO label_04D59
  label_04D54:
    CALL proc_0AA39()
  label_04D59:
    CALL mage_0C4A1()
    IF var_0112 == 0 THEN GOTO label_04D68
    GOTO label_04D6D
  label_04D68:
    CALL name_0AF8B()
  label_04D6D:
    RETURN
  label_04D6E:
    CALL free_string(addr(local_3A))
    CALL free_string(addr(local_44))
    CALL erase_array(addr(local_1C))
    CALL free_string(addr(local_4A))
    PROC_EXIT
    RETURN
    GOTO label_04E20
END SUB

SUB proc_04D9D  ' image &H4D9D, locals 8
    cx = 8
    CALL frame_enter()
    ax = var_012F
    ax = ax - 1
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    si = arg_6
    ax = [si]
    bx = ax
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF ? <= ? THEN GOTO label_04DD0
    GOTO label_04E0C
  label_04DD0:
    ' float_D9
    CALL RT_2F00_056C()
    local_C = ax
    ax = bx
    GOTO label_04E04
  label_04DE2:
    cx = 68
    ' imul cx
    bx = ax
    ax = ax + &HC32
    bx = bx + &HBEE
    CALL RT_2732_6404(DS, ax, cx, DS, BX, cx)
    ax = local_12
    ax = ax + 1
  label_04E04:
    local_12 = ax
    IF ax <= local_C THEN GOTO label_04DE2
  label_04E0C:
    ' float_D9
    CALL RT_2F00_056C()
    var_012F = ax
    PROC_EXIT
    RETURN
    GOTO label_05BB1
END SUB

SUB enter_04E23  ' image &H4E23, locals 312
  ' strings: ENTER | ESCAPE | The monster was carrying a pouch! | You have found a treasure chest. | What do you wish to do? | (O) Open it
    cx = 312
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 4, 4, &H8001, addr(local_1C))
  label_04E40:
    ax = 72
    ax = 112
    CALL RT_2732_6404(DS, 72, 1, DS, 112, 2)
    ax = 74
    ax = 114
    CALL RT_2732_6404(DS, 74, 1, DS, 114, 2)
    ax = "ENTER"
    PUSH DS
    PUSH "ENTER"
    ' xor ax,ax
    ax = 116
    CALL RT_2732_6404("ENTER", DS, 116, 10)
    ax = "ESCAPE"
    PUSH DS
    PUSH "ESCAPE"
    ' xor ax,ax
    ax = 126
    CALL RT_2732_6404("ESCAPE", DS, 126, 10)
    CALL proc_0AA39()
    si = arg_6
    IF [si] == 1 THEN GOTO label_04EAA
    GOTO label_04EB6
  label_04EAA:
    local_20 = "The monster was carrying a pouch!"
    GOTO label_04EBF
  label_04EB6:
    local_20 = "You have found a treasure chest."
  label_04EBF:
    local_22 = 2
    local_24 = 42
    local_26 = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_24), addr(local_20), addr(local_26))
    local_28 = 3
    local_2A = 42
    local_2E = "What do you wish to do?"
    local_30 = 1
    CALL locate_print_21DEA(addr(local_28), addr(local_2A), addr(local_2E), addr(local_30))
    CALL free_string(addr(local_2E))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(O) Open it"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(Q) Leave it"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(C) Cast spell"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "(I) Inventory management"
    CALL near_00033()
    local_32 = 4
    local_34 = 1
    local_36 = 42
    local_38 = 5
    local_3A = 2
    local_3C = 0
    local_3E = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_32), addr(local_34), addr(local_36), addr(local_38), addr(local_3A), addr(local_3C), addr(local_4A), addr(local_3E))
    local_42 = ax
    local_4E = addr(local_42)
    local_46 = addr(local_4E)
    CALL RT_2732_6130(addr(local_46), &H16D6)
    IF [si] == 1 THEN GOTO label_04FEE
    GOTO label_04FFF
  label_04FEE:
    local_48 = 0
    CALL cast_a_spell_00423(addr(local_48))
    GOTO label_05133
  label_04FFF:
    CALL RT_2732_6130(addr(local_46), &H1750)
    IF [si] == 1 THEN GOTO label_05011
    GOTO label_05031
  label_05011:
    local_50 = 0
    CALL wield_0684E(addr(local_50))
    CALL proc_0D0CF()
    CALL name_0AF8B()
    CALL proc_0C32E()
    GOTO label_05133
  label_05031:
    CALL RT_2732_6130(addr(local_46), &H16D0)
    IF [si] <> 1 THEN GOTO label_05043
    GOTO label_05060
  label_05043:
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_46))
    IF [si] == 1 THEN GOTO label_05060
    GOTO label_050C4
  label_05060:
    ax = 78
    ' imul word [0x28c]
    ax = ax + var_028A
    ax = ax + &HFFB2
    CALL RT_2F00_0558()
    ' float_D9
    ax = &H684
    ' float_D9
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    PUSH &H3442
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
    ax = 654
    ' float_D9
    PUSH DS
    PUSH 654
    PUSH &H3F6
    PUSH &H3442
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
    CALL proc_0AA39()
    GOTO label_05B2D
    GOTO label_05133
  label_050C4:
    CALL RT_2732_6130(addr(local_46), &H3448)
    IF [si] == 1 THEN GOTO label_050D6
    GOTO label_050DF
  label_050D6:
    CALL near_051C2()
    GOTO label_05136
    GOTO label_05133
  label_050DF:
    local_58 = "That was not a valid choice. Please retype!"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_5C = ax
    CALL proc_2311E(addr(local_58), addr(local_5C))
    ax = addr(local_5C)
    PUSH DS
    PUSH addr(local_5C)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_5C), DS, 79, 1)
    CALL free_string(addr(local_58))
    CALL free_string(addr(local_5C))
  label_05133:
    GOTO label_04E40
  label_05136:
    local_60 = "TRAPPED TREASURE CHEST"
    CALL loss_of_str_007A9(addr(local_60))
    CALL free_string(addr(local_60))
    CALL RT_2732_7413(var_021E, var_021C, var_010C, var_010A)
    ax = 0
    IF [si] <= 1 THEN GOTO label_0516C
    ax = ax - 1
  label_0516C:
    CALL RT_2732_7413(var_021E, var_021C, var_0110, var_010E)
    cx = 0
    IF [si] >= 1 THEN GOTO label_05187
    cx = cx - 1
  label_05187:
    ' or cx,ax
    si = arg_6
    ax = 0
    IF [si] <> 1 THEN GOTO label_05195
    ax = ax - 1
  label_05195:
    dx = 0
    IF var_00EC <> 0 THEN GOTO label_051A0
    dx = dx - 1
  label_051A0:
    ' and dx,ax
    ' or dx,cx
    ' and dx,dx
    IF var_00EC <> 0 THEN GOTO label_051AB
    GOTO label_051B5
  label_051AB:
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0AA39()
  label_051B5:
    CALL mage_0C4A1()
    CALL name_0AF8B()
    GOTO label_05B2D
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00EC == 0 THEN GOTO label_051F3
    GOTO label_05391
  label_051F3:
    CALL proc_0AA39()
    local_66 = 2
    local_68 = 42
    local_6C = "It was trapped!"
    local_6E = 1
    CALL locate_print_21DEA(addr(local_66), addr(local_68), addr(local_6C), addr(local_6E))
    CALL free_string(addr(local_6C))
    local_70 = 40
    CALL proc_25C7F(172, addr(local_70), addr(local_74))
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00EC <> 0 THEN GOTO label_05266
    ax = ax - 1
  label_05266:
    cx = 0
    IF var_0212 <> 0 THEN GOTO label_05271
    cx = cx - 1
  label_05271:
    ' and cx,ax
    ax = 0
    IF var_00BA <> 0 THEN GOTO label_0527E
    ax = ax - 1
  label_0527E:
    ' and ax,cx
    ' and ax,ax
    IF var_00BA <> 0 THEN GOTO label_05287
    GOTO label_0534D
  label_05287:
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_01F4
    CALL RT_2F00_0558()
    ' float_DE
    ax = var_009E
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_86 = ax
    local_76 = 0
    CALL proc_25D42(addr(local_76), addr(local_86))
    local_7A = ax
    ax = "You've been damaged for " + addr(local_7A)
    ax = ax + " hitpoints"
    local_20 = ax
    local_7C = 4
    local_7E = 41
    local_80 = 0
    CALL locate_print_21DEA(addr(local_7C), addr(local_7E), addr(local_20), addr(local_80))
    ax = local_86
    var_01E2 = var_01E2 - ax
    local_8A = "TRAPPED CHEST"
    CALL loss_of_str_007A9(addr(local_8A))
    CALL free_string(addr(local_8A))
    IF var_0112 == 1 THEN GOTO label_05349
    GOTO label_0534A
  label_05349:
    RETURN
  label_0534A:
    GOTO label_0538C
  label_0534D:
    local_8C = 4
    local_8E = 42
    local_92 = "Fortunately, you sidestepped it!"
    local_94 = 0
    CALL locate_print_21DEA(addr(local_8C), addr(local_8E), addr(local_92), addr(local_94))
    CALL free_string(addr(local_92))
  label_0538C:
    CALL hit_any_key_to_continue_2434A()
  label_05391:
    CALL proc_0AA39()
    ax = var_01F4
    ax = ax * 2
    local_96 = ax
    local_98 = 30
    CALL proc_25C7F(addr(local_96), addr(local_98), addr(local_9C))
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0112 == 1 THEN GOTO label_053DB
    GOTO label_053E1
  label_053DB:
    CALL near_056A4()
    GOTO label_053E4
  label_053E1:
    CALL near_0547C()
  label_053E4:
    ax = 78
    ' imul word [0x28c]
    ax = ax + var_028A
    ax = ax + &HFFB2
    CALL RT_2F00_0558()
    ' float_D9
    ax = &H684
    CALL RT_2732_63DF(DS, &H684, &H3F6)
    ' float_D9
    PUSH &H3F6
    CALL RT_2F00_056C()
    CALL RT_2732_6266(&H3F6, 1)
    local_A4 = ax
    CALL RT_2732_6130(addr(local_A4), &H3442)
    IF var_0112 == 1 THEN GOTO label_0543B
    GOTO label_0547B
  label_0543B:
    ax = &H684
    ' float_D9
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    PUSH &H178E
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
    ax = 654
    ' float_D9
    PUSH DS
    PUSH 654
    PUSH &H3F6
    PUSH &H3510
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
  label_0547B:
    RETURN
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    ' float_D8
    ax = var_01F4
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    ' float_DE
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_A6 = ax
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0112 == 1 THEN GOTO label_054E8
    GOTO label_054FE
  label_054E8:
    ' float_D9
    ' float_D9
    local_B2 = "gold"
  label_054FE:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0112 == 1 THEN GOTO label_05514
    GOTO label_0552A
  label_05514:
    ' float_D9
    ' float_D9
    local_B2 = "silver"
  label_0552A:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0112 == 1 THEN GOTO label_05540
    GOTO label_05556
  label_05540:
    ' float_D9
    ' float_D9
    local_B2 = "platinum"
  label_05556:
    ax = local_A6
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_C0 = ax
    local_B4 = 0
    CALL proc_25D42(addr(local_B4), addr(local_A6))
    local_B8 = ax
    ax = "You have found " + addr(local_B8)
    ax = ax + " pieces of "
    local_20 = ax
    local_BA = 2
    local_BC = 42
    local_BE = 0
    CALL locate_print_21DEA(addr(local_BA), addr(local_BC), addr(local_20), addr(local_BE))
    ax = addr(local_B2) + &H3510
    local_20 = ax
    local_C2 = 3
    local_C4 = 42
    local_C6 = 0
    CALL locate_print_21DEA(addr(local_C2), addr(local_C4), addr(local_20), addr(local_C6))
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0112 <> 1 THEN GOTO label_0562D
    GOTO label_0568F
  label_0562D:
    local_C8 = 0
    CALL proc_25D42(addr(local_C8), addr(local_C0))
    local_CC = ax
    ax = "It's worth " + addr(local_CC)
    ax = ax + " gold pieces."
    local_20 = ax
    local_CE = 5
    local_D0 = 42
    local_D2 = 0
    CALL locate_print_21DEA(addr(local_CE), addr(local_D0), addr(local_20), addr(local_D2))
  label_0568F:
    ax = local_C0
    ' cwd
    ax = ax + var_0220
    ' adc dx,[0x222]
    var_0220 = ax
    var_0222 = dx
    RETURN
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0135
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_D4 = ax
    CALL itemfile_dat_0816C(addr(local_D4))
    ax = 0
    IF var_0278 <> 5 THEN GOTO label_056E3
    ax = ax - 1
  label_056E3:
    cx = 0
    IF var_0278 <> 6 THEN GOTO label_056EE
    cx = cx - 1
  label_056EE:
    ' or cx,ax
    ax = 0
    IF var_0278 <> 7 THEN GOTO label_056FB
    ax = ax - 1
  label_056FB:
    ' or ax,cx
    cx = 0
    IF var_0278 <> 13 THEN GOTO label_05708
    cx = cx - 1
  label_05708:
    ' or cx,ax
    ' and cx,cx
    IF var_0278 <> 13 THEN GOTO label_05711
    GOTO label_0571E
  label_05711:
    local_D8 = "some "
    GOTO label_0573F
  label_0571E:
    IF var_0278 == 2 THEN GOTO label_05728
    GOTO label_05735
  label_05728:
    local_D8 = "an "
    GOTO label_0573F
  label_05735:
    local_D8 = "a "
  label_0573F:
    ax = "You have found " + addr(local_D8)
    cx = var_0278
    cx = cx * 2
    cx = cx * 2
    cx = cx + &H1590
    ax = ax + cx
    ax = ax + &H3510
    local_20 = ax
    local_DA = 2
    local_DC = 42
    local_DE = 0
    CALL locate_print_21DEA(addr(local_DA), addr(local_DC), addr(local_20), addr(local_DE))
    local_E0 = 3
    local_E2 = 42
    local_E6 = "Do you wish to pick it up?"
    local_E8 = 0
    CALL locate_print_21DEA(addr(local_E0), addr(local_E2), addr(local_E6), addr(local_E8))
    CALL free_string(addr(local_E6))
    local_EA = 5
    local_EC = 42
    local_EE = 1
    CALL y_yes_26031(addr(local_EA), addr(local_EC), addr(local_EE))
    local_F2 = ax
    local_4E = addr(local_F2)
    CALL RT_2732_6130(addr(local_4E), &H2022)
    IF var_0278 == 2 THEN GOTO label_05820
    GOTO label_05821
  label_05820:
    RETURN
  label_05821:
    CALL proc_0AA39()
    CALL itemfile_dat_0816C(addr(local_D4))
    ax = var_012F
    ax = ax + 1
    local_102 = ax
    CALL proc_07F08(addr(local_102), addr(local_F6))
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0278 == 2 THEN GOTO label_05869
    GOTO label_058AB
  label_05869:
    local_F8 = 2
    local_FA = 42
    local_FE = "You load is too heavy to lift it."
    local_100 = 0
    CALL locate_print_21DEA(addr(local_F8), addr(local_FA), addr(local_FE), addr(local_100))
    CALL free_string(addr(local_FE))
    GOTO label_05B2C
  label_058AB:
    ax = var_0278
    ax = ax * 2
    ax = ax * 2
    ax = ax + &H1590
    ax = "You pick up the " + ax
    ax = ax + &H3510
    local_20 = ax
    local_108 = 2
    local_10A = 42
    local_10C = 0
    CALL locate_print_21DEA(addr(local_108), addr(local_10A), addr(local_20), addr(local_10C))
    ax = 68
    ' imul word [bp-0x102]
    ax = ax + &HBEE
    bx = ax
    ax = ax + 64
    si = ax
    [si] = 0
    dx = bx
    bx = bx + 56
    si = bx
    ax = var_027C
    [bx] = ax
    dx = dx + 58
    si = dx
    [si] = ax
    ax = 606
    CALL RT_2732_63DF(DS, 606, 26)
    local_110 = ax
    CALL proc_23059(addr(local_110))
    local_114 = ax
    ax = addr(local_110)
    PUSH DS
    PUSH addr(local_110)
    ' xor ax,ax
    ax = 606
    CALL RT_2732_6404(addr(local_110), DS, 606, 26)
    CALL free_string(addr(local_110))
    ax = addr(local_114)
    PUSH DS
    PUSH addr(local_114)
    ' xor ax,ax
    ax = 68
    PUSH addr(local_114)
    ' imul word [bp-0x102]
    bx = ax
    ax = ax + &HBEE
    dx = ax
    ax = ax + 26
    local_120 = dx
    local_122 = bx
    CALL RT_2732_6404(DS, ax, 26)
    IF var_00B4 == 1 THEN GOTO label_059A4
    GOTO label_05AEF
  label_059A4:
    ax = 606
    CALL RT_2732_6404(DS, 606, 26, DS, local_120, 26)
    ax = local_122
    ax = ax + &HBEE
    ax = ax + 60
    si = ax
    [si] = 1
    local_116 = 5
    local_118 = 42
    local_11C = "Your RING OF IDENTIFY starts glowing!"
    local_11E = 0
    CALL locate_print_21DEA(addr(local_116), addr(local_118), addr(local_11C), addr(local_11E))
    CALL free_string(addr(local_11C))
    local_124 = 6
    local_126 = 42
    local_12A = "As knowledge is imparted to you,"
    local_12C = 0
    CALL locate_print_21DEA(addr(local_124), addr(local_126), addr(local_12A), addr(local_12C))
    CALL free_string(addr(local_12A))
    local_12E = 7
    local_130 = 42
    local_134 = "You realize that it is a"
    local_136 = 0
    CALL locate_print_21DEA(addr(local_12E), addr(local_130), addr(local_134), addr(local_136))
    CALL free_string(addr(local_134))
    local_138 = 8
    local_13A = 42
    ax = 606
    CALL RT_2732_63DF(DS, 606, 26)
    local_13E = ax
    local_140 = 0
    CALL locate_print_21DEA(addr(local_138), addr(local_13A), addr(local_13E), addr(local_140))
    ax = addr(local_13E)
    PUSH DS
    PUSH addr(local_13E)
    ' xor ax,ax
    ax = 606
    CALL RT_2732_6404(addr(local_13E), DS, 606, 26)
    CALL free_string(addr(local_13E))
    GOTO label_05B2C
  label_05AEF:
    ax = var_0278
    ax = ax * 2
    ax = ax * 2
    ax = ax + &H1590
    PUSH DS
    PUSH ax
    ' xor ax,ax
    ax = 68
    PUSH ax
    ' imul word [bp-0x102]
    bx = ax
    ax = ax + &HBEE
    local_142 = bx
    CALL RT_2732_6404(DS, ax, 26)
    ax = local_142
    ax = ax + &HBEE
    ax = ax + 60
    si = ax
    [si] = 0
  label_05B2C:
    RETURN
  label_05B2D:
    CALL free_string(addr(local_114))
    CALL free_string(addr(local_F2))
    CALL free_string(addr(local_CC))
    CALL free_string(addr(local_B8))
    CALL free_string(addr(local_7A))
    CALL free_string(addr(local_46))
    CALL free_string(addr(local_42))
    CALL free_string(addr(local_4E))
    CALL free_string(addr(local_A4))
    CALL free_string(addr(local_D8))
    CALL free_string(addr(local_20))
    CALL free_string(addr(local_B2))
    CALL erase_array(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_05F8B
END SUB

SUB character_choice_menu_05BB4  ' image &H5BB4, locals 130
  ' strings: CHARACTER CHOICE MENU | There are no characters created.  | Please create one first. |  Currently in town |  Adventuring on level  | Who do you want to 
    cx = 130
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, var_0131, 4, &H8001, addr(local_1C))
    ' float_D9
    ' float_D9
    var_0112 = 0
    local_1E = 1
    local_20 = 25
    CALL proc_21194(addr(local_1E), addr(local_20))
    local_26 = 15
    local_28 = 0
    CALL color_25283(addr(local_26), addr(local_28))
    local_2A = 1
    local_2C = 28
    local_30 = "CHARACTER CHOICE MENU"
    local_32 = 1
    CALL locate_print_21DEA(addr(local_2A), addr(local_2C), addr(local_30), addr(local_32))
    CALL free_string(addr(local_30))
    local_34 = 11
    local_36 = 0
    CALL color_25283(addr(local_34), addr(local_36))
    IF var_0131 == 0 THEN GOTO label_05C6A
    GOTO label_05CDD
  label_05C6A:
    local_38 = 3
    local_3A = 1
    local_3E = "There are no characters created. "
    local_40 = 0
    CALL locate_print_21DEA(addr(local_38), addr(local_3A), addr(local_3E), addr(local_40))
    CALL free_string(addr(local_3E))
    CALL RT_2732_6130(arg_8, &H16F4)
    IF var_0131 <> 0 THEN GOTO label_05CB1
    GOTO label_05CD5
  label_05CB1:
    local_44 = "Please create one first."
    local_46 = 0
    CALL print_more_21DB9(addr(local_44), addr(local_46))
    CALL free_string(addr(local_44))
  label_05CD5:
    CALL hit_any_key_to_continue_2434A()
    GOTO label_05F34
  label_05CDD:
    ax = var_0131
    local_48 = ax
    ax = 1
    GOTO label_05DAE
  label_05CEA:
    CALL proc_0800C(addr(local_4A))
    IF var_01F4 == 0 THEN GOTO label_05CFD
    GOTO label_05D09
  label_05CFD:
    local_4E = " Currently in town"
    GOTO label_05D34
  label_05D09:
    local_50 = 0
    CALL proc_25D42(addr(local_50), 500)
    local_54 = ax
    ax = " Adventuring on level " + addr(local_54)
    local_4E = ax
  label_05D34:
    ax = 440
    CALL RT_2732_63DF(DS, 440, 20)
    ax = ax + &H178E
    bx = ax
    ax = 475
    local_56 = bx
    CALL RT_2732_63DF(DS, 475, 5)
    ax = local_56 + ax
    ax = ax + &H178E
    bx = ax
    ax = 468
    local_58 = bx
    CALL RT_2732_63DF(DS, 468, 7)
    ax = local_58 + ax
    ax = ax + addr(local_4E)
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(local_4A, 1)
    bx = dx
    ax = local_4A
    ax = ax + 1
  label_05DAE:
    local_4A = ax
    IF ax > local_48 THEN GOTO label_05DB9
    GOTO label_05CEA
  label_05DB9:
    CALL RT_2732_6130(arg_8, &H16F4)
    IF ax == local_48 THEN GOTO label_05DCA
    GOTO label_05E25
  label_05DCA:
    local_5A = 1
    local_5C = 2
    local_5E = 5
    local_60 = 0
    local_62 = 0
    local_64 = 1
    CALL menu_choice_225B8(addr(local_1C), 305, addr(local_5A), addr(local_5C), addr(local_5E), addr(local_60), addr(local_62), addr(local_6A), addr(local_64))
    local_68 = ax
    local_6E = addr(local_68)
    GOTO label_05F34
  label_05E25:
    ax = "Who do you want to " + arg_8
    ax = ax + &H3714
    local_78 = ax
    local_70 = 3
    local_72 = 1
    local_74 = 0
    CALL locate_print_21DEA(addr(local_70), addr(local_72), addr(local_78), addr(local_74))
    local_7A = 1
    local_7C = 2
    local_7E = 5
    local_80 = 0
    local_82 = 0
    local_84 = 0
    CALL menu_choice_225B8(addr(local_1C), 305, addr(local_7A), addr(local_7C), addr(local_7E), addr(local_80), addr(local_82), addr(local_6A), addr(local_84))
    local_88 = ax
    local_6E = addr(local_88)
    ax = 0
    IF local_6A <= 0 THEN GOTO label_05ECA
    ax = ax - 1
  label_05ECA:
    bx = ax
    local_8A = bx
    CALL RT_2732_6130(addr(local_6E), &H16D0)
    ax = 0
    IF local_6A == 0 THEN GOTO label_05EE3
    ax = ax - 1
  label_05EE3:
    ' and ax,[bp-0x8a]
    bx = ax
    ax = 74
    local_8C = bx
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_6E))
    ax = 0
    IF local_6A == 0 THEN GOTO label_05F0B
    ax = ax - 1
  label_05F0B:
    ' and ax,[bp-0x8c]
    ' and ax,ax
    IF local_6A <> 0 THEN GOTO label_05F16
    GOTO label_05F34
  label_05F16:
    CALL proc_0800C(addr(local_6A))
    CALL inv_080AB()
    CALL mage_0C4A1()
    ' float_D9
    ' float_D9
  label_05F34:
    ' float_D9
    si = arg_6
    ' float_D9
    CALL free_string(addr(local_88))
    CALL free_string(addr(local_68))
    CALL free_string(addr(local_54))
    CALL free_string(addr(local_6E))
    CALL free_string(addr(local_78))
    CALL free_string(addr(local_4E))
    CALL erase_array(addr(local_1C))
    ax = arg_6
    PROC_EXIT
    RETURN
    GOTO label_06709
END SUB

SUB inventory_management_05F8E  ' image &H5F8E, locals 216
  ' strings: INVENTORY MANAGEMENT | You have no inventory | DISPLAY | W-Wear     U-Use     T-Take off     D-Drop     I-Item Info     Q or ESC-return | (Use arrows or mouse to move around, ENTER for menu, or ESC to quit) | Which item would you like to 
    cx = 216
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 34, 4, &H8001, addr(local_1C))
    local_1E = 15
    local_20 = 0
    CALL color_25283(addr(local_1E), addr(local_20))
    local_22 = 1
    local_24 = 30
    local_28 = "INVENTORY MANAGEMENT"
    local_2A = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_24), addr(local_28), addr(local_2A))
    CALL free_string(addr(local_28))
    IF var_012F == 0 THEN GOTO label_06005
    GOTO label_06070
  label_06005:
    local_2C = 7
    local_2E = 0
    CALL color_25283(addr(local_2C), addr(local_2E))
    local_30 = 3
    local_32 = 1
    local_36 = "You have no inventory"
    local_38 = 0
    CALL locate_print_21DEA(addr(local_30), addr(local_32), addr(local_36), addr(local_38))
    CALL free_string(addr(local_36))
    CALL hit_any_key_to_continue_2434A()
    ax = 74
    ax = addr(local_3C)
    PUSH DS
    PUSH 74
    PUSH 1
    PUSH DS
    PUSH addr(local_3C)
    ' xor ax,ax
    CALL RT_2732_6404(addr(local_3C))
    GOTO label_06695
  label_06070:
    CALL RT_2732_6130(arg_6, "DISPLAY")
    IF var_012F <> 0 THEN GOTO label_06081
    GOTO label_061F6
  label_06081:
    local_3E = 1
    local_40 = 7
    CALL color_25283(addr(local_3E), addr(local_40))
    local_42 = 2
    local_44 = 1
    CALL proc_253B3(addr(local_42), addr(local_44))
    CALL RT_2732_62BC(80)
    local_48 = ax
    local_4A = 0
    CALL print_more_21DB9(addr(local_48), addr(local_4A))
    CALL free_string(addr(local_48))
    CALL RT_2732_62BC(80)
    local_4E = ax
    local_50 = 0
    CALL print_more_21DB9(addr(local_4E), addr(local_50))
    CALL free_string(addr(local_4E))
    CALL RT_2732_62BC(80)
    local_54 = ax
    local_56 = 0
    CALL print_more_21DB9(addr(local_54), addr(local_56))
    CALL free_string(addr(local_54))
    local_58 = 2
    local_5A = 1
    CALL proc_253B3(addr(local_58), addr(local_5A))
    CALL RT_2732_6130(arg_6, &H16F4)
    IF var_012F == 0 THEN GOTO label_0615B
    GOTO label_061A6
  label_0615B:
    local_5E = "W-Wear     U-Use     T-Take off     D-Drop     I-Item Info     Q or ESC-return"
    local_60 = 0
    CALL print_more_21DB9(addr(local_5E), addr(local_60))
    CALL free_string(addr(local_5E))
    local_64 = "(Use arrows or mouse to move around, ENTER for menu, or ESC to quit)"
    local_66 = 0
    CALL print_more_21DB9(addr(local_64), addr(local_66))
    CALL free_string(addr(local_64))
    GOTO label_061F6
  label_061A6:
    ax = "Which item would you like to " + arg_6
    local_6A = ax
    local_6C = 0
    CALL print_more_21DB9(addr(local_6A), addr(local_6C))
    CALL free_string(addr(local_6A))
    local_70 = "(Use arrows or mouse to move around, ENTER to choose, or ESC to quit)"
    local_72 = 0
    CALL print_more_21DB9(addr(local_70), addr(local_72))
    CALL free_string(addr(local_70))
  label_061F6:
    CALL RT_2732_616F(6)
    ax = "* - CURRENTLY BEING WORN    " + ax
    ax = ax + " - CURSED       "
    bx = ax
    local_7A = bx
    CALL RT_2732_616F(1)
    ax = local_7A + ax
    ax = ax + " - MAGICALLY ENHANCED"
    local_76 = ax
    local_78 = 0
    CALL print_more_21DB9(addr(local_76), addr(local_78))
    CALL free_string(addr(local_76))
    local_7C = 7
    local_7E = 0
    CALL color_25283(addr(local_7C), addr(local_7E))
    ax = var_012F
    local_80 = ax
    ax = 1
    GOTO label_063F8
  label_06274:
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    ax = ax + 64
    si = ax
    IF [si] == 1 THEN GOTO label_0628A
    GOTO label_06297
  label_0628A:
    local_84 = &H38AC
    GOTO label_062A1
  label_06297:
    local_84 = &H178E
  label_062A1:
    ax = 68
    ' imul word [bp-0x86]
    ax = ax + &HBEE
    bx = ax
    ax = ax + 62
    si = ax
    cx = 0
    IF [si] <> &HFFFF THEN GOTO label_062BC
    cx = cx - 1
  label_062BC:
    bx = bx + 60
    si = bx
    ax = 0
    IF [bx] <> 1 THEN GOTO label_062CA
    ax = ax - 1
  label_062CA:
    ' and ax,cx
    ' and ax,ax
    IF [bx] <> 1 THEN GOTO label_062D3
    GOTO label_062E8
  label_062D3:
    CALL RT_2732_616F(6)
    local_8A = ax
    GOTO label_06339
  label_062E8:
    ax = 68
    ' imul word [bp-0x86]
    ax = ax + &HBEE
    bx = ax
    ax = ax + 62
    si = ax
    cx = 0
    IF [si] <> 1 THEN GOTO label_06303
    cx = cx - 1
  label_06303:
    bx = bx + 60
    si = bx
    ax = 0
    IF [bx] <> 1 THEN GOTO label_06311
    ax = ax - 1
  label_06311:
    ' and ax,cx
    ' and ax,ax
    IF [bx] <> 1 THEN GOTO label_0631A
    GOTO label_0632F
  label_0631A:
    CALL RT_2732_616F(1)
    local_8A = ax
    GOTO label_06339
  label_0632F:
    local_8A = &H178E
  label_06339:
    CALL RT_2732_63B4(local_86)
    local_8E = ax
    IF local_86 < 10 THEN GOTO label_06355
    GOTO label_06373
  label_06355:
    CALL RT_2732_6371(addr(local_8E))
    ax = &H178E + ax
    local_8E = ax
    GOTO label_06386
  label_06373:
    CALL RT_2732_6371(addr(local_8E))
    local_8E = ax
  label_06386:
    ax = addr(local_8E) + ") "
    local_8E = ax
    ax = addr(local_84) + addr(local_8A)
    ax = ax + addr(local_8E)
    bx = ax
    ax = 68
    ' imul word [bp-0x86]
    ax = ax + &HBEE
    local_90 = bx
    CALL RT_2732_63DF(DS, ax, 26)
    CALL RT_2732_6374(26)
    ax = local_90 + ax
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(local_86, 1)
    bx = dx
    ax = local_86
    ax = ax + 1
  label_063F8:
    local_86 = ax
    IF ax > local_80 THEN GOTO label_06404
    GOTO label_06274
  label_06404:
    local_92 = 5
    local_94 = 23
    CALL proc_21194(addr(local_92), addr(local_94))
    ax = var_0202
    ax = ax + var_0200
    ax = ax + var_0206
    ax = ax + var_0204
    local_9A = ax
    local_96 = 12
    local_98 = 0
    CALL color_25283(addr(local_96), addr(local_98))
    IF local_9A == 4 THEN GOTO label_06457
    GOTO label_06499
  label_06457:
    local_9C = 23
    local_9E = 1
    local_A2 = "You currently possess the STAFF OF POWER!!"
    local_A4 = 0
    CALL locate_print_21DEA(addr(local_9C), addr(local_9E), addr(local_A2), addr(local_A4))
    CALL free_string(addr(local_A2))
    GOTO label_06511
  label_06499:
    IF local_9A > 0 THEN GOTO label_064A3
    GOTO label_06511
  label_064A3:
    local_A6 = 23
    local_A8 = 1
    local_AA = 0
    CALL proc_25D42(addr(local_AA), addr(local_9A))
    local_AE = ax
    ax = "You currently possess " + addr(local_AE)
    ax = ax + " out of 4 parts of the STAFF OF POWER"
    local_B2 = ax
    local_B4 = 0
    CALL locate_print_21DEA(addr(local_A6), addr(local_A8), addr(local_B2), addr(local_B4))
    CALL free_string(addr(local_B2))
  label_06511:
    CALL RT_2732_6130(arg_6, "DISPLAY")
    IF local_9A == 0 THEN GOTO label_06522
    GOTO label_065A0
  label_06522:
    local_B6 = 2
    local_B8 = 1
    local_BA = 6
    local_BC = 0
    local_BE = 0
    local_C0 = 1
    CALL menu_choice_225B8(addr(local_1C), 303, addr(local_B6), addr(local_B8), addr(local_BA), addr(local_BC), addr(local_BE), arg_8, addr(local_C0))
    local_C4 = ax
    local_3C = addr(local_C4)
    ax = 74
    ax = addr(local_3C)
    PUSH DS
    PUSH 74
    PUSH 1
    PUSH DS
    PUSH addr(local_3C)
    ' xor ax,ax
    CALL RT_2732_6404(addr(local_3C))
    GOTO label_06695
  label_065A0:
    local_C6 = 2
    local_C8 = 1
    local_CA = 6
    local_CC = &HFFFF
    local_CE = 0
    local_D0 = 0
    CALL menu_choice_225B8(addr(local_1C), 303, addr(local_C6), addr(local_C8), addr(local_CA), addr(local_CC), addr(local_CE), arg_8, addr(local_D0))
    local_D4 = ax
    local_3C = addr(local_D4)
    ax = 72
    CALL RT_2732_63DF(DS, 72, 1)
    CALL RT_2732_6130(1, addr(local_3C))
    ax = 0
    IF local_9A <> 0 THEN GOTO label_06623
    ax = ax - 1
  label_06623:
    bx = ax
    local_DE = bx
    CALL RT_2732_6130(arg_6, &H16F4)
    ax = 0
    IF local_9A <> 0 THEN GOTO label_0663B
    ax = ax - 1
  label_0663B:
    ' and ax,[bp-0xde]
    ' and ax,ax
    IF local_9A <> 0 THEN GOTO label_06646
    GOTO label_06695
  label_06646:
    si = arg_8
    ax = [si]
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    CALL RT_2732_63DF(DS, ax, 26)
    CALL RT_2732_6374(26)
    local_D8 = ax
    CALL item_menu_07841(addr(local_D8))
    local_DC = ax
    CALL free_string(addr(local_D8))
    local_3C = addr(local_DC)
  label_06695:
    local_E2 = addr(local_3C)
    CALL free_string(addr(local_DC))
    CALL free_string(addr(local_D4))
    CALL free_string(addr(local_C4))
    CALL free_string(addr(local_AE))
    CALL free_string(addr(local_3C))
    CALL free_string(addr(local_8E))
    CALL free_string(addr(local_8A))
    CALL erase_array(addr(local_1C))
    CALL free_string(addr(local_84))
    CALL RT_2732_64F5(addr(local_E2))
    PROC_EXIT
    RETURN
    GOTO label_067B2
END SUB

SUB proc_0670C  ' image &H670C, locals 14
    cx = 14
    CALL frame_enter()
    var_013B = 0
    var_013D = 0
    var_013F = 0
    var_0141 = 0
    var_0143 = 0
    var_0145 = 0
    var_0147 = 0
    var_0149 = 0
    var_014B = 0
    var_014D = 0
    var_014F = 0
    var_0151 = 0
    ax = var_012F
    local_C = ax
    ax = 1
    GOTO label_067A2
  label_06768:
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    ax = ax + 64
    si = ax
    IF [si] == 1 THEN GOTO label_0677E
    GOTO label_0679E
  label_0677E:
    local_E = 0
    CALL proc_00A98(addr(local_14), addr(local_E), addr(local_12))
    ' float_D9
    ' float_D9
  label_0679E:
    ax = local_14
    ax = ax + 1
  label_067A2:
    local_14 = ax
    IF ax <= local_C THEN GOTO label_06768
    PROC_EXIT
    RETURN
    GOTO label_0684B
END SUB

SUB itemfile_dat_067B5  ' image &H67B5, locals 8
  ' strings: ITEMFILE.DAT
    cx = 8
    CALL frame_enter()
    OPEN "ITEMFILE.DAT" FOR RANDOM AS #1 LEN = 44
    ax = var_0135
    local_C = ax
    ax = 1
    GOTO label_06831
  label_067DE:
    GET #1, long(local_E), buffer(606) LEN = 44
    IF var_027E == 0 THEN GOTO label_06802
    GOTO label_0682D
  label_06802:
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    bx = &H1606
    CALL array_element(44, 1)
    ax = local_E
    [es:bx] = ax
  label_0682D:
    ax = local_E
    ax = ax + 1
  label_06831:
    local_E = ax
    IF ax <= local_C THEN GOTO label_067DE
    CLOSE #1
    PROC_EXIT
    RETURN
    GOTO label_0783E
END SUB

SUB wield_0684E  ' image &H684E, locals 352
  ' strings: You are already wearing this item  | This item needs to be used in the dungeon, not worn. | wield | wear | You  |  the 
    cx = 352
    CALL frame_enter()
  label_06856:
    local_C = 1
    local_E = 25
    CALL proc_21194(addr(local_C), addr(local_E))
  label_0686D:
    local_12 = &H16F4
    CALL inventory_management_05F8E(addr(local_1C), addr(local_12))
    local_16 = ax
    CALL free_string(addr(local_12))
    local_20 = addr(local_16)
    local_1A = addr(local_20)
    CALL RT_2732_6130(addr(local_1A), &H16D0)
    IF ? <> ? THEN GOTO label_068B8
    GOTO label_068D5
  label_068B8:
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_1A))
    IF ? == ? THEN GOTO label_068D5
    GOTO label_068E0
  label_068D5:
    CALL mage_0C4A1()
    GOTO label_077E2
    GOTO label_0726A
  label_068E0:
    ax = 68
    ' imul word [bp-0x1c]
    bx = ax
    ax = ax + &HBEE
    local_2E = bx
    CALL RT_2732_63DF(DS, ax, 26)
    CALL RT_2732_6374(26)
    local_32 = ax
    local_24 = addr(local_20)
    CALL RT_2732_6130(addr(local_24), &H396C)
    IF ? == ? THEN GOTO label_06923
    GOTO label_06F84
  label_06923:
    ax = local_2E
    ax = ax + &HBEE
    ax = ax + 64
    si = ax
    IF [si] == 1 THEN GOTO label_06937
    GOTO label_0698E
  label_06937:
    local_28 = "You are already wearing this item "
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_2C = ax
    CALL proc_2311E(addr(local_28), addr(local_2C))
    ax = addr(local_2C)
    PUSH DS
    PUSH addr(local_2C)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_2C), DS, 79, 1)
    CALL free_string(addr(local_28))
    CALL free_string(addr(local_2C))
    GOTO label_06F81
  label_0698E:
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    ax = ax + 52
    si = ax
    cx = 0
    IF [si] <> 12 THEN GOTO label_069A6
    cx = cx - 1
  label_069A6:
    dx = 0
    IF [si] <> 10 THEN GOTO label_069AF
    dx = dx - 1
  label_069AF:
    ' or dx,cx
    cx = 0
    IF [si] <> 11 THEN GOTO label_069BA
    cx = cx - 1
  label_069BA:
    ' or cx,dx
    ' and cx,cx
    IF [si] <> 11 THEN GOTO label_069C3
    GOTO label_06A1A
  label_069C3:
    local_36 = "This item needs to be used in the dungeon, not worn."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_3A = ax
    CALL proc_2311E(addr(local_36), addr(local_3A))
    ax = addr(local_3A)
    PUSH DS
    PUSH addr(local_3A)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_3A), DS, 79, 1)
    CALL free_string(addr(local_36))
    CALL free_string(addr(local_3A))
    GOTO label_06F81
  label_06A1A:
    local_3C = 0
    CALL proc_00A98(addr(local_1C), addr(local_3C), addr(local_40))
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [si] == 11 THEN GOTO label_06A4F
    GOTO label_06B86
  label_06A4F:
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    ax = ax + 26
    CALL RT_2732_63DF(DS, ax, 26)
    local_44 = ax
    CALL proc_21210(addr(local_44))
    local_48 = ax
    ax = addr(local_44)
    PUSH DS
    PUSH addr(local_44)
    ' xor ax,ax
    ax = 68
    PUSH addr(local_44)
    ' imul word [bp-0x1c]
    bx = ax
    ax = ax + &HBEE
    dx = ax
    ax = ax + 26
    local_4E = dx
    local_50 = bx
    CALL RT_2732_6404(DS, ax, 26)
    CALL free_string(addr(local_44))
    ax = addr(local_48)
    PUSH DS
    PUSH addr(local_48)
    ' xor ax,ax
    CALL RT_2732_6404(addr(local_48), DS, local_4E, 26)
    ax = local_50
    ax = ax + &HBEE
    bx = ax
    ax = ax + 64
    si = ax
    [si] = 1
    dx = bx
    bx = bx + 60
    si = bx
    [bx] = 1
    dx = dx + 52
    si = dx
    ax = 0
    IF [si] <> 1 THEN GOTO label_06AF3
    ax = ax - 1
  label_06AF3:
    cx = 0
    IF [si] <> 2 THEN GOTO label_06AFC
    cx = cx - 1
  label_06AFC:
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 2 THEN GOTO label_06B05
    GOTO label_06B11
  label_06B05:
    local_20 = "wield"
    GOTO label_06B1A
  label_06B11:
    local_20 = "wear"
  label_06B1A:
    ax = "You " + addr(local_20)
    ax = ax + " the "
    bx = ax
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    local_5A = bx
    CALL RT_2732_63DF(DS, ax, 26)
    CALL RT_2732_6374(26)
    ax = local_5A + ax
    local_54 = ax
    local_58 = &H16F4
    CALL proc_2311E(addr(local_54), addr(local_58))
    CALL free_string(addr(local_54))
    CALL free_string(addr(local_58))
    GOTO label_06F81
  label_06B86:
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    ax = ax + 52
    si = ax
    ax = [si]
    local_5C = ax
    IF local_5C == 3 THEN GOTO label_06BA3
    GOTO label_06BFA
  label_06BA3:
    local_60 = "You can only wear one helmet at a time. Take one off first."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_64 = ax
    CALL proc_2311E(addr(local_60), addr(local_64))
    ax = addr(local_64)
    PUSH DS
    PUSH addr(local_64)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_64), DS, 79, 1)
    CALL free_string(addr(local_60))
    CALL free_string(addr(local_64))
    GOTO label_06F81
  label_06BFA:
    IF local_5C == 4 THEN GOTO label_06C03
    GOTO label_06C5A
  label_06C03:
    local_68 = "You can only wear one shield at a time. Take one off first."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_6C = ax
    CALL proc_2311E(addr(local_68), addr(local_6C))
    ax = addr(local_6C)
    PUSH DS
    PUSH addr(local_6C)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_6C), DS, 79, 1)
    CALL free_string(addr(local_68))
    CALL free_string(addr(local_6C))
    GOTO label_06F81
  label_06C5A:
    IF local_5C == 9 THEN GOTO label_06C63
    GOTO label_06CBA
  label_06C63:
    local_70 = "You can only wear two rings at once.  Take one off first."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_74 = ax
    CALL proc_2311E(addr(local_70), addr(local_74))
    ax = addr(local_74)
    PUSH DS
    PUSH addr(local_74)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_74), DS, 79, 1)
    CALL free_string(addr(local_70))
    CALL free_string(addr(local_74))
    GOTO label_06F81
  label_06CBA:
    IF local_5C == 1 THEN GOTO label_06CC3
    GOTO label_06D1A
  label_06CC3:
    local_78 = "You must not wield anything while taking a weapon from its sheath"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_7C = ax
    CALL proc_2311E(addr(local_78), addr(local_7C))
    ax = addr(local_7C)
    PUSH DS
    PUSH addr(local_7C)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_7C), DS, 79, 1)
    CALL free_string(addr(local_78))
    CALL free_string(addr(local_7C))
    GOTO label_06F81
  label_06D1A:
    IF local_5C == 2 THEN GOTO label_06D23
    GOTO label_06D7E
  label_06D23:
    local_80 = "You must not wield anything while taking an instrument from its sheath"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_84 = ax
    CALL proc_2311E(addr(local_80), addr(local_84))
    ax = addr(local_84)
    PUSH DS
    PUSH addr(local_84)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_84), DS, 79, 1)
    CALL free_string(addr(local_80))
    CALL free_string(addr(local_84))
    GOTO label_06F81
  label_06D7E:
    IF local_5C == 6 THEN GOTO label_06D87
    GOTO label_06DE5
  label_06D87:
    local_88 = "You can't wear two sets of gauntlets at one time. Remove one set first."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_8C = ax
    CALL proc_2311E(addr(local_88), addr(local_8C))
    ax = addr(local_8C)
    PUSH DS
    PUSH addr(local_8C)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_8C), DS, 79, 1)
    CALL free_string(addr(local_88))
    CALL free_string(addr(local_8C))
    GOTO label_06F81
  label_06DE5:
    IF local_5C == 8 THEN GOTO label_06DEE
    GOTO label_06E4C
  label_06DEE:
    local_90 = "You can only wear one cloak at a time.  Take off the old one first."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_94 = ax
    CALL proc_2311E(addr(local_90), addr(local_94))
    ax = addr(local_94)
    PUSH DS
    PUSH addr(local_94)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_94), DS, 79, 1)
    CALL free_string(addr(local_90))
    CALL free_string(addr(local_94))
    GOTO label_06F81
  label_06E4C:
    IF local_5C == 7 THEN GOTO label_06E55
    GOTO label_06EB3
  label_06E55:
    local_98 = "You can't wear two pairs of boots at one time. Remove one set first."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_9C = ax
    CALL proc_2311E(addr(local_98), addr(local_9C))
    ax = addr(local_9C)
    PUSH DS
    PUSH addr(local_9C)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_9C), DS, 79, 1)
    CALL free_string(addr(local_98))
    CALL free_string(addr(local_9C))
    GOTO label_06F81
  label_06EB3:
    IF local_5C == 5 THEN GOTO label_06EBC
    GOTO label_06F1A
  label_06EBC:
    local_A0 = "You can't wear two suits of armor at one time. Remove one set first."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_A4 = ax
    CALL proc_2311E(addr(local_A0), addr(local_A4))
    ax = addr(local_A4)
    PUSH DS
    PUSH addr(local_A4)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_A4), DS, 79, 1)
    CALL free_string(addr(local_A0))
    CALL free_string(addr(local_A4))
    GOTO label_06F81
  label_06F1A:
    IF local_5C == 13 THEN GOTO label_06F23
    GOTO label_06F81
  label_06F23:
    local_A8 = "You can't wear two sets of lenses at one time. Remove one set first."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_AC = ax
    CALL proc_2311E(addr(local_A8), addr(local_AC))
    ax = addr(local_AC)
    PUSH DS
    PUSH addr(local_AC)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_AC), DS, 79, 1)
    CALL free_string(addr(local_A8))
    CALL free_string(addr(local_AC))
    GOTO label_06F81
  label_06F81:
    GOTO label_0726A
  label_06F84:
    CALL RT_2732_6130(addr(local_24), &H16DC)
    IF local_5C == 13 THEN GOTO label_06F96
    GOTO label_06F9C
  label_06F96:
    CALL near_0726D()
    GOTO label_0726A
  label_06F9C:
    CALL RT_2732_6130(addr(local_24), &H1750)
    IF local_5C == 13 THEN GOTO label_06FAE
    GOTO label_06FBA
  label_06FAE:
    CALL fighting_02AD5(addr(local_1C))
    GOTO label_06856
  label_06FBA:
    CALL RT_2732_6130(addr(local_24), &H1EC2)
    IF local_5C == 13 THEN GOTO label_06FCC
    GOTO label_07125
  label_06FCC:
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    ax = ax + 64
    si = ax
    IF [si] == 0 THEN GOTO label_06FE3
    GOTO label_07041
  label_06FE3:
    local_B0 = "This item is not being worn, hence it cannot be taken off"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_B4 = ax
    CALL proc_2311E(addr(local_B0), addr(local_B4))
    ax = addr(local_B4)
    PUSH DS
    PUSH addr(local_B4)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_B4), DS, 79, 1)
    CALL free_string(addr(local_B0))
    CALL free_string(addr(local_B4))
    GOTO label_07122
  label_07041:
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    ax = ax + 62
    si = ax
    IF [si] <> &HFFFF THEN GOTO label_07058
    GOTO label_070C7
  label_07058:
    ax = "You put the " + addr(local_32)
    ax = ax + " back in inventory"
    local_B8 = ax
    local_BC = &H16F4
    CALL proc_2311E(addr(local_B8), addr(local_BC))
    CALL free_string(addr(local_B8))
    CALL free_string(addr(local_BC))
    local_BE = 1
    CALL proc_00A98(addr(local_1C), addr(local_BE), addr(local_C2))
    ' float_D9
    ' float_D9
    GOTO label_07122
  label_070C7:
    local_CA = "Struggle as you might, you cannot dislodge the cursed item."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_CE = ax
    CALL proc_2311E(addr(local_CA), addr(local_CE))
    ax = addr(local_CE)
    PUSH DS
    PUSH addr(local_CE)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_CE), DS, 79, 1)
    CALL free_string(addr(local_CA))
    CALL free_string(addr(local_CE))
  label_07122:
    GOTO label_0726A
  label_07125:
    CALL RT_2732_6130(addr(local_24), &H1756)
    IF [si] == &HFFFF THEN GOTO label_07137
    GOTO label_0720F
  label_07137:
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    ax = ax + 64
    si = ax
    IF [si] == 0 THEN GOTO label_0714E
    GOTO label_071B1
  label_0714E:
    CALL proc_04D9D(addr(local_1C))
    local_D2 = "You drop the item."
    local_D6 = &H16F4
    CALL proc_2311E(addr(local_D2), addr(local_D6))
    CALL free_string(addr(local_D2))
    CALL free_string(addr(local_D6))
    IF var_012F == 0 THEN GOTO label_07198
    GOTO label_0719E
  label_07198:
    GOTO label_077E2
    GOTO label_071AE
  label_0719E:
    ax = var_012F
    IF ax < local_1C THEN GOTO label_071A9
    GOTO label_071AE
  label_071A9:
    local_1C = 1
  label_071AE:
    GOTO label_0720C
  label_071B1:
    local_DA = "You cannot drop something you are wearing"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_DE = ax
    CALL proc_2311E(addr(local_DA), addr(local_DE))
    ax = addr(local_DE)
    PUSH DS
    PUSH addr(local_DE)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_DE), DS, 79, 1)
    CALL free_string(addr(local_DA))
    CALL free_string(addr(local_DE))
  label_0720C:
    GOTO label_0726A
  label_0720F:
    local_E2 = "UNKNOWN KEY WAS HIT"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_E6 = ax
    CALL proc_2311E(addr(local_E2), addr(local_E6))
    ax = addr(local_E6)
    PUSH DS
    PUSH addr(local_E6)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_E6), DS, 79, 1)
    CALL free_string(addr(local_E2))
    CALL free_string(addr(local_E6))
  label_0726A:
    GOTO label_0686D
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    ax = ax + 52
    si = ax
    cx = 0
    IF [si] <> 10 THEN GOTO label_07285
    cx = cx - 1
  label_07285:
    dx = 0
    IF [si] <> 11 THEN GOTO label_0728E
    dx = dx - 1
  label_0728E:
    ' or dx,cx
    cx = 0
    IF [si] <> 12 THEN GOTO label_07299
    cx = cx - 1
  label_07299:
    ' or cx,dx
    ' and cx,cx
    IF [si] <> 12 THEN GOTO label_072A2
    GOTO label_072AC
  label_072A2:
    CALL proc_0D0CF()
    CALL name_0AF8B()
  label_072AC:
    ax = 68
    ' imul word [bp-0x1c]
    bx = ax
    ax = ax + &HBEE
    dx = ax
    ax = ax + 52
    si = ax
    ax = [si]
    local_E8 = ax
    IF local_E8 == 10 THEN GOTO label_072CF
    GOTO label_07590
  label_072CF:
    IF var_0141 == 0 THEN GOTO label_072D9
    GOTO label_074D0
  label_072D9:
    dx = dx + 56
    si = dx
    [si] = [si] - 1
    bx = bx + &HBEE
    bx = bx + 26
    CALL RT_2732_63DF(DS, BX, 26)
    di = ax
    bx = si
    si = addr(local_EC)
    local_FC = bx
    CALL near_00033()
    CALL proc_21210(addr(local_EC))
    local_F0 = ax
    ax = addr(local_EC)
    PUSH DS
    PUSH addr(local_EC)
    ' xor ax,ax
    ax = 68
    PUSH addr(local_EC)
    ' imul word [bp-0x1c]
    bx = ax
    ax = ax + &HBEE
    dx = ax
    ax = ax + 26
    local_FE = dx
    local_100 = bx
    CALL RT_2732_6404(DS, ax, 26)
    CALL free_string(addr(local_EC))
    ax = addr(local_F0)
    PUSH DS
    PUSH addr(local_F0)
    ' xor ax,ax
    CALL RT_2732_6404(addr(local_F0), DS, local_FE, 26)
    ax = local_100
    ax = ax + &HBEE
    ax = ax + 60
    si = ax
    [si] = 1
    local_F2 = 11
    local_F4 = 3
    CALL RT_2732_63DF(DS, local_FE, 26)
    ax = "You zap with a " + ax
    local_F8 = ax
    local_FA = 0
    CALL locate_print_21DEA(addr(local_F2), addr(local_F4), addr(local_F8), addr(local_FA))
    CALL free_string(addr(local_F8))
    local_104 = &H16F4
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    bx = ax
    ax = ax + 56
    bx = bx + 54
    CALL fields_like_they_used_to_12B8D(ax, 166, BX, arg_6, addr(local_104))
    CALL free_string(addr(local_104))
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    IF [si] <= 1 THEN GOTO label_07417
    GOTO label_0749E
  label_07417:
    CALL proc_04D9D(addr(local_1C))
    local_106 = 14
    local_108 = 3
    local_10C = "The worn out wand begins to shudder.  After expending its last charge,"
    local_10E = 0
    CALL locate_print_21DEA(addr(local_106), addr(local_108), addr(local_10C), addr(local_10E))
    CALL free_string(addr(local_10C))
    local_110 = 15
    local_112 = 3
    local_116 = "the wand crumbles to dust."
    local_118 = 0
    CALL locate_print_21DEA(addr(local_110), addr(local_112), addr(local_116), addr(local_118))
    CALL free_string(addr(local_116))
  label_0749E:
    si = arg_6
    ax = 0
    IF [si] <> 0 THEN GOTO label_074AA
    ax = ax - 1
  label_074AA:
    cx = 0
    IF var_015A <> 0 THEN GOTO label_074B5
    cx = cx - 1
  label_074B5:
    ' or cx,ax
    ' and cx,cx
    IF var_015A <> 0 THEN GOTO label_074BE
    GOTO label_074CD
  label_074BE:
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0AA39()
    CALL proc_0A9DA()
  label_074CD:
    GOTO label_0758D
  label_074D0:
    local_11A = 11
    local_11C = 3
    local_120 = "You CANNOT use a wand while wielding something else!! (Jeez!! All this, and"
    local_122 = 0
    CALL locate_print_21DEA(addr(local_11A), addr(local_11C), addr(local_120), addr(local_122))
    CALL free_string(addr(local_120))
    local_124 = 12
    local_126 = 3
    local_12A = "NOW you think you're a juggler, too!  I think you've been adventuring too"
    local_12C = 0
    CALL locate_print_21DEA(addr(local_124), addr(local_126), addr(local_12A), addr(local_12C))
    CALL free_string(addr(local_12A))
    local_12E = 13
    local_130 = 3
    local_134 = "long!!!)"
    local_136 = 0
    CALL locate_print_21DEA(addr(local_12E), addr(local_130), addr(local_134), addr(local_136))
    CALL free_string(addr(local_134))
  label_0758D:
    GOTO label_077D8
  label_07590:
    IF local_E8 == 11 THEN GOTO label_0759A
    GOTO label_07686
  label_0759A:
    local_138 = 11
    local_13A = 3
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    ax = ax + 26
    CALL RT_2732_63DF(DS, ax, 26)
    local_13E = ax
    CALL proc_21210(addr(local_13E))
    local_142 = ax
    ax = addr(local_13E)
    PUSH DS
    PUSH addr(local_13E)
    ' xor ax,ax
    ax = 68
    PUSH addr(local_13E)
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    ax = ax + 26
    CALL RT_2732_6404(DS, ax, 26)
    CALL free_string(addr(local_13E))
    ax = "You drink a " + addr(local_142)
    local_146 = ax
    local_148 = 0
    CALL locate_print_21DEA(addr(local_138), addr(local_13A), addr(local_146), addr(local_148))
    CALL free_string(addr(local_146))
    local_14C = &H16F4
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    bx = ax
    ax = ax + 56
    bx = bx + 54
    CALL fields_like_they_used_to_12B8D(ax, 166, BX, arg_6, addr(local_14C))
    CALL free_string(addr(local_14C))
    CALL proc_04D9D(addr(local_1C))
    GOTO label_077D8
  label_07686:
    IF local_E8 == 12 THEN GOTO label_07690
    GOTO label_0777C
  label_07690:
    local_14E = 11
    local_150 = 3
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    ax = ax + 26
    CALL RT_2732_63DF(DS, ax, 26)
    local_154 = ax
    CALL proc_21210(addr(local_154))
    local_158 = ax
    ax = addr(local_154)
    PUSH DS
    PUSH addr(local_154)
    ' xor ax,ax
    ax = 68
    PUSH addr(local_154)
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    ax = ax + 26
    CALL RT_2732_6404(DS, ax, 26)
    CALL free_string(addr(local_154))
    ax = "You read a " + addr(local_158)
    local_15C = ax
    local_15E = 0
    CALL locate_print_21DEA(addr(local_14E), addr(local_150), addr(local_15C), addr(local_15E))
    CALL free_string(addr(local_15C))
    local_162 = &H16F4
    ax = 68
    ' imul word [bp-0x1c]
    ax = ax + &HBEE
    bx = ax
    ax = ax + 56
    bx = bx + 54
    CALL fields_like_they_used_to_12B8D(ax, 166, BX, arg_6, addr(local_162))
    CALL free_string(addr(local_162))
    CALL proc_04D9D(addr(local_1C))
    GOTO label_077D8
  label_0777C:
    local_166 = "That item needs to be Worn, not used."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_16A = ax
    CALL proc_2311E(addr(local_166), addr(local_16A))
    ax = addr(local_16A)
    PUSH DS
    PUSH addr(local_16A)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_16A), DS, 79, 1)
    CALL free_string(addr(local_166))
    CALL free_string(addr(local_16A))
    RETURN
  label_077D8:
    CALL hit_any_key_to_continue_2434A()
    CALL mage_0C4A1()
  label_077E2:
    CALL free_string(addr(local_158))
    CALL free_string(addr(local_142))
    CALL free_string(addr(local_F0))
    CALL free_string(addr(local_48))
    CALL free_string(addr(local_24))
    CALL free_string(addr(local_1A))
    CALL free_string(addr(local_16))
    CALL free_string(addr(local_20))
    CALL free_string(addr(local_32))
    PROC_EXIT
    RETURN
    GOTO label_07B9D
END SUB

SUB item_menu_07841  ' image &H7841, locals 92
  ' strings: ITEM MENU | What do you wish to do with the  | (W) Wear the  | (U) Use the  | (T) Take the  |  off
    cx = 92
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 6, 4, &H8001, addr(local_1C))
    local_1E = 1
    local_20 = 25
    CALL proc_21194(addr(local_1E), addr(local_20))
    local_22 = 15
    local_24 = 0
    CALL color_25283(addr(local_22), addr(local_24))
    local_26 = 1
    local_28 = 35
    local_2C = "ITEM MENU"
    local_2E = 0
    CALL locate_print_21DEA(addr(local_26), addr(local_28), addr(local_2C), addr(local_2E))
    CALL free_string(addr(local_2C))
    local_30 = 3
    local_32 = 1
    ax = "What do you wish to do with the " + arg_6
    ax = ax + &H3714
    local_36 = ax
    local_38 = 0
    CALL locate_print_21DEA(addr(local_30), addr(local_32), addr(local_36), addr(local_38))
    CALL free_string(addr(local_36))
    ax = "(W) Wear the " + arg_6
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(1, 1)
    bx = dx
    ax = "(U) Use the " + arg_6
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(2, 1)
    bx = dx
    ax = "(T) Take the " + arg_6
    ax = ax + " off"
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(3, 1)
    bx = dx
    ax = "(D) Drop the " + arg_6
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(4, 1)
    bx = dx
    ax = "(I) Find out information about the " + arg_6
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(5, 1)
    bx = dx
    bx = addr(local_1C)
    CALL array_element(6, 1)
    si = bx
    di = "(Q or ESC) Return to the inventory screen"
    CALL near_00033()
  label_079DC:
    local_3A = 6
    local_3C = 1
    local_3E = 5
    local_40 = 5
    local_42 = 2
    local_44 = 0
    local_46 = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_3A), addr(local_3C), addr(local_3E), addr(local_40), addr(local_42), addr(local_44), addr(local_4C), addr(local_46))
    local_4A = ax
    local_50 = addr(local_4A)
    CALL RT_2732_6130(addr(local_50), &H16D0)
    ax = 0
    IF ? <> ? THEN GOTO label_07A4C
    ax = ax - 1
  label_07A4C:
    bx = ax
    ax = 74
    local_52 = bx
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_50))
    ax = 0
    IF ? <> ? THEN GOTO label_07A6F
    ax = ax - 1
  label_07A6F:
    ' or ax,[bp-0x52]
    ' and ax,ax
    IF ? <> ? THEN GOTO label_07A79
    GOTO label_07A88
  label_07A79:
    local_50 = &H16F4
    GOTO label_07B68
    GOTO label_07B11
  label_07A88:
    CALL RT_2732_6130(addr(local_50), &H396C)
    ax = 0
    IF ? <> ? THEN GOTO label_07A9B
    ax = ax - 1
  label_07A9B:
    bx = ax
    local_54 = bx
    CALL RT_2732_6130(addr(local_50), &H16DC)
    ax = 0
    IF ? <> ? THEN GOTO label_07AB3
    ax = ax - 1
  label_07AB3:
    ' or ax,[bp-0x54]
    bx = ax
    local_56 = bx
    CALL RT_2732_6130(addr(local_50), &H1EC2)
    ax = 0
    IF ? <> ? THEN GOTO label_07ACE
    ax = ax - 1
  label_07ACE:
    ' or ax,[bp-0x56]
    bx = ax
    local_58 = bx
    CALL RT_2732_6130(addr(local_50), &H1756)
    ax = 0
    IF ? <> ? THEN GOTO label_07AE9
    ax = ax - 1
  label_07AE9:
    ' or ax,[bp-0x58]
    bx = ax
    local_5A = bx
    CALL RT_2732_6130(addr(local_50), &H1750)
    ax = 0
    IF ? <> ? THEN GOTO label_07B04
    ax = ax - 1
  label_07B04:
    ' or ax,[bp-0x5a]
    ' and ax,ax
    IF ? <> ? THEN GOTO label_07B0E
    GOTO label_07B11
  label_07B0E:
    GOTO label_07B68
  label_07B11:
    local_5E = "INVALID KEY WAS HIT"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_62 = ax
    CALL proc_2311E(addr(local_5E), addr(local_62))
    ax = addr(local_62)
    PUSH DS
    PUSH addr(local_62)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_62), DS, 79, 1)
    CALL free_string(addr(local_5E))
    CALL free_string(addr(local_62))
    GOTO label_079DC
  label_07B68:
    local_66 = addr(local_50)
    CALL free_string(addr(local_4A))
    CALL free_string(addr(local_50))
    CALL erase_array(addr(local_1C))
    CALL RT_2732_64F5(addr(local_66))
    PROC_EXIT
    RETURN
    GOTO label_07F05
END SUB

SUB lerend_07BA0  ' image &H7BA0, locals 66
  ' strings:  cannot visit the cleric until he/she leaves the dungeon! | Lerend |  cannot visit the shop until he/she leaves the dungeon! | Kiera | HELPMAIN | INTRODUCTION
    cx = 66
    CALL frame_enter()
    ax = 440
    CALL RT_2732_63DF(DS, 440, 20)
    CALL RT_2732_6374(20)
    local_E = ax
    CALL proc_0670C()
  label_07BC9:
    local_10 = 1
    local_12 = 25
    CALL proc_21194(addr(local_10), addr(local_12))
  label_07BE0:
    IF var_0062 == 1 THEN GOTO label_07BEA
    GOTO label_07BF6
  label_07BEA:
    local_16 = &H16D0
    GOTO label_07C14
  label_07BF6:
    CALL character_menu_03522(addr(local_E), &HAE0)
    local_1A = ax
    local_16 = addr(local_1A)
  label_07C14:
    local_1E = addr(local_16)
    CALL RT_2732_6130(addr(local_1E), &H16D0)
    IF var_0062 <> 1 THEN GOTO label_07C2F
    GOTO label_07C4C
  label_07C2F:
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_1E))
    IF var_0062 == 1 THEN GOTO label_07C4C
    GOTO label_07C61
  label_07C4C:
    CALL proc_09BED()
    CALL hallfame_dat_10E6E()
    CALL inv_09C77()
    GOTO label_07ED9
    GOTO label_07EC9
  label_07C61:
    CALL RT_2732_6130(addr(local_1E), &H1A98)
    IF var_0062 == 1 THEN GOTO label_07C73
    GOTO label_07C7B
  label_07C73:
    CALL proc_166EF()
    GOTO label_07EC9
  label_07C7B:
    CALL RT_2732_6130(addr(local_1E), &H1756)
    IF var_0062 == 1 THEN GOTO label_07C8D
    GOTO label_07C95
  label_07C8D:
    CALL sorcerer_s_bane_17F3F()
    GOTO label_07EC9
  label_07C95:
    CALL RT_2732_6130(addr(local_1E), &H16F8)
    IF var_0062 == 1 THEN GOTO label_07CA7
    GOTO label_07CAF
  label_07CA7:
    CALL experience_level_menu_0D47B()
    GOTO label_07EC9
  label_07CAF:
    CALL RT_2732_6130(addr(local_1E), &H170A)
    IF var_0062 == 1 THEN GOTO label_07CC1
    GOTO label_07CC9
  label_07CC1:
    CALL character_attributes_0F9E0()
    GOTO label_07EC9
  label_07CC9:
    CALL RT_2732_6130(addr(local_1E), &H16D6)
    IF var_0062 == 1 THEN GOTO label_07CDB
    GOTO label_07D3F
  label_07CDB:
    IF var_01F4 > 0 THEN GOTO label_07CE5
    GOTO label_07D21
  label_07CE5:
    ax = addr(local_E) + " cannot visit the cleric until he/she leaves the dungeon!"
    local_22 = ax
    local_26 = &H16F4
    CALL proc_2311E(addr(local_22), addr(local_26))
    CALL free_string(addr(local_22))
    CALL free_string(addr(local_26))
    GOTO label_07BE0
  label_07D21:
    local_2A = "Lerend"
    CALL enter_00E6E(addr(local_2A))
    CALL free_string(addr(local_2A))
    GOTO label_07EC9
  label_07D3F:
    CALL RT_2732_6130(addr(local_1E), &H1710)
    IF var_01F4 == 0 THEN GOTO label_07D51
    GOTO label_07D59
  label_07D51:
    CALL wood_software_development_0EAE8()
    GOTO label_07EC9
  label_07D59:
    CALL RT_2732_6130(addr(local_1E), &H1A62)
    IF var_01F4 == 0 THEN GOTO label_07D6B
    GOTO label_07DCF
  label_07D6B:
    IF var_01F4 > 0 THEN GOTO label_07D75
    GOTO label_07DB1
  label_07D75:
    ax = addr(local_E) + " cannot visit the shop until he/she leaves the dungeon!"
    local_2E = ax
    local_32 = &H16F4
    CALL proc_2311E(addr(local_2E), addr(local_32))
    CALL free_string(addr(local_2E))
    CALL free_string(addr(local_32))
    GOTO label_07BE0
  label_07DB1:
    local_36 = "Kiera"
    CALL enter_08320(addr(local_36))
    CALL free_string(addr(local_36))
    GOTO label_07EC9
  label_07DCF:
    CALL RT_2732_6130(addr(local_1E), &H173A)
    IF var_01F4 == 0 THEN GOTO label_07DE1
    GOTO label_07E04
  label_07DE1:
    local_3A = "HELPMAIN"
    CALL sb_dat_21E13(addr(local_3A))
    CALL free_string(addr(local_3A))
    CALL hit_any_key_to_continue_2434A()
    GOTO label_07EC9
  label_07E04:
    CALL RT_2732_6130(addr(local_1E), &H1750)
    IF var_01F4 == 0 THEN GOTO label_07E16
    GOTO label_07E39
  label_07E16:
    local_3E = "INTRODUCTION"
    CALL sb_dat_21E13(addr(local_3E))
    CALL free_string(addr(local_3E))
    CALL hit_any_key_to_continue_2434A()
    GOTO label_07EC9
  label_07E39:
    CALL RT_2732_6130(addr(local_1E), &H396C)
    IF var_01F4 == 0 THEN GOTO label_07E4B
    GOTO label_07E72
  label_07E4B:
    local_42 = "ALLYN"
    local_44 = 0
    CALL monster_dat_19049(addr(local_42), addr(local_44))
    CALL free_string(addr(local_42))
    GOTO label_07EC9
  label_07E72:
    local_48 = "'Look', Allyn says, 'I'm a DM, not a mind reader! Enter a VALID choice!'"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_4C = ax
    CALL proc_2311E(addr(local_48), addr(local_4C))
    ax = addr(local_4C)
    PUSH DS
    PUSH addr(local_4C)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_4C), DS, 79, 1)
    CALL free_string(addr(local_48))
    CALL free_string(addr(local_4C))
    GOTO label_07BE0
  label_07EC9:
    IF var_0112 == 1 THEN GOTO label_07ED3
    GOTO label_07ED6
  label_07ED3:
    GOTO label_07ED9
  label_07ED6:
    GOTO label_07BC9
  label_07ED9:
    CALL free_string(addr(local_1E))
    CALL free_string(addr(local_1A))
    CALL free_string(addr(local_16))
    CALL free_string(addr(local_E))
    PROC_EXIT
    RETURN
    GOTO label_08009
END SUB

SUB proc_07F08  ' image &H7F08, locals 6
    cx = 6
    CALL frame_enter()
    si = arg_8
    ax = 0
    IF [si] <> 0 THEN GOTO label_07F1C
    ax = ax - 1
  label_07F1C:
    bx = ax
    ax = var_012F
    cx = 0
    IF ax >= [si] THEN GOTO label_07F29
    cx = cx - 1
  label_07F29:
    ' or cx,bx
    ' and cx,cx
    IF ax <> [si] THEN GOTO label_07F32
    GOTO label_07F35
  label_07F32:
    ax = ax + 1
    [si] = ax
  label_07F35:
    ax = var_01E0
    ax = ax + var_01E6
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax > [si] THEN GOTO label_07F5C
    GOTO label_07F67
  label_07F5C:
    ' float_D9
    ' float_D9
  label_07F67:
    local_10 = 1
    ' float_D9
    si = arg_8
    ax = [si]
    bx = ax
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF ax <= [si] THEN GOTO label_07F88
    GOTO label_07FEE
  label_07F88:
    local_10 = 0
    ax = 68
    ' imul bx
    ax = ax + &HBEE
    dx = ax
    ax = ax + 52
    si = ax
    cx = var_0278
    [si] = cx
    cx = dx
    dx = dx + 54
    si = dx
    ax = var_027A
    [si] = ax
    dx = cx
    cx = cx + 62
    si = cx
    ax = var_027E
    [si] = ax
    cx = dx
    dx = dx + 56
    si = dx
    ax = var_027C
    [si] = ax
    dx = cx
    cx = cx + 58
    si = cx
    [si] = ax
    ' float_DD
    CALL RT_2F00_056C()
    dx = dx + 66
    si = dx
    [si] = ax
    IF bx > var_012F THEN GOTO label_07FEA
    GOTO label_07FEE
  label_07FEA:
    var_012F = bx
  label_07FEE:
    ax = local_10
    CALL RT_2F00_0558()
    si = arg_6
    ' float_D9
    ax = arg_6
    PROC_EXIT
    RETURN
    GOTO label_080A8
END SUB

SUB proc_0800C  ' image &H800C, locals 2
    cx = 2
    CALL frame_enter()
    ax = 279
    CALL RT_2732_63DF(DS, 279, 12)
    OPEN 12 FOR RANDOM AS #3 LEN = 166
    si = arg_6
    ax = [si]
    bx = ax
    PUSH 3
    ' cwd
    dx = bx
    local_C = dx
    GET #DX, [si], buffer(440) LEN = 166
    CLOSE #3
    ax = local_C
    var_0098 = ax
    var_010E = 0
    var_0110 = 0
    var_010A = 0
    var_010C = 0
    ax = var_01F6
    var_1586 = ax
    ax = var_01F8
    var_1588 = ax
    ax = var_01FA
    var_158A = ax
    ax = var_01FC
    var_158C = ax
    ax = var_01FE
    var_158E = ax
    PROC_EXIT
    RETURN
    GOTO label_08169
END SUB

SUB inv_080AB  ' image &H80AB, locals 8
  ' strings: .INV
    cx = 8
    CALL frame_enter()
    ax = 460
    CALL RT_2732_63DF(DS, 460, 8)
    CALL RT_2732_6374(8)
    ax = ax + ".INV"
    local_E = ax
    OPEN addr(local_E) FOR RANDOM AS #4 LEN = 68
    CALL file_ah4(4)
    CALL RT_2F00_0559()
    ' float_DC
    CALL RT_2F00_056C()
    var_012F = ax
    CALL erase_array(&H40F2)
    ax = var_012F
    local_10 = ax
    ax = 1
    GOTO label_08143
  label_0811C:
    ax = 68
    PUSH 4
    PUSH long(local_12)
    ' imul word [bp-0x12]
    ax = ax + &HBEE
    CALL get_record(buffer(ax), 68)
    ax = local_12
    ax = ax + 1
  label_08143:
    local_12 = ax
    IF ax <= local_10 THEN GOTO label_0811C
    CLOSE #4
    CALL free_string(addr(local_E))
    PROC_EXIT
    RETURN
    GOTO label_081B7
END SUB

SUB itemfile_dat_0816C  ' image &H816C, locals 0
  ' strings: ITEMFILE.DAT
    cx = 0
    CALL frame_enter()
    OPEN "ITEMFILE.DAT" FOR RANDOM AS #1 LEN = 44
    si = arg_6
    GET #1, long([si]), buffer(606) LEN = 44
    CLOSE #1
    PROC_EXIT
    RETURN
    GOTO label_08224
END SUB

SUB spells_dat_081BA  ' image &H81BA, locals 4
  ' strings: SPELLS.DAT
    cx = 4
    CALL frame_enter()
    ax = var_0BC0
    ax = ax * 2
    ax = ax * 2
    ax = ax + var_0BC2
    ax = ax + &HFFFC
    CALL RT_2F00_0558()
    ' float_D9
    OPEN "SPELLS.DAT" FOR RANDOM AS #6 LEN = 66
    ' float_D9
    PUSH 6
    CALL RT_2F00_057D()
    GET #DX, 6, buffer(&HBAC) LEN = 66
    CLOSE #6
    PROC_EXIT
    RETURN
    GOTO label_0831D
END SUB

SUB remove_08227  ' image &H8227, locals 40
  ' strings: REMOVE | The item has been removed.  Hit any key to continue.
    cx = 40
    CALL frame_enter()
    local_C = 1
    local_E = 25
    CALL proc_21194(addr(local_C), addr(local_E))
    local_12 = "REMOVE"
    CALL inventory_management_05F8E(addr(local_26), addr(local_12))
    local_16 = ax
    CALL free_string(addr(local_12))
    local_2A = addr(local_16)
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_2A))
    IF ? <> ? THEN GOTO label_08293
    GOTO label_082FA
  label_08293:
    local_18 = 1
    CALL proc_00A98(addr(local_26), addr(local_18), addr(local_1C))
    ' float_D9
    ' float_D9
    local_20 = "The item has been removed.  Hit any key to continue."
    local_24 = &H16F4
    CALL proc_2311E(addr(local_20), addr(local_24))
    CALL free_string(addr(local_20))
    CALL free_string(addr(local_24))
    CALL proc_243D9()
    local_32 = ax
    local_2A = addr(local_32)
  label_082FA:
    CALL free_string(addr(local_32))
    CALL free_string(addr(local_16))
    CALL free_string(addr(local_2A))
    PROC_EXIT
    RETURN
    GOTO label_08825
END SUB

SUB enter_08320  ' image &H8320, locals 116
  ' strings: ENTER | ESCAPE | HELPSHOP | identify an item | IDENTIFY | It was a 
    cx = 116
    CALL frame_enter()
    CALL mage_0C4A1()
    CALL proc_0D0CF()
  label_08332:
    CALL proc_0A9DA()
    ax = 72
    ax = 112
    CALL RT_2732_6404(DS, 72, 1, DS, 112, 2)
    ax = 74
    ax = 114
    CALL RT_2732_6404(DS, 74, 1, DS, 114, 2)
    ax = "ENTER"
    PUSH DS
    PUSH "ENTER"
    ' xor ax,ax
    ax = 116
    CALL RT_2732_6404("ENTER", DS, 116, 10)
    ax = "ESCAPE"
    PUSH DS
    PUSH "ESCAPE"
    ' xor ax,ax
    ax = 126
    CALL RT_2732_6404("ESCAPE", DS, 126, 10)
  label_08391:
    CALL name_0AF8B()
    CALL magic_resist_0B7DE()
    CALL kiera_090AD(arg_6, addr(local_14))
    local_E = ax
    local_18 = addr(local_E)
    local_12 = addr(local_18)
    CALL RT_2732_6130(addr(local_12), &H16D0)
    IF ? <> ? THEN GOTO label_083D3
    GOTO label_083F0
  label_083D3:
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_12))
    IF ? == ? THEN GOTO label_083F0
    GOTO label_083F6
  label_083F0:
    GOTO label_087BA
    GOTO label_087B7
  label_083F6:
    CALL RT_2732_6130(addr(local_12), &H1750)
    IF ? == ? THEN GOTO label_08408
    GOTO label_0841E
  label_08408:
    local_1A = 0
    CALL wield_0684E(addr(local_1A))
    CALL proc_0D0CF()
    GOTO label_087B7
  label_0841E:
    CALL RT_2732_6130(addr(local_12), &H173A)
    IF ? == ? THEN GOTO label_08430
    GOTO label_08458
  label_08430:
    local_1E = "HELPSHOP"
    CALL sb_dat_21E13(addr(local_1E))
    CALL free_string(addr(local_1E))
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0D0CF()
    GOTO label_087B7
  label_08458:
    CALL RT_2732_6130(addr(local_12), &H1720)
    IF ? == ? THEN GOTO label_0846A
    GOTO label_0860F
  label_0846A:
    local_20 = &H5DC
    local_24 = "identify an item"
    CALL in_gold_to_08D9C(addr(local_20), addr(local_24))
    local_28 = ax
    CALL free_string(addr(local_24))
    local_18 = addr(local_28)
    CALL RT_2732_6130(addr(local_18), &H418E)
    IF ? == ? THEN GOTO label_084B1
    GOTO label_0860C
  label_084B1:
    local_2A = 1
    local_2C = 25
    CALL proc_21194(addr(local_2A), addr(local_2C))
    local_30 = "IDENTIFY"
    CALL inventory_management_05F8E(addr(local_46), addr(local_30))
    local_34 = ax
    CALL free_string(addr(local_30))
    local_18 = addr(local_34)
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_18))
    IF ? <> ? THEN GOTO label_08515
    GOTO label_08607
  label_08515:
    ax = 68
    ' imul word [bp-0x46]
    ax = ax + &HBEE
    ax = ax + 26
    CALL RT_2732_63DF(DS, ax, 26)
    local_38 = ax
    CALL proc_21210(addr(local_38))
    local_3C = ax
    ax = addr(local_38)
    PUSH DS
    PUSH addr(local_38)
    ' xor ax,ax
    ax = 68
    PUSH addr(local_38)
    ' imul word [bp-0x46]
    bx = ax
    ax = ax + &HBEE
    dx = ax
    ax = ax + 26
    local_48 = dx
    local_4A = bx
    CALL RT_2732_6404(DS, ax, 26)
    CALL free_string(addr(local_38))
    ax = addr(local_3C)
    PUSH DS
    PUSH addr(local_3C)
    ' xor ax,ax
    CALL RT_2732_6404(addr(local_3C), DS, local_48, 26)
    ax = local_4A
    ax = ax + &HBEE
    ax = ax + 60
    si = ax
    [si] = 1
    CALL RT_2732_63DF(DS, local_48, 26)
    CALL RT_2732_6374(26)
    ax = "It was a " + ax
    ax = ax + ". Hit any key to continue."
    local_40 = ax
    local_44 = &H16F4
    CALL proc_2311E(addr(local_40), addr(local_44))
    CALL free_string(addr(local_40))
    CALL free_string(addr(local_44))
    CALL proc_243D9()
    local_4E = ax
    local_52 = addr(local_4E)
  label_08607:
    CALL proc_0D0CF()
  label_0860C:
    GOTO label_087B7
  label_0860F:
    CALL RT_2732_6130(addr(local_12), &H1A98)
    IF ? == ? THEN GOTO label_08621
    GOTO label_08724
  label_08621:
    local_62 = &H1B58
    local_66 = "recharge a wand"
    local_54 = &H1B58
    local_58 = "recharge a wand"
    CALL in_gold_to_08D9C(addr(local_54), addr(local_58))
    local_5C = ax
    CALL free_string(addr(local_58))
    local_18 = addr(local_5C)
    CALL RT_2732_6130(addr(local_18), &H418E)
    IF ? == ? THEN GOTO label_08676
    GOTO label_08721
  label_08676:
    local_5E = 1
    local_60 = 25
    CALL proc_21194(addr(local_5E), addr(local_60))
    local_6A = "RECHARGE"
    CALL inventory_management_05F8E(addr(local_46), addr(local_6A))
    local_6E = ax
    CALL free_string(addr(local_6A))
    local_18 = addr(local_6E)
    CALL proc_0D0CF()
    CALL name_0AF8B()
    IF local_46 > 0 THEN GOTO label_086D0
    GOTO label_08721
  label_086D0:
    ax = 68
    ' imul word [bp-0x46]
    ax = ax + &HBEE
    bx = ax
    ax = ax + 58
    si = ax
    cx = [si]
    bx = bx + 56
    si = bx
    [bx] = cx
    local_70 = 13
    local_72 = 3
    CALL proc_253B3(addr(local_70), addr(local_72))
    local_76 = "ASHOPRECHARGE"
    CALL sb_dat_21E13(addr(local_76))
    CALL free_string(addr(local_76))
    CALL hit_any_key_to_continue_2434A()
  label_08721:
    GOTO label_087B7
  label_08724:
    CALL RT_2732_6130(addr(local_12), &H1DE8)
    IF local_46 == 0 THEN GOTO label_08736
    GOTO label_0873E
  label_08736:
    CALL itemfile_dat_08828()
    GOTO label_087B7
  label_0873E:
    CALL RT_2732_6130(addr(local_12), &H1A62)
    IF local_46 == 0 THEN GOTO label_08750
    GOTO label_08758
  label_08750:
    CALL text_092A2()
    GOTO label_087B7
  label_08758:
    ax = arg_6 + " smiles and says 'I don't understand. What was that?'"
    local_7A = ax
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_7E = ax
    CALL proc_2311E(addr(local_7A), addr(local_7E))
    ax = addr(local_7E)
    PUSH DS
    PUSH addr(local_7E)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_7E), DS, 79, 1)
    CALL free_string(addr(local_7A))
    CALL free_string(addr(local_7E))
    GOTO label_08391
  label_087B7:
    GOTO label_08332
  label_087BA:
    CALL free_string(addr(local_6E))
    CALL free_string(addr(local_5C))
    CALL free_string(addr(local_4E))
    CALL free_string(addr(local_3C))
    CALL free_string(addr(local_34))
    CALL free_string(addr(local_28))
    CALL free_string(addr(local_12))
    CALL free_string(addr(local_E))
    CALL free_string(addr(local_18))
    CALL free_string(addr(local_52))
    CALL free_string(addr(local_66))
    PROC_EXIT
    RETURN
    GOTO label_08D99
END SUB

SUB itemfile_dat_08828  ' image &H8828, locals 156
  ' strings: ITEMFILE.DAT |  -  | 'Which item would you like?' she asks nicely | Sorry, chum, but you don't have enough gold | Try as you might, you cannot lift the item. You have to drop something first | WEARWIELD
    cx = 156
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, var_0137, 4, &H8001, addr(local_1C))
    ' xor ax,ax
    CALL RT_2732_24B9(addr(local_1C), var_0137, 2, 513, addr(local_2E))
    ' float_D9
    ' float_D9
    OPEN "ITEMFILE.DAT" FOR RANDOM AS #1 LEN = 44
    ax = var_0137
    local_30 = ax
    ax = 1
    GOTO label_0892C
  label_0888C:
    bx = &H1606
    CALL array_element(1, local_3C, 1)
    CALL get_record(long([es:bx]), buffer(606), 44)
    ' float_DD
    ax = var_00A8
    CALL RT_2F00_0558()
    ' float_DE
    ' float_DC
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_3E = ax
    local_36 = 0
    CALL proc_25D42(addr(local_36), addr(local_3E))
    local_3A = ax
    ax = 606
    CALL RT_2732_63DF(DS, 606, 26)
    ax = ax + " - "
    ax = ax + addr(local_3A)
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(local_3C, 1)
    bx = dx
    ax = local_3C
    ax = ax + 1
  label_0892C:
    local_3C = ax
    IF ax > local_30 THEN GOTO label_08937
    GOTO label_0888C
  label_08937:
    CLOSE #1
    CALL proc_0A9DA()
    local_40 = 11
    local_42 = 0
    CALL color_25283(addr(local_40), addr(local_42))
    local_44 = 12
    local_46 = 3
    local_4A = "'Which item would you like?' she asks nicely"
    local_4C = 0
    CALL locate_print_21DEA(addr(local_44), addr(local_46), addr(local_4A), addr(local_4C))
    CALL free_string(addr(local_4A))
    CALL name_0AF8B()
    CALL magic_resist_0B7DE()
    ax = local_3C
    ax = ax - 1
    local_4E = ax
    local_50 = 2
    local_52 = 3
    local_54 = 14
    local_56 = 0
    local_58 = 0
    local_5A = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_4E), addr(local_50), addr(local_52), addr(local_54), addr(local_56), addr(local_58), addr(local_60), addr(local_5A))
    local_5E = ax
    local_64 = addr(local_5E)
  label_089FC:
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_64))
    ax = 0
    IF ax == local_30 THEN GOTO label_08A1A
    ax = ax - 1
  label_08A1A:
    bx = ax
    local_68 = bx
    CALL RT_2732_6130(addr(local_64), &H16D0)
    ax = 0
    IF ax == local_30 THEN GOTO label_08A32
    ax = ax - 1
  label_08A32:
    ' and ax,[bp-0x68]
    ' and ax,ax
    IF ax <> local_30 THEN GOTO label_08A3C
    GOTO label_08CFE
  label_08A3C:
    bx = &H1606
    CALL array_element(local_60, 1)
    ax = [es:bx]
    local_66 = ax
    CALL itemfile_dat_0816C(addr(local_66))
    bx = &H1606
    CALL array_element(local_60, 1)
    ax = local_66
    [es:bx] = ax
    ax = var_012F
    ax = ax + 1
    local_72 = ax
    ' float_DD
    ax = var_00A8
    CALL RT_2F00_0558()
    ' float_DE
    ' float_DC
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_3E = ax
    ' cwd
    CALL RT_2732_7413(DX, var_00A8, var_0222, var_0220)
    IF ax > local_30 THEN GOTO label_08AAF
    GOTO label_08B06
  label_08AAF:
    local_6C = "Sorry, chum, but you don't have enough gold"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_70 = ax
    CALL proc_2311E(addr(local_6C), addr(local_70))
    ax = addr(local_70)
    PUSH DS
    PUSH addr(local_70)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_70), DS, 79, 1)
    CALL free_string(addr(local_6C))
    CALL free_string(addr(local_70))
    GOTO label_08C81
  label_08B06:
    CALL proc_07F08(addr(local_72), addr(local_76))
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_30 THEN GOTO label_08B34
    GOTO label_08B8B
  label_08B34:
    local_7A = "Try as you might, you cannot lift the item. You have to drop something first"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_7E = ax
    CALL proc_2311E(addr(local_7A), addr(local_7E))
    ax = addr(local_7E)
    PUSH DS
    PUSH addr(local_7E)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_7E), DS, 79, 1)
    CALL free_string(addr(local_7A))
    CALL free_string(addr(local_7E))
    GOTO label_08C81
  label_08B8B:
    ax = local_3E
    ' cwd
    ax = ax - var_0220
    ' sbb dx,[0x222]
    ax = -ax
    ' adc dx,0x0
    dx = -dx
    var_0220 = ax
    var_0222 = dx
    ax = 68
    ' imul word [bp-0x72]
    ax = ax + &HBEE
    bx = ax
    ax = ax + 56
    si = ax
    cx = var_027C
    [si] = cx
    bx = bx + 58
    si = bx
    [bx] = cx
    ax = 606
    CALL RT_2732_63DF(DS, 606, 26)
    local_86 = ax
    CALL proc_23059(addr(local_86))
    local_8A = ax
    ax = addr(local_86)
    PUSH DS
    PUSH addr(local_86)
    ' xor ax,ax
    ax = 606
    CALL RT_2732_6404(addr(local_86), DS, 606, 26)
    CALL free_string(addr(local_86))
    ax = addr(local_8A)
    PUSH DS
    PUSH addr(local_8A)
    ' xor ax,ax
    ax = 68
    PUSH addr(local_8A)
    ' imul word [bp-0x72]
    bx = ax
    ax = ax + &HBEE
    dx = ax
    ax = ax + 26
    local_8C = dx
    local_8E = bx
    CALL RT_2732_6404(DS, ax, 26)
    ax = local_8E
    ax = ax + &HBEE
    bx = ax
    ax = ax + 64
    si = ax
    [si] = 0
    ax = 606
    local_90 = bx
    CALL RT_2732_6404(DS, 606, 26, DS, local_8C, 26)
    ax = local_90
    ax = ax + 60
    si = ax
    [si] = 1
    ' float_D9
    ' float_D9
  label_08C81:
    CALL name_0AF8B()
    CALL magic_resist_0B7DE()
    ax = local_3C
    ax = ax - 1
    local_92 = ax
    local_94 = 2
    local_96 = 3
    local_98 = 14
    local_9A = 0
    local_9C = 0
    local_9E = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_92), addr(local_94), addr(local_96), addr(local_98), addr(local_9A), addr(local_9C), addr(local_60), addr(local_9E))
    local_A2 = ax
    local_64 = addr(local_A2)
    GOTO label_089FC
  label_08CFE:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF ax <> local_30 THEN GOTO label_08D14
    ax = ax - 1
  label_08D14:
    cx = 0
    IF var_01E0 >= 3 THEN GOTO label_08D1F
    cx = cx - 1
  label_08D1F:
    ' and cx,ax
    ' and cx,cx
    IF var_01E0 <> 3 THEN GOTO label_08D28
    GOTO label_08D50
  label_08D28:
    local_A6 = "WEARWIELD"
    CALL sb_dat_21E13(addr(local_A6))
    CALL free_string(addr(local_A6))
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0D0CF()
  label_08D50:
    CALL free_string(addr(local_A2))
    CALL free_string(addr(local_8A))
    CALL free_string(addr(local_5E))
    CALL free_string(addr(local_3A))
    CALL free_string(addr(local_64))
    CALL erase_array(addr(local_2E))
    CALL erase_array(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_090AA
END SUB

SUB in_gold_to_08D9C  ' image &H8D9C, locals 104
  ' strings: You feel like a fish in a fishbowl as she appears to be appraising you. | She then gives you another warm smile and says 'For anyone else, I would | charge twice this much, but for you it will cost  |  in gold to  | .  Do you wish to  | ASHOPNOBUY
    cx = 104
    CALL frame_enter()
    CALL proc_0A9DA()
    ' float_D9
    CALL RT_2732_6199(arg_6)
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_DE
    CALL RT_2F00_056C()
    local_10 = ax
    CALL RT_2732_6333(arg_6)
    local_14 = ax
    si = arg_8
    ax = [si]
    CALL RT_2F00_0558()
    ax = var_00A8
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_16 = ax
    local_C = 11
    local_E = 0
    CALL locate_print_21DEA(addr(local_C), addr(local_10), addr(local_14), addr(local_E))
    local_18 = 13
    local_1A = 3
    local_1E = "You feel like a fish in a fishbowl as she appears to be appraising you."
    local_20 = 0
    CALL locate_print_21DEA(addr(local_18), addr(local_1A), addr(local_1E), addr(local_20))
    CALL free_string(addr(local_1E))
    local_22 = 14
    local_24 = 3
    local_28 = "She then gives you another warm smile and says 'For anyone else, I would"
    local_2A = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_24), addr(local_28), addr(local_2A))
    CALL free_string(addr(local_28))
    local_2C = 0
    CALL proc_25D42(addr(local_2C), addr(local_16))
    local_30 = ax
    ax = "charge twice this much, but for you it will cost " + addr(local_30)
    ax = ax + " in gold to "
    local_3A = ax
    local_32 = 15
    local_34 = 3
    local_36 = 0
    CALL locate_print_21DEA(addr(local_32), addr(local_34), addr(local_3A), addr(local_36))
    ax = arg_6 + ".  Do you wish to "
    ax = ax + arg_6
    local_3A = ax
    local_3C = 16
    local_3E = 3
    local_40 = 0
    CALL locate_print_21DEA(addr(local_3C), addr(local_3E), addr(local_3A), addr(local_40))
    local_42 = 18
    local_44 = 3
    local_46 = 1
    CALL y_yes_26031(addr(local_42), addr(local_44), addr(local_46))
    local_4A = ax
    local_52 = addr(local_4A)
    local_4C = 18
    local_4E = 3
    CALL proc_253B3(addr(local_4C), addr(local_4E))
    CALL RT_2732_6130(addr(local_52), &H2022)
    IF ? == ? THEN GOTO label_08F7F
    GOTO label_08F9D
  label_08F7F:
    local_56 = "ASHOPNOBUY"
    CALL sb_dat_21E13(addr(local_56))
    CALL free_string(addr(local_56))
    GOTO label_0905E
  label_08F9D:
    CALL RT_2732_7413(long(local_16), var_0222, var_0220)
    IF ? <= ? THEN GOTO label_08FB5
    GOTO label_0903A
  label_08FB5:
    ax = ax - var_0220
    ' sbb dx,[0x222]
    ax = -ax
    ' adc dx,0x0
    dx = -dx
    var_0220 = ax
    var_0222 = dx
    local_58 = 18
    local_5A = 3
    local_5E = "She smiles as she takes your money.  It seems that you both feel pretty"
    local_60 = 0
    CALL locate_print_21DEA(addr(local_58), addr(local_5A), addr(local_5E), addr(local_60))
    CALL free_string(addr(local_5E))
    local_62 = 19
    local_64 = 3
    local_68 = "good about the deal."
    local_6A = 0
    CALL locate_print_21DEA(addr(local_62), addr(local_64), addr(local_68), addr(local_6A))
    CALL free_string(addr(local_68))
    GOTO label_0905E
  label_0903A:
    local_6E = "ASHOPNOGOLD"
    CALL sb_dat_21E13(addr(local_6E))
    CALL free_string(addr(local_6E))
    local_52 = &H2022
  label_0905E:
    CALL hit_any_key_to_continue_2434A()
    local_72 = addr(local_52)
    CALL free_string(addr(local_4A))
    CALL free_string(addr(local_30))
    CALL free_string(addr(local_52))
    CALL free_string(addr(local_3A))
    CALL free_string(addr(local_14))
    CALL RT_2732_64F5(addr(local_72))
    PROC_EXIT
    RETURN
    GOTO label_0929F
END SUB

SUB kiera_090AD  ' image &H90AD, locals 66
  ' strings: Kiera | ASHOPKIERA | ASHOPTRAVELER | Choose what you wish to do: | (B) Buy an item | (I) Inventory management
    cx = 66
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 7, 4, &H8001, addr(local_1C))
    local_1E = 11
    local_20 = 3
    CALL proc_253B3(addr(local_1E), addr(local_20))
    CALL RT_2732_6130(arg_8, "Kiera")
    IF ? == ? THEN GOTO label_090F5
    GOTO label_09113
  label_090F5:
    local_24 = "ASHOPKIERA"
    CALL sb_dat_21E13(addr(local_24))
    CALL free_string(addr(local_24))
    GOTO label_0912E
  label_09113:
    local_28 = "ASHOPTRAVELER"
    CALL sb_dat_21E13(addr(local_28))
    CALL free_string(addr(local_28))
  label_0912E:
    local_2A = 18
    local_2C = 3
    local_30 = "Choose what you wish to do:"
    local_32 = 0
    CALL locate_print_21DEA(addr(local_2A), addr(local_2C), addr(local_30), addr(local_32))
    CALL free_string(addr(local_30))
    local_34 = 7
    local_36 = 0
    CALL color_25283(addr(local_34), addr(local_36))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(B) Buy an item"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(I) Inventory management"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(S) Sell an item"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "(H) Help"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "(K) identify an item"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(6, 1)
    si = bx
    di = "(Q or ESC) Quit shopping"
    CALL near_00033()
    bx = addr(local_1C)
    CALL array_element(7, 1)
    si = bx
    di = "(R) Recharge a wand"
    CALL near_00033()
    local_38 = 7
    local_3A = 2
    local_3C = 3
    local_3E = 20
    local_40 = 2
    local_42 = 0
    local_44 = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_38), addr(local_3A), addr(local_3C), addr(local_3E), addr(local_40), addr(local_42), arg_6, addr(local_44))
    local_48 = ax
    local_4C = addr(local_48)
    CALL free_string(addr(local_48))
    CALL erase_array(addr(local_1C))
    CALL RT_2732_64F5(addr(local_4C))
    PROC_EXIT
    RETURN
    GOTO label_0969D
END SUB

SUB text_092A2  ' image &H92A2, locals 114
  ' strings:  -  | You have no non-cursed identified items to sell | 'Which item do you want to sell?' she asks nicely | You must remove the item before selling it | She gladly takes the item off of your hands
    cx = 114
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, var_012F, 4, &H8001, addr(local_1C))
    ' xor ax,ax
    CALL RT_2732_24B9(addr(local_1C), var_012F, 2, 513, addr(local_2E))
  label_092DA:
    local_32 = 0
    ax = var_012F
    local_30 = ax
    ax = 1
    GOTO label_093B7
  label_092EC:
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    bx = ax
    ax = ax + 60
    si = ax
    cx = 0
    IF [si] <> 1 THEN GOTO label_09305
    cx = cx - 1
  label_09305:
    bx = bx + 66
    si = bx
    ax = 0
    IF [bx] <= 0 THEN GOTO label_09313
    ax = ax - 1
  label_09313:
    ' and ax,cx
    ' and ax,ax
    IF [bx] <> 0 THEN GOTO label_0931C
    GOTO label_093B3
  label_0931C:
    ax = [bx]
    CALL RT_2F00_0558()
    ax = var_00A8
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_3A = ax
    local_32 = local_32 + 1
    local_34 = 0
    CALL proc_25D42(addr(local_34), addr(local_3A))
    local_38 = ax
    ax = 68
    ' imul word [bp-0x3c]
    ax = ax + &HBEE
    CALL RT_2732_63DF(DS, ax, 26)
    ax = ax + " - "
    ax = ax + addr(local_38)
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(local_32, 1)
    bx = dx
    bx = addr(local_2E)
    CALL array_element(local_32, 1)
    ax = local_3C
    [es:bx] = ax
  label_093B3:
    ax = local_3C
    ax = ax + 1
  label_093B7:
    local_3C = ax
    IF ax > local_30 THEN GOTO label_093C2
    GOTO label_092EC
  label_093C2:
    IF local_32 == 0 THEN GOTO label_093CB
    GOTO label_09422
  label_093CB:
    local_40 = "You have no non-cursed identified items to sell"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_44 = ax
    CALL proc_2311E(addr(local_40), addr(local_44))
    ax = addr(local_44)
    PUSH DS
    PUSH addr(local_44)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_44), DS, 79, 1)
    CALL free_string(addr(local_40))
    CALL free_string(addr(local_44))
    GOTO label_09668
  label_09422:
    CALL proc_0A9DA()
    local_46 = 11
    local_48 = 0
    CALL color_25283(addr(local_46), addr(local_48))
    local_4A = 12
    local_4C = 3
    local_50 = "'Which item do you want to sell?' she asks nicely"
    local_52 = 0
    CALL locate_print_21DEA(addr(local_4A), addr(local_4C), addr(local_50), addr(local_52))
    CALL free_string(addr(local_50))
    CALL name_0AF8B()
    local_54 = 2
    local_56 = 3
    local_58 = 14
    local_5A = 0
    local_5C = 0
    local_5E = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_32), addr(local_54), addr(local_56), addr(local_58), addr(local_5A), addr(local_5C), addr(local_64), addr(local_5E))
    local_62 = ax
    local_68 = addr(local_62)
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_68))
    ax = 0
    IF local_32 <> 0 THEN GOTO label_094EF
    ax = ax - 1
  label_094EF:
    bx = ax
    local_6A = bx
    CALL RT_2732_6130(addr(local_68), &H16D0)
    ax = 0
    IF local_32 <> 0 THEN GOTO label_09507
    ax = ax - 1
  label_09507:
    ' or ax,[bp-0x6a]
    ' and ax,ax
    IF local_32 <> 0 THEN GOTO label_09511
    GOTO label_09517
  label_09511:
    GOTO label_09668
    GOTO label_09665
  label_09517:
    bx = addr(local_2E)
    CALL array_element(local_64, 1)
    ax = [es:bx]
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    ax = ax + 64
    si = ax
    IF [si] == 1 THEN GOTO label_0953F
    GOTO label_09596
  label_0953F:
    local_6E = "You must remove the item before selling it"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_72 = ax
    CALL proc_2311E(addr(local_6E), addr(local_72))
    ax = addr(local_72)
    PUSH DS
    PUSH addr(local_72)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_72), DS, 79, 1)
    CALL free_string(addr(local_6E))
    CALL free_string(addr(local_72))
    GOTO label_09665
  label_09596:
    bx = addr(local_2E)
    CALL array_element(local_64, 1)
    ax = [es:bx]
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    ax = ax + 66
    si = ax
    ax = [si]
    CALL RT_2F00_0558()
    ax = var_00A8
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_3A = ax
    bx = addr(local_2E)
    CALL array_element(local_64, 1)
    ax = [es:bx]
    local_74 = ax
    CALL proc_04D9D(addr(local_74))
    bx = addr(local_2E)
    CALL array_element(local_64, 1)
    ax = local_74
    [es:bx] = ax
    ax = local_3A
    ' cwd
    ax = ax + var_0220
    ' adc dx,[0x222]
    var_0220 = ax
    var_0222 = dx
    CALL name_0AF8B()
    local_78 = "She gladly takes the item off of your hands"
    local_7C = &H16F4
    CALL proc_2311E(addr(local_78), addr(local_7C))
    CALL free_string(addr(local_78))
    CALL free_string(addr(local_7C))
    IF var_012F == 0 THEN GOTO label_09662
    GOTO label_09665
  label_09662:
    GOTO label_09668
  label_09665:
    GOTO label_092DA
  label_09668:
    CALL free_string(addr(local_62))
    CALL free_string(addr(local_38))
    CALL free_string(addr(local_68))
    CALL erase_array(addr(local_2E))
    CALL erase_array(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_09A0C
END SUB

SUB cast_a_spell_096A0  ' image &H96A0, locals 96
  ' strings: CAST A SPELL | Which spell level do you wish to cast? | ENTER | ESCAPE | Level  |  - 
    cx = 96
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 6, 4, &H8001, addr(local_1C))
    local_1E = 15
    local_20 = 0
    CALL color_25283(addr(local_1E), addr(local_20))
    local_22 = 2
    local_24 = 54
    local_28 = "CAST A SPELL"
    local_2A = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_24), addr(local_28), addr(local_2A))
    CALL free_string(addr(local_28))
    local_2C = 3
    local_2E = 42
    local_32 = "Which spell level do you wish to cast?"
    local_34 = 0
    CALL locate_print_21DEA(addr(local_2C), addr(local_2E), addr(local_32), addr(local_34))
    CALL free_string(addr(local_32))
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? > ? THEN GOTO label_09777
    GOTO label_09782
  label_09777:
    ' float_D9
    ' float_D9
  label_09782:
    ax = 72
    ax = 112
    CALL RT_2732_6404(DS, 72, 1, DS, 112, 2)
    ax = 74
    ax = 114
    CALL RT_2732_6404(DS, 74, 1, DS, 114, 2)
    ax = "ENTER"
    PUSH DS
    PUSH "ENTER"
    ' xor ax,ax
    ax = 116
    CALL RT_2732_6404("ENTER", DS, 116, 10)
    ax = "ESCAPE"
    PUSH DS
    PUSH "ESCAPE"
    ' xor ax,ax
    ax = 126
    CALL RT_2732_6404("ESCAPE", DS, 126, 10)
    ax = 1
    GOTO label_0988E
  label_097E2:
    si = ax
    si = si * 2
    IF var_1578[si] >= 1 THEN GOTO label_097F0
    GOTO label_09899
  label_097F0:
    local_3A = 0
    CALL proc_25D42(addr(local_3A), addr(local_40))
    local_3E = ax
    ax = "Level " + addr(local_3E)
    ax = ax + " - "
    si = local_40
    si = si * 2
    local_42 = ax
    CALL RT_2732_63B4(var_1584[si])
    CALL RT_2732_6371(addr(local_40))
    CALL RT_2732_6374(addr(local_40))
    di = ax
    bx = si
    si = local_42
    local_44 = bx
    CALL near_0003B()
    ax = ax + &H469E
    si = local_44
    local_46 = ax
    CALL RT_2732_63B4(var_1578[si])
    CALL RT_2732_6371(addr(local_40))
    CALL RT_2732_6374(addr(local_40))
    ax = local_46 + ax
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(local_40, 1)
    bx = dx
    ax = local_40
    ax = ax + 1
  label_0988E:
    local_40 = ax
    IF ax > 5 THEN GOTO label_09899
    GOTO label_097E2
  label_09899:
    bx = addr(local_1C)
    CALL array_element(local_40, 1)
    si = bx
    di = "Don't cast a spell"
    CALL near_00033()
  label_098B0:
    local_48 = 1
    local_4A = 42
    local_4C = 4
    local_4E = 0
    local_50 = 0
    local_52 = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_40), addr(local_48), addr(local_4A), addr(local_4C), addr(local_4E), addr(local_50), addr(local_58), addr(local_52))
    local_56 = ax
    local_5C = addr(local_56)
    ax = local_40
    cx = 0
    IF ax <> local_58 THEN GOTO label_09914
    cx = cx - 1
  label_09914:
    ax = 74
    local_5E = cx
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_5C))
    ax = 0
    IF ax <> local_58 THEN GOTO label_09935
    ax = ax - 1
  label_09935:
    ' or ax,[bp-0x5e]
    ' and ax,ax
    IF ax <> local_58 THEN GOTO label_0993F
    GOTO label_0995B
  label_0993F:
    ax = 74
    ax = addr(local_5C)
    PUSH DS
    PUSH 74
    PUSH 1
    PUSH DS
    PUSH addr(local_5C)
    ' xor ax,ax
    CALL RT_2732_6404(addr(local_5C))
    GOTO label_099CE
    GOTO label_099CA
  label_0995B:
    si = local_58
    si = si * 2
    IF var_1584[si] == 0 THEN GOTO label_0996A
    GOTO label_099C1
  label_0996A:
    local_62 = "You have none of those spells left!"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_66 = ax
    CALL proc_2311E(addr(local_62), addr(local_66))
    ax = addr(local_66)
    PUSH DS
    PUSH addr(local_66)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_66), DS, 79, 1)
    CALL free_string(addr(local_62))
    CALL free_string(addr(local_66))
    GOTO label_099CA
  label_099C1:
    ax = local_58
    var_0BC0 = ax
    GOTO label_099CE
  label_099CA:
    GOTO label_098B0
  label_099CE:
    local_6A = addr(local_5C)
    CALL free_string(addr(local_56))
    CALL free_string(addr(local_3E))
    CALL free_string(addr(local_5C))
    CALL erase_array(addr(local_1C))
    CALL RT_2732_64F5(addr(local_6A))
    PROC_EXIT
    RETURN
    GOTO label_09BEA
END SUB

SUB don_t_cast_a_spell_09A0F  ' image &H9A0F, locals 76
  ' strings: SPELL NUMBERS FOR SPELL LEVEL  | Which spell do you wish to cast? | Don't cast a spell
    cx = 76
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 5, 4, &H8001, addr(local_1C))
    local_1E = 15
    local_20 = 0
    CALL color_25283(addr(local_1E), addr(local_20))
    local_22 = 2
    local_24 = 44
    local_26 = 0
    CALL proc_25D42(addr(local_26), &HBC0)
    local_2A = ax
    ax = "SPELL NUMBERS FOR SPELL LEVEL " + addr(local_2A)
    local_2E = ax
    local_30 = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_24), addr(local_2E), addr(local_30))
    CALL free_string(addr(local_2E))
    local_32 = 4
    local_34 = 42
    local_38 = "Which spell do you wish to cast?"
    local_3A = 0
    CALL locate_print_21DEA(addr(local_32), addr(local_34), addr(local_38), addr(local_3A))
    CALL free_string(addr(local_38))
    ax = 1
    GOTO label_09B09
  label_09ADA:
    var_0BC2 = ax
    CALL spells_dat_081BA()
    ax = &HBAC
    bx = addr(local_1C)
    CALL array_element(DS, &HBAC, 18, var_0BC2, 1)
    PUSH DS
    PUSH BX
    ' xor ax,ax
    CALL RT_2732_6404(1)
    ax = local_3C
    ax = ax + 1
  label_09B09:
    local_3C = ax
    IF ax <= 4 THEN GOTO label_09ADA
    var_0BC2 = 1
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "Don't cast a spell"
    CALL near_00033()
    local_3E = 5
    local_40 = 1
    local_42 = 42
    local_44 = 5
    local_46 = 0
    local_48 = 0
    local_4A = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_3E), addr(local_40), addr(local_42), addr(local_44), addr(local_46), addr(local_48), &HBC2, addr(local_4A))
    local_4E = ax
    local_52 = addr(local_4E)
    IF var_0BC2 == 5 THEN GOTO label_09B96
    GOTO label_09BAC
  label_09B96:
    ax = 74
    ax = addr(local_52)
    PUSH DS
    PUSH 74
    PUSH 1
    PUSH DS
    PUSH addr(local_52)
    ' xor ax,ax
    CALL RT_2732_6404(addr(local_52))
  label_09BAC:
    local_56 = addr(local_52)
    CALL free_string(addr(local_4E))
    CALL free_string(addr(local_2A))
    CALL free_string(addr(local_52))
    CALL erase_array(addr(local_1C))
    CALL RT_2732_64F5(addr(local_56))
    PROC_EXIT
    RETURN
    GOTO label_09C74
END SUB

SUB proc_09BED  ' image &H9BED, locals 0
    cx = 0
    CALL frame_enter()
    ax = var_0131
    IF ax < var_0098 THEN GOTO label_09C01
    GOTO label_09C07
  label_09C01:
    ax = var_0098
    var_0131 = ax
  label_09C07:
    ax = var_1586
    var_01F6 = ax
    ax = var_1588
    var_01F8 = ax
    ax = var_158A
    var_01FA = ax
    ax = var_158C
    var_01FC = ax
    ax = var_158E
    var_01FE = ax
    ax = 279
    CALL RT_2732_63DF(DS, 279, 12)
    OPEN 12 FOR RANDOM AS #3 LEN = 166
    CALL RT_2732_02EF(3, long(var_0098), buffer(440), 166)
    CLOSE #3
    PROC_EXIT
    RETURN
    GOTO label_09D3C
END SUB

SUB inv_09C77  ' image &H9C77, locals 8
  ' strings: .INV | FILES ARE IN USE.  COME BACK LATER
    cx = 8
    CALL frame_enter()
    ax = 460
    CALL RT_2732_63DF(DS, 460, 8)
    CALL RT_2732_6374(8)
    ax = ax + ".INV"
    local_10 = ax
    OPEN addr(local_10) FOR RANDOM AS #4 LEN = &HFFFF
    CLOSE #4
    OPEN addr(local_10) FOR RANDOM AS #4 LEN = 68
    ax = var_012F
    local_C = ax
    ax = 1
    GOTO label_09D0D
  label_09CE6:
    ax = 68
    PUSH 4
    PUSH long(local_12)
    ' imul word [bp-0x12]
    ax = ax + &HBEE
    CALL RT_2732_02EF(buffer(ax), 68)
    ax = local_12
    ax = ax + 1
  label_09D0D:
    local_12 = ax
    IF ax <= local_C THEN GOTO label_09CE6
    CALL erase_array(&H40F2)
    CLOSE #4
    CALL free_string(addr(local_10))
    PROC_EXIT
    RETURN
    CALL RT_2732_4E0A()
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bp+si+0x6c] = [bp+si+0x6c] + ah
    dx = dx + 1
    PUSH BX
    ' xor ah,[bx+si]
    ' and [bx+si],ah
    ' and [bx+si],ah
    dh = 116
    dx = dx + 1
    ' leave
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    PUSH &HAA16
    PUSH SS
    ' xor [bx+si],al
    ' rcl byte [di],0x0
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    ax = ax + 1
    di = di + 1
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bp+si] = [bp+si] + al
    ' lock adc cl,ch
    ' sbb al,0x0
    local_A = local_A + 1
    CALL RT_2732_60BA(DI, SI)
    local_A = local_A - 1
    RETURN
    local_A = local_A + 1
    CALL RT_2732_60F3(SI, DI)
    local_A = local_A - 1
    RETURN
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax > local_C THEN GOTO label_09DC6
    GOTO label_09E24
  label_09DC6:
    &H1672 = "FILES ARE IN USE.  COME BACK LATER"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    &H1676 = ax
    CALL proc_2311E(&H1672, &H1676)
    ax = &H1676
    PUSH DS
    PUSH &H1676
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(&H1676, DS, 79, 1)
    CALL free_string(&H1672)
    CALL free_string(&H1676)
    CALL hit_any_key_to_continue_2434A()
    CALL wood_software_development_0D2B8()
  label_09E24:
    CALL RT_2732_660D()
    CALL RT_2F00_0558()
    ' float_D9
    CALL RT_2732_6611()
    CALL RT_2F00_0559()
    ' float_D9
    CALL RT_2732_2316(long(1))
    CALL RT_2732_65BE()
    var_0058 = var_0058 + 1
    CALL RT_2732_65D9()
    GOTO label_09F88
END SUB

SUB proc_09E62  ' image &H9E62, locals 38
    cx = 38
    CALL frame_enter()
    ax = 78
    ' imul word [0x28c]
    ax = ax + var_028A
    ax = ax + &HFFB2
    CALL RT_2F00_0558()
    ' float_D9
    ax = 654
    CALL RT_2732_63DF(DS, 654, &H3F6)
    ' float_D9
    PUSH &H3F6
    CALL RT_2F00_056C()
    CALL RT_2732_6266(&H3F6, 1)
    local_12 = ax
    ax = var_028C
    ax = ax + 10
    local_14 = ax
    ax = var_028A
    ax = ax + 1
    local_16 = ax
    local_18 = 0
    CALL locate_print_21DEA(addr(local_14), addr(local_16), addr(local_12), addr(local_18))
  label_09ED8:
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_1A = ax
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_1C = ax
    CALL proc_0A5C4(addr(local_1C), addr(local_1A), addr(local_20))
    ' float_D9
    ' float_D9
    IF var_00EA == 1 THEN GOTO label_09ED8
    ax = local_1C
    var_028C = ax
    ax = local_1A
    var_028A = ax
    var_015C = 1
    local_26 = 0
    local_28 = 0
    CALL you_can_see_again_147F8(addr(local_26), addr(local_28), addr(local_2C))
    ' float_D9
    ' float_D9
    CALL free_string(addr(local_12))
    PROC_EXIT
    RETURN
    GOTO label_0A5C1
END SUB

SUB fighter_09F8B  ' image &H9F8B, locals 112
  ' strings: FIGHTER | BARD    | MAGE    | You have gone up a level! | You have an additional  |  hitpoints!
    cx = 112
    CALL frame_enter()
    ax = 468
    CALL RT_2732_63DF(DS, 468, 7)
    local_12 = ax
    CALL RT_2732_6130(addr(local_12), "FIGHTER")
    IF ? == ? THEN GOTO label_09FBB
    GOTO label_09FF9
  label_09FBB:
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    GOTO label_0A099
  label_09FF9:
    CALL RT_2732_6130(addr(local_12), "BARD   ")
    IF ? == ? THEN GOTO label_0A00B
    GOTO label_0A049
  label_0A00B:
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    GOTO label_0A099
  label_0A049:
    CALL RT_2732_6130(addr(local_12), "MAGE   ")
    IF ? == ? THEN GOTO label_0A05B
    GOTO label_0A099
  label_0A05B:
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    GOTO label_0A099
  label_0A099:
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_057D()
    var_010A = ax
    var_010C = dx
    var_010E = 0
    var_0110 = 0
    ' float_D9
    ax = var_021C
    dx = var_021E
    CALL RT_2F00_0559()
    CALL RT_2F00_05B3()
    IF ? > ? THEN GOTO label_0A0DC
    GOTO label_0A1D9
  label_0A0DC:
    ' float_D9
    GOTO label_0A1BE
  label_0A0E4:
    ax = var_010A
    dx = var_010C
    var_010E = ax
    var_0110 = dx
    ax = &HD4C0
    dx = 1
    CALL RT_2732_7413(var_010C, var_010A, DX, &HD4C0)
    IF ? > ? THEN GOTO label_0A10C
    GOTO label_0A123
  label_0A10C:
    ax = var_010A
    dx = var_010C
    ax = ax + &HD4C0
    ' adc dx,0x1
    var_010A = ax
    var_010C = dx
    GOTO label_0A198
  label_0A123:
    ' float_D9
    ' float_D8
    ' float_D9
    CALL RT_2F00_0619()
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_057D()
    var_010A = ax
    var_010C = dx
    ax = var_010A
    dx = var_010C
    ax = ax + 49
    ' adc dx,0x0
    CALL RT_2F00_0559()
    ' float_DC
    CALL RT_2F00_057D()
    local_E = ax
    local_C = dx
    ax = local_E
    dx = local_C
    var_010A = ax
    var_010C = dx
    CALL RT_2732_7404(long(100), var_010C, var_010A)
    var_010A = ax
    var_010C = dx
  label_0A198:
    CALL RT_2732_7413(var_021E, var_021C, var_010C, var_010A)
    IF ? < ? THEN GOTO label_0A1B2
    GOTO label_0A1B5
  label_0A1B2:
    GOTO label_0A1D9
  label_0A1B5:
    ' float_D9
    ' float_D8
  label_0A1BE:
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? > ? THEN GOTO label_0A1D9
    GOTO label_0A0E4
  label_0A1D9:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? > ? THEN GOTO label_0A1EE
    GOTO label_0A1F9
  label_0A1EE:
    ' float_D9
    ' float_D9
  label_0A1F9:
    ' float_D9
    ax = var_01E0
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF ? <> ? THEN GOTO label_0A211
    GOTO label_0A568
  label_0A211:
    ' float_D9
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    local_1C = ax
    ax = 0
    IF var_01EA <= 15 THEN GOTO label_0A233
    ax = ax - 1
  label_0A233:
    cx = 0
    IF local_1C <= 0 THEN GOTO label_0A23D
    cx = cx - 1
  label_0A23D:
    ' and cx,ax
    ' and cx,cx
    IF local_1C <> 0 THEN GOTO label_0A246
    GOTO label_0A25A
  label_0A246:
    ax = var_01EA
    ax = ax + &HFFF1
    CALL RT_2F00_0558()
    ' float_D9
    GOTO label_0A265
  label_0A25A:
    ' float_D9
    ' float_D9
  label_0A265:
    local_22 = 0
    ax = local_1C
    ' cwd
    ' xor ax,dx
    ax = ax - dx
    local_24 = ax
    ax = 1
    GOTO label_0A2B7
  label_0A27C:
    ax = local_22
    CALL RT_2F00_0558()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_DE
    ' float_D8
    ' float_D8
    CALL RT_2F00_056C()
    local_22 = ax
    ax = local_26
    ax = ax + 1
  label_0A2B7:
    local_26 = ax
    ax = local_24
    IF ax >= local_26 THEN GOTO label_0A27C
    IF local_1C < 0 THEN GOTO label_0A2CB
    GOTO label_0A2E1
  label_0A2CB:
    ax = local_1C
    ax = -ax
    local_28 = ax
    ax = local_22
    local_2A = ax
    ax = local_22
    ax = -ax
    local_22 = ax
  label_0A2E1:
    ax = local_22
    var_01E4 = var_01E4 + ax
    ax = local_22
    var_01E2 = var_01E2 + ax
    IF local_1C <> 0 THEN GOTO label_0A2F8
    GOTO label_0A4B1
  label_0A2F8:
    IF local_1C == 1 THEN GOTO label_0A301
    GOTO label_0A340
  label_0A301:
    local_2E = "You have gone up a level!"
    local_30 = 0
    CALL proc_25D42(addr(local_30), addr(local_22))
    local_34 = ax
    ax = "You have an additional " + addr(local_34)
    ax = ax + " hitpoints!"
    local_38 = ax
    GOTO label_0A469
  label_0A340:
    IF local_1C > 0 THEN GOTO label_0A349
    GOTO label_0A3B2
  label_0A349:
    local_3A = 0
    CALL proc_25D42(addr(local_3A), addr(local_1C))
    local_3E = ax
    ax = "You have gone up " + addr(local_3E)
    ax = ax + " levels!"
    local_2E = ax
    local_40 = 0
    CALL proc_25D42(addr(local_40), addr(local_22))
    local_44 = ax
    ax = "You have gained " + addr(local_44)
    ax = ax + " hitpoints!"
    local_38 = ax
    GOTO label_0A469
  label_0A3B2:
    IF local_1C == &HFFFF THEN GOTO label_0A3BB
    GOTO label_0A3FA
  label_0A3BB:
    local_2E = "You have gone down a level!"
    local_46 = 0
    CALL proc_25D42(addr(local_46), addr(local_2A))
    local_4A = ax
    ax = "You have lost " + addr(local_4A)
    ax = ax + " hitpoints!"
    local_38 = ax
    GOTO label_0A469
  label_0A3FA:
    IF local_1C < 0 THEN GOTO label_0A403
    GOTO label_0A469
  label_0A403:
    local_4C = 0
    CALL proc_25D42(addr(local_4C), addr(local_28))
    local_50 = ax
    ax = "You have gone down " + addr(local_50)
    ax = ax + " levels!"
    local_2E = ax
    local_52 = 0
    CALL proc_25D42(addr(local_52), addr(local_2A))
    local_56 = ax
    ax = "You have lost " + addr(local_56)
    ax = ax + " hitpoints!"
    local_38 = ax
  label_0A469:
    local_58 = 4
    local_5A = 42
    local_5C = 0
    CALL locate_print_21DEA(addr(local_58), addr(local_5A), addr(local_2E), addr(local_5C))
    local_5E = 5
    local_60 = 42
    local_62 = 0
    CALL locate_print_21DEA(addr(local_5E), addr(local_60), addr(local_38), addr(local_62))
  label_0A4B1:
    PUSH var_021E
    PUSH var_021C
    ' xor ax,ax
    ' cwd
    CALL RT_2732_7413(DX, addr(local_62))
    IF local_1C < 0 THEN GOTO label_0A4C8
    GOTO label_0A552
  label_0A4C8:
    local_64 = 8
    local_66 = 42
    local_6A = "You've lost too much experience!"
    local_6C = 0
    CALL locate_print_21DEA(addr(local_64), addr(local_66), addr(local_6A), addr(local_6C))
    CALL free_string(addr(local_6A))
    local_6E = 9
    local_70 = 42
    local_74 = "You die"
    local_76 = 0
    CALL locate_print_21DEA(addr(local_6E), addr(local_70), addr(local_74), addr(local_76))
    CALL free_string(addr(local_74))
    local_7A = "EXPERIENCE DRAIN"
    CALL dun_0E905(addr(local_7A))
    CALL free_string(addr(local_7A))
    GOTO label_0A568
  label_0A552:
    ax = local_1C
    var_01E0 = var_01E0 + ax
    CALL hit_any_key_to_continue_2434A()
    CALL name_0AF8B()
    CALL proc_0AA39()
  label_0A568:
    CALL free_string(addr(local_56))
    CALL free_string(addr(local_50))
    CALL free_string(addr(local_4A))
    CALL free_string(addr(local_44))
    CALL free_string(addr(local_3E))
    CALL free_string(addr(local_34))
    CALL free_string(addr(local_12))
    CALL free_string(addr(local_38))
    CALL free_string(addr(local_2E))
    PROC_EXIT
    RETURN
    GOTO label_0A9D7
END SUB

SUB proc_0A5C4  ' image &HA5C4, locals 16
    cx = 16
    CALL frame_enter()
    var_00E4 = 0
    var_00EC = 0
    var_00E6 = 0
    var_00E8 = 0
    var_00D8 = 0
    var_00DA = 0
    var_00DC = 0
    var_00DE = 0
    var_00E0 = 0
    var_00E2 = 0
    var_00EA = 0
    var_00F0 = 0
    var_00EE = 0
    si = arg_A
    ax = [si]
    cx = 78
    ' imul cx
    si = arg_8
    ax = ax + [si]
    ax = ax + &HFFB2
    CALL RT_2F00_0558()
    ' float_D9
    ax = &H684
    CALL RT_2732_63DF(DS, &H684, &H3F6)
    ' float_D9
    PUSH &H3F6
    CALL RT_2F00_056C()
    CALL RT_2732_6266(&H3F6, 1)
    CALL RT_2732_61A9(1)
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? <> ? THEN GOTO label_0A689
    GOTO label_0A69E
  label_0A689:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A69E
    GOTO label_0A6A7
  label_0A69E:
    var_00E4 = 1
    GOTO label_0A994
  label_0A6A7:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? <> ? THEN GOTO label_0A6BC
    GOTO label_0A6D1
  label_0A6BC:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A6D1
    GOTO label_0A6DA
  label_0A6D1:
    var_00E6 = 1
    GOTO label_0A994
  label_0A6DA:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A6EF
    GOTO label_0A6F8
  label_0A6EF:
    var_00D8 = 1
    GOTO label_0A994
  label_0A6F8:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? <> ? THEN GOTO label_0A70D
    GOTO label_0A722
  label_0A70D:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A722
    GOTO label_0A795
  label_0A722:
    ax = 654
    CALL RT_2732_63DF(DS, 654, &H3F6)
    ' float_D9
    PUSH &H3F6
    CALL RT_2F00_056C()
    CALL RT_2732_6266(&H3F6, 1)
    CALL RT_2732_61A9(1)
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF ? == ? THEN GOTO label_0A76B
    ax = ax - 1
  label_0A76B:
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF ? == ? THEN GOTO label_0A783
    ax = ax - 1
  label_0A783:
    ' and ax,bx
    ' and ax,ax
    IF ? <> ? THEN GOTO label_0A78C
    GOTO label_0A792
  label_0A78C:
    var_00E8 = 1
  label_0A792:
    GOTO label_0A994
  label_0A795:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A7AA
    GOTO label_0A7C4
  label_0A7AA:
    var_00DA = 1
    var_00DC = 1
    ' float_D9
    ' float_D9
    GOTO label_0A994
  label_0A7C4:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A7D9
    GOTO label_0A7E2
  label_0A7D9:
    var_00DC = 1
    GOTO label_0A994
  label_0A7E2:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A7F7
    GOTO label_0A800
  label_0A7F7:
    var_00E0 = 1
    GOTO label_0A994
  label_0A800:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A815
    GOTO label_0A829
  label_0A815:
    var_00DE = 1
    ' float_D9
    ' float_D9
    GOTO label_0A994
  label_0A829:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A83E
    GOTO label_0A847
  label_0A83E:
    var_00E2 = 1
    GOTO label_0A994
  label_0A847:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? <> ? THEN GOTO label_0A85C
    GOTO label_0A8EF
  label_0A85C:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? <> ? THEN GOTO label_0A871
    GOTO label_0A8EF
  label_0A871:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? <> ? THEN GOTO label_0A886
    GOTO label_0A8EF
  label_0A886:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? <> ? THEN GOTO label_0A89B
    GOTO label_0A8EF
  label_0A89B:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? <> ? THEN GOTO label_0A8B0
    GOTO label_0A8EF
  label_0A8B0:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? <> ? THEN GOTO label_0A8C5
    GOTO label_0A8EF
  label_0A8C5:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? <> ? THEN GOTO label_0A8DA
    GOTO label_0A8EF
  label_0A8DA:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A8EF
    GOTO label_0A8F8
  label_0A8EF:
    var_00EA = 1
    GOTO label_0A994
  label_0A8F8:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A90D
    GOTO label_0A916
  label_0A90D:
    var_00F0 = 16
    GOTO label_0A994
  label_0A916:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A92B
    GOTO label_0A934
  label_0A92B:
    var_00F0 = 17
    GOTO label_0A994
  label_0A934:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A949
    GOTO label_0A952
  label_0A949:
    var_00F0 = 18
    GOTO label_0A994
  label_0A952:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A967
    GOTO label_0A970
  label_0A967:
    var_00F0 = 19
    GOTO label_0A994
  label_0A970:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0A985
    GOTO label_0A98E
  label_0A985:
    var_00EE = 1
    GOTO label_0A994
  label_0A98E:
    var_00EC = 1
  label_0A994:
    ax = &H684
    ' float_D9
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2F00_056C()
    CALL RT_2732_616F(&H3F6)
    ' float_D9
    PUSH &H3F6
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
    ' float_D9
    si = arg_6
    ' float_D9
    ax = arg_6
    PROC_EXIT
    RETURN
    GOTO label_0AA36
END SUB

SUB proc_0A9DA  ' image &HA9DA, locals 10
    cx = 10
    CALL frame_enter()
    ax = 11
    GOTO label_0AA25
  label_0A9E8:
    local_C = 2
    CALL RT_2732_62BC(78)
    local_10 = ax
    local_12 = 0
    CALL locate_print_21DEA(addr(local_14), addr(local_C), addr(local_10), addr(local_12))
    CALL free_string(addr(local_10))
    ax = local_14
    ax = ax + 1
  label_0AA25:
    local_14 = ax
    IF local_14 <= 23 THEN GOTO label_0A9E8
    PROC_EXIT
    RETURN
    GOTO label_0AA96
END SUB

SUB proc_0AA39  ' image &HAA39, locals 10
    cx = 10
    CALL frame_enter()
    ax = 2
    GOTO label_0AA85
  label_0AA48:
    local_C = 41
    CALL RT_2732_62BC(39)
    local_10 = ax
    local_12 = 0
    CALL locate_print_21DEA(addr(local_14), addr(local_C), addr(local_10), addr(local_12))
    CALL free_string(addr(local_10))
    ax = local_14
    ax = ax + 1
  label_0AA85:
    local_14 = ax
    IF local_14 <= 9 THEN GOTO label_0AA48
    PROC_EXIT
    RETURN
    GOTO label_0AF88
END SUB

SUB createuser_0AA99  ' image &HAA99, locals 138
  ' strings: CREATEUSER | PLAYER NAME:  | SBC | This player already exists | What is the player's password? | Please reenter your password for verification
    cx = 138
    CALL frame_enter()
    local_E = "CREATEUSER"
    CALL sb_dat_21E13(addr(local_E))
    CALL free_string(addr(local_E))
  label_0AABC:
    local_10 = 20
    local_12 = 1
    local_14 = 60
    local_18 = "PLAYER NAME: "
    local_1A = 0
    local_1C = 0
    local_1E = 0
    CALL invalid_key_was_hit_23200(addr(local_10), addr(local_12), addr(local_14), addr(local_18), addr(local_26), addr(local_1A), addr(local_1C), addr(local_1E))
    local_22 = ax
    CALL free_string(addr(local_18))
    local_2A = addr(local_22)
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_2A))
    ax = 0
    IF ? <> ? THEN GOTO label_0AB40
    ax = ax - 1
  label_0AB40:
    bx = ax
    local_2C = bx
    CALL RT_2732_6130(addr(local_2A), &H49B6)
    ax = 0
    IF ? <> ? THEN GOTO label_0AB58
    ax = ax - 1
  label_0AB58:
    ' or ax,[bp-0x2c]
    bx = ax
    local_2E = bx
    CALL RT_2732_6374(addr(local_26))
    CALL RT_2732_6130(addr(local_26), &H49B6)
    ax = 0
    IF ? <> ? THEN GOTO label_0AB79
    ax = ax - 1
  label_0AB79:
    ' or ax,[bp-0x2e]
    ' and ax,ax
    IF ? <> ? THEN GOTO label_0AB83
    GOTO label_0AB88
  label_0AB83:
    CALL wood_software_development_0D2B8()
  label_0AB88:
    CALL file_ah4(7)
    PUSH DX
    PUSH 7
    ' xor ax,ax
    ' cwd
    CALL RT_2732_7413(DX, 7)
    IF ? > ? THEN GOTO label_0ABA2
    GOTO label_0ABAB
  label_0ABA2:
    CALL proc_009F2(addr(local_26))
  label_0ABAB:
    IF var_0096 == 0 THEN GOTO label_0ABB5
    GOTO label_0AC63
  label_0ABB5:
    ax = addr(local_26)
    PUSH DS
    PUSH addr(local_26)
    ' xor ax,ax
    ax = &HA90
    CALL RT_2732_6404(addr(local_26), DS, &HA90, 60)
    ax = &HA90
    CALL RT_2732_63DF(DS, &HA90, 60)
    local_32 = ax
    local_36 = "SBC"
    CALL proc_245DD(addr(local_32), addr(local_36))
    local_3A = ax
    ax = addr(local_32)
    PUSH DS
    PUSH addr(local_32)
    ' xor ax,ax
    ax = &HA90
    CALL RT_2732_6404(addr(local_32), DS, &HA90, 60)
    CALL free_string(addr(local_32))
    CALL free_string(addr(local_36))
    ax = addr(local_3A)
    PUSH DS
    PUSH addr(local_3A)
    ' xor ax,ax
    ax = &HAD6
    CALL RT_2732_6404(addr(local_3A), DS, &HAD6, 8)
    CALL file_ah4(7)
    CALL RT_2F00_0559()
    ' float_DC
    ' float_DC
    CALL RT_2F00_056C()
    var_0096 = ax
    GOTO label_0ACBA
    GOTO label_0ACB7
  label_0AC63:
    local_3E = "This player already exists"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_42 = ax
    CALL proc_2311E(addr(local_3E), addr(local_42))
    ax = addr(local_42)
    PUSH DS
    PUSH addr(local_42)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_42), DS, 79, 1)
    CALL free_string(addr(local_3E))
    CALL free_string(addr(local_42))
  label_0ACB7:
    GOTO label_0AABC
  label_0ACBA:
    local_44 = 21
    local_46 = 1
    local_4A = "What is the player's password?"
    CALL proc_251B9(addr(local_44), addr(local_46), addr(local_4A))
    local_4E = ax
    CALL free_string(addr(local_4A))
    ax = addr(local_4E)
    PUSH DS
    PUSH addr(local_4E)
    ' xor ax,ax
    ax = &HACC
    CALL RT_2732_6404(addr(local_4E), DS, &HACC, 10)
    local_50 = 22
    local_52 = 1
    local_56 = "Please reenter your password for verification"
    CALL proc_251B9(addr(local_50), addr(local_52), addr(local_56))
    local_5A = ax
    CALL free_string(addr(local_56))
    local_5E = addr(local_5A)
    ax = &HACC
    CALL RT_2732_63DF(DS, &HACC, 10)
    CALL RT_2732_6130(10, addr(local_5E))
    IF var_0096 == 0 THEN GOTO label_0AD60
    GOTO label_0ADBF
  label_0AD60:
    ax = &HACC
    CALL RT_2732_63DF(DS, &HACC, 10)
    local_62 = ax
    CALL proc_23059(addr(local_62))
    local_66 = ax
    ax = addr(local_62)
    PUSH DS
    PUSH addr(local_62)
    ' xor ax,ax
    ax = &HACC
    CALL RT_2732_6404(addr(local_62), DS, &HACC, 10)
    CALL free_string(addr(local_62))
    ax = addr(local_66)
    PUSH DS
    PUSH addr(local_66)
    ' xor ax,ax
    ax = &HACC
    CALL RT_2732_6404(addr(local_66), DS, &HACC, 10)
    GOTO label_0AE64
  label_0ADBF:
    ax = 20
    GOTO label_0AE03
  label_0ADC6:
    local_68 = 1
    CALL RT_2732_62BC(80)
    local_6C = ax
    local_6E = 0
    CALL locate_print_21DEA(addr(local_70), addr(local_68), addr(local_6C), addr(local_6E))
    CALL free_string(addr(local_6C))
    ax = local_70
    ax = ax + 1
  label_0AE03:
    local_70 = ax
    IF local_70 <= 22 THEN GOTO label_0ADC6
    local_74 = "Your passwords did not match up.  Please reenter it."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_78 = ax
    CALL proc_2311E(addr(local_74), addr(local_78))
    ax = addr(local_78)
    PUSH DS
    PUSH addr(local_78)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_78), DS, 79, 1)
    CALL free_string(addr(local_74))
    CALL free_string(addr(local_78))
    GOTO label_0ACBA
  label_0AE64:
    local_7A = 15
    local_7C = 0
    CALL color_25283(addr(local_7A), addr(local_7C))
    local_7E = 23
    local_80 = 1
    local_84 = "FINAL VERIFICATION: Is the above information correct?"
    local_86 = 0
    CALL locate_print_21DEA(addr(local_7E), addr(local_80), addr(local_84), addr(local_86))
    CALL free_string(addr(local_84))
    local_88 = 23
    local_8A = 55
    local_8C = 1
    CALL y_yes_26031(addr(local_88), addr(local_8A), addr(local_8C))
    local_90 = ax
    local_2A = addr(local_90)
    CALL RT_2732_6130(addr(local_2A), &H4AB6)
    IF local_70 == 22 THEN GOTO label_0AF01
    GOTO label_0AF06
  label_0AF01:
    CALL wood_software_development_0D2B8()
  label_0AF06:
    CALL sorcerer_s_bane_17F3F()
    local_94 = "INTRODUCTION"
    CALL sb_dat_21E13(addr(local_94))
    CALL free_string(addr(local_94))
    CALL hit_any_key_to_continue_2434A()
    CALL free_string(addr(local_90))
    CALL free_string(addr(local_66))
    CALL free_string(addr(local_5A))
    CALL free_string(addr(local_4E))
    CALL free_string(addr(local_3A))
    CALL free_string(addr(local_22))
    CALL free_string(addr(local_2A))
    CALL free_string(addr(local_5E))
    CALL free_string(addr(local_26))
    PROC_EXIT
    RETURN
    GOTO label_0B7DB
END SUB

SUB name_0AF8B  ' image &HAF8B, locals 300
  ' strings: NAME  -  | STR -  | RACE/CLASS -  | INT -  | LEVEL -  | CON - 
    cx = 300
    CALL frame_enter()
    local_C = 15
    local_E = 0
    CALL color_25283(addr(local_C), addr(local_E))
    local_10 = 2
    local_12 = 2
    ax = 440
    CALL RT_2732_63DF(DS, 440, 20)
    ax = "NAME  - " + ax
    local_16 = ax
    local_18 = 0
    CALL locate_print_21DEA(addr(local_10), addr(local_12), addr(local_16), addr(local_18))
    CALL free_string(addr(local_16))
    local_1A = 2
    local_1C = 30
    local_1E = 2
    CALL proc_25D42(addr(local_1E), 486)
    local_22 = ax
    ax = "STR - " + addr(local_22)
    local_26 = ax
    local_28 = 0
    CALL locate_print_21DEA(addr(local_1A), addr(local_1C), addr(local_26), addr(local_28))
    CALL free_string(addr(local_26))
    local_2A = 3
    local_2C = 2
    ax = 475
    CALL RT_2732_63DF(DS, 475, 5)
    ax = "RACE/CLASS - " + ax
    ax = ax + &H4AF4
    bx = ax
    ax = 468
    local_34 = bx
    CALL RT_2732_63DF(DS, 468, 7)
    ax = local_34 + ax
    local_30 = ax
    local_32 = 0
    CALL locate_print_21DEA(addr(local_2A), addr(local_2C), addr(local_30), addr(local_32))
    CALL free_string(addr(local_30))
    local_36 = 3
    local_38 = 30
    local_3A = 2
    CALL proc_25D42(addr(local_3A), 488)
    local_3E = ax
    ax = "INT - " + addr(local_3E)
    local_42 = ax
    local_44 = 0
    CALL locate_print_21DEA(addr(local_36), addr(local_38), addr(local_42), addr(local_44))
    CALL free_string(addr(local_42))
    local_46 = 4
    local_48 = 2
    local_4A = 2
    CALL proc_25D42(addr(local_4A), 480)
    local_4E = ax
    ax = "LEVEL - " + addr(local_4E)
    local_52 = ax
    local_54 = 0
    CALL locate_print_21DEA(addr(local_46), addr(local_48), addr(local_52), addr(local_54))
    CALL free_string(addr(local_52))
    local_56 = 4
    local_58 = 30
    local_5A = 2
    CALL proc_25D42(addr(local_5A), 490)
    local_5E = ax
    ax = "CON - " + addr(local_5E)
    local_62 = ax
    local_64 = 0
    CALL locate_print_21DEA(addr(local_56), addr(local_58), addr(local_62), addr(local_64))
    CALL free_string(addr(local_62))
    local_66 = 5
    local_68 = 2
    local_6A = 3
    CALL proc_25D42(addr(local_6A), 482)
    local_6E = ax
    local_70 = 3
    CALL proc_25D42(addr(local_70), 484)
    local_74 = ax
    ax = "HITPOINTS  -    " + addr(local_6E)
    ax = ax + &H4AF4
    ax = ax + addr(local_74)
    local_78 = ax
    local_7A = 0
    CALL locate_print_21DEA(addr(local_66), addr(local_68), addr(local_78), addr(local_7A))
    CALL free_string(addr(local_78))
    local_7C = 5
    local_7E = 30
    local_80 = 2
    CALL proc_25D42(addr(local_80), 492)
    local_84 = ax
    ax = "DEX - " + addr(local_84)
    local_88 = ax
    local_8A = 0
    CALL locate_print_21DEA(addr(local_7C), addr(local_7E), addr(local_88), addr(local_8A))
    CALL free_string(addr(local_88))
    local_8C = 6
    local_8E = 2
    local_90 = 10
    CALL proc_25F90(addr(local_90), 540)
    local_94 = ax
    ax = "EXPERIENCE - " + addr(local_94)
    local_98 = ax
    local_9A = 0
    CALL locate_print_21DEA(addr(local_8C), addr(local_8E), addr(local_98), addr(local_9A))
    CALL free_string(addr(local_98))
    local_9C = 6
    local_9E = 30
    local_A0 = 2
    CALL proc_25D42(addr(local_A0), 494)
    local_A4 = ax
    ax = "CHR - " + addr(local_A4)
    local_A8 = ax
    local_AA = 0
    CALL locate_print_21DEA(addr(local_9C), addr(local_9E), addr(local_A8), addr(local_AA))
    CALL free_string(addr(local_A8))
    local_AC = 7
    local_AE = 2
    local_B0 = 10
    CALL proc_25F90(addr(local_B0), 544)
    local_B4 = ax
    ax = "GOLD       - " + addr(local_B4)
    local_B8 = ax
    local_BA = 0
    CALL locate_print_21DEA(addr(local_AC), addr(local_AE), addr(local_B8), addr(local_BA))
    CALL free_string(addr(local_B8))
    local_BC = 7
    local_BE = 30
    local_C0 = 2
    CALL proc_25D42(addr(local_C0), 496)
    local_C4 = ax
    ax = "LCK - " + addr(local_C4)
    local_C8 = ax
    local_CA = 0
    CALL locate_print_21DEA(addr(local_BC), addr(local_BE), addr(local_C8), addr(local_CA))
    CALL free_string(addr(local_C8))
    IF var_0238 > 0 THEN GOTO label_0B442
    GOTO label_0B4B6
  label_0B442:
    local_CC = 8
    local_CE = 2
    local_D2 = "PET - "
    local_D4 = 0
    CALL locate_print_21DEA(addr(local_CC), addr(local_CE), addr(local_D2), addr(local_D4))
    CALL free_string(addr(local_D2))
    ax = 548
    CALL RT_2732_63DF(DS, 548, 20)
    CALL RT_2732_6374(20)
    local_D8 = ax
    local_DA = 0
    CALL print_more_21DB9(addr(local_D8), addr(local_DA))
    GOTO label_0B4FD
  label_0B4B6:
    local_DC = 8
    local_DE = 2
    CALL RT_2732_62BC(26)
    local_E2 = ax
    local_E4 = 0
    CALL locate_print_21DEA(addr(local_DC), addr(local_DE), addr(local_E2), addr(local_E4))
    CALL free_string(addr(local_E2))
  label_0B4FD:
    IF var_020C > 0 THEN GOTO label_0B507
    GOTO label_0B56F
  label_0B507:
    local_E6 = 8
    local_E8 = 29
    local_EA = 2
    CALL proc_25D42(addr(local_EA), 524)
    local_EE = ax
    ax = "WISH - " + addr(local_EE)
    local_F2 = ax
    local_F4 = 0
    CALL locate_print_21DEA(addr(local_E6), addr(local_E8), addr(local_F2), addr(local_F4))
    CALL free_string(addr(local_F2))
    GOTO label_0B5B6
  label_0B56F:
    local_F6 = 8
    local_F8 = 29
    CALL RT_2732_62BC(10)
    local_FC = ax
    local_FE = 0
    CALL locate_print_21DEA(addr(local_F6), addr(local_F8), addr(local_FC), addr(local_FE))
    CALL free_string(addr(local_FC))
  label_0B5B6:
    IF var_01F4 > 0 THEN GOTO label_0B5C0
    GOTO label_0B628
  label_0B5C0:
    local_100 = 9
    local_102 = 2
    local_104 = 2
    CALL proc_25D42(addr(local_104), 500)
    local_108 = ax
    ax = "DUNGEON LEV - " + addr(local_108)
    local_10C = ax
    local_10E = 0
    CALL locate_print_21DEA(addr(local_100), addr(local_102), addr(local_10C), addr(local_10E))
    CALL free_string(addr(local_10C))
    GOTO label_0B66F
  label_0B628:
    local_110 = 9
    local_112 = 2
    CALL RT_2732_62BC(27)
    local_116 = ax
    local_118 = 0
    CALL locate_print_21DEA(addr(local_110), addr(local_112), addr(local_116), addr(local_118))
    CALL free_string(addr(local_116))
  label_0B66F:
    IF var_020A > 0 THEN GOTO label_0B679
    GOTO label_0B6E1
  label_0B679:
    local_11A = 9
    local_11C = 29
    local_11E = 2
    CALL proc_25D42(addr(local_11E), 522)
    local_122 = ax
    ax = "SICK - " + addr(local_122)
    local_126 = ax
    local_128 = 0
    CALL locate_print_21DEA(addr(local_11A), addr(local_11C), addr(local_126), addr(local_128))
    CALL free_string(addr(local_126))
    GOTO label_0B728
  label_0B6E1:
    local_12A = 9
    local_12C = 29
    CALL RT_2732_62BC(10)
    local_130 = ax
    local_132 = 0
    CALL locate_print_21DEA(addr(local_12A), addr(local_12C), addr(local_130), addr(local_132))
    CALL free_string(addr(local_130))
  label_0B728:
    local_134 = 7
    local_136 = 0
    CALL color_25283(addr(local_134), addr(local_136))
    CALL free_string(addr(local_122))
    CALL free_string(addr(local_108))
    CALL free_string(addr(local_EE))
    CALL free_string(addr(local_C4))
    CALL free_string(addr(local_B4))
    CALL free_string(addr(local_A4))
    CALL free_string(addr(local_94))
    CALL free_string(addr(local_84))
    CALL free_string(addr(local_74))
    CALL free_string(addr(local_6E))
    CALL free_string(addr(local_5E))
    CALL free_string(addr(local_4E))
    CALL free_string(addr(local_3E))
    CALL free_string(addr(local_22))
    CALL free_string(addr(local_D8))
    PROC_EXIT
    RETURN
    GOTO label_0BE66
END SUB

SUB magic_resist_0B7DE  ' image &HB7DE, locals 244
  ' strings: Magic resist  -  | To hit       -  | Magic tools   -  | To damage    -  | Magic ability -  | To avoid dam - 
    cx = 244
    CALL frame_enter()
    local_C = 14
    local_E = 0
    CALL color_25283(addr(local_C), addr(local_E))
    CALL proc_0AA39()
    local_10 = 2
    local_12 = 42
    local_14 = 2
    CALL proc_25D42(addr(local_14), 164)
    local_18 = ax
    ax = "Magic resist  - " + addr(local_18)
    local_1C = ax
    local_1E = 0
    CALL locate_print_21DEA(addr(local_10), addr(local_12), addr(local_1C), addr(local_1E))
    CALL free_string(addr(local_1C))
    local_20 = 2
    local_22 = 62
    local_24 = 2
    CALL proc_25D42(addr(local_24), 154)
    local_28 = ax
    ax = "To hit       - " + addr(local_28)
    local_2C = ax
    local_2E = 0
    CALL locate_print_21DEA(addr(local_20), addr(local_22), addr(local_2C), addr(local_2E))
    CALL free_string(addr(local_2C))
    local_30 = 3
    local_32 = 42
    local_34 = 2
    CALL proc_25D42(addr(local_34), 166)
    local_38 = ax
    ax = "Magic tools   - " + addr(local_38)
    local_3C = ax
    local_3E = 0
    CALL locate_print_21DEA(addr(local_30), addr(local_32), addr(local_3C), addr(local_3E))
    CALL free_string(addr(local_3C))
    local_40 = 3
    local_42 = 62
    local_44 = 2
    CALL proc_25D42(addr(local_44), 156)
    local_48 = ax
    ax = "To damage    - " + addr(local_48)
    local_4C = ax
    local_4E = 0
    CALL locate_print_21DEA(addr(local_40), addr(local_42), addr(local_4C), addr(local_4E))
    CALL free_string(addr(local_4C))
    local_50 = 4
    local_52 = 42
    local_54 = 2
    CALL proc_25D42(addr(local_54), 162)
    local_58 = ax
    ax = "Magic ability - " + addr(local_58)
    local_5C = ax
    local_5E = 0
    CALL locate_print_21DEA(addr(local_50), addr(local_52), addr(local_5C), addr(local_5E))
    CALL free_string(addr(local_5C))
    local_60 = 4
    local_62 = 62
    local_64 = 2
    CALL proc_25D42(addr(local_64), 160)
    local_68 = ax
    ax = "To avoid dam - " + addr(local_68)
    local_6C = ax
    local_6E = 0
    CALL locate_print_21DEA(addr(local_60), addr(local_62), addr(local_6C), addr(local_6E))
    CALL free_string(addr(local_6C))
    local_70 = 5
    local_72 = 42
    local_74 = 2
    CALL proc_25D42(addr(local_74), 168)
    local_78 = ax
    ax = "To charm      - " + addr(local_78)
    local_7C = ax
    local_7E = 0
    CALL locate_print_21DEA(addr(local_70), addr(local_72), addr(local_7C), addr(local_7E))
    CALL free_string(addr(local_7C))
    local_80 = 5
    local_82 = 62
    local_84 = 2
    CALL proc_25D42(addr(local_84), 158)
    local_88 = ax
    ax = "To withstand - " + addr(local_88)
    local_8C = ax
    local_8E = 0
    CALL locate_print_21DEA(addr(local_80), addr(local_82), addr(local_8C), addr(local_8E))
    CALL free_string(addr(local_8C))
    local_90 = 6
    local_92 = 42
    local_94 = 2
    CALL proc_25D42(addr(local_94), 172)
    local_98 = ax
    ax = "To avoid trap - " + addr(local_98)
    local_9C = ax
    local_9E = 0
    CALL locate_print_21DEA(addr(local_90), addr(local_92), addr(local_9C), addr(local_9E))
    CALL free_string(addr(local_9C))
    local_A0 = 6
    local_A2 = 62
    local_A4 = 2
    CALL proc_25D42(addr(local_A4), 170)
    local_A8 = ax
    ax = "Alertness    - " + addr(local_A8)
    local_AC = ax
    local_AE = 0
    CALL locate_print_21DEA(addr(local_A0), addr(local_A2), addr(local_AC), addr(local_AE))
    CALL free_string(addr(local_AC))
    local_B0 = 7
    local_B2 = 42
    local_B4 = 2
    CALL proc_25D42(addr(local_B4), 174)
    local_B8 = ax
    ax = "To hide       - " + addr(local_B8)
    local_BC = ax
    local_BE = 0
    CALL locate_print_21DEA(addr(local_B0), addr(local_B2), addr(local_BC), addr(local_BE))
    CALL free_string(addr(local_BC))
    IF var_0216 > 0 THEN GOTO label_0BC06
    GOTO label_0BC45
  label_0BC06:
    local_C0 = 8
    local_C2 = 42
    local_C6 = "SHIELD"
    local_C8 = 0
    CALL locate_print_21DEA(addr(local_C0), addr(local_C2), addr(local_C6), addr(local_C8))
    CALL free_string(addr(local_C6))
  label_0BC45:
    IF var_0210 > 0 THEN GOTO label_0BC4F
    GOTO label_0BC8E
  label_0BC4F:
    local_CA = 8
    local_CC = 52
    local_D0 = "HASTE"
    local_D2 = 0
    CALL locate_print_21DEA(addr(local_CA), addr(local_CC), addr(local_D0), addr(local_D2))
    CALL free_string(addr(local_D0))
  label_0BC8E:
    IF var_021A == 1 THEN GOTO label_0BC98
    GOTO label_0BCD7
  label_0BC98:
    local_D4 = 8
    local_D6 = 62
    local_DA = "DREAM-WOLF"
    local_DC = 0
    CALL locate_print_21DEA(addr(local_D4), addr(local_D6), addr(local_DA), addr(local_DC))
    CALL free_string(addr(local_DA))
  label_0BCD7:
    IF var_0214 == 1 THEN GOTO label_0BCE1
    GOTO label_0BD20
  label_0BCE1:
    local_DE = 9
    local_E0 = 42
    local_E4 = "BLIND"
    local_E6 = 0
    CALL locate_print_21DEA(addr(local_DE), addr(local_E0), addr(local_E4), addr(local_E6))
    CALL free_string(addr(local_E4))
  label_0BD20:
    ax = 0
    IF var_020E < 1 THEN GOTO label_0BD2B
    ax = ax - 1
  label_0BD2B:
    cx = 0
    IF var_00B8 <> 1 THEN GOTO label_0BD36
    cx = cx - 1
  label_0BD36:
    ' or cx,ax
    ' and cx,cx
    IF var_00B8 <> 1 THEN GOTO label_0BD3F
    GOTO label_0BD7E
  label_0BD3F:
    local_E8 = 9
    local_EA = 52
    local_EE = "INVISIBLE"
    local_F0 = 0
    CALL locate_print_21DEA(addr(local_E8), addr(local_EA), addr(local_EE), addr(local_F0))
    CALL free_string(addr(local_EE))
  label_0BD7E:
    ax = 0
    IF var_0212 <> 1 THEN GOTO label_0BD89
    ax = ax - 1
  label_0BD89:
    cx = 0
    IF var_00BA <> 1 THEN GOTO label_0BD94
    cx = cx - 1
  label_0BD94:
    ' or cx,ax
    ' and cx,cx
    IF var_00BA <> 1 THEN GOTO label_0BD9D
    GOTO label_0BDDC
  label_0BD9D:
    local_F2 = 9
    local_F4 = 62
    local_F8 = "NO-TRAP"
    local_FA = 0
    CALL locate_print_21DEA(addr(local_F2), addr(local_F4), addr(local_F8), addr(local_FA))
    CALL free_string(addr(local_F8))
  label_0BDDC:
    local_FC = 7
    local_FE = 0
    CALL color_25283(addr(local_FC), addr(local_FE))
    CALL free_string(addr(local_B8))
    CALL free_string(addr(local_A8))
    CALL free_string(addr(local_98))
    CALL free_string(addr(local_88))
    CALL free_string(addr(local_78))
    CALL free_string(addr(local_68))
    CALL free_string(addr(local_58))
    CALL free_string(addr(local_48))
    CALL free_string(addr(local_38))
    CALL free_string(addr(local_28))
    CALL free_string(addr(local_18))
    PROC_EXIT
    RETURN
    GOTO label_0C32B
END SUB

SUB hallfame_dat_0BE69  ' image &HBE69, locals 266
  ' strings: HALLLOCK.SBL | HALLFAME.DAT | HALLFAME.TXT | SORCERER'S BANE HALL OF FAME | NAME                CLASS   LEV | ) 
    cx = 266
    CALL frame_enter()
    ' xor ax,ax
    PUSH ax
    CALL close_files()
    OPEN "HALLLOCK.SBL" FOR RANDOM AS #12 LEN = &HFFFF
    ax = &HFFFF
    CALL RT_2732_655C(CS, &HFFFF)
    OPEN "HALLFAME.DAT" FOR RANDOM AS #9 LEN = 166
    OPEN "HALLFAME.TXT" FOR RANDOM AS #14 LEN = &HFFFF
    CALL file_ah4(9)
    PUSH DX
    PUSH 9
    ' xor ax,ax
    ' cwd
    CALL RT_2732_7413(DX, 9)
    IF ? > ? THEN GOTO label_0BEDC
    GOTO label_0C2D6
  label_0BEDC:
    local_B2 = 1
    local_B4 = 25
    CALL proc_21194(addr(local_B2), addr(local_B4))
    local_B6 = 15
    local_B8 = 0
    CALL color_25283(addr(local_B6), addr(local_B8))
    local_BA = 1
    local_BC = 26
    local_C0 = "SORCERER'S BANE HALL OF FAME"
    local_C2 = 0
    CALL locate_print_21DEA(addr(local_BA), addr(local_BC), addr(local_C0), addr(local_C2))
    CALL free_string(addr(local_C0))
    local_C4 = 11
    local_C6 = 0
    CALL color_25283(addr(local_C4), addr(local_C6))
    local_C8 = 3
    local_CA = 4
    local_CE = "NAME                CLASS   LEV"
    local_D0 = 1
    CALL locate_print_21DEA(addr(local_C8), addr(local_CA), addr(local_CE), addr(local_D0))
    CALL free_string(addr(local_CE))
    CALL file_ah4(9)
    CALL RT_2F00_0559()
    ' float_DC
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    local_D6 = ax
    ax = 1
    GOTO label_0C2C0
  label_0BFDA:
    bx = addr(local_B0)
    PUSH 9
    PUSH long(local_D8)
    PUSH DS
    CALL get_record(ES, BX, 166)
    local_DA = 2
    CALL proc_25D42(addr(local_DA), addr(local_D8))
    local_DE = ax
    local_E0 = 3
    CALL proc_25D42(addr(local_E0), addr(local_88))
    local_E4 = ax
    ax = addr(local_DE) + ") "
    bx = ax
    ax = addr(local_B0)
    local_EC = bx
    CALL RT_2732_63DF(DS, addr(local_B0), 20)
    ax = local_EC + ax
    bx = ax
    ax = addr(local_94)
    local_EE = bx
    CALL RT_2732_63DF(DS, addr(local_94), 7)
    ax = local_EE + ax
    ax = ax + addr(local_E4)
    local_E8 = ax
    local_EA = 0
    CALL print_more_21DB9(addr(local_E8), addr(local_EA))
    CALL free_string(addr(local_E8))
    CALL RT_2732_6F99(14)
    CALL RT_2732_7199("##) && ##  ")
    PUSH local_D8
    CALL RT_2732_58FD()
    ax = addr(local_B0)
    CALL RT_2732_63DF(DS, addr(local_B0), 20)
    PUSH 20
    CALL RT_2732_591B()
    ax = addr(local_94)
    CALL RT_2732_63DF(DS, addr(local_94), 7)
    PUSH 7
    CALL RT_2732_591B()
    PUSH local_88
    CALL RT_2732_58FD()
    CALL RT_2732_5A54()
    IF local_74 > 30 THEN GOTO label_0C105
    GOTO label_0C143
  label_0C105:
    local_F2 = " WON THE GAME!!!"
    local_F4 = 1
    CALL print_more_21DB9(addr(local_F2), addr(local_F4))
    CALL free_string(addr(local_F2))
    CALL RT_2732_6F99(14)
    PUSH " WON THE GAME!!!"
    CALL RT_2732_5920()
    GOTO label_0C2BB
  label_0C143:
    ax = addr(local_1E)
    CALL RT_2732_63DF(DS, addr(local_1E), 20)
    PUSH 20
    CALL RT_2732_62BC(20)
    CALL RT_2732_6130(20)
    IF local_74 <> 30 THEN GOTO label_0C166
    GOTO label_0C20B
  label_0C166:
    local_F6 = 0
    CALL proc_25D42(addr(local_F6), addr(local_74))
    local_FA = ax
    ax = " killed on " + addr(local_FA)
    ax = ax + " by a "
    bx = ax
    ax = addr(local_1E)
    local_102 = bx
    CALL RT_2732_63DF(DS, addr(local_1E), 20)
    ax = local_102 + ax
    local_FE = ax
    local_100 = 1
    CALL print_more_21DB9(addr(local_FE), addr(local_100))
    CALL free_string(addr(local_FE))
    CALL RT_2732_6F99(14)
    CALL RT_2732_7199(" killed on ## by a &")
    PUSH local_74
    CALL RT_2732_58FD()
    ax = addr(local_1E)
    CALL RT_2732_63DF(DS, addr(local_1E), 20)
    PUSH 20
    CALL RT_2732_5920()
    GOTO label_0C2BB
  label_0C20B:
    IF local_74 == 0 THEN GOTO label_0C214
    GOTO label_0C252
  label_0C214:
    local_106 = " currently adventuring in town"
    local_108 = 1
    CALL print_more_21DB9(addr(local_106), addr(local_108))
    CALL free_string(addr(local_106))
    CALL RT_2732_6F99(14)
    PUSH " currently adventuring in town"
    CALL RT_2732_5920()
    GOTO label_0C2BB
  label_0C252:
    local_10A = 0
    CALL proc_25D42(addr(local_10A), addr(local_74))
    local_10E = ax
    ax = " currently adventuring on level " + addr(local_10E)
    local_112 = ax
    local_114 = 1
    CALL print_more_21DB9(addr(local_112), addr(local_114))
    CALL free_string(addr(local_112))
    CALL RT_2732_6F99(14)
    PUSH " currently adventuring on level "
    CALL RT_2732_591B()
    PUSH local_74
    CALL RT_2732_5902()
  label_0C2BB:
    ax = local_D8
    ax = ax + 1
  label_0C2C0:
    local_D8 = ax
    ax = local_D6
    IF ax < local_D8 THEN GOTO label_0C2D1
    GOTO label_0BFDA
  label_0C2D1:
    CALL hit_any_key_to_continue_2434A()
  label_0C2D6:
    ' xor ax,ax
    PUSH local_D6
    CALL close_files()
    ax = 262
    CALL RT_2732_655C(CS, 262)
    CALL RT_2732_000E("HALLLOCK.SBL")
    ax = &HFFFF
    CALL RT_2732_655C(CS, &HFFFF)
    CALL free_string(addr(local_10E))
    CALL free_string(addr(local_FA))
    CALL free_string(addr(local_E4))
    CALL free_string(addr(local_DE))
    PROC_EXIT
    RETURN
    GOTO label_0C3F9
END SUB

SUB proc_0C32E  ' image &HC32E, locals 24
    cx = 24
    CALL frame_enter()
    local_C = 11
    local_E = 0
    CALL color_25283(addr(local_C), addr(local_E))
    ax = 1
    GOTO label_0C3BE
  label_0C354:
    ax = 78
    ' imul word [bp-0x10]
    ax = ax + &HFFB3
    CALL RT_2F00_0558()
    ' float_D9
    ax = 654
    CALL RT_2732_63DF(DS, 654, &H3F6)
    ' float_D9
    PUSH &H3F6
    CALL RT_2F00_056C()
    CALL RT_2732_6266(&H3F6, 78)
    local_18 = ax
    ax = local_10
    ax = ax + 10
    local_1A = ax
    local_1C = 2
    local_1E = 0
    CALL locate_print_21DEA(addr(local_1A), addr(local_1C), addr(local_18), addr(local_1E))
    ax = local_10
    ax = ax + 1
  label_0C3BE:
    local_10 = ax
    IF local_10 <= 13 THEN GOTO label_0C354
    local_20 = 7
    local_22 = 0
    CALL color_25283(addr(local_20), addr(local_22))
    CALL name_0AF8B()
    CALL proc_0C3FC()
    CALL free_string(addr(local_18))
    PROC_EXIT
    RETURN
    GOTO label_0C49E
END SUB

SUB proc_0C3FC  ' image &HC3FC, locals 18
    cx = 18
    CALL frame_enter()
    ax = var_028C
    ax = ax + 10
    local_C = ax
    ax = var_028A
    ax = ax + 1
    local_E = ax
    CALL proc_253B3(addr(local_C), addr(local_E))
    local_10 = 15
    local_12 = 1
    CALL color_25283(addr(local_10), addr(local_12))
    ax = 278
    CALL RT_2732_63DF(DS, 278, 1)
    local_16 = ax
    local_18 = 0
    CALL print_more_21DB9(addr(local_16), addr(local_18))
    ax = addr(local_16)
    PUSH DS
    PUSH addr(local_16)
    ' xor ax,ax
    ax = 278
    CALL RT_2732_6404(addr(local_16), DS, 278, 1)
    CALL free_string(addr(local_16))
    local_1A = 7
    local_1C = 0
    CALL color_25283(addr(local_1A), addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_0D0CC
END SUB

SUB mage_0C4A1  ' image &HC4A1, locals 62
  ' strings: MAGE    | BARD    | You put all of your staffs together to | make a STAFF OF POWER! | STAFFOFPOWER | You stop moving forward.
    cx = 62
    CALL frame_enter()
    ax = 0
    IF var_01E2 > 0 THEN GOTO label_0C4B4
    ax = ax - 1
  label_0C4B4:
    CALL RT_2732_7413(var_021E, var_021C, var_010C, var_010A)
    cx = 0
    IF var_01E2 < 0 THEN GOTO label_0C4CF
    cx = cx - 1
  label_0C4CF:
    ' or cx,ax
    CALL RT_2732_7413(var_021E, var_021C, var_0110, var_010E)
    ax = 0
    IF var_01E2 >= 0 THEN GOTO label_0C4EC
    ax = ax - 1
  label_0C4EC:
    ' or ax,cx
    ' and ax,ax
    IF var_01E2 <> 0 THEN GOTO label_0C4F5
    GOTO label_0C4FA
  label_0C4F5:
    CALL fighter_09F8B()
  label_0C4FA:
    IF var_0112 == 1 THEN GOTO label_0C504
    GOTO label_0C507
  label_0C504:
    GOTO label_0D0A9
  label_0C507:
    ax = 468
    CALL RT_2732_63DF(DS, 468, 7)
    CALL RT_2732_6130(7, "MAGE   ")
    IF var_0112 == 1 THEN GOTO label_0C524
    GOTO label_0C574
  label_0C524:
    ax = var_01E0
    ax = ax + 1
    var_157A = ax
    ax = 2
    GOTO label_0C568
  label_0C532:
    ax = 3
    ' imul word [bp-0xc]
    cx = var_01E0
    cx = cx - ax
    cx = cx + 3
    si = local_C
    si = si * 2
    var_1578[si] = cx
    si = local_C
    si = si * 2
    IF var_1578[si] < 0 THEN GOTO label_0C559
    GOTO label_0C564
  label_0C559:
    si = local_C
    si = si * 2
    var_1578[si] = 0
  label_0C564:
    ax = local_C
    ax = ax + 1
  label_0C568:
    local_C = ax
    IF local_C <= 5 THEN GOTO label_0C532
    GOTO label_0C5B8
  label_0C574:
    ax = 468
    CALL RT_2732_63DF(DS, 468, 7)
    CALL RT_2732_6130(7, "BARD   ")
    IF local_C == 5 THEN GOTO label_0C591
    GOTO label_0C5B8
  label_0C591:
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_00F6
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    local_E = ax
  label_0C5B8:
    local_12 = &H49B6
    CALL loss_of_str_007A9(addr(local_12))
    CALL free_string(addr(local_12))
    ax = 0
    IF var_0208 <> 0 THEN GOTO label_0C5DE
    ax = ax - 1
  label_0C5DE:
    cx = 0
    IF var_0206 <> 1 THEN GOTO label_0C5E9
    cx = cx - 1
  label_0C5E9:
    ' and cx,ax
    ax = 0
    IF var_0204 <> 1 THEN GOTO label_0C5F6
    ax = ax - 1
  label_0C5F6:
    ' and ax,cx
    cx = 0
    IF var_0202 <> 1 THEN GOTO label_0C603
    cx = cx - 1
  label_0C603:
    ' and cx,ax
    ax = 0
    IF var_0200 <> 1 THEN GOTO label_0C610
    ax = ax - 1
  label_0C610:
    ' and ax,cx
    ' and ax,ax
    IF var_0200 <> 1 THEN GOTO label_0C619
    GOTO label_0C6BF
  label_0C619:
    local_14 = 5
    local_16 = 42
    local_1A = "You put all of your staffs together to"
    local_1C = 0
    CALL locate_print_21DEA(addr(local_14), addr(local_16), addr(local_1A), addr(local_1C))
    CALL free_string(addr(local_1A))
    local_1E = 6
    local_20 = 42
    local_24 = "make a STAFF OF POWER!"
    local_26 = 0
    CALL locate_print_21DEA(addr(local_1E), addr(local_20), addr(local_24), addr(local_26))
    CALL free_string(addr(local_24))
    var_0208 = 1
    CALL hit_any_key_to_continue_2434A()
    local_2A = "STAFFOFPOWER"
    CALL sb_dat_21E13(addr(local_2A))
    CALL free_string(addr(local_2A))
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0D0CF()
    CALL name_0AF8B()
    CALL proc_0C32E()
  label_0C6BF:
    ' float_D9
    ' float_D9
    ax = var_01E6
    ax = ax * 2
    cx = var_01EC
    cx = cx * 2
    cx = cx * 2
    cx = cx + ax
    cx = cx + var_01E8
    cx = cx + var_01F0
    ax = cx
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    var_009A = ax
    ax = 7
    ' imul word [0x1e6]
    ax = ax + var_01F0
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    var_009C = ax
    ax = 5
    ' imul word [0x1ec]
    ax = ax + var_01E6
    ax = ax + var_01E8
    ax = ax + var_01F0
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    var_00A0 = ax
    ax = 7
    ' imul word [0x1ea]
    ax = ax + var_01F0
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    var_009E = ax
    ax = var_01E8
    ax = ax * 2
    ax = ax + var_01E6
    ax = ax + var_01EC
    CALL RT_2F00_0558()
    ax = var_01EE
    CALL RT_2F00_0558()
    ' float_D8
    ' float_DE
    ax = var_01F0
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D9
    ' float_D8
    ' float_DE
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    var_00A8 = ax
    ax = 6
    ' imul word [0x1e8]
    ax = ax + var_01EC
    ax = ax + var_01F0
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    var_00AA = ax
    ax = 3
    ' imul word [0x1e8]
    cx = var_01EC
    cx = cx * 2
    cx = cx * 2
    cx = cx + ax
    cx = cx + var_01F0
    ax = cx
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    var_00AC = ax
    ax = 6
    ' imul word [0x1ec]
    ax = ax + var_01E8
    ax = ax + var_01F0
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    var_00AE = ax
    ax = 7
    ' imul word [0x1e8]
    ax = ax + var_01F0
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_00A2 = ax
    ax = 3
    ' imul word [0x1ec]
    cx = var_01E8
    cx = cx * 2
    cx = cx * 2
    cx = cx + ax
    cx = cx + var_01F0
    ax = cx
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    var_00A6 = ax
    ax = 5
    ' imul word [0x1e8]
    cx = var_01EC
    cx = cx * 2
    cx = cx + ax
    cx = cx + var_01F0
    ax = cx
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    var_00A4 = ax
    var_00B2 = 0
    IF var_0216 > 0 THEN GOTO label_0C96F
    GOTO label_0C979
  label_0C96F:
    var_009E = var_009E + 2
    var_00A0 = var_00A0 + 2
  label_0C979:
    var_00B4 = 0
    var_00B6 = 0
    var_00B8 = 0
    var_00BC = 1
    var_00D0 = 0
    var_00D2 = 0
    var_00D4 = 0
    var_00D6 = 0
    var_00EA = 0
    var_00F2 = 0
    var_00F4 = 0
    var_00F6 = 0
    var_00F8 = 0
    var_00BA = 0
    var_00BE = 0
    var_00C0 = 0
    var_00C2 = 0
    var_00C4 = 0
    var_00C6 = 0
    var_00C8 = 0
    var_00CA = 0
    var_00CC = 0
    var_00CE = 0
    IF var_013B > 0 THEN GOTO label_0CA0D
    GOTO label_0CA5D
  label_0CA0D:
    ax = var_013B
    local_30 = ax
    ax = "You stop moving forward."
    CALL RT_2732_7450()
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    bx = ax
    ax = ax + 62
    si = ax
    cx = 0
    IF [si] <> 1 THEN GOTO label_0CA35
    cx = cx - 1
  label_0CA35:
    dx = 0
    IF [si] <> &HFFFF THEN GOTO label_0CA3E
    dx = dx - 1
  label_0CA3E:
    bx = bx + 56
    si = bx
    ax = 0
    IF [bx] <= 1 THEN GOTO label_0CA4C
    ax = ax - 1
  label_0CA4C:
    ' and ax,dx
    ' or ax,cx
    ' and ax,ax
    IF [bx] <> 1 THEN GOTO label_0CA57
    GOTO label_0CA5D
  label_0CA57:
    var_00F8 = 1
  label_0CA5D:
    IF var_013D > 0 THEN GOTO label_0CA67
    GOTO label_0CA75
  label_0CA67:
    ax = var_013D
    local_30 = ax
    ax = "You stop moving forward."
    CALL RT_2732_7450()
  label_0CA75:
    IF var_013F > 0 THEN GOTO label_0CA7F
    GOTO label_0CA8D
  label_0CA7F:
    ax = var_013F
    local_30 = ax
    ax = "You stop moving forward."
    CALL RT_2732_7450()
  label_0CA8D:
    IF var_0141 > 0 THEN GOTO label_0CA97
    GOTO label_0CAEE
  label_0CA97:
    ax = var_0141
    local_30 = ax
    ax = "You stop moving forward."
    CALL RT_2732_7450()
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 62
    si = ax
    IF [si] == 1 THEN GOTO label_0CABC
    GOTO label_0CAC2
  label_0CABC:
    var_00F8 = 1
  label_0CAC2:
    ' float_D9
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 54
    si = ax
    ax = [si]
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF [si] == 1 THEN GOTO label_0CAE8
    GOTO label_0CAEE
  label_0CAE8:
    var_00F8 = 1
  label_0CAEE:
    IF var_0143 > 0 THEN GOTO label_0CAF8
    GOTO label_0CB06
  label_0CAF8:
    ax = var_0143
    local_30 = ax
    ax = "You stop moving forward."
    CALL RT_2732_7450()
  label_0CB06:
    IF var_0145 > 0 THEN GOTO label_0CB10
    GOTO label_0CB1E
  label_0CB10:
    ax = var_0145
    local_30 = ax
    ax = "You stop moving forward."
    CALL RT_2732_7450()
  label_0CB1E:
    IF var_0147 > 0 THEN GOTO label_0CB28
    GOTO label_0CB36
  label_0CB28:
    ax = var_0147
    local_30 = ax
    ax = "You stop moving forward."
    CALL RT_2732_7450()
  label_0CB36:
    IF var_0149 > 0 THEN GOTO label_0CB40
    GOTO label_0CB4E
  label_0CB40:
    ax = var_0149
    local_30 = ax
    ax = "You stop moving forward."
    CALL RT_2732_7450()
  label_0CB4E:
    IF var_014B > 0 THEN GOTO label_0CB58
    GOTO label_0CB66
  label_0CB58:
    ax = var_014B
    local_30 = ax
    ax = "You stop moving forward."
    CALL RT_2732_7450()
  label_0CB66:
    IF var_014D > 0 THEN GOTO label_0CB70
    GOTO label_0CB7E
  label_0CB70:
    ax = var_014D
    local_30 = ax
    ax = "You stop moving forward."
    CALL RT_2732_7450()
  label_0CB7E:
    IF var_014F > 0 THEN GOTO label_0CB88
    GOTO label_0CB96
  label_0CB88:
    ax = var_014F
    local_30 = ax
    ax = "You stop moving forward."
    CALL RT_2732_7450()
  label_0CB96:
    IF var_0151 > 0 THEN GOTO label_0CBA0
    GOTO label_0CBAE
  label_0CBA0:
    ax = var_0151
    local_30 = ax
    ax = "You stop moving forward."
    CALL RT_2732_7450()
  label_0CBAE:
    IF var_020E == 1 THEN GOTO label_0CBB8
    GOTO label_0CBC2
  label_0CBB8:
    var_009A = var_009A + 2
    var_00A0 = var_00A0 + 2
  label_0CBC2:
    ax = 468
    CALL RT_2732_63DF(DS, 468, 7)
    CALL RT_2732_6130(7, "MAGE   ")
    IF var_020E == 1 THEN GOTO label_0CBDF
    GOTO label_0CC15
  label_0CBDF:
    ax = 1
    GOTO label_0CC09
  label_0CBE6:
    si = local_C
    si = si * 2
    ax = var_1584[si]
    IF ax > var_1578[si] THEN GOTO label_0CBF8
    GOTO label_0CC05
  label_0CBF8:
    si = local_C
    si = si * 2
    ax = var_1578[si]
    var_1584[si] = ax
  label_0CC05:
    ax = local_C
    ax = ax + 1
  label_0CC09:
    local_C = ax
    IF local_C <= 5 THEN GOTO label_0CBE6
    GOTO label_0CC86
  label_0CC15:
    ax = 468
    CALL RT_2732_63DF(DS, 468, 7)
    CALL RT_2732_6130(7, "BARD   ")
    ax = 0
    IF local_C <> 5 THEN GOTO label_0CC33
    ax = ax - 1
  label_0CC33:
    bx = ax
    ax = local_E
    cx = 0
    IF ax >= var_0218 THEN GOTO label_0CC42
    cx = cx - 1
  label_0CC42:
    ' and cx,bx
    ' and cx,cx
    IF ax <> var_0218 THEN GOTO label_0CC4B
    GOTO label_0CC86
  label_0CC4B:
    var_0218 = 0
    local_38 = "You stop singing your song! Hit any key to continue."
    CALL proc_2311E(addr(local_38), addr(local_3C))
    CALL free_string(addr(local_38))
    CALL proc_243D9()
    local_40 = ax
    local_44 = addr(local_40)
  label_0CC86:
    IF var_0218 > 0 THEN GOTO label_0CC90
    GOTO label_0CCE1
  label_0CC90:
    var_00AA = var_00AA - 1
    var_00AE = var_00AE - 1
    ax = var_0218
    local_46 = ax
    IF local_46 == 2 THEN GOTO label_0CCA7
    GOTO label_0CCBE
  label_0CCA7:
    var_009A = var_009A + 1
    var_009C = var_009C + 1
    var_009E = var_009E + 1
    var_00A0 = var_00A0 + 1
    var_00BC = var_00BC + 1
    GOTO label_0CCE1
  label_0CCBE:
    IF local_46 == 3 THEN GOTO label_0CCC7
    GOTO label_0CCCF
  label_0CCC7:
    var_00A8 = var_00A8 + 4
    GOTO label_0CCE1
  label_0CCCF:
    IF local_46 == 4 THEN GOTO label_0CCD8
    GOTO label_0CCE1
  label_0CCD8:
    var_00F2 = 1
    GOTO label_0CCE1
  label_0CCE1:
    GOTO label_0D0A9
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 54
    si = ax
    ax = [si]
    local_48 = ax
    IF local_48 == 39 THEN GOTO label_0CD01
    GOTO label_0CD19
  label_0CD01:
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_00F6 = var_00F6 + ax
    GOTO label_0D0A4
  label_0CD19:
    IF local_48 == 40 THEN GOTO label_0CD22
    GOTO label_0CD3A
  label_0CD22:
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_00F6 = var_00F6 + ax
    GOTO label_0D0A4
  label_0CD3A:
    IF local_48 == 24 THEN GOTO label_0CD43
    GOTO label_0CD4C
  label_0CD43:
    var_00F2 = 1
    GOTO label_0D0A4
  label_0CD4C:
    IF local_48 == 3 THEN GOTO label_0CD55
    GOTO label_0CD5E
  label_0CD55:
    var_00B4 = 1
    GOTO label_0D0A4
  label_0CD5E:
    IF local_48 == 4 THEN GOTO label_0CD67
    GOTO label_0CD7F
  label_0CD67:
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_00B2 = var_00B2 + ax
    GOTO label_0D0A4
  label_0CD7F:
    IF local_48 == 5 THEN GOTO label_0CD88
    GOTO label_0CDC0
  label_0CD88:
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    IF [si] > 0 THEN GOTO label_0CD9F
    GOTO label_0CDB7
  label_0CD9F:
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_00B6 = var_00B6 + ax
    GOTO label_0CDBD
  label_0CDB7:
    var_0214 = 1
  label_0CDBD:
    GOTO label_0D0A4
  label_0CDC0:
    IF local_48 == 6 THEN GOTO label_0CDC9
    GOTO label_0CDD0
  label_0CDC9:
    var_00BC = var_00BC + 1
    GOTO label_0D0A4
  label_0CDD0:
    IF local_48 == 7 THEN GOTO label_0CDD9
    GOTO label_0CDFC
  label_0CDD9:
    IF var_020E > 0 THEN GOTO label_0CDE3
    GOTO label_0CDE9
  label_0CDE3:
    var_020E = 0
  label_0CDE9:
    var_00B8 = 1
    var_009A = var_009A + 2
    var_00A0 = var_00A0 + 2
    GOTO label_0D0A4
  label_0CDFC:
    IF local_48 == 37 THEN GOTO label_0CE05
    GOTO label_0CE85
  label_0CE05:
    ax = 1
    GOTO label_0CE3A
  label_0CE0C:
    si = local_C
    si = si * 2
    IF var_1578[si] == 0 THEN GOTO label_0CE1B
    GOTO label_0CE2C
  label_0CE1B:
    si = local_C
    si = si * 2
    var_1578[si] = 2
    GOTO label_0CE43
    GOTO label_0CE36
  label_0CE2C:
    si = local_C
    si = si * 2
    var_1578[si] = var_1578[si] + 2
  label_0CE36:
    ax = local_C
    ax = ax + 1
  label_0CE3A:
    local_C = ax
    IF local_C <= 5 THEN GOTO label_0CE0C
  label_0CE43:
    ax = var_00A2
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    var_00A2 = ax
    ax = var_00A4
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    var_00A4 = ax
    ax = var_00A4
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    var_00A6 = ax
    GOTO label_0D0A4
  label_0CE85:
    IF local_48 == 8 THEN GOTO label_0CE8E
    GOTO label_0CE9D
  label_0CE8E:
    var_00BA = 1
    var_0212 = 0
    GOTO label_0D0A4
  label_0CE9D:
    IF local_48 == 28 THEN GOTO label_0CEA6
    GOTO label_0CEAF
  label_0CEA6:
    var_00D0 = 1
    GOTO label_0D0A4
  label_0CEAF:
    IF local_48 == 29 THEN GOTO label_0CEB8
    GOTO label_0CEC1
  label_0CEB8:
    var_00D2 = 1
    GOTO label_0D0A4
  label_0CEC1:
    IF local_48 == 36 THEN GOTO label_0CECA
    GOTO label_0CEF7
  label_0CECA:
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_009A = var_009A + ax
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_009C = var_009C + ax
    GOTO label_0D0A4
  label_0CEF7:
    IF local_48 == 1 THEN GOTO label_0CF00
    GOTO label_0CF2D
  label_0CF00:
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_009A = var_009A + ax
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_009C = var_009C + ax
    GOTO label_0D0A4
  label_0CF2D:
    IF local_48 == 35 THEN GOTO label_0CF36
    GOTO label_0CF69
  label_0CF36:
    var_00BE = 1
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_009A = var_009A + ax
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_009C = var_009C + ax
    GOTO label_0D0A4
  label_0CF69:
    IF local_48 == 2 THEN GOTO label_0CF72
    GOTO label_0CF9F
  label_0CF72:
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_009E = var_009E + ax
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_00A0 = var_00A0 + ax
    GOTO label_0D0A4
  label_0CF9F:
    IF local_48 == 9 THEN GOTO label_0CFA8
    GOTO label_0CFC0
  label_0CFA8:
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_00D4 = var_00D4 + ax
    GOTO label_0D0A4
  label_0CFC0:
    IF local_48 == 41 THEN GOTO label_0CFC9
    GOTO label_0CFD2
  label_0CFC9:
    var_00C0 = 1
    GOTO label_0D0A4
  label_0CFD2:
    IF local_48 == 42 THEN GOTO label_0CFDB
    GOTO label_0CFF9
  label_0CFDB:
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_00A0 = var_00A0 + ax
    var_00C2 = 1
    GOTO label_0D0A4
  label_0CFF9:
    IF local_48 == 43 THEN GOTO label_0D002
    GOTO label_0D020
  label_0D002:
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_00A0 = var_00A0 + ax
    var_00C4 = 1
    GOTO label_0D0A4
  label_0D020:
    IF local_48 == 44 THEN GOTO label_0D029
    GOTO label_0D047
  label_0D029:
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_00A0 = var_00A0 + ax
    var_00C6 = 1
    GOTO label_0D0A4
  label_0D047:
    IF local_48 == 47 THEN GOTO label_0D050
    GOTO label_0D06E
  label_0D050:
    ax = 68
    ' imul word [bp-0x30]
    ax = ax + &HBEE
    ax = ax + 56
    si = ax
    ax = [si]
    var_00A0 = var_00A0 + ax
    var_00C8 = 1
    GOTO label_0D0A4
  label_0D06E:
    IF local_48 == 45 THEN GOTO label_0D077
    GOTO label_0D080
  label_0D077:
    var_00CA = 1
    GOTO label_0D0A4
  label_0D080:
    IF local_48 == 46 THEN GOTO label_0D089
    GOTO label_0D092
  label_0D089:
    var_00CC = 1
    GOTO label_0D0A4
  label_0D092:
    IF local_48 == 48 THEN GOTO label_0D09B
    GOTO label_0D0A4
  label_0D09B:
    var_00CE = 1
    GOTO label_0D0A4
  label_0D0A4:
    CALL RT_2732_7473()
  label_0D0A9:
    CALL free_string(addr(local_40))
    CALL free_string(addr(local_44))
    CALL free_string(addr(local_3C))
    PROC_EXIT
    RETURN
    GOTO label_0D2B5
END SUB

SUB proc_0D0CF  ' image &HD0CF, locals 72
    cx = 72
    CALL frame_enter()
    local_C = 1
    local_E = 25
    CALL proc_21194(addr(local_C), addr(local_E))
    local_10 = 6
    local_12 = 0
    CALL color_25283(addr(local_10), addr(local_12))
    local_16 = &H4F0E
    local_18 = 0
    CALL print_more_21DB9(addr(local_16), addr(local_18))
    CALL free_string(addr(local_16))
    ax = 2
    GOTO label_0D1C7
  label_0D130:
    local_1A = 1
    local_1E = &H4F62
    local_20 = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_1A), addr(local_1E), addr(local_20))
    CALL free_string(addr(local_1E))
    local_24 = 40
    local_28 = &H4F62
    local_2A = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_24), addr(local_28), addr(local_2A))
    CALL free_string(addr(local_28))
    local_2C = 80
    local_30 = &H4F62
    local_32 = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_2C), addr(local_30), addr(local_32))
    CALL free_string(addr(local_30))
    ax = local_22
    ax = ax + 1
  label_0D1C7:
    local_22 = ax
    IF local_22 > 9 THEN GOTO label_0D1D3
    GOTO label_0D130
  label_0D1D3:
    local_36 = &H4F68
    local_38 = 0
    CALL print_more_21DB9(addr(local_36), addr(local_38))
    CALL free_string(addr(local_36))
    ax = 11
    GOTO label_0D264
  label_0D1FE:
    local_3A = 1
    local_3E = &H4F62
    local_40 = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_3A), addr(local_3E), addr(local_40))
    CALL free_string(addr(local_3E))
    local_42 = 80
    local_46 = &H4F62
    local_48 = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_42), addr(local_46), addr(local_48))
    CALL free_string(addr(local_46))
    ax = local_22
    ax = ax + 1
  label_0D264:
    local_22 = ax
    IF local_22 <= 23 THEN GOTO label_0D1FE
    local_4C = &H4FBC
    local_4E = 0
    CALL print_more_21DB9(addr(local_4C), addr(local_4E))
    CALL free_string(addr(local_4C))
    CALL proc_22430()
    local_50 = 7
    local_52 = 0
    CALL color_25283(addr(local_50), addr(local_52))
    PROC_EXIT
    RETURN
    GOTO label_0D478
END SUB

SUB wood_software_development_0D2B8  ' image &HD2B8, locals 68
  ' strings: Standard SB Registration with the Game Master program (GM) | Extended SB Registration with GM, BASWOOD tools, and source | WOOD SOFTWARE DEVELOPMENT | P.O. BOX 50681 | INDIANAPOLIS, IN 46250 | 317-470-8085
    cx = 68
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 2, 4, &H8001, addr(local_1C))
    ' xor ax,ax
    CALL RT_2732_24B9(addr(local_1C), 2, 4, 513, addr(local_2E))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "Standard SB Registration with the Game Master program (GM)"
    CALL near_09D83()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "Extended SB Registration with GM, BASWOOD tools, and source"
    CALL near_09D83()
    ' float_D9
    bx = addr(local_2E)
    CALL array_element(1, 1)
    ' float_hw
    ' float_D9
    bx = addr(local_2E)
    CALL array_element(2, 1)
    ' float_hw
    CALL hallfame_dat_0BE69()
    ' xor ax,ax
    PUSH 1
    CALL close_files()
    ax = 262
    CALL RT_2732_655C(CS, 262)
    ax = 291
    CALL RT_2732_63DF(DS, 291, 12)
    CALL RT_2732_000E(12)
    ax = &HFFFF
    CALL RT_2732_655C(CS, &HFFFF)
    local_32 = "WOOD SOFTWARE DEVELOPMENT"
    local_36 = "P.O. BOX 50681"
    local_3A = "INDIANAPOLIS, IN 46250"
    local_3E = "317-470-8085"
    local_42 = &H49B6
    local_44 = 2
    CALL doshareware_25421(addr(local_32), addr(local_36), addr(local_3A), addr(local_3E), addr(local_42), addr(local_1C), addr(local_2E), addr(local_44))
    CALL free_string(addr(local_32))
    CALL free_string(addr(local_36))
    CALL free_string(addr(local_3A))
    CALL free_string(addr(local_3E))
    CALL free_string(addr(local_42))
    local_46 = 11
    local_48 = 0
    CALL color_25283(addr(local_46), addr(local_48))
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    ax = ax + "Thanks for playing SB.  Don't forget to register and tell your friends about it!"
    local_4C = ax
    local_4E = 1
    CALL print_more_21DB9(addr(local_4C), addr(local_4E))
    CALL free_string(addr(local_4C))
    CALL RT_2732_4E21()
    CALL erase_array(addr(local_1C))
    CALL erase_array(addr(local_2E))
    PROC_EXIT
    RETURN
    GOTO label_0DA58
END SUB

SUB experience_level_menu_0D47B  ' image &HD47B, locals 188
  ' strings: EXPERIENCE LEVEL MENU | What class do you wish to find the experience for? | (F) - FIGHTER | (M) - MAGE | (B) - BARD | (Q) - QUIT
    cx = 188
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 4, 4, &H8001, addr(local_1C))
  label_0D498:
    local_26 = 1
    local_28 = 25
    CALL proc_21194(addr(local_26), addr(local_28))
    local_2A = 15
    local_2C = 0
    CALL color_25283(addr(local_2A), addr(local_2C))
    local_2E = 1
    local_30 = 29
    local_34 = "EXPERIENCE LEVEL MENU"
    local_36 = 0
    CALL locate_print_21DEA(addr(local_2E), addr(local_30), addr(local_34), addr(local_36))
    CALL free_string(addr(local_34))
    local_38 = 11
    local_3A = 0
    CALL color_25283(addr(local_38), addr(local_3A))
    local_3C = 3
    local_3E = 10
    local_42 = "What class do you wish to find the experience for?"
    local_44 = 0
    CALL locate_print_21DEA(addr(local_3C), addr(local_3E), addr(local_42), addr(local_44))
    CALL free_string(addr(local_42))
    local_46 = 7
    local_48 = 0
    CALL color_25283(addr(local_46), addr(local_48))
    local_24 = 0
    local_22 = 0
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(F) - FIGHTER"
    CALL near_09D83()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(M) - MAGE"
    CALL near_09D83()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(B) - BARD"
    CALL near_09D83()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "(Q) - QUIT"
    CALL near_09D83()
  label_0D5C7:
    local_4A = 4
    local_4C = 1
    local_4E = 15
    local_50 = 5
    local_52 = 2
    local_54 = 0
    local_56 = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_4A), addr(local_4C), addr(local_4E), addr(local_50), addr(local_52), addr(local_54), addr(local_5C), addr(local_56))
    local_5A = ax
    local_60 = addr(local_5A)
    local_64 = addr(local_60)
    CALL RT_2732_6130(addr(local_64), &H51D0)
    IF ? <> ? THEN GOTO label_0D63F
    GOTO label_0D65C
  label_0D63F:
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_64))
    IF ? == ? THEN GOTO label_0D65C
    GOTO label_0D662
  label_0D65C:
    GOTO label_0DA05
    GOTO label_0D722
  label_0D662:
    CALL RT_2732_6130(addr(local_64), &H51D6)
    IF ? == ? THEN GOTO label_0D674
    GOTO label_0D685
  label_0D674:
    local_66 = &H9C4
    local_6A = "FIGHTER"
    GOTO label_0D722
  label_0D685:
    CALL RT_2732_6130(addr(local_64), &H51E8)
    IF ? == ? THEN GOTO label_0D697
    GOTO label_0D6A8
  label_0D697:
    local_66 = &HBB8
    local_6A = "MAGE"
    GOTO label_0D722
  label_0D6A8:
    CALL RT_2732_6130(addr(local_64), &H51F6)
    IF ? == ? THEN GOTO label_0D6BA
    GOTO label_0D6CB
  label_0D6BA:
    local_66 = &HAF0
    local_6A = "BARD"
    GOTO label_0D722
  label_0D6CB:
    local_6E = "INVALID CLASS. PLEASE ENTER A VALID ONE."
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_72 = ax
    CALL proc_2311E(addr(local_6E), addr(local_72))
    ax = addr(local_72)
    PUSH DS
    PUSH addr(local_72)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_72), DS, 79, 1)
    CALL free_string(addr(local_6E))
    CALL free_string(addr(local_72))
    GOTO label_0D5C7
  label_0D722:
    local_74 = 1
    local_76 = 25
    CALL proc_21194(addr(local_74), addr(local_76))
    local_78 = 15
    local_7A = 0
    CALL color_25283(addr(local_78), addr(local_7A))
    local_7C = 1
    local_7E = 10
    local_82 = "EXPERIENCE NEEDED FOR EACH LEVEL FOR A "
    local_84 = 0
    CALL locate_print_21DEA(addr(local_7C), addr(local_7E), addr(local_82), addr(local_84))
    CALL free_string(addr(local_82))
    local_86 = 0
    CALL print_more_21DB9(addr(local_6A), addr(local_86))
    local_88 = 11
    local_8A = 0
    CALL color_25283(addr(local_88), addr(local_8A))
    local_8C = 3
    local_8E = 11
    local_92 = "LEVEL  1 -         0"
    local_94 = 1
    CALL locate_print_21DEA(addr(local_8C), addr(local_8E), addr(local_92), addr(local_94))
    CALL free_string(addr(local_92))
    local_96 = 9
    CALL proc_25D42(addr(local_96), addr(local_66))
    local_9A = ax
    ax = "          LEVEL  2 - " + addr(local_9A)
    local_9E = ax
    local_A0 = 1
    CALL print_more_21DB9(addr(local_9E), addr(local_A0))
    CALL free_string(addr(local_9E))
    ax = 3
    GOTO label_0D97A
  label_0D84E:
    ax = &HD4C0
    dx = 1
    CALL RT_2732_7413(local_22, local_24, DX, &HD4C0)
    IF ? > ? THEN GOTO label_0D866
    GOTO label_0D87B
  label_0D866:
    ax = local_24
    dx = local_22
    ax = ax + &HD4C0
    ' adc dx,0x1
    local_24 = ax
    local_22 = dx
    GOTO label_0D8F7
  label_0D87B:
    ax = local_66
    CALL RT_2F00_0558()
    ax = local_A2
    ax = ax - 1
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D9
    CALL RT_2F00_0619()
    ' float_DE
    CALL RT_2F00_05DF()
    CALL RT_2F00_057D()
    local_24 = ax
    local_22 = dx
    ax = local_24
    dx = local_22
    ax = ax + 49
    ' adc dx,0x0
    CALL RT_2F00_0559()
    ' float_DC
    CALL RT_2F00_057D()
    local_20 = ax
    local_1E = dx
    ax = local_20
    dx = local_1E
    local_24 = ax
    local_22 = dx
    CALL RT_2732_7404(long(100), local_22, local_24)
    local_24 = ax
    local_22 = dx
  label_0D8F7:
    local_A4 = 2
    CALL proc_25D42(addr(local_A4), addr(local_A2))
    local_A8 = ax
    local_AA = 9
    CALL proc_25F90(addr(local_AA), addr(local_24))
    local_AE = ax
    ax = "          LEVEL " + addr(local_A8)
    ax = ax + " - "
    ax = ax + addr(local_AE)
    local_B2 = ax
    local_B4 = 1
    CALL print_more_21DB9(addr(local_B2), addr(local_B4))
    CALL free_string(addr(local_B2))
    ax = local_A2
    ax = ax + 1
  label_0D97A:
    local_A2 = ax
    IF local_A2 > 15 THEN GOTO label_0D988
    GOTO label_0D84E
  label_0D988:
    local_B6 = 15
    local_B8 = 0
    CALL color_25283(addr(local_B6), addr(local_B8))
    local_BA = 19
    local_BC = 10
    local_C0 = "LEVEL 15 IS THE HIGHEST YOU CAN GO"
    local_C2 = 0
    CALL locate_print_21DEA(addr(local_BA), addr(local_BC), addr(local_C0), addr(local_C2))
    CALL free_string(addr(local_C0))
    local_C4 = 7
    local_C6 = 0
    CALL color_25283(addr(local_C4), addr(local_C6))
    CALL hit_any_key_to_continue_2434A()
    GOTO label_0D498
  label_0DA05:
    CALL free_string(addr(local_AE))
    CALL free_string(addr(local_A8))
    CALL free_string(addr(local_9A))
    CALL free_string(addr(local_64))
    CALL free_string(addr(local_5A))
    CALL free_string(addr(local_60))
    CALL free_string(addr(local_6A))
    CALL erase_array(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_0DF98
END SUB

SUB getuser_0DA5B  ' image &HDA5B, locals 164
  ' strings: GETUSER | Have you played SB at this installation before?  | NOMOREUSERS | Who are you? | You are  |  (at least according to you!)
    cx = 164
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, var_0133, 4, &H8001, addr(local_1C))
    IF var_0133 > 0 THEN GOTO label_0DA85
    GOTO label_0DB07
  label_0DA85:
    local_20 = "GETUSER"
    CALL sb_dat_21E13(addr(local_20))
    CALL free_string(addr(local_20))
    local_22 = 9
    local_24 = 1
    local_28 = "Have you played SB at this installation before? "
    local_2A = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_24), addr(local_28), addr(local_2A))
    CALL free_string(addr(local_28))
    local_2C = 9
    local_2E = 51
    local_30 = 1
    CALL y_yes_26031(addr(local_2C), addr(local_2E), addr(local_30))
    local_34 = ax
    local_38 = addr(local_34)
  label_0DB07:
    ax = 0
    IF var_0133 <> 0 THEN GOTO label_0DB12
    ax = ax - 1
  label_0DB12:
    bx = ax
    local_3A = bx
    CALL RT_2732_6130(addr(local_38), &H4AB6)
    ax = 0
    IF var_0133 <> 0 THEN GOTO label_0DB2A
    ax = ax - 1
  label_0DB2A:
    ' or ax,[bp-0x3a]
    ' and ax,ax
    IF var_0133 <> 0 THEN GOTO label_0DB34
    GOTO label_0DB82
  label_0DB34:
    ax = var_0A7B
    cx = 0
    IF ax <= var_0133 THEN GOTO label_0DB41
    cx = cx - 1
  label_0DB41:
    ' or ax,ax
    dx = 0
    IF ax > var_0133 THEN GOTO label_0DB49
    dx = dx - 1
  label_0DB49:
    ' or dx,cx
    ' and dx,dx
    IF ax <> var_0133 THEN GOTO label_0DB52
    GOTO label_0DB5A
  label_0DB52:
    CALL createuser_0AA99()
    GOTO label_0DB7F
  label_0DB5A:
    local_3E = "NOMOREUSERS"
    CALL sb_dat_21E13(addr(local_3E))
    CALL free_string(addr(local_3E))
    CALL hit_any_key_to_continue_2434A()
    CALL wood_software_development_0D2B8()
  label_0DB7F:
    GOTO label_0DF44
  label_0DB82:
    local_40 = 1
    local_42 = 25
    CALL proc_21194(addr(local_40), addr(local_42))
    local_44 = 15
    local_46 = 0
    CALL color_25283(addr(local_44), addr(local_46))
    local_4A = "Who are you?"
    local_4C = 0
    CALL print_more_21DB9(addr(local_4A), addr(local_4C))
    CALL free_string(addr(local_4A))
    ax = var_0133
    local_4E = ax
    ax = 1
    GOTO label_0DC2C
  label_0DBE0:
    GET #7, long(local_50), buffer(&HA90) LEN = 87
    ax = &HA90
    CALL RT_2732_63DF(DS, &HA90, 60)
    CALL RT_2732_6374(60)
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(local_50, 1)
    bx = dx
    ax = local_50
    ax = ax + 1
  label_0DC2C:
    local_50 = ax
    ax = local_4E
    IF ax >= local_50 THEN GOTO label_0DBE0
    local_52 = 1
    local_54 = 2
    local_56 = 5
    local_58 = 0
    local_5A = 0
    local_5C = 0
    CALL menu_choice_225B8(addr(local_1C), 307, addr(local_52), addr(local_54), addr(local_56), addr(local_58), addr(local_5A), addr(local_62), addr(local_5C))
    local_60 = ax
    local_38 = addr(local_60)
    ax = 0
    IF local_62 <= 0 THEN GOTO label_0DC99
    ax = ax - 1
  label_0DC99:
    bx = ax
    local_64 = bx
    CALL RT_2732_6130(addr(local_38), &H51D0)
    ax = 0
    IF local_62 == 0 THEN GOTO label_0DCB1
    ax = ax - 1
  label_0DCB1:
    ' and ax,[bp-0x64]
    bx = ax
    ax = 74
    local_66 = bx
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_38))
    ax = 0
    IF local_62 == 0 THEN GOTO label_0DCD7
    ax = ax - 1
  label_0DCD7:
    ' and ax,[bp-0x66]
    ' and ax,ax
    IF local_62 <> 0 THEN GOTO label_0DCE1
    GOTO label_0DF3F
  label_0DCE1:
    CALL charactr_0F56E(addr(local_62))
    local_68 = 1
    local_6A = 25
    CALL proc_21194(addr(local_68), addr(local_6A))
    local_6C = 11
    local_6E = 0
    CALL color_25283(addr(local_6C), addr(local_6E))
    local_72 = "You are "
    local_74 = 0
    CALL print_more_21DB9(addr(local_72), addr(local_74))
    CALL free_string(addr(local_72))
    local_76 = 14
    local_78 = 0
    CALL color_25283(addr(local_76), addr(local_78))
    ax = &HA90
    CALL RT_2732_63DF(DS, &HA90, 60)
    CALL RT_2732_6374(60)
    local_7C = ax
    local_7E = 0
    CALL print_more_21DB9(addr(local_7C), addr(local_7E))
    CALL free_string(addr(local_7C))
    local_80 = 11
    local_82 = 0
    CALL color_25283(addr(local_80), addr(local_82))
    local_86 = " (at least according to you!)"
    local_88 = 0
    CALL print_more_21DB9(addr(local_86), addr(local_88))
    CALL free_string(addr(local_86))
    local_8A = 21
    local_8C = 1
    local_90 = "What is the your password?"
    CALL proc_251B9(addr(local_8A), addr(local_8C), addr(local_90))
    local_94 = ax
    CALL free_string(addr(local_90))
    local_98 = addr(local_94)
    local_9A = 10
    CALL proc_2515F(addr(local_98), addr(local_9A))
    CALL proc_23059(addr(local_98))
    local_9E = ax
    local_98 = addr(local_9E)
    ax = &HACC
    CALL RT_2732_63DF(DS, &HACC, 10)
    CALL RT_2732_6130(10, addr(local_98))
    ax = 0
    IF local_62 == 0 THEN GOTO label_0DE66
    ax = ax - 1
  label_0DE66:
    bx = ax
    ax = &HA85
    local_A0 = bx
    CALL RT_2732_63DF(DS, &HA85, 10)
    CALL RT_2732_6130(10, addr(local_98))
    ax = 0
    IF local_62 == 0 THEN GOTO label_0DE8B
    ax = ax - 1
  label_0DE8B:
    bx = ax
    ax = &HA85
    local_A2 = bx
    CALL RT_2732_63DF(DS, &HA85, 10)
    PUSH 10
    CALL RT_2732_62BC(10)
    CALL RT_2732_6130(10)
    ax = 0
    IF local_62 <> 0 THEN GOTO label_0DEB5
    ax = ax - 1
  label_0DEB5:
    ' or ax,[bp-0xa2]
    ' and ax,[bp-0xa0]
    ' and ax,ax
    IF local_62 <> 0 THEN GOTO label_0DEC4
    GOTO label_0DF3C
  label_0DEC4:
    local_A6 = "That was an incorrect password! The program is ending. Hit any key to continue"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_AA = ax
    CALL proc_2311E(addr(local_A6), addr(local_AA))
    ax = addr(local_AA)
    PUSH DS
    PUSH addr(local_AA)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_AA), DS, 79, 1)
    CALL free_string(addr(local_A6))
    CALL free_string(addr(local_AA))
    CALL proc_243D9()
    local_AE = ax
    local_38 = addr(local_AE)
    CALL wood_software_development_0D2B8()
  label_0DF3C:
    GOTO label_0DF44
  label_0DF3F:
    CALL wood_software_development_0D2B8()
  label_0DF44:
    CALL free_string(addr(local_AE))
    CALL free_string(addr(local_9E))
    CALL free_string(addr(local_94))
    CALL free_string(addr(local_60))
    CALL free_string(addr(local_34))
    CALL free_string(addr(local_38))
    CALL erase_array(addr(local_1C))
    CALL free_string(addr(local_98))
    PROC_EXIT
    RETURN
    GOTO label_0E902
END SUB

SUB itemfile_dat_0DF9B  ' image &HDF9B, locals 88
  ' strings: weapon | instrument | helmet | shield | armor | gauntlets
    cx = 88
    CALL frame_enter()
    CALL RT_2732_7AEA()
    si = ax
    ' float_D9
    sp = sp - 8
    bx = sp
    ' float_DD
    CALL RT_2732_7A43()
    CALL proc_24B05()
    IF var_0064 == 1 THEN GOTO label_0DFCB
    GOTO label_0DFF4
  label_0DFCB:
    local_C = 1
    local_E = 1
    local_10 = 3
    local_12 = 3
    CALL proc_24CA6(addr(local_C), addr(local_E), addr(local_10), addr(local_12))
  label_0DFF4:
    var_0ADE = 1
    var_0AE0 = 1
    CALL RT_2732_616F(7)
    PUSH DS
    PUSH 7
    ' xor ax,ax
    ax = &HAE6
    CALL RT_2732_6404(7, DS, &HAE6, 1)
    var_0AE2 = 1
    var_0AE4 = 0
    CALL RT_2732_7AEA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_056C()
    var_005E = ax
    local_14 = 7
    local_16 = 0
    CALL color_25283(addr(local_14), addr(local_16))
    local_18 = 1
    local_1A = 25
    CALL proc_21194(addr(local_18), addr(local_1A))
    &H1594 = "weapon"
    &H1598 = "instrument"
    &H159C = "helmet"
    &H15A0 = "shield"
    &H15A4 = "armor"
    &H15A8 = "gauntlets"
    &H15AC = "boots"
    &H15B0 = "cloak"
    &H15B4 = "ring"
    &H15B8 = "wand"
    &H15BC = "potion"
    &H15C0 = "book"
    &H15C4 = "lenses"
    CALL RT_2732_616F(157)
    PUSH DS
    PUSH 157
    ' xor ax,ax
    ax = 278
    CALL RT_2732_6404(157, DS, 278, 1)
    var_0054 = 1
    OPEN "ITEMFILE.DAT" FOR RANDOM AS #1 LEN = 44
    CALL file_ah4(1)
    CALL RT_2F00_0559()
    ' float_DC
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    var_0135 = ax
    IF var_0135 == 0 THEN GOTO label_0E145
    GOTO label_0E173
  label_0E145:
    local_1E = "NO ITEM FILE (ITEMFILE.DAT) PRESENT. GAME TERMINATED"
    local_20 = 0
    CALL print_more_21DB9(addr(local_1E), addr(local_20))
    CALL free_string(addr(local_1E))
    CALL hit_any_key_to_continue_2434A()
    CALL wood_software_development_0D2B8()
  label_0E173:
    ax = var_0135
    local_22 = ax
    ax = 1
    GOTO label_0E220
  label_0E180:
    GET #1, long(local_24), buffer(606) LEN = 44
    ' float_D9
    ax = var_0278
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF var_0135 <> 0 THEN GOTO label_0E1B2
    GOTO label_0E1CD
  label_0E1B2:
    si = var_0278
    si = si * 2
    ax = local_24
    var_15E4[si] = ax
    ax = var_0278
    CALL RT_2F00_0558()
    ' float_D9
  label_0E1CD:
    si = var_0278
    si = si * 2
    ax = local_24
    var_15C8[si] = ax
    ax = 0
    IF var_027E == 0 THEN GOTO label_0E1E5
    ax = ax - 1
  label_0E1E5:
    ' float_DD
    ' float_DD
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_027E <= 0 THEN GOTO label_0E1FE
    ax = ax - 1
  label_0E1FE:
    ' and ax,bx
    ' and ax,ax
    IF var_027E <> 0 THEN GOTO label_0E207
    GOTO label_0E20E
  label_0E207:
    var_0139 = var_0139 + 1
    GOTO label_0E21C
  label_0E20E:
    IF var_027E == 0 THEN GOTO label_0E218
    GOTO label_0E21C
  label_0E218:
    var_0137 = var_0137 + 1
  label_0E21C:
    ax = local_24
    ax = ax + 1
  label_0E220:
    local_24 = ax
    ax = local_22
    IF ax < local_24 THEN GOTO label_0E22E
    GOTO label_0E180
  label_0E22E:
    CLOSE #1
    OPEN "MONSTER.DAT" FOR RANDOM AS #2 LEN = 196
    CALL file_ah4(2)
    CALL RT_2F00_0559()
    ' float_DC
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_24 THEN GOTO label_0E27B
    GOTO label_0E2A9
  label_0E27B:
    local_30 = "NO MONSTER FILE (MONSTER.DAT) PRESENT. GAME TERMINATED"
    local_32 = 0
    CALL print_more_21DB9(addr(local_30), addr(local_32))
    CALL free_string(addr(local_30))
    CALL hit_any_key_to_continue_2434A()
    CALL wood_software_development_0D2B8()
  label_0E2A9:
    ax = 1
    GOTO label_0E2C6
  label_0E2B0:
    ' float_D9
    CALL RT_2F00_056C()
    si = local_24
    si = si * 2
    var_153A[si] = ax
    ax = local_24
    ax = ax + 1
  label_0E2C6:
    local_24 = ax
    IF local_24 <= 30 THEN GOTO label_0E2B0
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    local_38 = ax
    ax = 1
    GOTO label_0E38F
  label_0E2EC:
    GET #2, long(local_24), buffer(&HAE8) LEN = 196
    ax = 0
    IF local_24 <= 1 THEN GOTO label_0E310
    ax = ax - 1
  label_0E310:
    ' float_D9
    bx = ax
    ax = var_0AFC
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ax = 0
    IF local_24 == 1 THEN GOTO label_0E32B
    ax = ax - 1
  label_0E32B:
    ' and ax,bx
    ' and ax,ax
    IF local_24 <> 1 THEN GOTO label_0E334
    GOTO label_0E34B
  label_0E334:
    ax = local_24
    ax = ax - 1
    ' float_D9
    bx = ax
    CALL RT_2F00_056C()
    si = ax
    si = si * 2
    var_153A[si] = bx
  label_0E34B:
    ax = var_0AFC
    CALL RT_2F00_0558()
    ' float_D9
    ax = 0
    IF var_0AFC >= 21 THEN GOTO label_0E364
    ax = ax - 1
  label_0E364:
    cx = 0
    IF var_0B00 <> 0 THEN GOTO label_0E36F
    cx = cx - 1
  label_0E36F:
    ' and cx,ax
    ax = 0
    IF var_0AFE < 0 THEN GOTO label_0E37C
    ax = ax - 1
  label_0E37C:
    ' and ax,cx
    ' and ax,ax
    IF var_0AFE <> 0 THEN GOTO label_0E385
    GOTO label_0E38B
  label_0E385:
    ax = local_24
    var_0153 = ax
  label_0E38B:
    ax = local_24
    ax = ax + 1
  label_0E38F:
    local_24 = ax
    ax = local_38
    IF ax < local_24 THEN GOTO label_0E39D
    GOTO label_0E2EC
  label_0E39D:
    CLOSE #2
    OPEN "SPELLS.DAT" FOR RANDOM AS #6 LEN = 66
    CALL file_ah4(6)
    CALL RT_2F00_0559()
    ' float_DC
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_24 THEN GOTO label_0E3ED
    GOTO label_0E41B
  label_0E3ED:
    local_40 = "NO SPELLS FILE (SPELLS.DAT) PRESENT. GAME TERMINATED"
    local_42 = 0
    CALL print_more_21DB9(addr(local_40), addr(local_42))
    CALL free_string(addr(local_40))
    CALL hit_any_key_to_continue_2434A()
    CALL wood_software_development_0D2B8()
  label_0E41B:
    CLOSE #6
    CALL RT_2732_02F6()
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    PUSH "SB.DAT"
    CALL RT_2F00_056C()
    CALL open_random("SB.DAT", &HFFFF, &H4001)
    ' float_D9
    CALL RT_2F00_056C()
    CALL file_ah4(&H4001)
    PUSH DX
    PUSH &H4001
    ' xor ax,ax
    ' cwd
    CALL RT_2732_7413(DX, &H4001)
    IF ax == local_24 THEN GOTO label_0E473
    GOTO label_0E4A1
  label_0E473:
    local_4A = "NO TEXT FILE (SB.DAT) PRESENT. GAME TERMINATED"
    local_4C = 0
    CALL print_more_21DB9(addr(local_4A), addr(local_4C))
    CALL free_string(addr(local_4A))
    CALL hit_any_key_to_continue_2434A()
    CALL wood_software_development_0D2B8()
  label_0E4A1:
    ' float_D9
    CALL RT_2F00_056C()
    CLOSE #addr(local_4A)
    ax = 79
    CALL RT_2732_655C(CS, 79)
    OPEN "SYSTEM.SBS" FOR RANDOM AS #10 LEN = 21
    ax = &HFFFF
    CALL RT_2732_655C(CS, &HFFFF)
    CALL file_ah4(10)
    PUSH DX
    PUSH 10
    ' xor ax,ax
    ' cwd
    CALL RT_2732_7413(DX, 10)
    IF ax == local_24 THEN GOTO label_0E4F7
    GOTO label_0E519
  label_0E4F7:
    CALL setup_0F632()
    CALL RT_2732_02EF(10, long(1), buffer(&HA7A), 21)
    GOTO label_0E533
  label_0E519:
    GET #10, long(1), buffer(&HA7A) LEN = 21
  label_0E533:
    CLOSE #10
    IF var_0A83 > 0 THEN GOTO label_0E54A
    GOTO label_0E554
  label_0E54A:
    ax = var_0A83
    ax = ax + var_005E
    var_0060 = ax
  label_0E554:
    IF var_0A7F > 0 THEN GOTO label_0E55E
    GOTO label_0E6EA
  label_0E55E:
    ax = 60
    ' imul word [0xa7f]
    CALL RT_2F00_0558()
    ' float_D9
    ax = var_0A81
    ax = ax + var_0A7F
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0A7F > 0 THEN GOTO label_0E597
    GOTO label_0E5A6
  label_0E597:
    ' float_D9
    ' float_D8
    ' float_D9
  label_0E5A6:
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    ' jnc 0xe5ca
    ax = ax - 1
  label_0E5CA:
    ' float_D9
    bx = ax
    ax = var_005E
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ax = 0
    ' jc 0xe5e5
    ax = ax - 1
  label_0E5E5:
    ' and ax,bx
    ' float_D9
    bx = ax
    ax = var_005E
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ax = 0
    ' jnc 0xe602
    ax = ax - 1
  label_0E602:
    ' and ax,bx
    ' float_D9
    bx = ax
    ax = var_005E
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ax = 0
    ' jnc 0xe61f
    ax = ax - 1
  label_0E61F:
    ' or ax,bx
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_0A7F <= 0 THEN GOTO label_0E638
    ax = ax - 1
  label_0E638:
    ' float_D9
    dx = ax
    ax = var_005E
    cx = dx
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ax = 0
    ' jc 0xe655
    ax = ax - 1
  label_0E655:
    ' and ax,cx
    ' or ax,bx
    ' and ax,ax
    IF var_0A7F <> 0 THEN GOTO label_0E660
    GOTO label_0E688
  label_0E660:
    local_5C = "HOURSBLOCKED"
    CALL sb_dat_21E13(addr(local_5C))
    CALL free_string(addr(local_5C))
    CALL hit_any_key_to_continue_2434A()
    CALL wood_software_development_0D2B8()
    GOTO label_0E6EA
  label_0E688:
    ' float_D9
    ax = var_005E
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF var_0A7F > 0 THEN GOTO label_0E6A0
    GOTO label_0E6AF
  label_0E6A0:
    ' float_D9
    ' float_D8
    ' float_D9
  label_0E6AF:
    ax = 0
    IF var_0060 <> 0 THEN GOTO label_0E6BA
    ax = ax - 1
  label_0E6BA:
    ' float_D9
    bx = ax
    ax = var_0060
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ax = 0
    IF var_0060 <= 0 THEN GOTO label_0E6D5
    ax = ax - 1
  label_0E6D5:
    ' or ax,bx
    ' and ax,ax
    IF var_0060 <> 0 THEN GOTO label_0E6DE
    GOTO label_0E6EA
  label_0E6DE:
    ' float_D9
    CALL RT_2F00_056C()
    var_0060 = ax
  label_0E6EA:
    OPEN "USER.SBS" FOR RANDOM AS #7 LEN = 87
    CALL file_ah4(7)
    CALL RT_2F00_0559()
    ' float_DC
    CALL RT_2F00_056C()
    var_0133 = ax
    ax = &HA7A
    CALL RT_2732_63DF(DS, &HA7A, 1)
    CALL RT_2732_6130(1, &H55C0)
    IF var_0060 == 0 THEN GOTO label_0E737
    GOTO label_0E76C
  label_0E737:
    ax = "Single User"
    PUSH DS
    PUSH "Single User"
    ' xor ax,ax
    ax = &HA90
    CALL RT_2732_6404("Single User", DS, &HA90, 60)
    ax = "CHARACTR"
    PUSH DS
    PUSH "CHARACTR"
    ' xor ax,ax
    ax = &HAD6
    CALL RT_2732_6404("CHARACTR", DS, &HAD6, 8)
    var_0096 = 1
    GOTO label_0E771
  label_0E76C:
    CALL getuser_0DA5B()
  label_0E771:
    CALL file_ah4(7)
    CALL RT_2F00_0559()
    ' float_DC
    CALL RT_2F00_056C()
    var_0133 = ax
    IF var_0133 == 0 THEN GOTO label_0E796
    GOTO label_0E7F5
  label_0E796:
    CALL RT_2732_02EF(7, long(var_0096), buffer(&HA90), 87)
    ax = &HA7A
    CALL RT_2732_63DF(DS, &HA7A, 1)
    CALL RT_2732_6130(1, &H55C0)
    IF var_0133 == 0 THEN GOTO label_0E7CD
    GOTO label_0E7F2
  label_0E7CD:
    CALL sorcerer_s_bane_17F3F()
    local_60 = "INTRODUCTION"
    CALL sb_dat_21E13(addr(local_60))
    CALL free_string(addr(local_60))
    CALL hit_any_key_to_continue_2434A()
  label_0E7F2:
    GOTO label_0E820
  label_0E7F5:
    ax = &HA7A
    CALL RT_2732_63DF(DS, &HA7A, 1)
    CALL RT_2732_6130(1, &H55C0)
    IF var_0133 == 0 THEN GOTO label_0E812
    GOTO label_0E820
  label_0E812:
    local_62 = 1
    CALL charactr_0F56E(addr(local_62))
  label_0E820:
    ax = &HAD6
    CALL RT_2732_63DF(DS, &HAD6, 8)
    CALL RT_2732_6374(8)
    ax = ax + ".SBL"
    PUSH DS
    PUSH 8
    ' xor ax,ax
    ax = 291
    CALL RT_2732_6404(8, DS, 291, 12)
    ax = &HAD6
    CALL RT_2732_63DF(DS, &HAD6, 8)
    CALL RT_2732_6374(8)
    ax = ax + ".SBC"
    PUSH DS
    PUSH 8
    ' xor ax,ax
    ax = 279
    CALL RT_2732_6404(8, DS, 279, 12)
    ax = 79
    CALL RT_2732_655C(CS, 79)
    ax = 291
    CALL RT_2732_63DF(DS, 291, 12)
    OPEN 12 FOR RANDOM AS #16 LEN = &HFFFF
    ax = 279
    CALL RT_2732_63DF(DS, 279, 12)
    OPEN 12 FOR RANDOM AS #3 LEN = 166
    ax = &HFFFF
    CALL RT_2732_655C(CS, &HFFFF)
    CALL file_ah4(3)
    CALL RT_2F00_0559()
    ' float_DC
    CALL RT_2F00_056C()
    var_0131 = ax
    CLOSE #3
    PROC_EXIT
    RETURN
    GOTO label_0EAE5
END SUB

SUB dun_0E905  ' image &HE905, locals 16
  ' strings: KILLLOCK.SBL | .DUN | .INV | KILLCHAR.SBC
    cx = 16
    CALL frame_enter()
    var_0112 = 1
    ax = 79
    CALL RT_2732_655C(CS, 79)
    OPEN "KILLLOCK.SBL" FOR RANDOM AS #12 LEN = &HFFFF
    ax = &HFFFF
    CALL RT_2732_655C(CS, &HFFFF)
    PUSH DS
    PUSH arg_6
    ' xor ax,ax
    ax = 586
    CALL RT_2732_6404(&HFFFF, DS, 586, 20)
    ax = 460
    CALL RT_2732_63DF(DS, 460, 8)
    CALL RT_2732_6374(8)
    ax = ax + ".DUN"
    local_E = ax
    ax = 460
    CALL RT_2732_63DF(DS, 460, 8)
    CALL RT_2732_6374(8)
    ax = ax + ".INV"
    local_12 = ax
    ax = 262
    CALL RT_2732_655C(CS, 262)
    CALL RT_2732_000E(addr(local_E))
    CALL RT_2732_000E(addr(local_12))
    ax = &HFFFF
    CALL RT_2732_655C(CS, &HFFFF)
    ax = 460
    ax = addr(local_16)
    PUSH DS
    PUSH 460
    PUSH 8
    PUSH DS
    PUSH addr(local_16)
    ' xor ax,ax
    CALL RT_2732_6404(addr(local_16))
    PUSH var_021E
    PUSH var_021C
    ' xor ax,ax
    ' cwd
    CALL RT_2732_7413(DX, addr(local_16))
    IF ? <> ? THEN GOTO label_0E9EC
    GOTO label_0E9F1
  label_0E9EC:
    CALL hallfame_dat_10E6E()
  label_0E9F1:
    OPEN "KILLCHAR.SBC" FOR RANDOM AS #8 LEN = 166
    ax = var_0131
    local_18 = ax
    ax = 1
    GOTO label_0EA50
  label_0EA12:
    CALL proc_0800C(addr(local_1A))
    ax = 460
    CALL RT_2732_63DF(DS, 460, 8)
    CALL RT_2732_6130(8, addr(local_16))
    IF ? <> ? THEN GOTO label_0EA38
    GOTO label_0EA4C
  label_0EA38:
    CALL RT_2732_02BD(8, buffer(440), 166)
  label_0EA4C:
    ax = local_1A
    ax = ax + 1
  label_0EA50:
    local_1A = ax
    ax = local_18
    IF ax >= local_1A THEN GOTO label_0EA12
    ax = 279
    CALL RT_2732_63DF(DS, 279, 12)
    CALL RT_2732_000E(12)
    CLOSE #8
    ax = 279
    PUSH "KILLCHAR.SBC"
    CALL RT_2732_63DF(DS, 279, 12)
    CALL RT_2732_0057(12)
    CLOSE #12
    ax = 262
    CALL RT_2732_655C(CS, 262)
    CALL RT_2732_000E("KILLLOCK.SBL")
    ax = &HFFFF
    CALL RT_2732_655C(CS, &HFFFF)
    var_0131 = var_0131 - 1
    CALL free_string(addr(local_E))
    CALL free_string(addr(local_16))
    CALL free_string(addr(local_12))
    PROC_EXIT
    RETURN
    GOTO label_0ED1B
END SUB

SUB wood_software_development_0EAE8  ' image &HEAE8, locals 58
  ' strings: Standard SB Registration with GAME MASTER | Extended SB Registration with GAME MASTER, |     BASWOOD BASIC tools, source code, and manuals | WOOD SOFTWARE DEVELOPMENT | P.O. BOX 50681 | INDIANAPOLIS, IN 46250
    cx = 58
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 2, 4, &H8001, addr(local_1C))
    ' xor ax,ax
    CALL RT_2732_24B9(addr(local_1C), 2, 4, 513, addr(local_2E))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "Standard SB Registration with GAME MASTER"
    CALL near_09D83()
    ax = 77
    CALL RT_2732_63DF(DS, 77, 1)
    ax = "Extended SB Registration with GAME MASTER," + ax
    ax = ax + "    BASWOOD BASIC tools, source code, and manuals"
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(2, 1)
    bx = dx
    ' float_D9
    bx = addr(local_2E)
    CALL array_element(1, 1)
    ' float_hw
    ' float_D9
    bx = addr(local_2E)
    CALL array_element(2, 1)
    ' float_hw
    local_32 = "WOOD SOFTWARE DEVELOPMENT"
    local_36 = "P.O. BOX 50681"
    local_3A = "INDIANAPOLIS, IN 46250"
    local_3E = "317-470-8085"
    local_42 = "STDOUT"
    local_44 = 2
    CALL doshareware_25421(addr(local_32), addr(local_36), addr(local_3A), addr(local_3E), addr(local_42), addr(local_1C), addr(local_2E), addr(local_44))
    CALL free_string(addr(local_32))
    CALL free_string(addr(local_36))
    CALL free_string(addr(local_3A))
    CALL free_string(addr(local_3E))
    CALL free_string(addr(local_42))
    CALL RT_2732_6F64()
    PUSH "Your registration fee entitles you to use all software received on a single"
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "computer, make as many backups as you wish, and/or transfer all rights to"
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "the software to another individual.  Although you cannot use the source code"
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "for SB or GM for distribution without written expressed permission of the"
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "holder of the copyright, you can use the BASWOOD utilities to make and"
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "distribute your own software ALONG WITH the BASWOOD.LIB that will come with"
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    ax = "the 99.95 registration.  Site licenses are also available; call for details." + ax
    PUSH 1
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "Check or money order only (No cash please, for my sake as well as yours,"
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "and all checks must be drawn against U.S. banks.)  Make all checks out for"
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "$19.95 for each SB regular registration and 99.95 for each SB extended"
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "registration.  Most corporate P.O.s also accepted.  Allow 6 weeks for"
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "delivery on personal checks.  Money orders and corporate P.O.s allow 1"
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    ax = 78
    CALL RT_2732_63DF(DS, 78, 1)
    ax = "week for delivery." + ax
    PUSH 1
    CALL RT_2732_5920()
    CALL erase_array(addr(local_1C))
    CALL erase_array(addr(local_2E))
    PROC_EXIT
    RETURN
    GOTO label_0F56B
END SUB

SUB monster_dat_0ED1E  ' image &HED1E, locals 246
  ' strings: MONSTER.DAT
    cx = 246
    CALL frame_enter()
    CALL RT_2732_24B9(2, 5, 4, 513, addr(local_1C))
    ax = var_01F4
    ax = ax + &HFFFB
    CALL RT_2F00_0558()
    ' float_D9
    ax = var_01F4
    CALL RT_2F00_0558()
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0ED8F
    GOTO label_0EDAF
  label_0ED8F:
    ax = var_01F4
    ax = ax + &HFFF6
    CALL RT_2F00_0558()
    ' float_D9
    ax = var_01F4
    ax = ax + 1
    CALL RT_2F00_0558()
    ' float_D9
  label_0EDAF:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jc 0xedc4
    GOTO label_0EDCF
  label_0EDC4:
    ' float_D9
    ' float_D9
  label_0EDCF:
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? > ? THEN GOTO label_0EDE4
    GOTO label_0EDEF
  label_0EDE4:
    ' float_D9
    ' float_D9
  label_0EDEF:
    ' float_D9
    CALL RT_2F00_056C()
    si = ax
    si = si * 2
    ax = var_153A[si]
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0EE20
    GOTO label_0EE2E
  label_0EE20:
    ' float_D9
    ' float_D9
    GOTO label_0EE84
  label_0EE2E:
    ' float_D9
    ' float_D8
    CALL RT_2F00_056C()
    si = ax
    si = si * 2
    ax = var_153A[si]
    ax = ax + 1
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    si = var_01F4
    si = si * 2
    ax = var_153A[si]
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ' jc 0xee6f
    GOTO label_0EE84
  label_0EE6F:
    si = var_01F4
    si = si * 2
    ax = var_153A[si]
    CALL RT_2F00_0558()
    ' float_D9
  label_0EE84:
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D9
    ax = 1
    GOTO label_0EF66
  label_0EE9E:
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    var_0156 = ax
    OPEN "MONSTER.DAT" FOR RANDOM AS #2 LEN = 196
    GET #2, long(var_0156), buffer(&HAE8) LEN = 196
    CLOSE #2
    local_36 = 22
    CALL proc_10DF0(addr(local_36), addr(local_3A))
    ' float_D9
    CALL RT_2F00_056C()
    var_018C = ax
    local_3C = 23
    CALL proc_10DF0(addr(local_3C), addr(local_40))
    ' float_D9
    CALL RT_2F00_056C()
    var_018E = ax
    local_42 = 25
    CALL proc_10DF0(addr(local_42), addr(local_46))
    ' float_D9
    CALL RT_2F00_056C()
    var_0192 = ax
    IF var_0AFE < 0 THEN GOTO label_0EF5F
    GOTO label_0EF62
  label_0EF5F:
    GOTO label_0EF72
  label_0EF62:
    ax = local_48
    ax = ax + 1
  label_0EF66:
    local_48 = ax
    IF local_48 > 2 THEN GOTO label_0EF72
    GOTO label_0EE9E
  label_0EF72:
    var_015A = 0
    var_015C = 0
    var_015E = 0
    var_0160 = 0
    local_4A = 28
    CALL proc_10DF0(addr(local_4A), addr(local_4E))
    ' float_D9
    CALL RT_2F00_056C()
    var_019A = ax
    IF var_019A == 1 THEN GOTO label_0EFB2
    GOTO label_0EFF5
  label_0EFB2:
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_019A == 1 THEN GOTO label_0EFE3
    GOTO label_0EFEF
  label_0EFE3:
    var_0158 = 1
    GOTO label_0F55A
    GOTO label_0EFF5
  label_0EFEF:
    var_019A = 0
  label_0EFF5:
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0B14
    ax = ax - var_0B12
    ax = ax + 1
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ax = var_0B12
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    var_0158 = ax
    local_54 = 1
    CALL proc_10DF0(addr(local_54), addr(local_58))
    ' float_D9
    CALL RT_2F00_056C()
    var_0162 = ax
    local_5A = 2
    CALL proc_10DF0(addr(local_5A), addr(local_5E))
    ' float_D9
    CALL RT_2F00_056C()
    var_0164 = ax
    local_60 = 3
    CALL proc_10DF0(addr(local_60), addr(local_64))
    ' float_D9
    CALL RT_2F00_056C()
    var_0166 = ax
    local_66 = 4
    CALL proc_10DF0(addr(local_66), addr(local_6A))
    ' float_D9
    CALL RT_2F00_056C()
    var_0168 = ax
    local_6C = 5
    CALL proc_10DF0(addr(local_6C), addr(local_70))
    ' float_D9
    CALL RT_2F00_056C()
    var_016A = ax
    local_72 = 6
    CALL proc_10DF0(addr(local_72), addr(local_76))
    ' float_D9
    CALL RT_2F00_056C()
    var_016C = ax
    local_78 = 7
    CALL proc_10DF0(addr(local_78), addr(local_7C))
    ' float_D9
    CALL RT_2F00_056C()
    var_016E = ax
    local_7E = 8
    CALL proc_10DF0(addr(local_7E), addr(local_82))
    ' float_D9
    CALL RT_2F00_056C()
    var_0170 = ax
    local_84 = 9
    CALL proc_10DF0(addr(local_84), addr(local_88))
    ' float_D9
    CALL RT_2F00_056C()
    var_0172 = ax
    local_8A = 10
    CALL proc_10DF0(addr(local_8A), addr(local_8E))
    ' float_D9
    CALL RT_2F00_056C()
    var_0174 = ax
    local_90 = 11
    CALL proc_10DF0(addr(local_90), addr(local_94))
    ' float_D9
    CALL RT_2F00_056C()
    var_0176 = ax
    local_96 = 12
    CALL proc_10DF0(addr(local_96), addr(local_9A))
    ' float_D9
    CALL RT_2F00_056C()
    var_0178 = ax
    local_9C = 13
    CALL proc_10DF0(addr(local_9C), addr(local_A0))
    ' float_D9
    CALL RT_2F00_056C()
    var_017A = ax
    local_A2 = 14
    CALL proc_10DF0(addr(local_A2), addr(local_A6))
    ' float_D9
    CALL RT_2F00_056C()
    var_017C = ax
    local_A8 = 15
    CALL proc_10DF0(addr(local_A8), addr(local_AC))
    ' float_D9
    CALL RT_2F00_056C()
    var_017E = ax
    local_AE = 15
    CALL proc_10DF0(addr(local_AE), addr(local_B2))
    ' float_D9
    CALL RT_2F00_056C()
    var_0180 = ax
    local_B4 = 16
    CALL proc_10DF0(addr(local_B4), addr(local_B8))
    ' float_D9
    CALL RT_2F00_056C()
    var_0180 = ax
    local_BA = 17
    CALL proc_10DF0(addr(local_BA), addr(local_BE))
    ' float_D9
    CALL RT_2F00_056C()
    var_0182 = ax
    local_C0 = 18
    CALL proc_10DF0(addr(local_C0), addr(local_C4))
    ' float_D9
    CALL RT_2F00_056C()
    var_0184 = ax
    local_C6 = 19
    CALL proc_10DF0(addr(local_C6), addr(local_CA))
    ' float_D9
    CALL RT_2F00_056C()
    var_0186 = ax
    local_CC = 20
    CALL proc_10DF0(addr(local_CC), addr(local_D0))
    ' float_D9
    CALL RT_2F00_056C()
    var_0188 = ax
    local_D2 = 21
    CALL proc_10DF0(addr(local_D2), addr(local_D6))
    ' float_D9
    CALL RT_2F00_056C()
    var_018A = ax
    local_D8 = 24
    CALL proc_10DF0(addr(local_D8), addr(local_DC))
    ' float_D9
    CALL RT_2F00_056C()
    var_0190 = ax
    local_DE = 26
    CALL proc_10DF0(addr(local_DE), addr(local_E2))
    ' float_D9
    CALL RT_2F00_056C()
    var_0194 = ax
    local_E4 = 27
    CALL proc_10DF0(addr(local_E4), addr(local_E8))
    ' float_D9
    CALL RT_2F00_056C()
    var_0198 = ax
    local_EA = 29
    CALL proc_10DF0(addr(local_EA), addr(local_EE))
    ' float_D9
    CALL RT_2F00_056C()
    var_019C = ax
    local_F0 = 30
    CALL proc_10DF0(addr(local_F0), addr(local_F4))
    ' float_D9
    CALL RT_2F00_056C()
    var_01A0 = ax
    local_F6 = 31
    CALL proc_10DF0(addr(local_F6), addr(local_FA))
    ' float_D9
    CALL RT_2F00_056C()
    var_01A2 = ax
    local_FC = 32
    CALL proc_10DF0(addr(local_FC), addr(local_100))
    ' float_D9
    CALL RT_2F00_056C()
    var_01A4 = ax
    var_019E = 0
    IF var_0198 == 1 THEN GOTO label_0F3F5
    GOTO label_0F519
  label_0F3F5:
    ax = var_0AFC
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    var_01A6 = ax
    ax = 2
    GOTO label_0F49D
  label_0F41C:
    ax = var_0AFC
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_05DF()
    ax = 3
    ' imul word [bp-0x48]
    ax = ax - 3
    ax = -ax
    CALL RT_2F00_0558()
    ' float_DE
    bx = addr(local_1C)
    CALL array_element(local_48, 1)
    ' float_hw
    ' float_D9
    bx = addr(local_1C)
    CALL array_element(local_48, 1)
    ' float_hw
    CALL RT_2F00_05B3()
    ' jc 0xf47c
    GOTO label_0F499
  label_0F47C:
    ' float_D9
    bx = addr(local_1C)
    CALL array_element(local_48, 1)
    ' float_hw
    GOTO label_0F4A9
  label_0F499:
    ax = local_48
    ax = ax + 1
  label_0F49D:
    local_48 = ax
    IF local_48 > 5 THEN GOTO label_0F4A9
    GOTO label_0F41C
  label_0F4A9:
    bx = addr(local_1C)
    CALL array_element(2, 1)
    ' float_hw
    CALL RT_2F00_056C()
    var_01A8 = ax
    bx = addr(local_1C)
    CALL array_element(3, 1)
    ' float_hw
    CALL RT_2F00_056C()
    var_01AA = ax
    bx = addr(local_1C)
    CALL array_element(4, 1)
    ' float_hw
    CALL RT_2F00_056C()
    var_01AC = ax
    bx = addr(local_1C)
    CALL array_element(5, 1)
    ' float_hw
    CALL RT_2F00_056C()
    var_01AE = ax
  label_0F519:
    ax = var_0168
    ' or ax,[0x166]
    ' or ax,[0x17c]
    ' or ax,[0x16c]
    ' or ax,[0x170]
    ' or ax,[0x176]
    ' or ax,[0x17a]
    ' or ax,[0x188]
    ' or ax,[0x1a4]
    ' or ax,[0x1a2]
    ' or ax,[0x1a0]
    ' and ax,ax
    IF local_48 <> 5 THEN GOTO label_0F54B
    GOTO label_0F554
  label_0F54B:
    var_01B6 = 1
    GOTO label_0F55A
  label_0F554:
    var_01B6 = 0
  label_0F55A:
    CALL erase_array(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_0F62F
END SUB

SUB charactr_0F56E  ' image &HF56E, locals 0
  ' strings: CHARACTR
    cx = 0
    CALL frame_enter()
    si = arg_6
    GET #7, long([si]), buffer(&HA90) LEN = 87
    ax = &HAE6
    ax = 79
    CALL RT_2732_6404(DS, &HAE6, 1, DS, 79, 1)
    ax = var_0ADE
    var_0056 = ax
    ax = var_0AE2
    var_0066 = ax
    ax = var_0AE0
    var_0050 = ax
    ax = var_0AE4
    var_008A = ax
    ax = 0
    IF var_0064 <> 0 THEN GOTO label_0F5CC
    ax = ax - 1
  label_0F5CC:
    cx = 0
    IF var_0066 <> 0 THEN GOTO label_0F5D7
    cx = cx - 1
  label_0F5D7:
    ' or cx,ax
    ' and cx,cx
    IF var_0066 <> 0 THEN GOTO label_0F5E0
    GOTO label_0F5EC
  label_0F5E0:
    var_0066 = 0
    var_008A = 0
  label_0F5EC:
    si = arg_6
    ax = [si]
    var_0096 = ax
    ax = &HA7A
    CALL RT_2732_63DF(DS, &HA7A, 1)
    CALL RT_2732_6130(1, &H55C0)
    IF var_0066 == 0 THEN GOTO label_0F611
    GOTO label_0F627
  label_0F611:
    ax = "CHARACTR"
    PUSH DS
    PUSH "CHARACTR"
    ' xor ax,ax
    ax = &HAD6
    CALL RT_2732_6404("CHARACTR", DS, &HAD6, 8)
  label_0F627:
    PROC_EXIT
    RETURN
    GOTO label_0F9DD
END SUB

SUB setup_0F632  ' image &HF632, locals 124
  ' strings: SETUP | SB SYSTEM SETUP | Enter your type of system | (S) Single-user (for one computer and no password protection) | (M) Multi-user (for networks or single systems needing password protection) | (Q or ESC) Leave SB
    cx = 124
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 3, 4, &H8001, addr(local_1C))
    var_0056 = 1
    local_20 = "SETUP"
    CALL sb_dat_21E13(addr(local_20))
    CALL free_string(addr(local_20))
    CALL hit_any_key_to_continue_2434A()
    local_22 = 1
    local_24 = 25
    CALL proc_21194(addr(local_22), addr(local_24))
    local_26 = 15
    local_28 = 0
    CALL color_25283(addr(local_26), addr(local_28))
    local_2A = 1
    local_2C = 30
    local_30 = "SB SYSTEM SETUP"
    local_32 = 0
    CALL locate_print_21DEA(addr(local_2A), addr(local_2C), addr(local_30), addr(local_32))
    CALL free_string(addr(local_30))
    local_34 = 4
    local_36 = 1
    local_3A = "Enter your type of system"
    local_3C = 0
    CALL locate_print_21DEA(addr(local_34), addr(local_36), addr(local_3A), addr(local_3C))
    CALL free_string(addr(local_3A))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(S) Single-user (for one computer and no password protection)"
    CALL near_09D83()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(M) Multi-user (for networks or single systems needing password protection)"
    CALL near_09D83()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(Q or ESC) Leave SB"
    CALL near_09D83()
    local_3E = 1
  label_0F75C:
    local_40 = 3
    local_42 = 1
    local_44 = 6
    local_46 = 6
    local_48 = 2
    local_4A = 0
    local_4C = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_40), addr(local_42), addr(local_44), addr(local_46), addr(local_48), addr(local_4A), addr(local_3E), addr(local_4C))
    local_50 = ax
    local_54 = addr(local_50)
    ax = addr(local_54)
    PUSH DS
    PUSH addr(local_54)
    ' xor ax,ax
    ax = &HA7A
    CALL RT_2732_6404(addr(local_54), DS, &HA7A, 1)
    local_58 = addr(local_54)
    CALL RT_2732_6130(addr(local_58), &H55C0)
    IF ? == ? THEN GOTO label_0F7EA
    GOTO label_0F8D5
  label_0F7EA:
    local_5A = 15
    local_5C = 0
    CALL color_25283(addr(local_5A), addr(local_5C))
    local_5E = 11
    local_60 = 1
    local_64 = "You have elected to install SB in the single-user mode."
    local_66 = 0
    CALL locate_print_21DEA(addr(local_5E), addr(local_60), addr(local_64), addr(local_66))
    CALL free_string(addr(local_64))
    local_68 = 12
    local_6A = 1
    local_6E = "Is this what you intended to do?"
    local_70 = 0
    CALL locate_print_21DEA(addr(local_68), addr(local_6A), addr(local_6E), addr(local_70))
    CALL free_string(addr(local_6E))
    local_72 = 12
    local_74 = 35
    local_76 = 1
    CALL y_yes_26031(addr(local_72), addr(local_74), addr(local_76))
    local_7A = ax
    local_54 = addr(local_7A)
    CALL RT_2732_6130(addr(local_54), &H5C6A)
    IF ? <> ? THEN GOTO label_0F8B0
    GOTO label_0F8B5
  label_0F8B0:
    CALL wood_software_development_0D2B8()
  label_0F8B5:
    CALL RT_2732_02EF(10, long(1), buffer(&HA7A), 21)
    GOTO label_0F9A8
    GOTO label_0F97C
  label_0F8D5:
    CALL RT_2732_6130(addr(local_58), &H51D0)
    IF ? <> ? THEN GOTO label_0F8E7
    GOTO label_0F904
  label_0F8E7:
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_58))
    IF ? == ? THEN GOTO label_0F904
    GOTO label_0F90C
  label_0F904:
    CALL wood_software_development_0D2B8()
    GOTO label_0F97C
  label_0F90C:
    CALL RT_2732_6130(addr(local_58), &H51E8)
    IF ? == ? THEN GOTO label_0F91E
    GOTO label_0F924
  label_0F91E:
    GOTO label_0F980
    GOTO label_0F97C
  label_0F924:
    local_7E = "B, M, S, Q, or ESC only, please"
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    local_82 = ax
    CALL proc_2311E(addr(local_7E), addr(local_82))
    ax = addr(local_82)
    PUSH DS
    PUSH addr(local_82)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_82), DS, 79, 1)
    CALL free_string(addr(local_7E))
    CALL free_string(addr(local_82))
  label_0F97C:
    GOTO label_0F75C
  label_0F980:
    local_86 = "MULTIUSERINFO"
    CALL sb_dat_21E13(addr(local_86))
    CALL free_string(addr(local_86))
    CALL hit_any_key_to_continue_2434A()
    CALL maximum_users_allowed_186AA()
  label_0F9A8:
    CALL free_string(addr(local_7A))
    CALL free_string(addr(local_58))
    CALL free_string(addr(local_50))
    CALL free_string(addr(local_54))
    CALL erase_array(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_008A3
END SUB

SUB character_attributes_0F9E0  ' image &HF9E0, locals 536
  ' strings: CHARACTER ATTRIBUTES | Name  -  | Level      -  | Hitpoints    -  | Race  -  | Experience - 
    cx = 536
    CALL frame_enter()
    CALL mage_0C4A1()
    local_C = 1
    local_E = 25
    CALL proc_21194(addr(local_C), addr(local_E))
    local_10 = 15
    local_12 = 0
    CALL color_25283(addr(local_10), addr(local_12))
    local_14 = 1
    local_16 = 30
    local_1A = "CHARACTER ATTRIBUTES"
    local_1C = 0
    CALL locate_print_21DEA(addr(local_14), addr(local_16), addr(local_1A), addr(local_1C))
    CALL free_string(addr(local_1A))
    local_1E = 10
    local_20 = 0
    CALL color_25283(addr(local_1E), addr(local_20))
    local_22 = 3
    local_24 = 1
    ax = 440
    CALL RT_2732_63DF(DS, 440, 20)
    ax = "Name  - " + ax
    local_28 = ax
    local_2A = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_24), addr(local_28), addr(local_2A))
    CALL free_string(addr(local_28))
    local_2C = 3
    local_2E = 30
    local_30 = 3
    CALL proc_25D42(addr(local_30), 480)
    local_34 = ax
    ax = "Level      - " + addr(local_34)
    local_38 = ax
    local_3A = 0
    CALL locate_print_21DEA(addr(local_2C), addr(local_2E), addr(local_38), addr(local_3A))
    CALL free_string(addr(local_38))
    local_3C = 3
    local_3E = 57
    local_40 = 3
    CALL proc_25D42(addr(local_40), 482)
    local_44 = ax
    local_46 = 3
    CALL proc_25D42(addr(local_46), 484)
    local_4A = ax
    ax = "Hitpoints    - " + addr(local_44)
    ax = ax + &H4AF4
    ax = ax + addr(local_4A)
    local_4E = ax
    local_50 = 0
    CALL locate_print_21DEA(addr(local_3C), addr(local_3E), addr(local_4E), addr(local_50))
    CALL free_string(addr(local_4E))
    local_52 = 4
    local_54 = 1
    ax = 475
    CALL RT_2732_63DF(DS, 475, 5)
    ax = "Race  - " + ax
    local_58 = ax
    local_5A = 0
    CALL locate_print_21DEA(addr(local_52), addr(local_54), addr(local_58), addr(local_5A))
    CALL free_string(addr(local_58))
    local_5C = 4
    local_5E = 30
    local_60 = 9
    CALL proc_25F90(addr(local_60), 540)
    local_64 = ax
    ax = "Experience - " + addr(local_64)
    local_68 = ax
    local_6A = 0
    CALL locate_print_21DEA(addr(local_5C), addr(local_5E), addr(local_68), addr(local_6A))
    CALL free_string(addr(local_68))
    local_6C = 4
    local_6E = 57
    local_70 = 3
    CALL proc_25D42(addr(local_70), 524)
    local_74 = ax
    ax = "Wishes       - " + addr(local_74)
    local_78 = ax
    local_7A = 0
    CALL locate_print_21DEA(addr(local_6C), addr(local_6E), addr(local_78), addr(local_7A))
    CALL free_string(addr(local_78))
    local_7C = 5
    local_7E = 1
    ax = 468
    CALL RT_2732_63DF(DS, 468, 7)
    ax = "Class - " + ax
    local_82 = ax
    local_84 = 0
    CALL locate_print_21DEA(addr(local_7C), addr(local_7E), addr(local_82), addr(local_84))
    CALL free_string(addr(local_82))
    local_86 = 5
    local_88 = 30
    local_8A = 9
    CALL proc_25F90(addr(local_8A), 544)
    local_8E = ax
    ax = "Gold       - " + addr(local_8E)
    local_92 = ax
    local_94 = 0
    CALL locate_print_21DEA(addr(local_86), addr(local_88), addr(local_92), addr(local_94))
    CALL free_string(addr(local_92))
    local_96 = 5
    local_98 = 57
    local_9A = 3
    CALL proc_25D42(addr(local_9A), 522)
    local_9E = ax
    ax = "Sick level   - " + addr(local_9E)
    local_A2 = ax
    local_A4 = 0
    CALL locate_print_21DEA(addr(local_96), addr(local_98), addr(local_A2), addr(local_A4))
    CALL free_string(addr(local_A2))
    local_A6 = 7
    local_A8 = 1
    local_AA = 2
    CALL proc_25D42(addr(local_AA), 486)
    local_AE = ax
    ax = "Strength  - " + addr(local_AE)
    local_B2 = ax
    local_B4 = 0
    CALL locate_print_21DEA(addr(local_A6), addr(local_A8), addr(local_B2), addr(local_B4))
    CALL free_string(addr(local_B2))
    local_B6 = 7
    local_B8 = 30
    local_BA = 2
    CALL proc_25D42(addr(local_BA), 488)
    local_BE = ax
    ax = "Intelligence - " + addr(local_BE)
    local_C2 = ax
    local_C4 = 0
    CALL locate_print_21DEA(addr(local_B6), addr(local_B8), addr(local_C2), addr(local_C4))
    CALL free_string(addr(local_C2))
    local_C6 = 7
    local_C8 = 57
    local_CA = 2
    CALL proc_25D42(addr(local_CA), 490)
    local_CE = ax
    ax = "Constitution - " + addr(local_CE)
    local_D2 = ax
    local_D4 = 0
    CALL locate_print_21DEA(addr(local_C6), addr(local_C8), addr(local_D2), addr(local_D4))
    CALL free_string(addr(local_D2))
    local_D6 = 8
    local_D8 = 1
    local_DA = 2
    CALL proc_25D42(addr(local_DA), 492)
    local_DE = ax
    ax = "Dexterity - " + addr(local_DE)
    local_E2 = ax
    local_E4 = 0
    CALL locate_print_21DEA(addr(local_D6), addr(local_D8), addr(local_E2), addr(local_E4))
    CALL free_string(addr(local_E2))
    local_E6 = 8
    local_E8 = 30
    local_EA = 2
    CALL proc_25D42(addr(local_EA), 494)
    local_EE = ax
    ax = "Charisma     - " + addr(local_EE)
    local_F2 = ax
    local_F4 = 0
    CALL locate_print_21DEA(addr(local_E6), addr(local_E8), addr(local_F2), addr(local_F4))
    CALL free_string(addr(local_F2))
    local_F6 = 8
    local_F8 = 57
    local_FA = 2
    CALL proc_25D42(addr(local_FA), 496)
    local_FE = ax
    ax = "Luck         - " + addr(local_FE)
    local_102 = ax
    local_104 = 0
    CALL locate_print_21DEA(addr(local_F6), addr(local_F8), addr(local_102), addr(local_104))
    CALL free_string(addr(local_102))
    local_106 = 15
    local_108 = 0
    CALL color_25283(addr(local_106), addr(local_108))
    local_10A = 10
    local_10C = 30
    local_110 = "EXTENDED ATTRIBUTES"
    local_112 = 0
    CALL locate_print_21DEA(addr(local_10A), addr(local_10C), addr(local_110), addr(local_112))
    CALL free_string(addr(local_110))
    local_114 = 14
    local_116 = 0
    CALL color_25283(addr(local_114), addr(local_116))
    local_118 = 12
    local_11A = 1
    local_11C = 3
    CALL proc_25D42(addr(local_11C), 154)
    local_120 = ax
    ax = "Hitting ability  - " + addr(local_120)
    local_124 = ax
    local_126 = 0
    CALL locate_print_21DEA(addr(local_118), addr(local_11A), addr(local_124), addr(local_126))
    CALL free_string(addr(local_124))
    local_128 = 12
    local_12A = 26
    local_12C = 3
    CALL proc_25D42(addr(local_12C), 162)
    local_130 = ax
    ax = "Magical ability        - " + addr(local_130)
    local_134 = ax
    local_136 = 0
    CALL locate_print_21DEA(addr(local_128), addr(local_12A), addr(local_134), addr(local_136))
    CALL free_string(addr(local_134))
    local_138 = 12
    local_13A = 57
    local_13C = 3
    CALL proc_25D42(addr(local_13C), 174)
    local_140 = ax
    ax = "Ability to hide   - " + addr(local_140)
    local_144 = ax
    local_146 = 0
    CALL locate_print_21DEA(addr(local_138), addr(local_13A), addr(local_144), addr(local_146))
    CALL free_string(addr(local_144))
    local_148 = 13
    local_14A = 1
    local_14C = 3
    CALL proc_25D42(addr(local_14C), 156)
    local_150 = ax
    ax = "Ability to damage- " + addr(local_150)
    local_154 = ax
    local_156 = 0
    CALL locate_print_21DEA(addr(local_148), addr(local_14A), addr(local_154), addr(local_156))
    CALL free_string(addr(local_154))
    local_158 = 13
    local_15A = 26
    local_15C = 3
    CALL proc_25D42(addr(local_15C), 164)
    local_160 = ax
    ax = "Magical resistance     - " + addr(local_160)
    local_164 = ax
    local_166 = 0
    CALL locate_print_21DEA(addr(local_158), addr(local_15A), addr(local_164), addr(local_166))
    CALL free_string(addr(local_164))
    local_168 = 13
    local_16A = 57
    local_16C = 3
    CALL proc_25D42(addr(local_16C), 170)
    local_170 = ax
    ax = "Alertness         - " + addr(local_170)
    local_174 = ax
    local_176 = 0
    CALL locate_print_21DEA(addr(local_168), addr(local_16A), addr(local_174), addr(local_176))
    CALL free_string(addr(local_174))
    local_178 = 14
    local_17A = 1
    local_17C = 3
    CALL proc_25D42(addr(local_17C), 160)
    local_180 = ax
    ax = "Evading ability  - " + addr(local_180)
    local_184 = ax
    local_186 = 0
    CALL locate_print_21DEA(addr(local_178), addr(local_17A), addr(local_184), addr(local_186))
    CALL free_string(addr(local_184))
    local_188 = 14
    local_18A = 26
    local_18C = 3
    CALL proc_25D42(addr(local_18C), 166)
    local_190 = ax
    ax = "Magical tool aptitude  - " + addr(local_190)
    local_194 = ax
    local_196 = 0
    CALL locate_print_21DEA(addr(local_188), addr(local_18A), addr(local_194), addr(local_196))
    CALL free_string(addr(local_194))
    local_198 = 14
    local_19A = 57
    local_19C = 3
    CALL proc_25D42(addr(local_19C), 172)
    local_1A0 = ax
    ax = "Trap avoidance    - " + addr(local_1A0)
    local_1A4 = ax
    local_1A6 = 0
    CALL locate_print_21DEA(addr(local_198), addr(local_19A), addr(local_1A4), addr(local_1A6))
    CALL free_string(addr(local_1A4))
    local_1A8 = 15
    local_1AA = 1
    local_1AC = 3
    CALL proc_25D42(addr(local_1AC), 158)
    local_1B0 = ax
    ax = "Fortitude        - " + addr(local_1B0)
    local_1B4 = ax
    local_1B6 = 0
    CALL locate_print_21DEA(addr(local_1A8), addr(local_1AA), addr(local_1B4), addr(local_1B6))
    CALL free_string(addr(local_1B4))
    local_1B8 = 15
    local_1BA = 26
    local_1BC = 3
    CALL proc_25D42(addr(local_1BC), 168)
    local_1C0 = ax
    ax = "Ability to charm       - " + addr(local_1C0)
    local_1C4 = ax
    local_1C6 = 0
    CALL locate_print_21DEA(addr(local_1B8), addr(local_1BA), addr(local_1C4), addr(local_1C6))
    CALL free_string(addr(local_1C4))
    IF var_01F4 == 0 THEN GOTO label_004D6
    GOTO label_00518
    local_1C8 = 15
    local_1CA = 57
    local_1CE = "Currently in town"
    local_1D0 = 0
    CALL locate_print_21DEA(addr(local_1C8), addr(local_1CA), addr(local_1CE), addr(local_1D0))
    CALL free_string(addr(local_1CE))
    GOTO label_0057D
    local_1D2 = 15
    local_1D4 = 57
    local_1D6 = 0
    CALL proc_25D42(addr(local_1D6), 500)
    local_1DA = ax
    ax = "Adventuring on level " + addr(local_1DA)
    local_1DE = ax
    local_1E0 = 0
    CALL locate_print_21DEA(addr(local_1D2), addr(local_1D4), addr(local_1DE), addr(local_1E0))
    CALL free_string(addr(local_1DE))
    IF var_00A2 > 0 THEN GOTO label_00587
    GOTO label_006F8
    local_1E2 = 15
    local_1E4 = 0
    CALL color_25283(addr(local_1E2), addr(local_1E4))
    local_1E6 = 17
    local_1E8 = 22
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    ax = "SPELLS AVAILABLE (CURRENT / MAXIMUM)" + ax
    local_1EC = ax
    local_1EE = 0
    CALL locate_print_21DEA(addr(local_1E6), addr(local_1E8), addr(local_1EC), addr(local_1EE))
    CALL free_string(addr(local_1EC))
    local_1F0 = 11
    local_1F2 = 0
    CALL color_25283(addr(local_1F0), addr(local_1F2))
    ax = 1
    GOTO label_006EA
    si = local_1F4
    si = si * 2
    IF var_1578[si] == 0 THEN GOTO label_00628
    GOTO label_0062B
    GOTO label_006F8
    local_1F6 = 1
    CALL proc_25D42(addr(local_1F6), addr(local_1F4))
    local_1FA = ax
    local_1FC = 2
    ax = local_1F4
    ax = ax * 2
    ax = ax + &H1584
    CALL proc_25D42(addr(local_1FC), ax)
    local_200 = ax
    local_202 = 0
    ax = local_1F4
    ax = ax * 2
    ax = ax + &H1578
    CALL proc_25D42(addr(local_202), ax)
    local_206 = ax
    ax = "Level " + addr(local_1FA)
    ax = ax + " spells - "
    ax = ax + addr(local_200)
    ax = ax + &H4AF4
    ax = ax + addr(local_206)
    local_20A = ax
    local_20C = 1
    CALL print_more_21DB9(addr(local_20A), addr(local_20C))
    CALL free_string(addr(local_20A))
    ax = local_1F4
    ax = ax + 1
    local_1F4 = ax
    IF local_1F4 > 5 THEN GOTO label_006F8
    GOTO label_00618
    local_20E = 7
    local_210 = 0
    CALL color_25283(addr(local_20E), addr(local_210))
    CALL hit_any_key_to_continue_2434A()
    IF var_012F > 0 THEN GOTO label_00722
    GOTO label_00774
    local_212 = 1
    local_214 = 25
    CALL proc_21194(addr(local_212), addr(local_214))
    local_218 = "DISPLAY"
    CALL inventory_management_05F8E(addr(local_21E), addr(local_218))
    local_21C = ax
    CALL free_string(addr(local_218))
    local_222 = addr(local_21C)
    CALL free_string(addr(local_21C))
    CALL free_string(addr(local_206))
    CALL free_string(addr(local_200))
    CALL free_string(addr(local_1FA))
    CALL free_string(addr(local_1DA))
    CALL free_string(addr(local_1C0))
    CALL free_string(addr(local_1B0))
    CALL free_string(addr(local_1A0))
    CALL free_string(addr(local_190))
    CALL free_string(addr(local_180))
    CALL free_string(addr(local_170))
    CALL free_string(addr(local_160))
    CALL free_string(addr(local_150))
    CALL free_string(addr(local_140))
    CALL free_string(addr(local_130))
    CALL free_string(addr(local_120))
    CALL free_string(addr(local_FE))
    CALL free_string(addr(local_EE))
    CALL free_string(addr(local_DE))
    CALL free_string(addr(local_CE))
    CALL free_string(addr(local_BE))
    CALL free_string(addr(local_AE))
    CALL free_string(addr(local_9E))
    CALL free_string(addr(local_8E))
    CALL free_string(addr(local_74))
    CALL free_string(addr(local_64))
    CALL free_string(addr(local_4A))
    CALL free_string(addr(local_44))
    CALL free_string(addr(local_34))
    CALL free_string(addr(local_222))
    PROC_EXIT
    RETURN
    GOTO label_00DED
END SUB

SUB sing_a_song_108A6  ' image &H108A6, locals 176
  ' strings: SING A SONG | BARD    | You start singing, but it | has no effect. If only you | were a bard! | You start singing a pleasant
    cx = 176
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 5, 4, &H8001, addr(local_1C))
    CALL proc_0AA39()
    local_1E = 2
    local_20 = 54
    local_24 = "SING A SONG"
    local_26 = 0
    CALL locate_print_21DEA(addr(local_1E), addr(local_20), addr(local_24), addr(local_26))
    CALL free_string(addr(local_24))
    ax = 468
    CALL RT_2732_63DF(DS, 468, 7)
    CALL RT_2732_6130(7, "BARD   ")
    IF ? <> ? THEN GOTO label_0091E
    GOTO label_009CD
    local_28 = 4
    local_2A = 42
    local_2E = "You start singing, but it"
    local_30 = 0
    CALL locate_print_21DEA(addr(local_28), addr(local_2A), addr(local_2E), addr(local_30))
    CALL free_string(addr(local_2E))
    local_32 = 5
    local_34 = 42
    local_38 = "has no effect. If only you"
    local_3A = 0
    CALL locate_print_21DEA(addr(local_32), addr(local_34), addr(local_38), addr(local_3A))
    CALL free_string(addr(local_38))
    local_3C = 6
    local_3E = 42
    local_42 = "were a bard!"
    local_44 = 0
    CALL locate_print_21DEA(addr(local_3C), addr(local_3E), addr(local_42), addr(local_44))
    CALL free_string(addr(local_42))
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0AA39()
    GOTO label_00DBE
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_00F6
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    local_46 = ax
    IF local_46 == 0 THEN GOTO label_009FD
    GOTO label_00B0E
    local_48 = 4
    local_4A = 42
    local_4E = "You start singing a pleasant"
    local_50 = 0
    CALL locate_print_21DEA(addr(local_48), addr(local_4A), addr(local_4E), addr(local_50))
    CALL free_string(addr(local_4E))
    local_52 = 5
    local_54 = 42
    local_58 = "song, but it has no effect."
    local_5A = 0
    CALL locate_print_21DEA(addr(local_52), addr(local_54), addr(local_58), addr(local_5A))
    CALL free_string(addr(local_58))
    local_5C = 6
    local_5E = 42
    local_62 = "You will learn songs of"
    local_64 = 0
    CALL locate_print_21DEA(addr(local_5C), addr(local_5E), addr(local_62), addr(local_64))
    CALL free_string(addr(local_62))
    local_66 = 7
    local_68 = 42
    local_6C = "power starting at level 3 or"
    local_6E = 0
    CALL locate_print_21DEA(addr(local_66), addr(local_68), addr(local_6C), addr(local_6E))
    CALL free_string(addr(local_6C))
    local_70 = 8
    local_72 = 42
    local_76 = "when wielding an instrument"
    local_78 = 0
    CALL locate_print_21DEA(addr(local_70), addr(local_72), addr(local_76), addr(local_78))
    CALL free_string(addr(local_76))
    GOTO label_00DBE
    IF local_46 > 5 THEN GOTO label_00B17
    GOTO label_00B1C
    local_46 = 5
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "HYPOCRITA - The song of healing"
    CALL near_09D83()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "BAZERKER  - The song of ferocity"
    CALL near_09D83()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "ASSUAGEO  - The song of soothing"
    CALL near_09D83()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "DISPELLIA - The song of dispelling"
    CALL near_09D83()
    ax = local_46
    ax = ax + 1
    bx = addr(local_1C)
    CALL array_element(ax, 1)
    si = bx
    di = "Do not sing anything"
    CALL near_09D83()
    IF var_0218 == 0 THEN GOTO label_00B9C
    GOTO label_00BD7
    local_7A = 3
    local_7C = 42
    local_80 = "You are currently not singing"
    local_82 = 0
    CALL locate_print_21DEA(addr(local_7A), addr(local_7C), addr(local_80), addr(local_82))
    CALL free_string(addr(local_80))
    GOTO label_00C46
    local_84 = 3
    local_86 = 42
    bx = addr(local_1C)
    CALL array_element(var_0218, 1)
    CALL RT_2732_6266(BX, 1, 9)
    CALL RT_2732_6374(9)
    ax = "You are singing the " + ax
    ax = ax + &H6160
    local_8A = ax
    local_8C = 0
    CALL locate_print_21DEA(addr(local_84), addr(local_86), addr(local_8A), addr(local_8C))
    CALL free_string(addr(local_8A))
    local_8E = 4
    local_90 = 42
    local_94 = "Which song do you wish to sing?"
    local_96 = 0
    CALL locate_print_21DEA(addr(local_8E), addr(local_90), addr(local_94), addr(local_96))
    CALL free_string(addr(local_94))
    ax = local_46
    ax = ax + 1
    local_98 = ax
    local_9A = 1
    local_9C = 42
    local_9E = 5
    local_A0 = 0
    local_A2 = 0
    local_A4 = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_98), addr(local_9A), addr(local_9C), addr(local_9E), addr(local_A0), addr(local_A2), addr(local_AA), addr(local_A4))
    local_A8 = ax
    local_AE = addr(local_A8)
    CALL proc_0AA39()
    CALL RT_2732_6130(addr(local_AE), &H51D0)
    ax = 0
    IF var_0218 == 0 THEN GOTO label_00D0F
    ax = ax - 1
    bx = ax
    ax = 74
    local_B0 = bx
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_AE))
    ax = 0
    IF var_0218 == 0 THEN GOTO label_00D34
    ax = ax - 1
    ' and ax,[bp-0xb0]
    ' and ax,ax
    IF var_0218 <> 0 THEN GOTO label_00D3F
    GOTO label_00DBE
    ax = local_46
    ax = ax + 1
    IF ax == local_AA THEN GOTO label_00D4C
    GOTO label_00D55
    var_0218 = 0
    GOTO label_00D5C
    ax = local_AA
    var_0218 = ax
    CALL mage_0C4A1()
    local_B2 = 2
    local_B4 = 42
    bx = addr(local_1C)
    CALL array_element(local_AA, 1)
    local_B8 = bx
    local_BA = 0
    CALL locate_print_21DEA(addr(local_B2), addr(local_B4), addr(local_B8), addr(local_BA))
    bx = addr(local_1C)
    CALL array_element(local_AA, 1)
    si = bx
    di = addr(local_B8)
    CALL near_09D83()
    CALL free_string(addr(local_B8))
    CALL free_string(addr(local_A8))
    CALL free_string(addr(local_AE))
    CALL erase_array(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_00E6B
END SUB

SUB proc_10DF0  ' image &H10DF0, locals 4
    cx = 4
    CALL frame_enter()
    ' float_D9
    ' float_D9
    si = arg_8
    ax = [si]
    cx = 0
    IF ax <> var_0B02 THEN GOTO label_00E12
    cx = cx - 1
    dx = 0
    IF ax <> var_0B04 THEN GOTO label_00E1C
    dx = dx - 1
    ' or dx,cx
    cx = 0
    IF ax <> var_0B06 THEN GOTO label_00E28
    cx = cx - 1
    ' or cx,dx
    dx = 0
    IF ax <> var_0B08 THEN GOTO label_00E34
    dx = dx - 1
    ' or dx,cx
    cx = 0
    IF ax <> var_0B0A THEN GOTO label_00E40
    cx = cx - 1
    ' or cx,dx
    ' and cx,cx
    IF ax <> var_0B0A THEN GOTO label_00E49
    GOTO label_00E54
    ' float_D9
    ' float_D9
    ' float_D9
    si = arg_6
    ' float_D9
    ax = arg_6
    PROC_EXIT
    RETURN
    GOTO label_01201
END SUB

SUB hallfame_dat_10E6E  ' image &H10E6E, locals 184
  ' strings: HALLLOCK.SBL | HALLFAME.DAT | WRITHALL.SBT
    cx = 184
    CALL frame_enter()
    ax = 79
    CALL RT_2732_655C(CS, 79)
    OPEN "HALLLOCK.SBL" FOR RANDOM AS #13 LEN = &HFFFF
    ax = &HFFFF
    CALL RT_2732_655C(CS, &HFFFF)
    OPEN "HALLFAME.DAT" FOR RANDOM AS #9 LEN = 166
    CALL file_ah4(9)
    CALL RT_2F00_0559()
    ' float_DC
    ' float_D9
    ax = 262
    CALL RT_2732_655C(CS, 262)
    CALL RT_2732_000E("WRITHALL.SBT")
    ax = &HFFFF
    CALL RT_2732_655C(CS, &HFFFF)
    OPEN "WRITHALL.SBT" FOR RANDOM AS #8 LEN = 166
    CALL file_ah4(9)
    CALL RT_2F00_0559()
    ' float_DC
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? > ? THEN GOTO label_00F30
    GOTO label_01132
    ' float_D9
    ' float_D9
    ' float_D9
    PUSH 9
    CALL RT_2F00_057D()
    bx = addr(local_B0)
    PUSH DX
    PUSH 9
    PUSH DS
    CALL get_record(ES, BX, 166)
    ax = 460
    CALL RT_2732_63DF(DS, 460, 8)
    ax = addr(local_9C)
    PUSH 8
    CALL RT_2732_63DF(DS, addr(local_9C), 8)
    CALL RT_2732_6130(8)
    ax = 0
    IF ? <> ? THEN GOTO label_00F88
    ax = ax - 1
    bx = ax
    ax = addr(local_1E)
    local_BA = bx
    CALL RT_2732_63DF(DS, addr(local_1E), 20)
    PUSH 20
    CALL RT_2732_62BC(20)
    CALL RT_2732_6130(20)
    ax = 0
    IF ? <> ? THEN GOTO label_00FB2
    ax = ax - 1
    ' and ax,[bp-0xba]
    ' and ax,ax
    IF ? <> ? THEN GOTO label_00FBD
    GOTO label_01034
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_00FD3
    GOTO label_00FFF
    ' float_D9
    PUSH 8
    CALL RT_2F00_057D()
    CALL RT_2732_02EF(DX, 8, buffer(440), 166)
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    PUSH 9
    CALL RT_2F00_057D()
    bx = addr(local_B0)
    PUSH DX
    PUSH 9
    PUSH DS
    CALL get_record(ES, BX, 166)
    GOTO label_010E5
    CALL RT_2732_7413(var_021E, var_021C, local_4A, local_4C)
    ax = 0
    IF ? <= ? THEN GOTO label_0104D
    ax = ax - 1
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF ? <> ? THEN GOTO label_01066
    ax = ax - 1
    ' and ax,bx
    ' and ax,ax
    IF ? <> ? THEN GOTO label_0106F
    GOTO label_0109E
    ' float_D9
    PUSH 8
    CALL RT_2F00_057D()
    CALL RT_2732_02EF(DX, 8, buffer(440), 166)
    ' float_D9
    ' float_D9
    GOTO label_010E5
    bx = addr(local_B0)
    PUSH 8
    PUSH DS
    CALL RT_2732_02BD(ES, BX, 166)
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    PUSH 9
    CALL RT_2F00_057D()
    bx = addr(local_B0)
    PUSH DX
    PUSH 9
    PUSH DS
    CALL get_record(ES, BX, 166)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF ? > ? THEN GOTO label_010FC
    ax = ax - 1
    ' float_DD
    bx = ax
    local_C0 = bx
    CALL file_ah4(8)
    CALL RT_2F00_0559()
    ' float_DC
    CALL RT_2F00_05B3()
    ax = 0
    IF ? > ? THEN GOTO label_01127
    ax = ax - 1
    ' and ax,[bp-0xc0]
    ' and ax,ax
    IF ? == ? THEN GOTO label_01132
    GOTO label_00F5E
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    ' jnc 0x1149
    ax = ax - 1
    local_C2 = ax
    PUSH var_021E
    PUSH var_021C
    ' xor ax,ax
    ' cwd
    CALL RT_2732_7413(DX, ax)
    ax = 0
    IF ? <= ? THEN GOTO label_01165
    ax = ax - 1
    ' and ax,[bp-0xc2]
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF ? <> ? THEN GOTO label_01182
    ax = ax - 1
    ' and ax,bx
    ' and ax,ax
    IF ? <> ? THEN GOTO label_0118B
    GOTO label_0119F
    CALL RT_2732_02BD(8, buffer(440), 166)
    CLOSE #9
    CALL RT_2732_000E("HALLFAME.DAT")
    CLOSE #8
    CALL RT_2732_0057("WRITHALL.SBT", "HALLFAME.DAT")
    CLOSE #13
    ax = 262
    CALL RT_2732_655C(CS, 262)
    CALL RT_2732_000E("HALLLOCK.SBL")
    ax = &HFFFF
    CALL RT_2732_655C(CS, &HFFFF)
    PROC_EXIT
    RETURN
    CALL RT_2732_4E0A()
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    ' pusha
    [bx+si] = [bx+si] + al
    arg_0 = arg_0 + dh
    [bx+si] = [bx+si] + al
    RETURN
    bh = bh + cl
    [bx+si] = [bx+si] + al
    ah = ah + dl
    [bx+si] = [bx+si] + al
    ah = ah + dl
    [bx+si] = [bx+si] + al
    ch = ch + ah
    [bx+si] = [bx+si] + al
    dh = dh + dh
    [bx+si] = [bx+si] + al
    [bx+di] = [bx+di] + al
    [bx+si] = [bx+si] + ax
    var_0001 = var_0001 + al
    var_0001 = var_0001 + al
    [bp+si] = [bp+si] + cl
    [bx+si] = [bx+si] + ax
    [bx] = [bx] + cl
    [bx+si] = [bx+si] + ax
    [bp+si] = [bp+si] + bl
    [bx+si] = [bx+si] + ax
    [bp+di] = [bp+di] + dh
    [bx+si] = [bx+si] + ax
    [di+0x1] = [di+0x1] + bl
    [bx+si] = [bx+si] + al
    ' decode stopped: operand-size prefix at 0x11436 at 0x11436
END SUB

SUB proc_127B6  ' image &H127B6, locals 4
    cx = 4
    CALL frame_enter()
    si = arg_6
    ax = [si]
    var_01E6 = var_01E6 + ax
    var_01E8 = var_01E8 + ax
    var_01EA = var_01EA + ax
    var_01EC = var_01EC + ax
    var_01EE = var_01EE + ax
    var_01F0 = var_01F0 + ax
    di = &H6220
    si = addr(local_E)
    CALL near_027A3()
    CALL loss_of_str_007A9(addr(local_E))
    CALL free_string(addr(local_E))
    PROC_EXIT
    RETURN
    GOTO label_02B8A
END SUB

SUB stay_12801  ' image &H12801, locals 46
  ' strings: STAY | (M)enu | (Q)uit | (H)elp
    cx = 46
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 12, 4, &H8001, addr(local_1C))
    CALL proc_0AA39()
    CALL RT_2732_616F(92)
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(1, 1)
    di = dx
    si = bx
    CALL near_027A3()
    CALL RT_2732_616F(24)
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(2, 1)
    di = dx
    si = bx
    CALL near_027A3()
    CALL RT_2732_616F(47)
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(3, 1)
    di = dx
    si = bx
    CALL near_027A3()
    CALL RT_2732_616F(27)
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(4, 1)
    di = dx
    si = bx
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "STAY"
    CALL near_027A3()
    CALL RT_2732_616F(26)
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(6, 1)
    di = dx
    si = bx
    CALL near_027A3()
    CALL RT_2732_616F(47)
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(7, 1)
    di = dx
    si = bx
    CALL near_027A3()
    CALL RT_2732_616F(25)
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(8, 1)
    di = dx
    si = bx
    CALL near_027A3()
    CALL RT_2732_616F(92)
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(9, 1)
    di = dx
    si = bx
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(10, 1)
    si = bx
    di = "(M)enu"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(11, 1)
    si = bx
    di = "(Q)uit"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(12, 1)
    si = bx
    di = "(H)elp"
    CALL near_027A3()
    var_0088 = 1
    local_1E = 12
    local_20 = 3
    local_22 = 42
    local_24 = 2
    local_26 = &HFFFF
    local_28 = 0
    local_2A = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_1E), addr(local_20), addr(local_22), addr(local_24), addr(local_26), addr(local_28), arg_6, addr(local_2A))
    di = ax
    si = addr(local_2E)
    CALL near_027A3()
    di = addr(local_2E)
    si = addr(local_32)
    CALL near_027A3()
    var_0088 = 0
    ax = 0
    IF var_006C <> 0 THEN GOTO label_02A16
    ax = ax - 1
    cx = 0
    IF var_006E <> 0 THEN GOTO label_02A21
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_006E <> 0 THEN GOTO label_02A2A
    GOTO label_02A31
    si = arg_8
    [si] = 0
    ax = 72
    CALL RT_2732_63DF(DS, 72, 1)
    CALL RT_2732_6130(1, addr(local_32))
    IF var_006E == 0 THEN GOTO label_02A4E
    GOTO label_02B50
    si = arg_6
    ax = [si]
    local_34 = ax
    IF local_34 == 1 THEN GOTO label_02A5F
    GOTO label_02A6B
    di = &H624A
    si = addr(local_32)
    CALL near_027A3()
    GOTO label_02B50
    IF local_34 == 2 THEN GOTO label_02A74
    GOTO label_02A80
    di = &H6250
    si = addr(local_32)
    CALL near_027A3()
    GOTO label_02B50
    IF local_34 == 3 THEN GOTO label_02A89
    GOTO label_02A95
    di = &H6256
    si = addr(local_32)
    CALL near_027A3()
    GOTO label_02B50
    IF local_34 == 4 THEN GOTO label_02A9E
    GOTO label_02AAA
    di = &H625C
    si = addr(local_32)
    CALL near_027A3()
    GOTO label_02B50
    IF local_34 == 5 THEN GOTO label_02AB3
    GOTO label_02ABF
    di = &H6262
    si = addr(local_32)
    CALL near_027A3()
    GOTO label_02B50
    IF local_34 == 6 THEN GOTO label_02AC8
    GOTO label_02AD4
    di = &H6268
    si = addr(local_32)
    CALL near_027A3()
    GOTO label_02B50
    IF local_34 == 7 THEN GOTO label_02ADD
    GOTO label_02AE9
    di = &H626E
    si = addr(local_32)
    CALL near_027A3()
    GOTO label_02B50
    IF local_34 == 8 THEN GOTO label_02AF2
    GOTO label_02AFE
    di = &H6274
    si = addr(local_32)
    CALL near_027A3()
    GOTO label_02B50
    IF local_34 == 9 THEN GOTO label_02B07
    GOTO label_02B13
    di = &H627A
    si = addr(local_32)
    CALL near_027A3()
    GOTO label_02B50
    IF local_34 == 10 THEN GOTO label_02B1C
    GOTO label_02B26
    si = arg_8
    [si] = 0
    GOTO label_02B50
    IF local_34 == 11 THEN GOTO label_02B2F
    GOTO label_02B3B
    di = &H6280
    si = addr(local_32)
    CALL near_027A3()
    GOTO label_02B50
    IF local_34 == 12 THEN GOTO label_02B44
    GOTO label_02B50
    di = &H6286
    si = addr(local_32)
    CALL near_027A3()
    GOTO label_02B50
    CALL proc_0AA39()
    di = addr(local_32)
    si = addr(local_38)
    CALL near_027A3()
    CALL free_string(addr(local_2E))
    CALL free_string(addr(local_32))
    CALL erase_array(addr(local_1C))
    CALL RT_2732_64F5(addr(local_38))
    PROC_EXIT
    RETURN
    GOTO label_03889
END SUB

SUB fields_like_they_used_to_12B8D  ' image &H12B8D, locals 132
  ' strings: That was certainly a waste of magic |  The monster breaks through your force | field!  (I guess they don't make force | fields like they used to.) | An invisible wall appears between you | and the monster.  After trying to get
    cx = 132
    CALL frame_enter()
    si = arg_E
    ax = [si]
    cx = 10
    ' imul cx
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    ' float_D8
    CALL RT_2F00_056C()
    local_1A = ax
    si = arg_A
    ax = [si]
    local_10 = ax
    IF local_10 <> 20 THEN GOTO label_02BE5
    GOTO label_02C09
    IF local_10 <> 21 THEN GOTO label_02BEE
    GOTO label_02C09
    IF local_10 <> 22 THEN GOTO label_02BF7
    GOTO label_02C09
    IF local_10 <> 23 THEN GOTO label_02C00
    GOTO label_02C09
    IF local_10 == 24 THEN GOTO label_02C09
    GOTO label_03009
    si = arg_8
    IF [si] == 0 THEN GOTO label_02C14
    GOTO label_02C23
    di = "That was certainly a waste of magic"
    si = addr(local_1E)
    CALL near_027A3()
    CALL near_03740()
    GOTO label_03827
    si = arg_A
    ax = [si]
    local_20 = ax
    IF local_20 == 21 THEN GOTO label_02C34
    GOTO label_02C7F
    IF local_1A > 0 THEN GOTO label_02C3D
    GOTO label_02C5B
    di = " The monster breaks through your force"
    si = addr(local_1E)
    CALL near_027A3()
    di = "field!  (I guess they don't make force"
    si = addr(local_24)
    CALL near_027A3()
    di = "fields like they used to.)"
    si = addr(local_28)
    CALL near_027A3()
    GOTO label_02C7C
    di = "An invisible wall appears between you"
    si = addr(local_1E)
    CALL near_027A3()
    di = "and the monster.  After trying to get"
    si = addr(local_24)
    CALL near_027A3()
    di = "through, the monster leaves."
    si = addr(local_28)
    CALL near_027A3()
    var_015C = 1
    GOTO label_03006
    IF local_20 == 24 THEN GOTO label_02C88
    GOTO label_02CB5
    di = "The area becomes devoid of all magic"
    si = addr(local_1E)
    CALL near_027A3()
    di = "that is directed at you (with the"
    si = addr(local_24)
    CALL near_027A3()
    di = "exception of your own, of course) AND"
    si = addr(local_28)
    CALL near_027A3()
    di = "all animation magic! (What a bonus!)"
    si = addr(local_2C)
    CALL near_027A3()
    var_015E = 1
    GOTO label_03006
    IF local_20 == 23 THEN GOTO label_02CBE
    GOTO label_02E17
    ax = 0
    IF var_0AFE >= 1 THEN GOTO label_02CC9
    ax = ax - 1
    cx = 0
    IF var_0B00 <> 1 THEN GOTO label_02CD4
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0B00 <> 1 THEN GOTO label_02CDD
    GOTO label_02D04
    di = "The monster chuckles as it easily"
    si = addr(local_1E)
    CALL near_027A3()
    di = "shakes off your spell.  'Can you"
    si = addr(local_24)
    CALL near_027A3()
    di = "believe this guy' it says to itself."
    si = addr(local_28)
    CALL near_027A3()
    di = "He wants ME for a pet.  Whatta maroon.'"
    si = addr(local_2C)
    CALL near_027A3()
    GOTO label_02E14
    IF var_0AFE < 0 THEN GOTO label_02D0E
    GOTO label_02D2C
    di = "The monster snarls as it shakes off"
    si = addr(local_1E)
    CALL near_027A3()
    di = "your spell.  Maybe you ought to"
    si = addr(local_24)
    CALL near_027A3()
    di = "consider your choice in pets!"
    si = addr(local_28)
    CALL near_027A3()
    GOTO label_02E14
    IF var_0B00 == 1 THEN GOTO label_02D36
    GOTO label_02D66
    di = "Although the good creature is not"
    si = addr(local_1E)
    CALL near_027A3()
    di = "trying to harm you, you try to take"
    si = addr(local_24)
    CALL near_027A3()
    di = "control of its mind.  It is insulted"
    si = addr(local_28)
    CALL near_027A3()
    di = "that you would even think of trying"
    si = addr(local_2C)
    CALL near_027A3()
    di = "to tame it!"
    si = addr(local_30)
    CALL near_027A3()
    GOTO label_02E14
    IF var_0AFC < 21 THEN GOTO label_02D70
    GOTO label_02DEA
    ax = var_0156
    var_0238 = ax
    ax = &HAE8
    ax = 548
    CALL RT_2732_6404(DS, &HAE8, 20, DS, 548, 20)
    ax = var_0B1E
    var_023E = ax
    ax = var_0B00
    var_0240 = ax
    ax = var_0B24
    var_0242 = ax
    ax = var_0B18
    var_0244 = ax
    ax = var_0B1A
    var_0246 = ax
    ax = var_0B1C
    var_0248 = ax
    ax = var_0B12
    IF ax > var_0158 THEN GOTO label_02DBD
    GOTO label_02DC3
    var_023A = ax
    GOTO label_02DC9
    ax = var_0158
    var_023A = ax
    ax = var_0B12
    var_023C = ax
    var_015C = 1
    di = "The creature cuddles up to you.  You"
    si = addr(local_1E)
    CALL near_027A3()
    di = "give it a doggie biscuit."
    si = addr(local_24)
    CALL near_027A3()
    GOTO label_02E14
    var_015C = 1
    di = "The creature stops fighting you, but"
    si = addr(local_1E)
    CALL near_027A3()
    di = "then wanders off.  It is obviously"
    si = addr(local_24)
    CALL near_027A3()
    di = "too used to doing things its own way"
    si = addr(local_28)
    CALL near_027A3()
    di = "to be anyone's pet"
    si = addr(local_2C)
    CALL near_027A3()
    GOTO label_03006
    ax = 0
    IF var_0208 <> 1 THEN GOTO label_02E22
    ax = ax - 1
    cx = 0
    IF var_0AFE < 0 THEN GOTO label_02E2D
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0AFE <> 0 THEN GOTO label_02E36
    GOTO label_02E75
    di = "As you are about to attack, your"
    si = addr(local_1E)
    CALL near_027A3()
    di = "staff starts to glow. You are"
    si = addr(local_24)
    CALL near_027A3()
    di = "appalled that you would even"
    si = addr(local_28)
    CALL near_027A3()
    di = "THINK of attacking such a noble"
    si = addr(local_2C)
    CALL near_027A3()
    di = "creature. (Of course NOW is the"
    si = addr(local_30)
    CALL near_027A3()
    di = "perfect time for a new consience.)"
    si = addr(local_34)
    CALL near_027A3()
    CALL near_03740()
    GOTO label_03827
    GOTO label_02F06
    ax = 0
    IF var_0208 <> 1 THEN GOTO label_02E80
    ax = ax - 1
    cx = var_01E0
    cx = cx * 2
    cx = cx + &HFFF6
    dx = 0
    IF cx <= var_0AFC THEN GOTO label_02E93
    dx = dx - 1
    ' and dx,ax
    ' and dx,dx
    IF cx <> var_0AFC THEN GOTO label_02E9C
    GOTO label_02EDB
    di = "As you are about to attack, your staff"
    si = addr(local_1E)
    CALL near_027A3()
    di = "starts to glow.  OH MY GOD! HOW could"
    si = addr(local_24)
    CALL near_027A3()
    di = "you even THINK of attacking such a"
    si = addr(local_28)
    CALL near_027A3()
    di = "weak pathetic creature. (Hmm. You also"
    si = addr(local_2C)
    CALL near_027A3()
    di = "find it odd that such one-sidedness"
    si = addr(local_30)
    CALL near_027A3()
    di = "never used to bother you at all.)"
    si = addr(local_34)
    CALL near_027A3()
    CALL near_03740()
    GOTO label_03827
    GOTO label_02F06
    IF var_0194 == 1 THEN GOTO label_02EE5
    GOTO label_02F06
    di = "The spell begins to work, but then"
    si = addr(local_1E)
    CALL near_027A3()
    di = "fizzles when it approaches your"
    si = addr(local_24)
    CALL near_027A3()
    di = "opponent!"
    si = addr(local_28)
    CALL near_027A3()
    CALL near_03740()
    GOTO label_03827
    CALL proc_25C7F(arg_C, &HB20, addr(local_38))
    ' float_D9
    CALL RT_2F00_056C()
    local_3A = ax
    ' or ax,ax
    cx = 0
    IF var_0194 <> 1 THEN GOTO label_02F2A
    cx = cx - 1
    ax = 0
    IF local_1A <> 0 THEN GOTO label_02F34
    ax = ax - 1
    ' or ax,cx
    ' and ax,ax
    IF local_1A <> 0 THEN GOTO label_02F3D
    GOTO label_02F4C
    di = "The monster dodges your blast!"
    si = addr(local_1E)
    CALL near_027A3()
    CALL near_03740()
    GOTO label_03827
    si = arg_A
    ax = [si]
    local_3C = ax
    IF local_3C == 22 THEN GOTO label_02F5D
    GOTO label_02F96
    IF local_1A == 0 THEN GOTO label_02F66
    GOTO label_02F7B
    di = "The monster starts to get groggy,"
    si = addr(local_1E)
    CALL near_027A3()
    di = "but then shakes it off!"
    si = addr(local_24)
    CALL near_027A3()
    GOTO label_02F93
    di = "The monster starts dreaming of"
    si = addr(local_1E)
    CALL near_027A3()
    di = "helpless adventurers to eat."
    si = addr(local_24)
    CALL near_027A3()
    ax = local_1A
    var_0160 = ax
    GOTO label_03006
    IF local_3C == 20 THEN GOTO label_02F9F
    GOTO label_03006
    ax = local_1A
    var_0158 = var_0158 - ax
    di = arg_6
    si = addr(local_1E)
    CALL near_027A3()
    local_3E = 0
    CALL proc_25D42(addr(local_3E), addr(local_1A))
    di = ax
    si = addr(local_42)
    CALL near_027A3()
    di = addr(local_42)
    si = "You've damaged it for "
    CALL near_027AB()
    si = ax
    di = " hitpoints"
    CALL near_027AB()
    di = ax
    si = addr(local_24)
    CALL near_027A3()
    IF var_0158 < 1 THEN GOTO label_02FEC
    GOTO label_03003
    var_015A = 1
    di = "You've killed it!!"
    si = addr(local_34)
    CALL near_027A3()
    CALL near_03740()
    CALL hit_any_key_to_continue_2434A()
    GOTO label_03006
    GOTO label_03735
    IF local_10 == 27 THEN GOTO label_03012
    GOTO label_03027
    CALL remove_08227()
    CALL proc_0D0CF()
    CALL name_0AF8B()
    GOTO label_03827
    GOTO label_03735
    IF local_10 == 18 THEN GOTO label_03030
    GOTO label_03092
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jc 0x3045
    GOTO label_03066
    di = arg_6
    si = addr(local_1E)
    CALL near_027A3()
    di = "All your gold is destroyed!"
    si = addr(local_24)
    CALL near_027A3()
    var_0220 = 0
    var_0222 = 0
    GOTO label_0308F
    ax = 200
    ' imul word [0xa6]
    ' cwd
    ax = ax + var_0220
    ' adc dx,[0x222]
    var_0220 = ax
    var_0222 = dx
    di = arg_6
    si = addr(local_1E)
    CALL near_027A3()
    di = "You feel richer for the experience!"
    si = addr(local_24)
    CALL near_027A3()
    GOTO label_03735
    IF local_10 == 25 THEN GOTO label_0309B
    GOTO label_030B5
    di = "You feel an internal wrenching.  You"
    si = addr(local_1E)
    CALL near_027A3()
    di = "appear in strange place."
    si = addr(local_24)
    CALL near_027A3()
    CALL proc_09E62()
    GOTO label_03735
    IF local_10 == 26 THEN GOTO label_030BE
    GOTO label_03126
    di = "You feel sooo much better."
    si = addr(local_1E)
    CALL near_027A3()
    ax = var_01E4
    IF ax > var_01E2 THEN GOTO label_030D3
    GOTO label_0311D
    ax = var_01E2
    CALL RT_2F00_0558()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    si = arg_C
    ax = [si]
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_01E2 = ax
    ax = var_01E4
    IF ax < var_01E2 THEN GOTO label_0311A
    GOTO label_0311D
    var_01E2 = ax
    var_020A = 0
    GOTO label_03735
    IF local_10 == 31 THEN GOTO label_0312F
    GOTO label_031C0
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D9
    si = arg_E
    ax = [si]
    CALL RT_2F00_0558()
    CALL RT_2F00_0619()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_52 = ax
    var_01E2 = var_01E2 - ax
    local_48 = 0
    CALL proc_25D42(addr(local_48), addr(local_52))
    di = ax
    si = addr(local_4C)
    CALL near_027A3()
    di = addr(local_4C)
    si = "You are hurt for "
    CALL near_027AB()
    si = ax
    di = " hitpoints!"
    CALL near_027AB()
    di = ax
    si = addr(local_1E)
    CALL near_027A3()
    di = "CURSED WAND"
    si = addr(local_50)
    CALL near_027A3()
    CALL loss_of_str_007A9(addr(local_50))
    CALL free_string(addr(local_50))
    GOTO label_03735
    IF local_10 == 34 THEN GOTO label_031C9
    GOTO label_031F8
    IF var_00CC == 1 THEN GOTO label_031D3
    GOTO label_031DF
    di = "It doesn't seem to affect you"
    si = addr(local_1E)
    CALL near_027A3()
    GOTO label_031F5
    di = "All of a sudden, you don't feel so"
    si = addr(local_1E)
    CALL near_027A3()
    di = "good"
    si = addr(local_24)
    CALL near_027A3()
    var_020A = var_020A + 1
    GOTO label_03735
    IF local_10 == 33 THEN GOTO label_03201
    GOTO label_0328D
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_012F
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_5A = ax
    local_54 = 1
    CALL proc_00A98(addr(local_5A), addr(local_54), addr(local_58))
    ' float_D9
    ' float_D9
    CALL proc_04D9D(addr(local_5A))
    di = "A flare emits from your wand as"
    si = addr(local_1E)
    CALL near_027A3()
    ax = 68
    ' imul word [bp-0x5a]
    ax = ax + &HBEE
    CALL RT_2732_63DF(DS, ax, 26)
    di = ax
    si = "your "
    CALL near_027AB()
    di = ax
    si = addr(local_24)
    CALL near_027A3()
    di = "is destroyed"
    si = addr(local_28)
    CALL near_027A3()
    GOTO label_03735
    IF local_10 == 52 THEN GOTO label_03296
    GOTO label_032D9
    di = "You have turned invisible!"
    si = addr(local_1E)
    CALL near_027A3()
    IF var_01EE < 12 THEN GOTO label_032A9
    GOTO label_032BE
    di = "All the mirrors in the dungeon"
    si = addr(local_24)
    CALL near_027A3()
    di = "breath a sigh of relief."
    si = addr(local_28)
    CALL near_027A3()
    GOTO label_032D0
    di = "All the fair young admirers will"
    si = addr(local_24)
    CALL near_027A3()
    di = "certainly be disappointed."
    si = addr(local_28)
    CALL near_027A3()
    ax = local_1A
    var_020E = ax
    GOTO label_03735
    IF local_10 == 19 THEN GOTO label_032E2
    GOTO label_0330D
    di = "With a bright flash and a puff of"
    si = addr(local_1E)
    CALL near_027A3()
    di = "smoke, a Djinni appears."
    si = addr(local_24)
    CALL near_027A3()
    di = "'I am the mighty FLEMBAD! You are"
    si = addr(local_28)
    CALL near_027A3()
    di = "granted a wish.' He then disappears."
    si = addr(local_2C)
    CALL near_027A3()
    var_020C = var_020C + 1
    GOTO label_03735
    IF local_10 == 53 THEN GOTO label_03316
    GOTO label_03331
    di = "May no trap befall you (for a"
    si = addr(local_1E)
    CALL near_027A3()
    di = "while, anyway)"
    si = addr(local_24)
    CALL near_027A3()
    var_0212 = 1
    GOTO label_03735
    IF local_10 == 51 THEN GOTO label_0333A
    GOTO label_03355
    di = "You see the air solidify in front"
    si = addr(local_1E)
    CALL near_027A3()
    di = "of you, forming a floating shield"
    si = addr(local_24)
    CALL near_027A3()
    ax = local_1A
    var_0216 = ax
    GOTO label_03735
    IF local_10 == 55 THEN GOTO label_0335E
    GOTO label_03382
    di = "A ferocious wolf appears at your"
    si = addr(local_1E)
    CALL near_027A3()
    di = "side. Upon closer inspection, you"
    si = addr(local_24)
    CALL near_027A3()
    di = "realize that it's only an illusion."
    si = addr(local_28)
    CALL near_027A3()
    var_021A = 1
    GOTO label_03735
    IF local_10 == 54 THEN GOTO label_0338B
    GOTO label_0339B
    di = "You feel yourself speed up!"
    si = addr(local_1E)
    CALL near_027A3()
    var_0210 = var_0210 + 1
    GOTO label_03735
    IF local_10 == 10 THEN GOTO label_033A4
    GOTO label_033E0
    si = arg_E
    ax = [si]
    var_01E6 = var_01E6 + ax
    ' or ax,ax
    IF local_10 > 10 THEN GOTO label_033B4
    GOTO label_033C9
    di = "You feel like you could bend"
    si = addr(local_1E)
    CALL near_027A3()
    di = "steel with your bear hands!"
    si = addr(local_24)
    CALL near_027A3()
    GOTO label_033DD
    si = arg_E
    IF [si] < 0 THEN GOTO label_033D4
    GOTO label_033DD
    di = "You feel so much weaker!"
    si = addr(local_1E)
    CALL near_027A3()
    GOTO label_03735
    IF local_10 == 11 THEN GOTO label_033E9
    GOTO label_0342E
    si = arg_E
    ax = [si]
    var_01E8 = var_01E8 + ax
    ' or ax,ax
    IF local_10 > 11 THEN GOTO label_033F9
    GOTO label_0340E
    di = "Newton? Einstein? Shakespeare?"
    si = addr(local_1E)
    CALL near_027A3()
    di = "They seem so childlike now!"
    si = addr(local_24)
    CALL near_027A3()
    GOTO label_0342B
    si = arg_E
    IF [si] < 0 THEN GOTO label_03419
    GOTO label_0342B
    di = "Newton? Einstein? Shakespeare?"
    si = addr(local_1E)
    CALL near_027A3()
    di = "Who the heck are they?"
    si = addr(local_24)
    CALL near_027A3()
    GOTO label_03735
    IF local_10 == 12 THEN GOTO label_03437
    GOTO label_03473
    si = arg_E
    ax = [si]
    var_01EA = var_01EA + ax
    ' or ax,ax
    IF local_10 > 12 THEN GOTO label_03447
    GOTO label_0345C
    di = "You feel like you could take"
    si = addr(local_1E)
    CALL near_027A3()
    di = "an extra punch or two!"
    si = addr(local_24)
    CALL near_027A3()
    GOTO label_03470
    si = arg_E
    IF [si] < 0 THEN GOTO label_03467
    GOTO label_03470
    di = "Your glass jaw starts spreading!"
    si = addr(local_1E)
    CALL near_027A3()
    GOTO label_03735
    IF local_10 == 13 THEN GOTO label_0347C
    GOTO label_034AF
    si = arg_E
    ax = [si]
    var_01EC = var_01EC + ax
    ' or ax,ax
    IF local_10 > 13 THEN GOTO label_0348C
    GOTO label_03498
    di = "You start to leap like a ballarina!"
    si = addr(local_1E)
    CALL near_027A3()
    GOTO label_034AC
    si = arg_E
    IF [si] < 0 THEN GOTO label_034A3
    GOTO label_034AC
    di = "Have a nice trip!"
    si = addr(local_1E)
    CALL near_027A3()
    GOTO label_03735
    IF local_10 == 14 THEN GOTO label_034B8
    GOTO label_034FD
    si = arg_E
    ax = [si]
    var_01EE = var_01EE + ax
    ' or ax,ax
    IF local_10 > 14 THEN GOTO label_034C8
    GOTO label_034DD
    di = "Sometimes, don't you feel that"
    si = addr(local_1E)
    CALL near_027A3()
    di = "you get better looking each day."
    si = addr(local_24)
    CALL near_027A3()
    GOTO label_034FA
    si = arg_E
    IF [si] < 0 THEN GOTO label_034E8
    GOTO label_034FA
    di = "You feel like you've been beaten"
    si = addr(local_1E)
    CALL near_027A3()
    di = "with an ugly stick."
    si = addr(local_24)
    CALL near_027A3()
    GOTO label_03735
    IF local_10 == 15 THEN GOTO label_03506
    GOTO label_0354B
    si = arg_E
    ax = [si]
    var_01F0 = var_01F0 + ax
    ' or ax,ax
    IF local_10 > 15 THEN GOTO label_03516
    GOTO label_0352B
    di = "One thousand rabits sever their"
    si = addr(local_1E)
    CALL near_027A3()
    di = "feet in your honor!"
    si = addr(local_24)
    CALL near_027A3()
    GOTO label_03548
    si = arg_E
    IF [si] < 0 THEN GOTO label_03536
    GOTO label_03548
    di = "Your four-leave clover just lost"
    si = addr(local_1E)
    CALL near_027A3()
    di = "a leaf!"
    si = addr(local_24)
    CALL near_027A3()
    GOTO label_03735
    IF local_10 == 32 THEN GOTO label_03554
    GOTO label_035AC
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    si = arg_E
    ax = [si]
    CALL RT_2F00_0558()
    ' float_DE
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    var_00B0 = ax
    IF var_00B0 > 0 THEN GOTO label_03594
    GOTO label_035A0
    di = "You doze off for a while"
    si = addr(local_1E)
    CALL near_027A3()
    GOTO label_035A9
    di = "You shake off its affects"
    si = addr(local_1E)
    CALL near_027A3()
    GOTO label_03735
    IF local_10 == 17 THEN GOTO label_035B5
    GOTO label_036DD
    si = arg_E
    IF [si] < 0 THEN GOTO label_035C0
    GOTO label_03642
    IF var_01E0 == 1 THEN GOTO label_035CA
    GOTO label_035DA
    ax = var_021C
    dx = var_021E
    local_E = ax
    local_C = dx
    GOTO label_035F5
    ax = var_021C
    dx = var_021E
    ax = ax - var_010E
    ' sbb dx,[0x110]
    ax = ax + &HFC18
    ' adc dx,0xffffffffffffffff
    local_E = ax
    local_C = dx
    local_60 = 0
    CALL proc_25F90(addr(local_60), addr(local_E))
    di = ax
    si = addr(local_64)
    CALL near_027A3()
    di = addr(local_64)
    si = "You lose "
    CALL near_027AB()
    si = ax
    di = " experience points"
    CALL near_027AB()
    di = ax
    si = addr(local_1E)
    CALL near_027A3()
    CALL RT_2732_7404(long(&HFFFF), local_C, local_E)
    local_E = ax
    local_C = dx
    GOTO label_036C6
    IF var_01E0 < 9 THEN GOTO label_0364C
    GOTO label_036A1
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    ' float_D8
    CALL RT_2F00_057D()
    local_E = ax
    local_C = dx
    local_66 = 0
    CALL proc_25F90(addr(local_66), addr(local_E))
    di = ax
    si = addr(local_6A)
    CALL near_027A3()
    di = addr(local_6A)
    si = "You gain "
    CALL near_027AB()
    si = ax
    di = " experience points"
    CALL near_027AB()
    di = ax
    si = addr(local_1E)
    CALL near_027A3()
    GOTO label_036C6
    local_E = 0
    local_C = 0
    di = "You are too experienced to gain"
    si = addr(local_1E)
    CALL near_027A3()
    di = "from this book. (Time to use the"
    si = addr(local_24)
    CALL near_027A3()
    di = "old fashioned way.)"
    si = addr(local_28)
    CALL near_027A3()
    ax = var_021C
    dx = var_021E
    ax = ax + local_E
    ' adc dx,[bp-0xc]
    var_021C = ax
    var_021E = dx
    GOTO label_03735
    IF local_10 == 16 THEN GOTO label_036E6
    GOTO label_03723
    si = arg_E
    IF [si] > 0 THEN GOTO label_036F1
    GOTO label_03706
    di = "All of your statistics go up!  You"
    si = addr(local_1E)
    CALL near_027A3()
    di = "feel great!"
    si = addr(local_24)
    CALL near_027A3()
    GOTO label_03718
    di = "All of your statistics go down!  You"
    si = addr(local_1E)
    CALL near_027A3()
    di = "feel really lousy!"
    si = addr(local_24)
    CALL near_027A3()
    CALL proc_127B6(arg_E)
    GOTO label_03735
    IF local_10 == 38 THEN GOTO label_0372C
    GOTO label_03735
    var_020C = 0
    GOTO label_03735
    CALL near_03740()
    CALL mage_0C4A1()
    GOTO label_03827
    local_6C = 3
    local_6E = 42
    local_70 = 0
    CALL locate_print_21DEA(addr(local_6C), addr(local_6E), addr(local_1E), addr(local_70))
    local_72 = 4
    local_74 = 42
    local_76 = 0
    CALL locate_print_21DEA(addr(local_72), addr(local_74), addr(local_24), addr(local_76))
    local_78 = 5
    local_7A = 42
    local_7C = 0
    CALL locate_print_21DEA(addr(local_78), addr(local_7A), addr(local_28), addr(local_7C))
    local_7E = 6
    local_80 = 42
    local_82 = 0
    CALL locate_print_21DEA(addr(local_7E), addr(local_80), addr(local_2C), addr(local_82))
    local_84 = 7
    local_86 = 42
    local_88 = 0
    CALL locate_print_21DEA(addr(local_84), addr(local_86), addr(local_30), addr(local_88))
    local_8A = 8
    local_8C = 42
    local_8E = 0
    CALL locate_print_21DEA(addr(local_8A), addr(local_8C), addr(local_34), addr(local_8E))
    RETURN
    CALL free_string(addr(local_6A))
    CALL free_string(addr(local_64))
    CALL free_string(addr(local_4C))
    CALL free_string(addr(local_42))
    CALL free_string(addr(local_34))
    CALL free_string(addr(local_30))
    CALL free_string(addr(local_2C))
    CALL free_string(addr(local_28))
    CALL free_string(addr(local_24))
    CALL free_string(addr(local_1E))
    PROC_EXIT
    RETURN
    GOTO label_03DE0
END SUB

SUB lips_1388C  ' image &H1388C, locals 82
  ' strings: You see a fountain before you. Do you | wish to drink from it? ('Y' or 'N') | The water glowed when it hit your | lips! | The radiation makes you weaker! | You are too weak already!
    cx = 82
    CALL frame_enter()
    CALL proc_0AA39()
    local_C = 2
    local_E = 42
    di = "You see a fountain before you. Do you"
    si = addr(local_12)
    CALL near_027A3()
    local_14 = 0
    CALL locate_print_21DEA(addr(local_C), addr(local_E), addr(local_12), addr(local_14))
    CALL free_string(addr(local_12))
    local_16 = 3
    local_18 = 42
    di = "wish to drink from it? ('Y' or 'N')"
    si = addr(local_1C)
    CALL near_027A3()
    local_1E = 0
    CALL locate_print_21DEA(addr(local_16), addr(local_18), addr(local_1C), addr(local_1E))
    CALL free_string(addr(local_1C))
    local_20 = 5
    local_22 = 42
    local_24 = 1
    CALL y_yes_26031(addr(local_20), addr(local_22), addr(local_24))
    di = ax
    si = addr(local_28)
    CALL near_027A3()
    di = addr(local_28)
    si = addr(local_2C)
    CALL near_027A3()
    CALL proc_0AA39()
    CALL RT_2732_6130(addr(local_2C), &H719E)
    IF ? == ? THEN GOTO label_0394D
    GOTO label_03950
    GOTO label_03DA2
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_03990
    GOTO label_039C8
    di = "The water glowed when it hit your"
    si = addr(local_38)
    CALL near_027A3()
    di = "lips!"
    si = addr(local_3C)
    CALL near_027A3()
    IF var_01E6 > 1 THEN GOTO label_039AC
    GOTO label_039BC
    var_01E6 = var_01E6 - 1
    di = "The radiation makes you weaker!"
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_039C5
    di = "You are too weak already!"
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03D08
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_01E6 == 1 THEN GOTO label_039DD
    GOTO label_03A15
    di = "The water was tainted with lithium!"
    si = addr(local_38)
    CALL near_027A3()
    IF var_01E8 > 1 THEN GOTO label_039F0
    GOTO label_03A00
    var_01E8 = var_01E8 - 1
    di = "You now cannot think as clearly!"
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03A12
    di = "(But you are already too stupid"
    si = addr(local_40)
    CALL near_027A3()
    di = "to realize that!)"
    si = addr(local_44)
    CALL near_027A3()
    GOTO label_03D08
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_01E8 == 1 THEN GOTO label_03A2A
    GOTO label_03A62
    di = "YECH!  ACID!"
    si = addr(local_38)
    CALL near_027A3()
    IF var_01EA > 1 THEN GOTO label_03A3D
    GOTO label_03A4D
    var_01EA = var_01EA - 1
    di = "You are internally damaged!"
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03A5F
    di = "However, compared to some of the junk"
    si = addr(local_40)
    CALL near_027A3()
    di = "you've ingested, this isn't so bad!"
    si = addr(local_44)
    CALL near_027A3()
    GOTO label_03D08
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_01EA == 1 THEN GOTO label_03A77
    GOTO label_03AAF
    di = "This tastes like booze, only stronger!"
    si = addr(local_38)
    CALL near_027A3()
    IF var_01EC > 1 THEN GOTO label_03A8A
    GOTO label_03A9A
    var_01EC = var_01EC - 1
    di = "You begin to stumble!"
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03AAC
    di = "Nothing like a good, stiff drink to"
    si = addr(local_40)
    CALL near_027A3()
    di = "take your mind off your bad dexterity!"
    si = addr(local_44)
    CALL near_027A3()
    GOTO label_03D08
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_01EC == 1 THEN GOTO label_03AC4
    GOTO label_03AF3
    di = "MM! Chocolate covered frog broth!"
    si = addr(local_38)
    CALL near_027A3()
    IF var_01EE > 1 THEN GOTO label_03AD7
    GOTO label_03AE7
    var_01EE = var_01EE - 1
    di = "You break out in warts!"
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03AF0
    di = "The new warts cover the old ones!"
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03D08
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_01EE == 1 THEN GOTO label_03B08
    GOTO label_03B49
    di = "ACH! PHEW! Black cat furball stew!"
    si = addr(local_38)
    CALL near_027A3()
    IF var_01F0 > 1 THEN GOTO label_03B1B
    GOTO label_03B34
    var_01F0 = var_01F0 - 1
    di = "If you think this was a bad break,"
    si = addr(local_40)
    CALL near_027A3()
    di = "just stick around for worse!"
    si = addr(local_44)
    CALL near_027A3()
    GOTO label_03B46
    di = "If it wasn't for bad luck, you'd"
    si = addr(local_40)
    CALL near_027A3()
    di = "have no luck at all!"
    si = addr(local_44)
    CALL near_027A3()
    GOTO label_03D08
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_01F0 == 1 THEN GOTO label_03B5E
    GOTO label_03B8D
    di = "MM! Rabbit foot stew!"
    si = addr(local_38)
    CALL near_027A3()
    IF var_01F0 < 21 THEN GOTO label_03B71
    GOTO label_03B81
    var_01F0 = var_01F0 + 1
    di = "What a lucky find!"
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03B8A
    di = "You're already a lucky guy."
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03D08
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_01F0 == 21 THEN GOTO label_03BA2
    GOTO label_03BD1
    di = "Fine wine!"
    si = addr(local_38)
    CALL near_027A3()
    IF var_01EE < 21 THEN GOTO label_03BB5
    GOTO label_03BC5
    var_01EE = var_01EE + 1
    di = "Nothing enhances an image more!"
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03BCE
    di = "Your image is dashing enough."
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03D08
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_01EE == 21 THEN GOTO label_03BE6
    GOTO label_03C15
    di = "BALLETBREW, the drink of dance stars!"
    si = addr(local_38)
    CALL near_027A3()
    IF var_01EC < 21 THEN GOTO label_03BF9
    GOTO label_03C09
    var_01EC = var_01EC + 1
    di = "You feel more graceful!"
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03C12
    di = "You are graceful enough."
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03D08
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_01EC == 21 THEN GOTO label_03C2A
    GOTO label_03C62
    di = "Liquid iron supplements?"
    si = addr(local_38)
    CALL near_027A3()
    IF var_01EA < 21 THEN GOTO label_03C3D
    GOTO label_03C4D
    var_01EA = var_01EA + 1
    di = "You feel healthier inside!"
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03C5F
    di = "What possible good could extra iron"
    si = addr(local_40)
    CALL near_027A3()
    di = "do for you?"
    si = addr(local_44)
    CALL near_027A3()
    GOTO label_03D08
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_01EA == 21 THEN GOTO label_03C77
    GOTO label_03CA6
    di = "Mnemonade! You remember more!"
    si = addr(local_38)
    CALL near_027A3()
    IF var_01E8 < 21 THEN GOTO label_03C8A
    GOTO label_03C9A
    var_01E8 = var_01E8 + 1
    di = "Your intelligence greatly benefits!"
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03CA3
    di = "You seem to know it all already."
    si = addr(local_44)
    CALL near_027A3()
    GOTO label_03D08
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_01E8 == 21 THEN GOTO label_03CBB
    GOTO label_03CEA
    di = "Spinach juice!"
    si = addr(local_38)
    CALL near_027A3()
    IF var_01E6 < 21 THEN GOTO label_03CCE
    GOTO label_03CDE
    var_01E6 = var_01E6 + 1
    di = "You feel stronger now!"
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03CE7
    di = "You don't feel any affects."
    si = addr(local_40)
    CALL near_027A3()
    GOTO label_03D08
    di = "MM! Nothing refreshes quite like a"
    si = addr(local_38)
    CALL near_027A3()
    di = "moutain stream!"
    si = addr(local_3C)
    CALL near_027A3()
    var_020A = 0
    ax = var_01E4
    var_01E2 = ax
    local_46 = 4
    local_48 = 42
    local_4A = 0
    CALL locate_print_21DEA(addr(local_46), addr(local_48), addr(local_38), addr(local_4A))
    local_4C = 5
    local_4E = 42
    local_50 = 0
    CALL locate_print_21DEA(addr(local_4C), addr(local_4E), addr(local_3C), addr(local_50))
    local_52 = 7
    local_54 = 42
    local_56 = 0
    CALL locate_print_21DEA(addr(local_52), addr(local_54), addr(local_40), addr(local_56))
    local_58 = 8
    local_5A = 42
    local_5C = 0
    CALL locate_print_21DEA(addr(local_58), addr(local_5A), addr(local_44), addr(local_5C))
    CALL mage_0C4A1()
    CALL name_0AF8B()
    CALL free_string(addr(local_28))
    CALL free_string(addr(local_2C))
    CALL free_string(addr(local_44))
    CALL free_string(addr(local_40))
    CALL free_string(addr(local_3C))
    CALL free_string(addr(local_38))
    PROC_EXIT
    RETURN
    GOTO label_0464C
END SUB

SUB deck_13DE3  ' image &H13DE3, locals 238
  ' strings: DECK | CARD0 | CARD1 | CARD2 | CARD3 | CARD4
    cx = 238
    CALL frame_enter()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? <> ? THEN GOTO label_03E1C
    GOTO label_03E1F
    CALL near_041CA()
    di = "DECK"
    si = addr(local_12)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_12))
    CALL free_string(addr(local_12))
    local_14 = 18
    local_16 = 59
    local_18 = 1
    CALL y_yes_26031(addr(local_14), addr(local_16), addr(local_18))
    di = ax
    si = addr(local_1C)
    CALL near_027A3()
    di = addr(local_1C)
    si = addr(local_20)
    CALL near_027A3()
    CALL RT_2732_6130(addr(local_20), &H719E)
    IF ? <> ? THEN GOTO label_03E7D
    GOTO label_045E3
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_03EB8
    GOTO label_03EE2
    di = "CARD0"
    si = addr(local_28)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_28))
    CALL free_string(addr(local_28))
    var_020A = 0
    ax = var_01E4
    var_01E2 = ax
    GOTO label_041AC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_03EF7
    GOTO label_03F62
    di = "CARD1"
    si = addr(local_30)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_30))
    CALL free_string(addr(local_30))
    var_0220 = 0
    var_0222 = 0
    ax = var_012F
    local_32 = ax
    ax = 1
    GOTO label_03F57
    local_34 = 1
    CALL proc_00A98(addr(local_3A), addr(local_34), addr(local_38))
    ' float_D9
    ' float_D9
    CALL proc_04D9D(addr(local_3A))
    ax = local_3A
    ax = ax + 1
    local_3A = ax
    IF ax <= local_32 THEN GOTO label_03F2A
    GOTO label_041AC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_32 THEN GOTO label_03F77
    GOTO label_03F9A
    di = "CARD2"
    si = addr(local_42)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_42))
    CALL free_string(addr(local_42))
    var_020C = var_020C + 3
    GOTO label_041AC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_32 THEN GOTO label_03FAF
    GOTO label_03FDB
    di = "CARD3"
    si = addr(local_46)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_46))
    CALL free_string(addr(local_46))
    local_48 = 2
    CALL proc_127B6(addr(local_48))
    GOTO label_041AC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_32 THEN GOTO label_03FF0
    GOTO label_0401C
    di = "CARD4"
    si = addr(local_4C)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_4C))
    CALL free_string(addr(local_4C))
    local_4E = &HFFFE
    CALL proc_127B6(addr(local_4E))
    GOTO label_041AC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_32 THEN GOTO label_04031
    GOTO label_04072
    di = "CARD5"
    si = addr(local_52)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_52))
    CALL free_string(addr(local_52))
    ax = var_01EA
    ax = ax * 2
    var_01EA = ax
    di = &H6220
    si = addr(local_56)
    CALL near_027A3()
    CALL loss_of_str_007A9(addr(local_56))
    CALL free_string(addr(local_56))
    GOTO label_041AC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_32 THEN GOTO label_04087
    GOTO label_040DC
    di = "CARD6"
    si = addr(local_5A)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_5A))
    CALL free_string(addr(local_5A))
    ax = var_01EA
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    var_01EA = ax
    di = "DECK OF CARDS"
    si = addr(local_5E)
    CALL near_027A3()
    CALL loss_of_str_007A9(addr(local_5E))
    CALL free_string(addr(local_5E))
    GOTO label_041AC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_32 THEN GOTO label_040F1
    GOTO label_04119
    di = "CARD7"
    si = addr(local_62)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_62))
    CALL free_string(addr(local_62))
    var_01E4 = var_01E4 + 10
    var_01E2 = var_01E2 + 10
    GOTO label_041AC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_32 THEN GOTO label_0412E
    GOTO label_04156
    di = "CARD8"
    si = addr(local_66)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_66))
    CALL free_string(addr(local_66))
    var_01E4 = var_01E4 + &HFFF6
    var_01E2 = var_01E2 + &HFFF6
    GOTO label_041AC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_32 THEN GOTO label_0416B
    GOTO label_041AC
    di = "CARD9"
    si = addr(local_6A)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_6A))
    CALL free_string(addr(local_6A))
    ax = var_01E6
    ax = ax * 2
    var_01E6 = ax
    di = &H6220
    si = addr(local_6E)
    CALL near_027A3()
    CALL loss_of_str_007A9(addr(local_6E))
    CALL free_string(addr(local_6E))
    GOTO label_041AC
    di = "DECK OF CARDS"
    si = addr(local_72)
    CALL near_027A3()
    CALL loss_of_str_007A9(addr(local_72))
    CALL free_string(addr(local_72))
    GOTO label_045E3
    di = "GAMBLER"
    si = addr(local_76)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_76))
    CALL free_string(addr(local_76))
    local_78 = 15
    local_7A = 45
    local_7C = 1
    CALL y_yes_26031(addr(local_78), addr(local_7A), addr(local_7C))
    di = ax
    si = addr(local_80)
    CALL near_027A3()
    di = addr(local_80)
    si = addr(local_20)
    CALL near_027A3()
    CALL RT_2732_6130(addr(local_20), &H7804)
    IF ax == local_32 THEN GOTO label_04229
    GOTO label_045DA
    local_82 = 1
    local_84 = 25
    CALL proc_21194(addr(local_82), addr(local_84))
    local_86 = 11
    local_88 = 0
    CALL color_25283(addr(local_86), addr(local_88))
    local_8A = 0
    CALL proc_25F90(addr(local_8A), 544)
    di = ax
    si = addr(local_8E)
    CALL near_027A3()
    di = addr(local_8E)
    si = "You currently have "
    CALL near_027AB()
    di = ax
    si = addr(local_92)
    CALL near_027A3()
    local_94 = 0
    CALL print_more_21DB9(addr(local_92), addr(local_94))
    CALL free_string(addr(local_92))
    local_96 = 2
    local_98 = 1
    local_9A = 9
    di = "How much would you like to gamble?"
    si = addr(local_9E)
    CALL near_027A3()
    local_A0 = 1
    local_A2 = 0
    local_A4 = 0
    CALL invalid_key_was_hit_23200(addr(local_96), addr(local_98), addr(local_9A), addr(local_9E), addr(local_B0), addr(local_A0), addr(local_A2), addr(local_A4))
    di = ax
    si = addr(local_A8)
    CALL near_027A3()
    CALL free_string(addr(local_9E))
    di = addr(local_A8)
    si = addr(local_20)
    CALL near_027A3()
    CALL RT_2732_76EA(addr(local_B0))
    si = ax
    ' float_DD
    ' float_D9
    local_AA = 4
    local_AC = 1
    CALL proc_253B3(addr(local_AA), addr(local_AC))
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_20))
    IF ax == local_32 THEN GOTO label_04374
    GOTO label_0437A
    GOTO label_045E3
    GOTO label_0459E
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax <= local_32 THEN GOTO label_04390
    GOTO label_043B9
    di = "GAMBLERNOBET"
    si = addr(local_B8)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_B8))
    CALL free_string(addr(local_B8))
    CALL hit_any_key_to_continue_2434A()
    GOTO label_045E0
    GOTO label_0459E
    ax = var_0220
    dx = var_0222
    CALL RT_2F00_0559()
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax > local_32 THEN GOTO label_043D6
    GOTO label_043F7
    di = "GAMBLERNOGOLD"
    si = addr(local_BC)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_BC))
    CALL free_string(addr(local_BC))
    GOTO label_0459E
    CALL of_spades_1464F(addr(local_BE), addr(local_C2), addr(local_C6), 496)
    local_C8 = 15
    CALL of_spades_1464F(addr(local_CA), addr(local_CE), addr(local_D2), addr(local_C8))
    local_D4 = 11
    local_D6 = 0
    CALL color_25283(addr(local_D4), addr(local_D6))
    di = addr(local_C2)
    si = "The gambler deftly shuffles the cards.  You end up cutting a "
    CALL near_027AB()
    di = ax
    si = addr(local_DA)
    CALL near_027A3()
    local_DC = 1
    CALL print_more_21DB9(addr(local_DA), addr(local_DC))
    CALL free_string(addr(local_DA))
    CALL RT_2732_6371(addr(local_C6))
    si = ax
    di = ".  The gambler then reshuffles and cuts a "
    CALL near_027AB()
    si = ax
    di = addr(local_CE)
    CALL near_027AB()
    si = ax
    di = addr(local_D2)
    CALL near_027AB()
    bx = ax
    ax = 76
    local_E4 = bx
    CALL RT_2732_63DF(DS, 76, 1)
    di = ax
    si = local_E4
    CALL near_027AB()
    di = ax
    si = addr(local_E0)
    CALL near_027A3()
    local_E2 = 1
    CALL print_more_21DB9(addr(local_E0), addr(local_E2))
    CALL free_string(addr(local_E0))
    ax = local_BE
    IF ax == local_CA THEN GOTO label_044F1
    GOTO label_04512
    di = "GAMBLERTIES"
    si = addr(local_E8)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_E8))
    CALL free_string(addr(local_E8))
    GOTO label_0459E
    ax = local_BE
    IF ax < local_CA THEN GOTO label_0451F
    GOTO label_04560
    di = "GAMBLERWINS"
    si = addr(local_EC)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_EC))
    CALL free_string(addr(local_EC))
    ax = var_0220
    dx = var_0222
    CALL RT_2F00_0559()
    ' float_D9
    ' float_DE
    CALL RT_2F00_057D()
    var_0220 = ax
    var_0222 = dx
    GOTO label_0459E
    di = "GAMBLERLOOSES"
    si = addr(local_F0)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_F0))
    CALL free_string(addr(local_F0))
    ax = var_0220
    dx = var_0222
    CALL RT_2F00_0559()
    ' float_D9
    ' float_DE
    CALL RT_2F00_057D()
    var_0220 = ax
    var_0222 = dx
    local_F2 = 14
    local_F4 = 1
    CALL proc_253B3(addr(local_F2), addr(local_F4))
    di = "GAMBLERTRY"
    si = addr(local_F8)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_F8))
    CALL free_string(addr(local_F8))
    GOTO label_045DD
    GOTO label_045E3
    GOTO label_041E6
    GOTO label_045E3
    CALL free_string(addr(local_A8))
    CALL free_string(addr(local_8E))
    CALL free_string(addr(local_80))
    CALL free_string(addr(local_1C))
    CALL free_string(addr(local_B0))
    CALL free_string(addr(local_20))
    CALL free_string(addr(local_D2))
    CALL free_string(addr(local_CE))
    CALL free_string(addr(local_C6))
    CALL free_string(addr(local_C2))
    PROC_EXIT
    RETURN
    GOTO label_047F5
END SUB

SUB of_spades_1464F  ' image &H1464F, locals 28
  ' strings:  OF SPADES |  OF DIAMONDS |  OF CLUBS |  OF HEARTS | DUECE | JACK
    cx = 28
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 4, 4, &H8001, addr(local_1C))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = " OF SPADES"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = " OF DIAMONDS"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = " OF CLUBS"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = " OF HEARTS"
    CALL near_027A3()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_1C)
    CALL array_element(1, 1)
    di = bx
    si = arg_8
    CALL near_027A3()
    si = arg_C
    CALL RT_2732_79CA()
    di = ax
    ' float_D9
    di = arg_6
    ax = [di]
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    [si] = ax
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? > ? THEN GOTO label_04754
    GOTO label_0475F
    ' float_D9
    ' float_D9
    si = arg_C
    ax = [si]
    local_26 = ax
    IF local_26 == 1 THEN GOTO label_04770
    GOTO label_0477C
    di = "DUECE"
    si = arg_A
    CALL near_027A3()
    GOTO label_047E4
    IF local_26 == 10 THEN GOTO label_04785
    GOTO label_04791
    di = "JACK"
    si = arg_A
    CALL near_027A3()
    GOTO label_047E4
    IF local_26 == 11 THEN GOTO label_0479A
    GOTO label_047A6
    di = "QUEEN"
    si = arg_A
    CALL near_027A3()
    GOTO label_047E4
    IF local_26 == 12 THEN GOTO label_047AF
    GOTO label_047BB
    di = "KING"
    si = arg_A
    CALL near_027A3()
    GOTO label_047E4
    IF local_26 == 13 THEN GOTO label_047C4
    GOTO label_047D0
    di = "ACE"
    si = arg_A
    CALL near_027A3()
    GOTO label_047E4
    si = arg_C
    ax = [si]
    ax = ax + 1
    CALL RT_2732_63B4(ax)
    di = ax
    si = arg_A
    CALL near_027A3()
    CALL erase_array(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_05579
END SUB

SUB you_can_see_again_147F8  ' image &H147F8, locals 118
  ' strings: You can see again
    cx = 118
    CALL frame_enter()
    si = arg_A
    ax = [si]
    ax = -ax
    CALL RT_2F00_0558()
    ' float_D9
    si = arg_8
    ax = [si]
    ax = -ax
    CALL RT_2F00_0558()
    ' float_D9
    IF var_00B6 > 0 THEN GOTO label_0482E
    GOTO label_0483C
    ' float_D9
    ' float_D9
    GOTO label_04847
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    IF var_0214 == 1 THEN GOTO label_0485C
    GOTO label_048F1
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0214 == 1 THEN GOTO label_0488D
    GOTO label_04896
    var_0214 = 0
    GOTO label_048A1
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0214 > 1 THEN GOTO label_048B6
    GOTO label_048F1
    CALL proc_0AA39()
    local_20 = 2
    local_22 = 42
    di = "You can see again"
    si = addr(local_26)
    CALL near_027A3()
    local_28 = 0
    CALL locate_print_21DEA(addr(local_20), addr(local_22), addr(local_26), addr(local_28))
    CALL free_string(addr(local_26))
    ax = var_028A
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jc 0x4918
    GOTO label_04923
    ' float_D9
    ' float_D9
    ax = var_028C
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jc 0x494a
    GOTO label_04955
    ' float_D9
    ' float_D9
    ax = var_028A
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0214 > 1 THEN GOTO label_0497C
    GOTO label_04987
    ' float_D9
    ' float_D9
    ax = var_028C
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0214 > 1 THEN GOTO label_049AE
    GOTO label_049B9
    ' float_D9
    ' float_D9
    local_3A = 11
    local_3C = 0
    CALL color_25283(addr(local_3A), addr(local_3C))
    ' float_D9
    CALL RT_2F00_056C()
    local_3E = ax
    ' float_D9
    CALL RT_2F00_056C()
    GOTO label_050D6
    ' float_D9
    CALL RT_2F00_056C()
    local_40 = ax
    ' float_D9
    CALL RT_2F00_056C()
    GOTO label_050C7
    ax = 78
    ' imul word [bp-0x46]
    ax = ax + local_48
    ax = ax + &HFFB2
    CALL RT_2F00_0558()
    ' float_D9
    ax = 654
    CALL RT_2732_63DF(DS, 654, &H3F6)
    ' float_D9
    PUSH &H3F6
    CALL RT_2F00_056C()
    CALL RT_2732_6266(&H3F6, 1)
    di = ax
    si = addr(local_50)
    CALL near_027A3()
    ax = &H684
    CALL RT_2732_63DF(DS, &H684, &H3F6)
    ' float_D9
    PUSH &H3F6
    CALL RT_2F00_056C()
    CALL RT_2732_6266(&H3F6, 1)
    di = ax
    si = addr(local_54)
    CALL near_027A3()
    CALL RT_2732_61A9(addr(local_54))
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF var_0214 <= 1 THEN GOTO label_04A95
    ax = ax - 1
    cx = 0
    IF var_00C0 <> 1 THEN GOTO label_04AA0
    cx = cx - 1
    ' or cx,ax
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    ' jnc 0x4ab8
    ax = ax - 1
    ' and ax,cx
    ' and ax,ax
    IF var_00C0 <> 1 THEN GOTO label_04AC1
    GOTO label_04C48
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 == 1 THEN GOTO label_04AE0
    GOTO label_04AEE
    ' float_D9
    ' float_D9
    GOTO label_04C11
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 == 1 THEN GOTO label_04B03
    GOTO label_04B11
    ' float_D9
    ' float_D9
    GOTO label_04C11
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 == 1 THEN GOTO label_04B26
    GOTO label_04B34
    ' float_D9
    ' float_D9
    GOTO label_04C11
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 == 1 THEN GOTO label_04B49
    GOTO label_04B57
    ' float_D9
    ' float_D9
    GOTO label_04C11
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 <> 1 THEN GOTO label_04B6C
    GOTO label_04BAB
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 <> 1 THEN GOTO label_04B81
    GOTO label_04BAB
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 <> 1 THEN GOTO label_04B96
    GOTO label_04BAB
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 == 1 THEN GOTO label_04BAB
    GOTO label_04BC2
    CALL RT_2732_61A9(&H79D2)
    CALL RT_2F00_0558()
    ' float_D9
    GOTO label_04C11
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 == 1 THEN GOTO label_04BD7
    GOTO label_04BE5
    ' float_D9
    ' float_D9
    GOTO label_04C11
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 == 1 THEN GOTO label_04BFA
    GOTO label_04C11
    CALL RT_2732_61A9(&H79DC)
    CALL RT_2F00_0558()
    ' float_D9
    GOTO label_04C11
    ' float_D9
    CALL RT_2F00_056C()
    CALL RT_2732_616F(&H79DC)
    di = ax
    si = addr(local_5C)
    CALL near_027A3()
    CALL RT_2732_6130(addr(local_50), addr(local_5C))
    IF var_00C0 <> 1 THEN GOTO label_04C3A
    GOTO label_04C45
    ' float_D9
    ' float_D9
    GOTO label_04E61
    CALL RT_2732_6130(addr(local_50), &H79E2)
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_04C5B
    ax = ax - 1
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_04C73
    ax = ax - 1
    ' or ax,bx
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_04C8D
    ax = ax - 1
    ' or ax,bx
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_04CA7
    ax = ax - 1
    ' or ax,bx
    ' and ax,ax
    IF var_00C0 <> 1 THEN GOTO label_04CB0
    GOTO label_04E58
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 == 1 THEN GOTO label_04CCF
    GOTO label_04CE3
    CALL RT_2732_616F(196)
    di = ax
    si = addr(local_5C)
    CALL near_027A3()
    GOTO label_04E55
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 == 1 THEN GOTO label_04CF8
    GOTO label_04D0C
    CALL RT_2732_616F(179)
    di = ax
    si = addr(local_5C)
    CALL near_027A3()
    GOTO label_04E55
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 == 1 THEN GOTO label_04D21
    GOTO label_04D8A
    ' float_D9
    ax = local_46
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ax = 0
    ' jnc 0x4d3a
    ax = ax - 1
    bx = ax
    local_62 = bx
    CALL RT_2732_616F(194)
    CALL RT_2732_6130(194, addr(local_50))
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_04D58
    ax = ax - 1
    ' or ax,[bp-0x62]
    ' and ax,ax
    IF var_00C0 <> 1 THEN GOTO label_04D62
    GOTO label_04D76
    CALL RT_2732_616F(194)
    di = ax
    si = addr(local_5C)
    CALL near_027A3()
    GOTO label_04D87
    CALL RT_2732_616F(196)
    di = ax
    si = addr(local_5C)
    CALL near_027A3()
    GOTO label_04E55
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 == 1 THEN GOTO label_04D9F
    GOTO label_04E08
    ' float_D9
    ax = local_46
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 <= 1 THEN GOTO label_04DB8
    ax = ax - 1
    bx = ax
    local_64 = bx
    CALL RT_2732_616F(193)
    CALL RT_2732_6130(193, addr(local_50))
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_04DD6
    ax = ax - 1
    ' or ax,[bp-0x64]
    ' and ax,ax
    IF var_00C0 <> 1 THEN GOTO label_04DE0
    GOTO label_04DF4
    CALL RT_2732_616F(193)
    di = ax
    si = addr(local_5C)
    CALL near_027A3()
    GOTO label_04E05
    CALL RT_2732_616F(196)
    di = ax
    si = addr(local_5C)
    CALL near_027A3()
    GOTO label_04E55
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 <> 1 THEN GOTO label_04E1D
    GOTO label_04E32
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00C0 > 1 THEN GOTO label_04E32
    GOTO label_04E3E
    di = &H79F8
    si = addr(local_5C)
    CALL near_027A3()
    GOTO label_04E55
    ' float_D9
    CALL RT_2F00_056C()
    CALL RT_2732_616F(196)
    di = ax
    si = addr(local_5C)
    CALL near_027A3()
    GOTO label_04E61
    di = addr(local_50)
    si = addr(local_5C)
    CALL near_027A3()
    CALL RT_2732_6130(addr(local_50), addr(local_5C))
    ax = 0
    IF var_00C0 == 1 THEN GOTO label_04E74
    ax = ax - 1
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_04E8C
    ax = ax - 1
    ' or ax,bx
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_04EA6
    ax = ax - 1
    ' or ax,bx
    bx = ax
    local_68 = bx
    CALL RT_2732_6130(addr(local_50), &H79E2)
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_04EC0
    ax = ax - 1
    ' or ax,[bp-0x68]
    ' and ax,ax
    IF var_00C0 <> 1 THEN GOTO label_04ECA
    GOTO label_0501B
    ax = local_46
    ax = ax + 10
    local_6A = ax
    ax = local_48
    ax = ax + 1
    local_6C = ax
    local_66 = 0
    CALL locate_print_21DEA(addr(local_6A), addr(local_6C), addr(local_5C), addr(local_66))
    ax = 654
    ' float_D9
    PUSH DS
    PUSH 654
    PUSH &H3F6
    PUSH addr(local_5C)
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 == 1 THEN GOTO label_04F2A
    ax = ax - 1
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 == 1 THEN GOTO label_04F42
    ax = ax - 1
    ' and ax,bx
    bx = ax
    local_6E = bx
    CALL RT_2732_616F(179)
    CALL RT_2732_6130(179, addr(local_5C))
    ax = 0
    IF var_00C0 == 1 THEN GOTO label_04F62
    ax = ax - 1
    ' and ax,[bp-0x6e]
    bx = ax
    local_70 = bx
    CALL RT_2732_616F(196)
    CALL RT_2732_6130(196, addr(local_5C))
    ax = 0
    IF var_00C0 == 1 THEN GOTO label_04F83
    ax = ax - 1
    ' and ax,[bp-0x70]
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 == 1 THEN GOTO label_04F9E
    ax = ax - 1
    ' and ax,bx
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 == 1 THEN GOTO label_04FB8
    ax = ax - 1
    ' and ax,bx
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 == 1 THEN GOTO label_04FD2
    ax = ax - 1
    ' and ax,bx
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 == 1 THEN GOTO label_04FEC
    ax = ax - 1
    ' and ax,bx
    bx = ax
    local_72 = bx
    CALL RT_2732_6130(addr(local_5C), &H79F8)
    ax = 0
    IF var_00C0 == 1 THEN GOTO label_05006
    ax = ax - 1
    ' and ax,[bp-0x72]
    ' and ax,ax
    IF var_00C0 <> 1 THEN GOTO label_05010
    GOTO label_0501B
    ' float_D9
    ' float_D9
    CALL RT_2732_616F(196)
    CALL RT_2732_6130(196, addr(local_5C))
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_05034
    ax = ax - 1
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_0504C
    ax = ax - 1
    ' and ax,bx
    bx = ax
    local_74 = bx
    CALL RT_2732_616F(179)
    CALL RT_2732_6130(179, addr(local_5C))
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_0506C
    ax = ax - 1
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_05084
    ax = ax - 1
    ' and ax,bx
    ' or ax,[bp-0x74]
    cx = local_46
    cx = cx - var_028C
    si = arg_8
    dx = 0
    IF cx <> [si] THEN GOTO label_0509B
    dx = dx - 1
    ' and dx,ax
    ax = local_48
    ax = ax - var_028A
    si = arg_A
    cx = 0
    IF ax <> [si] THEN GOTO label_050AF
    cx = cx - 1
    ' and cx,dx
    ' and cx,cx
    IF ax <> [si] THEN GOTO label_050B8
    GOTO label_050C3
    ' float_D9
    ' float_D9
    ax = local_48
    ax = ax + 1
    local_48 = ax
    IF ax > local_40 THEN GOTO label_050D2
    GOTO label_04A00
    ax = local_46
    ax = ax + 1
    local_46 = ax
    IF ax > local_3E THEN GOTO label_050E1
    GOTO label_049E8
    local_76 = 7
    local_78 = 0
    CALL color_25283(addr(local_76), addr(local_78))
    CALL proc_0C3FC()
    ax = 78
    ' imul word [0x28c]
    ax = ax + var_028A
    ax = ax + &HFFB2
    CALL RT_2F00_0558()
    ' float_D9
    ax = &H684
    CALL RT_2732_63DF(DS, &H684, &H3F6)
    ' float_D9
    PUSH &H3F6
    CALL RT_2F00_056C()
    CALL RT_2732_6266(&H3F6, 1)
    di = ax
    si = addr(local_54)
    CALL near_027A3()
    CALL RT_2732_61A9(addr(local_54))
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_3E THEN GOTO label_05169
    GOTO label_0519C
    IF var_00D0 == 1 THEN GOTO label_05173
    GOTO label_05199
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(21)
    ' float_D9
    PUSH 21
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_051C6
    GOTO label_051EF
    ax = 654
    PUSH DS
    PUSH 654
    PUSH &H3F6
    CALL RT_2732_616F(186)
    ' float_D9
    PUSH 186
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_05204
    GOTO label_0522D
    ax = 654
    PUSH DS
    PUSH 654
    PUSH &H3F6
    CALL RT_2732_616F(205)
    ' float_D9
    PUSH 205
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_05242
    GOTO label_0526B
    ax = 654
    PUSH DS
    PUSH 654
    PUSH &H3F6
    CALL RT_2732_616F(24)
    ' float_D9
    PUSH 24
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_05280
    GOTO label_052A9
    ax = 654
    PUSH DS
    PUSH 654
    PUSH &H3F6
    CALL RT_2732_616F(25)
    ' float_D9
    PUSH 25
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_052BE
    GOTO label_052E7
    ax = 654
    PUSH DS
    PUSH 654
    PUSH &H3F6
    CALL RT_2732_616F(186)
    ' float_D9
    PUSH 186
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_052FC
    GOTO label_05325
    ax = 654
    PUSH DS
    PUSH 654
    PUSH &H3F6
    CALL RT_2732_616F(205)
    ' float_D9
    PUSH 205
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_0533A
    GOTO label_05363
    ax = 654
    PUSH DS
    PUSH 654
    PUSH &H3F6
    CALL RT_2732_616F(145)
    ' float_D9
    PUSH 145
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_05378
    GOTO label_053A1
    ax = 654
    PUSH DS
    PUSH 654
    PUSH &H3F6
    CALL RT_2732_616F(209)
    ' float_D9
    PUSH 209
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_053B6
    GOTO label_053DF
    ax = 654
    PUSH DS
    PUSH 654
    PUSH &H3F6
    CALL RT_2732_616F(209)
    ' float_D9
    PUSH 209
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_053F3
    GOTO label_0541C
    ax = 654
    PUSH DS
    PUSH 654
    PUSH &H3F6
    CALL RT_2732_616F(24)
    ' float_D9
    PUSH 24
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_05431
    GOTO label_0545A
    ax = 654
    PUSH DS
    PUSH 654
    PUSH &H3F6
    CALL RT_2732_616F(25)
    ' float_D9
    PUSH 25
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_0546F
    GOTO label_05498
    ax = 654
    PUSH DS
    PUSH 654
    PUSH &H3F6
    CALL RT_2732_616F(21)
    ' float_D9
    PUSH 21
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 <> 1 THEN GOTO label_054AD
    GOTO label_054EC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 <> 1 THEN GOTO label_054C2
    GOTO label_054EC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 <> 1 THEN GOTO label_054D7
    GOTO label_054EC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_054EC
    GOTO label_0550F
    ax = 654
    ' float_D9
    PUSH DS
    PUSH 654
    PUSH &H3F6
    PUSH &H79D2
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00D0 == 1 THEN GOTO label_05524
    GOTO label_05547
    ax = 654
    ' float_D9
    PUSH DS
    PUSH 654
    PUSH &H3F6
    PUSH &H79DC
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_05547
    ' float_D9
    si = arg_6
    ' float_D9
    CALL free_string(addr(local_5C))
    CALL free_string(addr(local_50))
    CALL free_string(addr(local_54))
    ax = arg_6
    PROC_EXIT
    RETURN
    GOTO label_05771
END SUB

SUB proc_1557C  ' image &H1557C, locals 60
    cx = 60
    CALL frame_enter()
    IF var_01F4 == 30 THEN GOTO label_0558E
    GOTO label_055B1
    local_C = 20
    local_E = 1
    local_10 = 0
    CALL proc_1643A(addr(local_C), addr(local_E), addr(local_10))
    GOTO label_0565B
    local_12 = 25
    local_14 = 1
    local_16 = 0
    CALL proc_1643A(addr(local_12), addr(local_14), addr(local_16))
    IF var_01F4 == 29 THEN GOTO label_055DB
    GOTO label_0565B
    local_18 = 16
    local_1A = 1
    local_1C = 0
    CALL proc_1643A(addr(local_18), addr(local_1A), addr(local_1C))
    local_1E = 17
    local_20 = 1
    local_22 = 0
    CALL proc_1643A(addr(local_1E), addr(local_20), addr(local_22))
    local_24 = 18
    local_26 = 1
    local_28 = 0
    CALL proc_1643A(addr(local_24), addr(local_26), addr(local_28))
    local_2A = 19
    local_2C = 1
    local_2E = 0
    CALL proc_1643A(addr(local_2A), addr(local_2C), addr(local_2E))
    local_30 = 24
    local_32 = 1
    local_34 = 1
    CALL proc_1643A(addr(local_30), addr(local_32), addr(local_34))
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_3A = ax
    local_36 = 21
    local_38 = 0
    CALL proc_1643A(addr(local_36), addr(local_3A), addr(local_38))
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_3A = ax
    local_3C = 145
    local_3E = 0
    CALL proc_1643A(addr(local_3C), addr(local_3A), addr(local_3E))
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_3A = ax
    local_40 = 209
    local_42 = 0
    CALL proc_1643A(addr(local_40), addr(local_3A), addr(local_42))
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_3A = ax
    local_44 = 36
    local_46 = 0
    CALL proc_1643A(addr(local_44), addr(local_3A), addr(local_46))
    PROC_EXIT
    RETURN
    GOTO label_05C08
END SUB

SUB proc_15774  ' image &H15774, locals 54
    cx = 54
    CALL frame_enter()
    CALL RT_2732_62BC(&H3F6)
    PUSH DS
    PUSH &H3F6
    ' xor ax,ax
    ax = 654
    CALL RT_2732_6404(&H3F6, DS, 654, &H3F6)
    ax = 1
    GOTO label_05825
    cx = 78
    ' imul cx
    bx = ax
    ax = ax + &HFFB3
    CALL RT_2F00_0558()
    ' float_D9
    ax = &H684
    local_10 = bx
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_62EF(CX, 32)
    ' float_D9
    PUSH 32
    PUSH 78
    CALL RT_2F00_056C()
    CALL RT_2732_650E(78)
    IF local_12 < 13 THEN GOTO label_057E6
    GOTO label_0581F
    ax = local_10
    ax = ax + 1
    CALL RT_2F00_0558()
    ' float_D9
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_62EF(78, 196)
    ' float_D9
    PUSH 196
    PUSH 78
    CALL RT_2F00_056C()
    CALL RT_2732_650E(78)
    ax = local_12
    ax = ax + 2
    local_12 = ax
    IF ax > 13 THEN GOTO label_05830
    GOTO label_0579E
    ' float_D9
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    local_14 = ax
    ax = 1
    GOTO label_05A76
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D8
    CALL RT_2F00_056C()
    local_1E = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_056C()
    GOTO label_059AC
    ' or ax,ax
    IF ax > 13 THEN GOTO label_058FB
    GOTO label_059A8
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D8
    GOTO label_0597C
    ax = 156
    ' imul word [bp-0x30]
    ax = ax + &HFF64
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D9
    ax = &H684
    CALL RT_2732_63DF(DS, &H684, &H3F6)
    ' float_D9
    PUSH &H3F6
    CALL RT_2F00_056C()
    CALL RT_2732_6266(&H3F6, 1)
    PUSH 1
    CALL RT_2732_616F(179)
    CALL RT_2732_6130(179)
    IF ax == 13 THEN GOTO label_05965
    GOTO label_05973
    ' float_D9
    ' float_D9
    GOTO label_05993
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax <= 13 THEN GOTO label_05916
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax <> 13 THEN GOTO label_059A8
    GOTO label_059B7
    ax = local_30
    ax = ax + 1
    local_30 = ax
    IF ax > local_1E THEN GOTO label_059B7
    GOTO label_058F4
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_1E THEN GOTO label_059CC
    GOTO label_05A72
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(179)
    ' float_D9
    PUSH 179
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax > local_1E THEN GOTO label_05A07
    GOTO label_05A32
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(194)
    ' float_D9
    ' float_D8
    PUSH 194
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jc 0x5a47
    GOTO label_05A72
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(193)
    ' float_D9
    ' float_D8
    PUSH 193
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
    ax = local_12
    ax = ax + 1
    local_12 = ax
    IF ax > local_14 THEN GOTO label_05A81
    GOTO label_0586C
    ax = 2
    GOTO label_05BF0
    ' float_D9
    ' float_D9
    ax = 1
    GOTO label_05B69
    ax = 78
    ' imul word [bp-0x12]
    ax = ax + local_30
    ax = ax + &HFFB2
    CALL RT_2F00_0558()
    ' float_D9
    ax = &H684
    CALL RT_2732_63DF(DS, &H684, &H3F6)
    ' float_D9
    PUSH &H3F6
    CALL RT_2F00_056C()
    CALL RT_2732_6266(&H3F6, 1)
    PUSH 1
    CALL RT_2732_616F(196)
    CALL RT_2732_6130(196)
    IF ax <> local_14 THEN GOTO label_05AE8
    GOTO label_05B65
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = local_30
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ' float_D9
    ax = local_30
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    ' float_D9
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(11)
    ' float_D9
    PUSH 11
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
    ax = local_30
    ax = ax + 1
    CALL RT_2F00_0558()
    ' float_D9
    ax = local_30
    ax = ax + 1
    local_30 = ax
    IF ax > 78 THEN GOTO label_05B74
    GOTO label_05A9A
    ax = 78
    ' imul word [bp-0x12]
    CALL RT_2F00_0558()
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D9
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(11)
    ' float_D9
    PUSH 11
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
    ax = local_12
    ax = ax + 2
    local_12 = ax
    IF ax > 12 THEN GOTO label_05BFB
    GOTO label_05A88
    CALL proc_1557C()
    PROC_EXIT
    RETURN
    GOTO label_06437
END SUB

SUB proc_15C0B  ' image &H15C0B, locals 152
    cx = 152
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 35, 4, 513, addr(local_1C))
    ' xor ax,ax
    CALL RT_2732_24B9(addr(local_1C), 35, 4, 513, addr(local_2E))
    ' xor ax,ax
    CALL RT_2732_24B9(addr(local_2E), 35, 4, 513, addr(local_40))
    ' xor ax,ax
    CALL RT_2732_24B9(addr(local_40), 35, 4, 513, addr(local_52))
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2732_62BC(&H3F6)
    PUSH DS
    PUSH &H3F6
    ' xor ax,ax
    ax = 654
    CALL RT_2732_6404(&H3F6, DS, 654, &H3F6)
    CALL RT_2732_62BC(&H3F6)
    PUSH DS
    PUSH &H3F6
    ' xor ax,ax
    ax = &H684
    CALL RT_2732_6404(&H3F6, DS, &H684, &H3F6)
    ' float_D9
    CALL RT_2F00_056C()
    local_54 = ax
    ax = 1
    GOTO label_063FA
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D8
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D8
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    local_5E = ax
    ax = 1
    GOTO label_05E74
    bx = addr(local_1C)
    CALL array_element(1, 1)
    ' float_hw
    ' float_D8
    ' float_D9
    bx = addr(local_2E)
    CALL array_element(local_74, 1)
    ' float_hw
    ' float_D8
    ' float_D9
    bx = addr(local_40)
    CALL array_element(local_74, 1)
    ' float_hw
    ' float_D8
    ' float_D9
    bx = addr(local_52)
    CALL array_element(local_74, 1)
    ' float_hw
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    ' jc 0x5e1e
    ax = ax - 1
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF ? > ? THEN GOTO label_05E35
    ax = ax - 1
    ' and ax,bx
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF ? > ? THEN GOTO label_05E4E
    ax = ax - 1
    ' and ax,bx
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    ' jc 0x5e67
    ax = ax - 1
    ' and ax,bx
    ' and ax,ax
    IF ? == ? THEN GOTO label_05E70
    GOTO label_063F5
    ax = local_74
    ax = ax + 1
    local_74 = ax
    IF ax > local_5E THEN GOTO label_05E7F
    GOTO label_05D9C
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_1C)
    CALL array_element(ax, 1)
    ' float_hw
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_40)
    CALL array_element(1, 1)
    ' float_hw
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_2E)
    CALL array_element(1, 1)
    ' float_hw
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_52)
    CALL array_element(1, 1)
    ' float_hw
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(218)
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D8
    PUSH 218
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(191)
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D8
    PUSH 191
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(192)
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D8
    PUSH 192
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(217)
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D8
    PUSH 217
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    ' float_D9
    ' float_D8
    CALL RT_2F00_056C()
    local_82 = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_056C()
    GOTO label_06091
    ' float_D9
    ' float_D8
    ' float_D8
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D9
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(196)
    ' float_D9
    PUSH 196
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    ' float_D9
    ' float_D8
    ' float_D8
    ax = local_74
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D9
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(196)
    ' float_D9
    PUSH 196
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    ax = local_74
    ax = ax + 1
    local_74 = ax
    IF ax > local_82 THEN GOTO label_0609D
    GOTO label_06002
    ' float_D9
    ' float_D8
    CALL RT_2F00_056C()
    local_88 = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_056C()
    GOTO label_06144
    cx = 78
    ' imul cx
    ax = ax + &HFFB2
    bx = ax
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D9
    ax = &H684
    local_8A = bx
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(179)
    ' float_D9
    PUSH 179
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    ax = local_8A
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D9
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(179)
    ' float_D9
    PUSH 179
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    ax = local_74
    ax = ax + 1
    local_74 = ax
    IF ax > local_88 THEN GOTO label_06150
    GOTO label_060C0
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    local_8C = ax
    ax = 1
    GOTO label_063E9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF ax <> local_88 THEN GOTO label_061DC
    ax = ax - 1
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF ax <> local_88 THEN GOTO label_061F5
    ax = ax - 1
    ' or ax,bx
    ' and ax,ax
    IF ax <> local_88 THEN GOTO label_061FE
    GOTO label_062F3
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_88 THEN GOTO label_0624A
    GOTO label_0626B
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D8
    ' float_D8
    ' float_D9
    GOTO label_06289
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D8
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_88 THEN GOTO label_0629F
    GOTO label_062C9
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(11)
    ' float_D9
    PUSH 11
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_062F0
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(186)
    ' float_D9
    PUSH 186
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_063E5
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_88 THEN GOTO label_0633F
    GOTO label_06360
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D8
    ' float_D8
    ' float_D9
    GOTO label_0637E
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D8
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_88 THEN GOTO label_06394
    GOTO label_063BE
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(12)
    ' float_D9
    PUSH 12
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_063E5
    ax = &H684
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F(205)
    ' float_D9
    PUSH 205
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    ax = local_74
    ax = ax + 1
    local_74 = ax
    IF ax > local_8C THEN GOTO label_063F5
    GOTO label_06186
    ax = local_A2
    ax = ax + 1
    local_A2 = ax
    IF ax > local_54 THEN GOTO label_06406
    GOTO label_05CEA
    CALL proc_1557C()
    CALL erase_array(addr(local_52))
    CALL erase_array(addr(local_40))
    CALL erase_array(addr(local_2E))
    CALL erase_array(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_0655F
END SUB

SUB proc_1643A  ' image &H1643A, locals 20
    cx = 20
    CALL frame_enter()
    si = arg_8
    IF [si] > 0 THEN GOTO label_0644D
    GOTO label_0654E
    ax = [si]
    local_C = ax
    ax = 1
    GOTO label_06520
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D8
    ' float_D9
    ax = &H684
    CALL RT_2732_63DF(DS, &H684, &H3F6)
    ' float_D9
    PUSH &H3F6
    CALL RT_2F00_056C()
    CALL RT_2732_6266(&H3F6, 1)
    di = ax
    si = addr(local_1C)
    CALL near_027A3()
    CALL RT_2732_6130(addr(local_1C), &H79E2)
    IF [si] == 0 THEN GOTO label_064EE
    GOTO label_06518
    ax = &H684
    si = arg_A
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    CALL RT_2732_616F([si])
    ' float_D9
    PUSH &H3F6
    PUSH &H7FFF
    CALL RT_2F00_056C()
    CALL RT_2732_650E(&H7FFF)
    GOTO label_0651C
    GOTO label_06458
    ax = local_1E
    ax = ax + 1
    local_1E = ax
    IF ax > local_C THEN GOTO label_0652B
    GOTO label_06458
    si = arg_6
    IF [si] == 1 THEN GOTO label_06536
    GOTO label_0654E
    ' float_D9
    CALL RT_2F00_056C()
    var_028A = ax
    ' float_D9
    CALL RT_2F00_056C()
    var_028C = ax
    CALL free_string(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_066EC
END SUB

SUB resurrection_16562  ' image &H16562, locals 20
  ' strings: RESURRECTION | RESURRNOGOLD | RESURRNOCON | RESURRWORKED
    cx = 20
    CALL frame_enter()
    CALL hit_any_key_to_continue_2434A()
    di = "RESURRECTION"
    si = addr(local_E)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_E))
    CALL free_string(addr(local_E))
    CALL RT_2732_7413(var_0222, var_0220, long(100))
    IF ? < ? THEN GOTO label_065A2
    GOTO label_065C8
    di = "RESURRNOGOLD"
    si = addr(local_12)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_12))
    CALL free_string(addr(local_12))
    CALL dun_0E905(arg_6)
    GOTO label_066B6
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_01EA
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF ? <> ? THEN GOTO label_06605
    ax = ax - 1
    cx = 0
    IF var_01EA >= 17 THEN GOTO label_06610
    cx = cx - 1
    ' and cx,ax
    ax = 0
    IF var_01EA >= 10 THEN GOTO label_0661D
    ax = ax - 1
    ' or ax,cx
    cx = 0
    IF var_01E4 >= 1 THEN GOTO label_0662A
    cx = cx - 1
    ' or cx,ax
    ' and cx,cx
    IF var_01E4 <> 1 THEN GOTO label_06633
    GOTO label_06659
    di = "RESURRNOCON"
    si = addr(local_16)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_16))
    CALL free_string(addr(local_16))
    CALL dun_0E905(arg_6)
    GOTO label_066B6
    di = "RESURRWORKED"
    si = addr(local_1E)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_1E))
    CALL free_string(addr(local_1E))
    var_0220 = 0
    var_0222 = 0
    var_01EA = var_01EA - 1
    ax = var_01EA
    ' imul word [0x1e4]
    CALL RT_2F00_0558()
    ax = var_01EA
    ax = ax + 1
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    var_01E4 = ax
    ax = var_01E4
    var_01E2 = ax
    CALL proc_09BED()
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0D0CF()
    ax = 0
    IF var_01F4 <= 0 THEN GOTO label_066CB
    ax = ax - 1
    cx = 0
    IF var_0112 <> 0 THEN GOTO label_066D6
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0112 <> 0 THEN GOTO label_066DF
    GOTO label_066E4
    CALL proc_0C32E()
    PROC_EXIT
    RETURN
    GOTO label_067F3
END SUB

SUB proc_166EF  ' image &H166EF, locals 34
  ' strings: You've escaped the dungeon! Have fun in town. (Hit any key to continue.)
    cx = 34
    CALL frame_enter()
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    local_C = 1
    local_E = 25
    CALL proc_21194(addr(local_C), addr(local_E))
    CALL mage_0C4A1()
    CALL proc_0D0CF()
    CALL name_0AF8B()
    IF var_01F4 == 0 THEN GOTO label_06748
    GOTO label_06769
    ax = 1
    GOTO label_0675B
    si = ax
    si = si * 2
    cx = var_1578[si]
    var_1584[si] = cx
    ax = ax + 1
    local_1C = ax
    IF ax <= 5 THEN GOTO label_0674E
    var_01F4 = 1
    CALL dun_17C4C()
    CALL menu_167F6()
    ax = 0
    IF var_01F4 <> 0 THEN GOTO label_0677E
    ax = ax - 1
    cx = 0
    IF var_0112 <> 0 THEN GOTO label_06789
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0112 <> 0 THEN GOTO label_06792
    GOTO label_067D9
    di = "You've escaped the dungeon! Have fun in town. (Hit any key to continue.)"
    si = addr(local_20)
    CALL near_027A3()
    di = &H6220
    si = addr(local_24)
    CALL near_027A3()
    CALL proc_2311E(addr(local_20), addr(local_24))
    CALL free_string(addr(local_20))
    CALL free_string(addr(local_24))
    CALL proc_243D9()
    di = ax
    si = addr(local_28)
    CALL near_027A3()
    di = addr(local_28)
    si = addr(local_2C)
    CALL near_027A3()
    CALL free_string(addr(local_28))
    CALL free_string(addr(local_2C))
    PROC_EXIT
    RETURN
    GOTO label_06F5A
END SUB

SUB menu_167F6  ' image &H167F6, locals 112
  ' strings: MENU | ESCAPE | You start running. | You slow your pace to a walk. | HELPRUN | UNKNOWN KEY WAS HIT 
    cx = 112
    CALL frame_enter()
    ax = 72
    ax = 112
    CALL RT_2732_6404(DS, 72, 1, DS, 112, 2)
    ax = 74
    ax = 114
    CALL RT_2732_6404(DS, 74, 1, DS, 114, 2)
    ax = "MENU"
    PUSH DS
    PUSH "MENU"
    ' xor ax,ax
    ax = 116
    CALL RT_2732_6404("MENU", DS, 116, 10)
    ax = "ESCAPE"
    PUSH DS
    PUSH "ESCAPE"
    ' xor ax,ax
    ax = 126
    CALL RT_2732_6404("ESCAPE", DS, 126, 10)
    CALL left_mouse_button_is_24897()
    CALL name_0AF8B()
    CALL proc_22430()
    IF var_0062 == 1 THEN GOTO label_06871
    GOTO label_0688A
    ax = 74
    ax = addr(local_E)
    PUSH DS
    PUSH 74
    PUSH 1
    PUSH DS
    PUSH addr(local_E)
    ' xor ax,ax
    CALL RT_2732_6404(addr(local_E))
    GOTO label_0690C
    IF local_18 == 0 THEN GOTO label_06893
    GOTO label_068EE
    CALL proc_243D9()
    di = ax
    si = addr(local_12)
    CALL near_027A3()
    di = addr(local_12)
    si = addr(local_E)
    CALL near_027A3()
    ax = 0
    IF var_008C == 0 THEN GOTO label_068B4
    ax = ax - 1
    cx = 0
    IF var_008E == 0 THEN GOTO label_068BF
    cx = cx - 1
    ' or cx,ax
    ' and cx,cx
    IF var_008E <> 0 THEN GOTO label_068C8
    GOTO label_068EB
    local_18 = 1
    CALL stay_12801(addr(local_18), addr(local_1A))
    di = ax
    si = addr(local_16)
    CALL near_027A3()
    di = addr(local_16)
    si = addr(local_E)
    CALL near_027A3()
    GOTO label_0690C
    CALL stay_12801(addr(local_18), addr(local_1A))
    di = ax
    si = addr(local_1E)
    CALL near_027A3()
    di = addr(local_1E)
    si = addr(local_E)
    CALL near_027A3()
    ax = 72
    CALL RT_2732_63DF(DS, 72, 1)
    CALL RT_2732_6130(1, addr(local_E))
    ax = 0
    IF var_008E <> 0 THEN GOTO label_0692A
    ax = ax - 1
    bx = ax
    local_24 = bx
    CALL RT_2732_6130(addr(local_E), &H7AD8)
    ax = 0
    IF var_008E <> 0 THEN GOTO label_06942
    ax = ax - 1
    ' or ax,[bp-0x24]
    ' and ax,ax
    IF var_008E <> 0 THEN GOTO label_0694C
    GOTO label_069D5
    CALL r_toggle_run_mode_on_off_16F5D()
    di = ax
    si = addr(local_22)
    CALL near_027A3()
    di = addr(local_22)
    si = addr(local_E)
    CALL near_027A3()
    CALL proc_0AA39()
    CALL RT_2732_6130(addr(local_E), &H6280)
    ax = 0
    IF var_008E == 0 THEN GOTO label_0697A
    ax = ax - 1
    bx = ax
    ax = 74
    local_26 = bx
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_E))
    ax = 0
    IF var_008E == 0 THEN GOTO label_0699D
    ax = ax - 1
    ' and ax,[bp-0x26]
    bx = ax
    local_28 = bx
    CALL RT_2732_6130(addr(local_E), &H6220)
    ax = 0
    IF var_008E == 0 THEN GOTO label_069B8
    ax = ax - 1
    cx = 0
    IF var_006E <> 0 THEN GOTO label_069C3
    cx = cx - 1
    ' or cx,ax
    ' and cx,[bp-0x28]
    ' and cx,cx
    IF var_006E <> 0 THEN GOTO label_069CF
    GOTO label_069D2
    GOTO label_069DC
    GOTO label_069D8
    GOTO label_069DC
    GOTO label_067FE
    di = addr(local_E)
    si = addr(local_2C)
    CALL near_027A3()
    CALL RT_2732_6130(addr(local_2C), &H6280)
    IF var_006E <> 0 THEN GOTO label_069F7
    GOTO label_06A14
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_2C))
    IF var_006E == 0 THEN GOTO label_06A14
    GOTO label_06A1F
    CALL dun_1A58C()
    GOTO label_06F1C
    GOTO label_06EFC
    ax = 48
    CALL RT_2732_63DF(DS, 48, 2)
    CALL RT_2732_6130(2, addr(local_2C))
    IF var_006E <> 0 THEN GOTO label_06A3C
    GOTO label_06A4E
    CALL RT_2732_6130(addr(local_2C), &H6250)
    IF var_006E == 0 THEN GOTO label_06A4E
    GOTO label_06A6C
    local_2E = 0
    local_30 = &HFFFF
    CALL experience_170C7(addr(local_18), addr(local_2E), addr(local_30))
    GOTO label_06EFC
    ax = 50
    CALL RT_2732_63DF(DS, 50, 2)
    CALL RT_2732_6130(2, addr(local_2C))
    IF var_006E <> 0 THEN GOTO label_06A89
    GOTO label_06A9B
    CALL RT_2732_6130(addr(local_2C), &H6274)
    IF var_006E == 0 THEN GOTO label_06A9B
    GOTO label_06AB9
    local_32 = 0
    local_34 = 1
    CALL experience_170C7(addr(local_18), addr(local_32), addr(local_34))
    GOTO label_06EFC
    ax = 52
    CALL RT_2732_63DF(DS, 52, 2)
    CALL RT_2732_6130(2, addr(local_2C))
    IF var_006E <> 0 THEN GOTO label_06AD6
    GOTO label_06AE8
    CALL RT_2732_6130(addr(local_2C), &H625C)
    IF var_006E == 0 THEN GOTO label_06AE8
    GOTO label_06B06
    local_36 = &HFFFF
    local_38 = 0
    CALL experience_170C7(addr(local_18), addr(local_36), addr(local_38))
    GOTO label_06EFC
    ax = 54
    CALL RT_2732_63DF(DS, 54, 2)
    CALL RT_2732_6130(2, addr(local_2C))
    IF var_006E <> 0 THEN GOTO label_06B23
    GOTO label_06B35
    CALL RT_2732_6130(addr(local_2C), &H6268)
    IF var_006E == 0 THEN GOTO label_06B35
    GOTO label_06B53
    local_3A = 1
    local_3C = 0
    CALL experience_170C7(addr(local_18), addr(local_3A), addr(local_3C))
    GOTO label_06EFC
    ax = 56
    CALL RT_2732_63DF(DS, 56, 2)
    CALL RT_2732_6130(2, addr(local_2C))
    IF var_006E <> 0 THEN GOTO label_06B70
    GOTO label_06B82
    CALL RT_2732_6130(addr(local_2C), &H6256)
    IF var_006E == 0 THEN GOTO label_06B82
    GOTO label_06BA0
    local_3E = 1
    local_40 = &HFFFF
    CALL experience_170C7(addr(local_18), addr(local_3E), addr(local_40))
    GOTO label_06EFC
    ax = 58
    CALL RT_2732_63DF(DS, 58, 2)
    CALL RT_2732_6130(2, addr(local_2C))
    IF var_006E <> 0 THEN GOTO label_06BBD
    GOTO label_06BCF
    CALL RT_2732_6130(addr(local_2C), &H627A)
    IF var_006E == 0 THEN GOTO label_06BCF
    GOTO label_06BED
    local_42 = 1
    local_44 = 1
    CALL experience_170C7(addr(local_18), addr(local_42), addr(local_44))
    GOTO label_06EFC
    ax = 60
    CALL RT_2732_63DF(DS, 60, 2)
    CALL RT_2732_6130(2, addr(local_2C))
    IF var_006E <> 0 THEN GOTO label_06C0A
    GOTO label_06C1C
    CALL RT_2732_6130(addr(local_2C), &H624A)
    IF var_006E == 0 THEN GOTO label_06C1C
    GOTO label_06C3A
    local_46 = &HFFFF
    local_48 = &HFFFF
    CALL experience_170C7(addr(local_18), addr(local_46), addr(local_48))
    GOTO label_06EFC
    ax = 62
    CALL RT_2732_63DF(DS, 62, 2)
    CALL RT_2732_6130(2, addr(local_2C))
    IF var_006E <> 0 THEN GOTO label_06C57
    GOTO label_06C69
    CALL RT_2732_6130(addr(local_2C), &H626E)
    IF var_006E == 0 THEN GOTO label_06C69
    GOTO label_06C87
    local_4A = &HFFFF
    local_4C = 1
    CALL experience_170C7(addr(local_18), addr(local_4A), addr(local_4C))
    GOTO label_06EFC
    ax = 64
    CALL RT_2732_63DF(DS, 64, 2)
    CALL RT_2732_6130(2, addr(local_2C))
    IF var_006E <> 0 THEN GOTO label_06CA4
    GOTO label_06CB6
    CALL RT_2732_6130(addr(local_2C), &H6262)
    IF var_006E == 0 THEN GOTO label_06CB6
    GOTO label_06CD4
    local_4E = 0
    local_50 = 0
    CALL experience_170C7(addr(local_18), addr(local_4E), addr(local_50))
    GOTO label_06EFC
    ax = 66
    CALL RT_2732_63DF(DS, 66, 2)
    CALL RT_2732_6130(2, addr(local_2C))
    IF var_006E <> 0 THEN GOTO label_06CF1
    GOTO label_06D15
    CALL RT_2732_6130(addr(local_2C), &H7ADE)
    IF var_006E <> 0 THEN GOTO label_06D03
    GOTO label_06D15
    CALL RT_2732_6130(addr(local_2C), &H7AE4)
    IF var_006E == 0 THEN GOTO label_06D15
    GOTO label_06DA2
    CALL proc_0AA39()
    IF var_01F2 == 0 THEN GOTO label_06D24
    GOTO label_06D63
    local_52 = 3
    local_54 = 42
    di = "You start running."
    si = addr(local_58)
    CALL near_027A3()
    local_5A = 0
    CALL locate_print_21DEA(addr(local_52), addr(local_54), addr(local_58), addr(local_5A))
    CALL free_string(addr(local_58))
    var_01F2 = 1
    GOTO label_06D9F
    local_5C = 3
    local_5E = 42
    di = "You slow your pace to a walk."
    si = addr(local_62)
    CALL near_027A3()
    local_64 = 0
    CALL locate_print_21DEA(addr(local_5C), addr(local_5E), addr(local_62), addr(local_64))
    CALL free_string(addr(local_62))
    var_01F2 = 0
    GOTO label_06EFC
    CALL RT_2732_6130(addr(local_2C), &H7B22)
    IF var_01F2 == 0 THEN GOTO label_06DB4
    GOTO label_06DBC
    CALL magic_resist_0B7DE()
    GOTO label_06EFC
    CALL RT_2732_6130(addr(local_2C), &H6286)
    IF var_01F2 == 0 THEN GOTO label_06DCE
    GOTO label_06DFB
    di = "HELPRUN"
    si = addr(local_68)
    CALL near_027A3()
    CALL sb_dat_21E13(addr(local_68))
    CALL free_string(addr(local_68))
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0D0CF()
    CALL proc_0C32E()
    GOTO label_06EFC
    CALL RT_2732_6130(addr(local_2C), &H7B34)
    IF var_01F2 == 0 THEN GOTO label_06E0D
    GOTO label_06E15
    CALL sing_a_song_108A6()
    GOTO label_06EFC
    CALL RT_2732_6130(addr(local_2C), &H7B3A)
    IF var_01F2 == 0 THEN GOTO label_06E27
    GOTO label_06E3D
    local_6A = 0
    CALL cast_a_spell_00423(addr(local_6A))
    CALL proc_0C32E()
    GOTO label_06EFC
    CALL RT_2732_6130(addr(local_2C), &H79DC)
    IF var_01F2 == 0 THEN GOTO label_06E4F
    GOTO label_06E7B
    di = &H6220
    si = addr(local_6E)
    CALL near_027A3()
    local_70 = 0
    CALL monster_dat_19049(addr(local_6E), addr(local_70))
    CALL free_string(addr(local_6E))
    CALL proc_0C32E()
    GOTO label_06EFC
    CALL RT_2732_6130(addr(local_2C), &H7B40)
    IF var_01F2 == 0 THEN GOTO label_06E8D
    GOTO label_06EA8
    local_72 = 0
    CALL wield_0684E(addr(local_72))
    CALL proc_0D0CF()
    CALL proc_0C32E()
    GOTO label_06EFC
    di = "UNKNOWN KEY WAS HIT "
    si = addr(local_76)
    CALL near_027A3()
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    di = ax
    si = addr(local_7A)
    CALL near_027A3()
    CALL proc_2311E(addr(local_76), addr(local_7A))
    ax = addr(local_7A)
    PUSH DS
    PUSH addr(local_7A)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_7A), DS, 79, 1)
    CALL free_string(addr(local_76))
    CALL free_string(addr(local_7A))
    ax = 0
    IF var_01F4 <> 0 THEN GOTO label_06F07
    ax = ax - 1
    cx = 0
    IF var_0112 <> 1 THEN GOTO label_06F12
    cx = cx - 1
    ' or cx,ax
    ' and cx,cx
    IF var_0112 <> 1 THEN GOTO label_06F1B
    GOTO label_067FE
    CALL free_string(addr(local_2C))
    CALL free_string(addr(local_22))
    CALL free_string(addr(local_1E))
    CALL free_string(addr(local_16))
    CALL free_string(addr(local_12))
    CALL free_string(addr(local_E))
    PROC_EXIT
    RETURN
    GOTO label_070C4
END SUB

SUB r_toggle_run_mode_on_off_16F5D  ' image &H16F5D, locals 42
  ' strings: (R) TOGGLE RUN MODE ON/OFF | (X) DISPLAY EXTENDED ATTRIBUTES | (H) HELP | (S) SING A SONG | (C) CAST A SPELL | (W) MAKE A WISH
    cx = 42
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 8, 4, &H8001, addr(local_1C))
    CALL proc_0AA39()
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(R) TOGGLE RUN MODE ON/OFF"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(X) DISPLAY EXTENDED ATTRIBUTES"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(H) HELP"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "(S) SING A SONG"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "(C) CAST A SPELL"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(6, 1)
    si = bx
    di = "(W) MAKE A WISH"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(7, 1)
    si = bx
    di = "(I) INVENTORY MAINTENANCE"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(8, 1)
    si = bx
    di = "(Q or ESC) CONTINUE RUNNING"
    CALL near_027A3()
    CALL proc_0AA39()
    local_1E = 8
    local_20 = 1
    local_22 = 42
    local_24 = 2
    local_26 = 2
    local_28 = 0
    local_2A = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_1E), addr(local_20), addr(local_22), addr(local_24), addr(local_26), addr(local_28), addr(local_30), addr(local_2A))
    di = ax
    si = addr(local_2E)
    CALL near_027A3()
    di = addr(local_2E)
    si = addr(local_34)
    CALL near_027A3()
    CALL free_string(addr(local_2E))
    CALL erase_array(addr(local_1C))
    CALL RT_2732_64F5(addr(local_34))
    PROC_EXIT
    RETURN
    GOTO label_07C49
END SUB

SUB experience_170C7  ' image &H170C7, locals 226
  ' strings: EXPERIENCE -  | DAMAGING MAGIC ITEM | You see the remnants of an | already-sprung trap.  Ah yes, | you remember it well. | You have found a secret door!
    cx = 226
    CALL frame_enter()
    ' float_D9
    ' float_D9
    si = arg_8
    ax = [si]
    ax = ax + var_028A
    local_10 = ax
    si = arg_6
    cx = [si]
    cx = cx + var_028C
    ax = cx
    local_12 = ax
    cx = 0
    IF local_10 >= 1 THEN GOTO label_070FF
    cx = cx - 1
    dx = 0
    IF local_10 <= 78 THEN GOTO label_07109
    dx = dx - 1
    ' or dx,cx
    cx = 0
    IF ax >= 1 THEN GOTO label_07114
    cx = cx - 1
    ' or cx,dx
    dx = 0
    IF ax <= 13 THEN GOTO label_0711F
    dx = dx - 1
    ' or dx,cx
    ' and dx,dx
    IF ax <> 13 THEN GOTO label_07128
    GOTO label_07136
    ' float_D9
    ' float_D9
    GOTO label_07C2F
    CALL proc_0A5C4(addr(local_12), addr(local_10), addr(local_16))
    ' float_D9
    ' float_D9
    IF var_00EA == 1 THEN GOTO label_0715B
    GOTO label_07169
    ' float_D9
    ' float_D9
    GOTO label_07C2F
    local_1C = 15
    local_1E = 0
    CALL color_25283(addr(local_1C), addr(local_1E))
    ax = var_021C
    dx = var_021E
    ax = ax + 1
    ' adc dx,0x0
    var_021C = ax
    var_021E = dx
    local_20 = 6
    local_22 = 2
    local_24 = 10
    CALL proc_25F90(addr(local_24), 540)
    di = ax
    si = addr(local_28)
    CALL near_027A3()
    di = addr(local_28)
    si = "EXPERIENCE - "
    CALL near_027AB()
    di = ax
    si = addr(local_2C)
    CALL near_027A3()
    local_2E = 0
    CALL locate_print_21DEA(addr(local_20), addr(local_22), addr(local_2C), addr(local_2E))
    CALL free_string(addr(local_2C))
    local_30 = 7
    local_32 = 0
    CALL color_25283(addr(local_30), addr(local_32))
    ' float_D9
    ax = var_01EA
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D9
    IF var_0238 > 0 THEN GOTO label_0722A
    GOTO label_07285
    ' float_D9
    ax = var_023E
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jnc 0x726a
    GOTO label_07285
    ax = var_023A
    IF ax > var_023C THEN GOTO label_07276
    GOTO label_0727A
    var_023C = var_023C + 1
    ' float_D9
    ' float_D9
    IF var_00B2 < 0 THEN GOTO label_0728F
    GOTO label_072B3
    var_01E2 = var_01E2 - 1
    CALL name_0AF8B()
    di = "DAMAGING MAGIC ITEM"
    si = addr(local_42)
    CALL near_027A3()
    CALL loss_of_str_007A9(addr(local_42))
    CALL free_string(addr(local_42))
    ax = var_01E4
    IF ax > var_01E2 THEN GOTO label_072BF
    GOTO label_073CA
    ax = 0
    IF var_00B2 <= 0 THEN GOTO label_072CA
    ax = ax - 1
    cx = 0
    IF var_020A <> 0 THEN GOTO label_072D5
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_020A <> 0 THEN GOTO label_072DE
    GOTO label_072F6
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    GOTO label_07383
    ax = 0
    IF var_0218 <> 1 THEN GOTO label_07301
    ax = ax - 1
    cx = 0
    IF var_020A <> 0 THEN GOTO label_0730C
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_020A <> 0 THEN GOTO label_07315
    GOTO label_0733D
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_D9
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    ' float_D9
    GOTO label_07383
    ax = 0
    IF var_020A <> 0 THEN GOTO label_07348
    ax = ax - 1
    cx = 0
    IF var_0218 <> 1 THEN GOTO label_07353
    cx = cx - 1
    ' or cx,ax
    ax = 0
    IF var_00B2 <= 0 THEN GOTO label_07360
    ax = ax - 1
    ' or ax,cx
    ' and ax,ax
    IF var_00B2 <> 0 THEN GOTO label_07369
    GOTO label_07383
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jnc 0x7397
    GOTO label_073CA
    ax = var_01E2
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    var_01E2 = ax
    ax = var_01E4
    IF ax < var_01E2 THEN GOTO label_073B7
    GOTO label_073BA
    var_01E2 = ax
    CALL name_0AF8B()
    ' float_D9
    ' float_D9
    IF var_00A2 > 0 THEN GOTO label_073D4
    GOTO label_07449
    ' float_D9
    ax = var_00A2
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jnc 0x7414
    GOTO label_07449
    ax = 1
    GOTO label_07436
    si = ax
    si = si * 2
    ax = var_1584[si]
    IF ax < var_1578[si] THEN GOTO label_0742B
    GOTO label_07432
    var_1584[si] = var_1584[si] + 1
    GOTO label_0743E
    ax = local_54
    ax = ax + 1
    local_54 = ax
    IF ax <= 5 THEN GOTO label_0741A
    ' float_D9
    ' float_D9
    ax = 78
    ' imul word [0x28c]
    ax = ax + var_028A
    ax = ax + &HFFB2
    CALL RT_2F00_0558()
    ' float_D9
    ax = 654
    CALL RT_2732_63DF(DS, 654, &H3F6)
    ' float_D9
    PUSH &H3F6
    CALL RT_2F00_056C()
    CALL RT_2732_6266(&H3F6, 1)
    di = ax
    si = addr(local_60)
    CALL near_027A3()
    ax = var_028A
    ax = ax + 1
    local_62 = ax
    ax = var_028C
    ax = ax + 10
    local_64 = ax
    local_56 = 11
    local_58 = 0
    CALL color_25283(addr(local_56), addr(local_58))
    local_66 = 0
    CALL locate_print_21DEA(addr(local_64), addr(local_62), addr(local_60), addr(local_66))
    local_68 = 7
    local_6A = 0
    CALL color_25283(addr(local_68), addr(local_6A))
    ax = local_10
    var_028A = ax
    ax = local_12
    var_028C = ax
    CALL you_can_see_again_147F8(arg_8, arg_6, addr(local_6E))
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == 5 THEN GOTO label_0751E
    GOTO label_07530
    si = arg_A
    [si] = 0
    ' float_D9
    ' float_D9
    ax = 0
    IF var_00D2 <> 0 THEN GOTO label_0753B
    ax = ax - 1
    cx = var_01F4
    cx = cx + 2
    dx = 0
    IF cx >= var_01E0 THEN GOTO label_0754C
    dx = dx - 1
    ' and dx,ax
    ' and dx,dx
    IF cx <> var_01E0 THEN GOTO label_07555
    GOTO label_07574
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    GOTO label_07590
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ax = 0
    IF var_0112 <> 0 THEN GOTO label_0759B
    ax = ax - 1
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_0112 <> 0 THEN GOTO label_075B3
    ax = ax - 1
    cx = 0
    IF var_00D2 <> 1 THEN GOTO label_075BE
    cx = cx - 1
    ' float_D9
    ' float_D9
    dx = ax
    CALL RT_2F00_05B3()
    ax = 0
    ' jnc 0x75d6
    ax = ax - 1
    ' and ax,cx
    ' or ax,dx
    ' and ax,bx
    ' and ax,ax
    IF var_00D2 <> 1 THEN GOTO label_075E3
    GOTO label_07668
    si = arg_A
    [si] = 0
    ' float_D9
    ' float_D9
    local_78 = 0
    CALL she_1B3FD(addr(local_78))
    IF var_0112 == 0 THEN GOTO label_0760D
    GOTO label_07668
    CALL proc_0D0CF()
    CALL name_0AF8B()
    CALL proc_0C32E()
    CALL mage_0C4A1()
    ax = 0
    IF var_0B00 <> 1 THEN GOTO label_0762C
    ax = ax - 1
    cx = 0
    IF var_0BAA == 0 THEN GOTO label_07637
    cx = cx - 1
    dx = 0
    IF var_0B26 <= 15 THEN GOTO label_07642
    dx = dx - 1
    ' or dx,cx
    ' and dx,ax
    ax = 0
    IF var_015A <> 1 THEN GOTO label_07651
    ax = ax - 1
    ' and ax,dx
    ' and ax,ax
    IF var_015A <> 1 THEN GOTO label_0765A
    GOTO label_07668
    local_7A = 1
    CALL enter_04E23(addr(local_7A))
    ' float_D9
    ' float_D9
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_D9
    ax = 0
    IF var_00EC <> 0 THEN GOTO label_0768D
    ax = ax - 1
    cx = 0
    IF var_0112 <> 1 THEN GOTO label_07698
    cx = cx - 1
    ' or cx,ax
    ax = 0
    IF var_0062 <> 1 THEN GOTO label_076A5
    ax = ax - 1
    ' or ax,cx
    ' and ax,ax
    IF var_0062 <> 1 THEN GOTO label_076AE
    GOTO label_076C0
    si = arg_A
    [si] = 0
    ' float_D9
    ' float_D9
    IF var_0112 == 0 THEN GOTO label_076CA
    GOTO label_07873
    IF var_00D8 == 1 THEN GOTO label_076D4
    GOTO label_076DC
    CALL lips_1388C()
    GOTO label_07873
    IF var_00DC == 1 THEN GOTO label_076E6
    GOTO label_076EE
    CALL hitpoints_17FE5()
    GOTO label_07873
    IF var_00F0 <> 0 THEN GOTO label_076F8
    GOTO label_07700
    CALL proc_1B043()
    GOTO label_07873
    IF var_00EE == 1 THEN GOTO label_0770A
    GOTO label_07712
    CALL sorcererslair_204A2()
    GOTO label_07873
    ax = 0
    IF var_00DE <> 1 THEN GOTO label_0771D
    ax = ax - 1
    cx = 0
    IF var_00B0 <> 0 THEN GOTO label_07728
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_00B0 <> 0 THEN GOTO label_07731
    GOTO label_07739
    CALL fortunately_you_avoid_it_03BA4()
    GOTO label_07873
    IF var_00E2 == 1 THEN GOTO label_07743
    GOTO label_07756
    local_84 = 0
    CALL enter_04E23(addr(local_84))
    GOTO label_07873
    IF var_00E0 == 1 THEN GOTO label_07760
    GOTO label_07825
    CALL proc_0AA39()
    local_86 = 2
    local_88 = 42
    di = "You see the remnants of an"
    si = addr(local_8C)
    CALL near_027A3()
    local_8E = 0
    CALL locate_print_21DEA(addr(local_86), addr(local_88), addr(local_8C), addr(local_8E))
    CALL free_string(addr(local_8C))
    local_90 = 3
    local_92 = 42
    di = "already-sprung trap.  Ah yes,"
    si = addr(local_96)
    CALL near_027A3()
    local_98 = 0
    CALL locate_print_21DEA(addr(local_90), addr(local_92), addr(local_96), addr(local_98))
    CALL free_string(addr(local_96))
    local_9A = 4
    local_9C = 42
    di = "you remember it well."
    si = addr(local_A0)
    CALL near_027A3()
    local_A2 = 0
    CALL locate_print_21DEA(addr(local_9A), addr(local_9C), addr(local_A0), addr(local_A2))
    CALL free_string(addr(local_A0))
    GOTO label_07873
    IF var_00E8 == 1 THEN GOTO label_0782F
    GOTO label_07873
    CALL proc_0AA39()
    local_A4 = 2
    local_A6 = 42
    di = "You have found a secret door!"
    si = addr(local_AA)
    CALL near_027A3()
    local_AC = 0
    CALL locate_print_21DEA(addr(local_A4), addr(local_A6), addr(local_AA), addr(local_AC))
    CALL free_string(addr(local_AA))
    IF var_0112 == 0 THEN GOTO label_0787D
    GOTO label_078C0
    CALL RT_2732_7413(var_021E, var_021C, var_010C, var_010A)
    IF var_0112 > 0 THEN GOTO label_07897
    GOTO label_0789C
    CALL mage_0C4A1()
    ax = 0
    IF var_00E4 <> 1 THEN GOTO label_078A7
    ax = ax - 1
    cx = 0
    IF var_00E6 <> 1 THEN GOTO label_078B2
    cx = cx - 1
    ' or cx,ax
    ' and cx,cx
    IF var_00E6 <> 1 THEN GOTO label_078BB
    GOTO label_078C0
    CALL down_17D7E()
    IF var_0216 > 0 THEN GOTO label_078CA
    GOTO label_0795C
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0216
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0216 == 0 THEN GOTO label_07908
    GOTO label_0795C
    var_0216 = 0
    CALL proc_0AA39()
    local_B2 = 2
    local_B4 = 42
    di = "You air shield drops!"
    si = addr(local_B8)
    CALL near_027A3()
    local_BA = 0
    CALL locate_print_21DEA(addr(local_B2), addr(local_B4), addr(local_B8), addr(local_BA))
    CALL free_string(addr(local_B8))
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0AA39()
    IF var_0210 >= 1 THEN GOTO label_07966
    GOTO label_079E6
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0210 == 1 THEN GOTO label_07999
    GOTO label_079E6
    var_0210 = var_0210 - 1
    local_BC = 2
    local_BE = 42
    di = "You feel yourself slowing down!"
    si = addr(local_C2)
    CALL near_027A3()
    local_C4 = 0
    CALL locate_print_21DEA(addr(local_BC), addr(local_BE), addr(local_C2), addr(local_C4))
    CALL free_string(addr(local_C2))
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0AA39()
    IF var_0212 == 1 THEN GOTO label_079F0
    GOTO label_07A7C
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0212 == 1 THEN GOTO label_07A23
    GOTO label_07A7C
    var_0212 = 0
    IF var_00BA == 0 THEN GOTO label_07A33
    GOTO label_07A7C
    local_C6 = 2
    local_C8 = 42
    di = "Your no-trap protection has worn off!"
    si = addr(local_CC)
    CALL near_027A3()
    local_CE = 0
    CALL locate_print_21DEA(addr(local_C6), addr(local_C8), addr(local_CC), addr(local_CE))
    CALL free_string(addr(local_CC))
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0AA39()
    IF var_020E > 0 THEN GOTO label_07A86
    GOTO label_07B13
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_020E
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_020E == 0 THEN GOTO label_07ABF
    GOTO label_07B13
    var_020E = 0
    CALL mage_0C4A1()
    local_D0 = 2
    local_D2 = 42
    di = "You start to turn visible again!"
    si = addr(local_D6)
    CALL near_027A3()
    local_D8 = 0
    CALL locate_print_21DEA(addr(local_D0), addr(local_D2), addr(local_D6), addr(local_D8))
    CALL free_string(addr(local_D6))
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0AA39()
    IF var_00B0 > 0 THEN GOTO label_07B1D
    GOTO label_07BF6
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_00B0
    ax = ax + 1
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D9
    si = arg_8
    [si] = 0
    si = arg_6
    [si] = 0
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00B0 == 0 THEN GOTO label_07B65
    GOTO label_07BB2
    local_DA = 4
    local_DC = 42
    di = "You start to wake up"
    si = addr(local_E0)
    CALL near_027A3()
    local_E2 = 0
    CALL locate_print_21DEA(addr(local_DA), addr(local_DC), addr(local_E0), addr(local_E2))
    CALL free_string(addr(local_E0))
    var_00B0 = 0
    CALL hit_any_key_to_continue_2434A()
    GOTO label_07BF1
    local_E4 = 4
    local_E6 = 42
    di = "You are sleeping"
    si = addr(local_EA)
    CALL near_027A3()
    local_EC = 0
    CALL locate_print_21DEA(addr(local_E4), addr(local_E6), addr(local_EA), addr(local_EC))
    CALL free_string(addr(local_EA))
    CALL proc_0AA39()
    ax = 0
    IF var_00B0 <> 0 THEN GOTO label_07C01
    ax = ax - 1
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_00B0 <> 0 THEN GOTO label_07C19
    ax = ax - 1
    cx = 0
    IF var_01F2 <> 0 THEN GOTO label_07C24
    cx = cx - 1
    ' or cx,ax
    ' and cx,bx
    ' and cx,cx
    IF var_01F2 <> 0 THEN GOTO label_07C2F
    GOTO label_070D0
    CALL free_string(addr(local_28))
    CALL free_string(addr(local_60))
    PROC_EXIT
    RETURN
    GOTO label_07D7B
END SUB

SUB dun_17C4C  ' image &H17C4C, locals 24
  ' strings: .DUN
    cx = 24
    CALL frame_enter()
    CALL proc_0A9DA()
    ax = 460
    CALL RT_2732_63DF(DS, 460, 8)
    CALL RT_2732_6374(8)
    si = ax
    di = ".DUN"
    CALL near_027AB()
    di = ax
    si = addr(local_E)
    CALL near_027A3()
    OPEN addr(local_E) FOR RANDOM AS #5 LEN = &H7F0
    CALL file_ah4(5)
    CALL RT_2F00_0559()
    ' float_DC
    ' float_D9
    ' float_D9
    ax = var_01F4
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF ? > ? THEN GOTO label_07CC3
    GOTO label_07CE2
    ' float_D9
    ' float_D8
    CALL RT_2F00_056C()
    var_01F4 = ax
    ' float_D9
    ' float_D9
    GOTO label_07D07
    GET #5, long(var_01F4), buffer(650) LEN = &H7F0
    ' float_D9
    ' float_D9
    CLOSE #5
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_07D29
    GOTO label_07D40
    IF var_01F4 < 30 THEN GOTO label_07D33
    GOTO label_07D3B
    CALL proc_15C0B()
    GOTO label_07D40
    CALL proc_15774()
    CALL proc_0C32E()
    local_18 = 0
    local_1A = 0
    CALL you_can_see_again_147F8(addr(local_18), addr(local_1A), addr(local_1E))
    ' float_D9
    ' float_D9
    CALL free_string(addr(local_E))
    PROC_EXIT
    RETURN
    GOTO label_07F3C
END SUB

SUB down_17D7E  ' image &H17D7E, locals 64
  ' strings: You have found some stairs going | up | down | .  Do you wish to take them?
    cx = 64
    CALL frame_enter()
    CALL proc_0AA39()
    local_C = 2
    local_E = 42
    di = "You have found some stairs going"
    si = addr(local_12)
    CALL near_027A3()
    local_14 = 0
    CALL locate_print_21DEA(addr(local_C), addr(local_E), addr(local_12), addr(local_14))
    CALL free_string(addr(local_12))
    IF var_00E4 == 1 THEN GOTO label_07DCB
    GOTO label_07E0F
    local_16 = 3
    local_18 = 42
    di = "up"
    si = addr(local_1C)
    CALL near_027A3()
    local_1E = 0
    CALL locate_print_21DEA(addr(local_16), addr(local_18), addr(local_1C), addr(local_1E))
    CALL free_string(addr(local_1C))
    ' float_D9
    ' float_D9
    GOTO label_07E50
    local_24 = 3
    local_26 = 42
    di = "down"
    si = addr(local_2A)
    CALL near_027A3()
    local_2C = 0
    CALL locate_print_21DEA(addr(local_24), addr(local_26), addr(local_2A), addr(local_2C))
    CALL free_string(addr(local_2A))
    ' float_D9
    ' float_D9
    di = ".  Do you wish to take them?"
    si = addr(local_30)
    CALL near_027A3()
    local_32 = 0
    CALL print_more_21DB9(addr(local_30), addr(local_32))
    CALL free_string(addr(local_30))
    local_34 = 5
    local_36 = 42
    local_38 = 1
    CALL y_yes_26031(addr(local_34), addr(local_36), addr(local_38))
    di = ax
    si = addr(local_3C)
    CALL near_027A3()
    di = addr(local_3C)
    si = addr(local_40)
    CALL near_027A3()
    CALL proc_0AA39()
    CALL RT_2732_6130(addr(local_40), &H7804)
    IF var_00E4 == 1 THEN GOTO label_07EBC
    GOTO label_07F22
    CALL dun_1A58C()
    ax = var_01F4
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    var_01F4 = ax
    IF var_01F4 > 0 THEN GOTO label_07EDF
    GOTO label_07F22
    local_42 = 9
    local_44 = 41
    CALL RT_2732_62BC(38)
    di = ax
    si = addr(local_48)
    CALL near_027A3()
    local_4A = 0
    CALL locate_print_21DEA(addr(local_42), addr(local_44), addr(local_48), addr(local_4A))
    CALL free_string(addr(local_48))
    CALL dun_17C4C()
    CALL free_string(addr(local_3C))
    CALL free_string(addr(local_40))
    PROC_EXIT
    RETURN
    GOTO label_07FE2
END SUB

SUB sorcerer_s_bane_17F3F  ' image &H17F3F, locals 4
  ' strings: SORCERER'S BANE
    cx = 4
    CALL frame_enter()
    ax = &HAE6
    ax = 79
    CALL RT_2732_6404(DS, &HAE6, 1, DS, 79, 1)
    ax = var_0ADE
    var_0056 = ax
    ax = var_0AE2
    var_0066 = ax
    ax = var_0AE0
    var_0050 = ax
    ax = var_0AE4
    var_008A = ax
    di = "SORCERER'S BANE"
    si = addr(local_E)
    CALL near_027A3()
    CALL no_212EF(addr(local_E))
    CALL free_string(addr(local_E))
    ax = 79
    ax = &HAE6
    CALL RT_2732_6404(DS, 79, 1, DS, &HAE6, 1)
    ax = var_0056
    var_0ADE = ax
    ax = var_0066
    var_0AE2 = ax
    ax = var_0050
    var_0AE0 = ax
    ax = var_008A
    var_0AE4 = ax
    CALL RT_2732_02EF(7, long(var_0096), buffer(&HA90), 87)
    PROC_EXIT
    RETURN
    GOTO label_086A7
END SUB

SUB hitpoints_17FE5  ' image &H17FE5, locals 118
  ' strings: You see a throne before you. Do you | wish to sit on it? ('Y' or 'N') | A Styxian haze surrounds the chair! | You feel it draining you of energy! | You wake with less experience and | hitpoints
    cx = 118
    CALL frame_enter()
    CALL proc_0AA39()
    local_C = 2
    local_E = 42
    di = "You see a throne before you. Do you"
    si = addr(local_12)
    CALL near_027A3()
    local_14 = 0
    CALL locate_print_21DEA(addr(local_C), addr(local_E), addr(local_12), addr(local_14))
    CALL free_string(addr(local_12))
    local_16 = 3
    local_18 = 42
    di = "wish to sit on it? ('Y' or 'N')"
    si = addr(local_1C)
    CALL near_027A3()
    local_1E = 0
    CALL locate_print_21DEA(addr(local_16), addr(local_18), addr(local_1C), addr(local_1E))
    CALL free_string(addr(local_1C))
    local_20 = 5
    local_22 = 42
    local_24 = 1
    CALL y_yes_26031(addr(local_20), addr(local_22), addr(local_24))
    di = ax
    si = addr(local_28)
    CALL near_027A3()
    di = addr(local_28)
    si = addr(local_2C)
    CALL near_027A3()
    CALL RT_2732_6130(addr(local_2C), &H719E)
    IF ? == ? THEN GOTO label_080A1
    GOTO label_080A9
    CALL proc_0AA39()
    GOTO label_08660
    local_2E = 5
    local_30 = 42
    CALL RT_2732_62BC(38)
    di = ax
    si = addr(local_34)
    CALL near_027A3()
    local_36 = 0
    CALL locate_print_21DEA(addr(local_2E), addr(local_30), addr(local_34), addr(local_36))
    CALL free_string(addr(local_34))
    IF var_00DA == 1 THEN GOTO label_080F1
    GOTO label_08115
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    GOTO label_08120
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00DA == 1 THEN GOTO label_0813F
    GOTO label_0817A
    di = "A Styxian haze surrounds the chair!"
    si = addr(local_42)
    CALL near_027A3()
    di = "You feel it draining you of energy!"
    si = addr(local_46)
    CALL near_027A3()
    di = "You wake with less experience and"
    si = addr(local_4A)
    CALL near_027A3()
    di = "hitpoints"
    si = addr(local_4E)
    CALL near_027A3()
    ax = var_010E
    dx = var_0110
    ax = ax + &HFC18
    ' adc dx,0xffffffffffffffff
    var_021C = ax
    var_021E = dx
    GOTO label_0857D
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00DA == 1 THEN GOTO label_0818F
    GOTO label_081D0
    di = "As you sit down, a kobold grabs your"
    si = addr(local_42)
    CALL near_027A3()
    di = "gold pouch and runs!"
    si = addr(local_46)
    CALL near_027A3()
    PUSH var_0222
    PUSH var_0220
    ' xor ax,ax
    ' cwd
    CALL RT_2732_7413(DX, ax)
    IF var_00DA == 1 THEN GOTO label_081B8
    GOTO label_081C1
    di = "Good thing you didn't own anything!"
    si = addr(local_4E)
    CALL near_027A3()
    var_0220 = 0
    var_0222 = 0
    GOTO label_0857D
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00DA == 1 THEN GOTO label_081E5
    GOTO label_0825A
    di = "An electric shock runs through you!"
    si = addr(local_42)
    CALL near_027A3()
    di = "Your body is permanently damaged!"
    si = addr(local_46)
    CALL near_027A3()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_01EA
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    ax = ax - 1
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D9
    ax = var_01E4
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    var_01E4 = ax
    ax = var_01E2
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    var_01E2 = ax
    GOTO label_0857D
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00DA == 1 THEN GOTO label_0826F
    GOTO label_082EC
    di = "You cut yourself DEEPLY on one of"
    si = addr(local_42)
    CALL near_027A3()
    di = "the rusty springs in the cushion!"
    si = addr(local_46)
    CALL near_027A3()
    di = "You don't feel so good!"
    si = addr(local_4A)
    CALL near_027A3()
    IF var_01EA > 0 THEN GOTO label_08294
    GOTO label_082BB
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_01EA
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ax = var_01E2
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    var_01E2 = ax
    IF var_00CC == 1 THEN GOTO label_082D9
    GOTO label_082E5
    di = "(At least you didn't get sick!)"
    si = addr(local_4E)
    CALL near_027A3()
    GOTO label_082E9
    var_020A = var_020A + 1
    GOTO label_0857D
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00CC == 1 THEN GOTO label_08301
    GOTO label_0838C
    di = "The local denizens, realizing you are"
    si = addr(local_42)
    CALL near_027A3()
    di = "not their king, beat you to a bloody"
    si = addr(local_46)
    CALL near_027A3()
    di = "pulp and take all you own!  (At least"
    si = addr(local_4A)
    CALL near_027A3()
    di = "they let you keep what you have on!)"
    si = addr(local_4E)
    CALL near_027A3()
    var_0220 = 0
    var_0222 = 0
    ax = var_01E2
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    var_01E2 = ax
    ax = var_012F
    local_58 = ax
    ax = 1
    GOTO label_08381
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    ax = ax + 64
    si = ax
    IF [si] == 0 THEN GOTO label_08374
    GOTO label_0837D
    CALL proc_04D9D(addr(local_5A))
    ax = local_5A
    ax = ax + 1
    local_5A = ax
    IF ax <= local_58 THEN GOTO label_0835E
    GOTO label_0857D
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_58 THEN GOTO label_083A1
    GOTO label_083C3
    di = "A djinni appears.  Mistaking you for"
    si = addr(local_42)
    CALL near_027A3()
    di = "the king, it grants you a wish, then"
    si = addr(local_46)
    CALL near_027A3()
    di = "disappears in a cloud of smoke!"
    si = addr(local_4A)
    CALL near_027A3()
    var_020C = var_020C + 1
    GOTO label_0857D
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_58 THEN GOTO label_083D8
    GOTO label_08402
    di = "A healing mist rises from the"
    si = addr(local_42)
    CALL near_027A3()
    di = "cushion!  The mist makes you"
    si = addr(local_46)
    CALL near_027A3()
    di = "feel very good!"
    si = addr(local_4A)
    CALL near_027A3()
    ax = var_01E4
    var_01E2 = ax
    var_020A = 0
    GOTO label_0857D
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_58 THEN GOTO label_08417
    GOTO label_0847E
    di = "A warm massage runs through you!"
    si = addr(local_42)
    CALL near_027A3()
    di = "You body feels that it could take"
    si = addr(local_46)
    CALL near_027A3()
    di = "more abuse than before!"
    si = addr(local_4A)
    CALL near_027A3()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ax = var_01E4
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    var_01E4 = ax
    ax = var_01E2
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    var_01E2 = ax
    GOTO label_0857D
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_58 THEN GOTO label_08493
    GOTO label_084E7
    di = "The local denizens, mistaking you for"
    si = addr(local_42)
    CALL near_027A3()
    di = "their king, start throwing gold!"
    si = addr(local_46)
    CALL near_027A3()
    di = "You manage to pick it all up."
    si = addr(local_4A)
    CALL near_027A3()
    ax = var_0220
    dx = var_0222
    CALL RT_2F00_0559()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_DE
    ' float_DC
    CALL RT_2F00_057D()
    var_0220 = ax
    var_0222 = dx
    GOTO label_0857D
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_58 THEN GOTO label_084FC
    GOTO label_08550
    di = "A Mnemonadian haze surrounds the"
    si = addr(local_42)
    CALL near_027A3()
    di = "chair! You realize things you never"
    si = addr(local_46)
    CALL near_027A3()
    di = "knew!"
    si = addr(local_4A)
    CALL near_027A3()
    ax = var_021C
    dx = var_021E
    CALL RT_2F00_0559()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_DE
    ' float_DC
    CALL RT_2F00_057D()
    var_021C = ax
    var_021E = dx
    GOTO label_0857D
    di = "Oh sure. No big deal. Go ahead and"
    si = addr(local_42)
    CALL near_027A3()
    di = "rest. It's only the entire realm at"
    si = addr(local_46)
    CALL near_027A3()
    di = "stake. I wouldn't want you miss your"
    si = addr(local_4A)
    CALL near_027A3()
    di = "beauty sleep! (Jeez! All the heroes"
    si = addr(local_4E)
    CALL near_027A3()
    di = "in the world and we get a schmutz!)"
    si = addr(local_5E)
    CALL near_027A3()
    local_60 = 4
    local_62 = 42
    local_64 = 0
    CALL locate_print_21DEA(addr(local_60), addr(local_62), addr(local_42), addr(local_64))
    local_66 = 5
    local_68 = 42
    local_6A = 0
    CALL locate_print_21DEA(addr(local_66), addr(local_68), addr(local_46), addr(local_6A))
    local_6C = 6
    local_6E = 42
    local_70 = 0
    CALL locate_print_21DEA(addr(local_6C), addr(local_6E), addr(local_4A), addr(local_70))
    local_72 = 7
    local_74 = 42
    local_76 = 0
    CALL locate_print_21DEA(addr(local_72), addr(local_74), addr(local_4E), addr(local_76))
    local_78 = 8
    local_7A = 42
    local_7C = 0
    CALL locate_print_21DEA(addr(local_78), addr(local_7A), addr(local_5E), addr(local_7C))
    CALL hit_any_key_to_continue_2434A()
    CALL proc_0AA39()
    di = "THRONE"
    si = addr(local_80)
    CALL near_027A3()
    CALL loss_of_str_007A9(addr(local_80))
    CALL free_string(addr(local_80))
    CALL mage_0C4A1()
    CALL name_0AF8B()
    CALL free_string(addr(local_28))
    CALL free_string(addr(local_2C))
    CALL free_string(addr(local_5E))
    CALL free_string(addr(local_4E))
    CALL free_string(addr(local_4A))
    CALL free_string(addr(local_46))
    CALL free_string(addr(local_42))
    PROC_EXIT
    RETURN
    GOTO label_09046
END SUB

SUB maximum_users_allowed_186AA  ' image &H186AA, locals 72
  ' strings: MAXIMUM USERS ALLOWED: | The maximum number of users SB can allocate (Blank or zero for unlimited) | MAX (LIVE) CHARACTERS: | The number of live characters each user can have (Blank or zero for unlimited) | STARTING BLOCKED HOUR: | The starting hour that SB is blocked on this system (Blank or zero for none)
    cx = 72
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 6, 193, 513, addr(local_1C))
    CALL near_08FB0()
    ax = "MAXIMUM USERS ALLOWED:"
    PUSH DS
    PUSH "MAXIMUM USERS ALLOWED:"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("MAXIMUM USERS ALLOWED:", 1, 1)
    CALL RT_2732_6404(ES, BX, 23)
    bx = addr(local_1C)
    CALL array_element(1, 1)
    bx = bx + 23
    [es:bx] = 3
    bx = addr(local_1C)
    CALL array_element(1, 1)
    bx = bx + 25
    [es:bx] = ax
    bx = addr(local_1C)
    CALL array_element(1, 1)
    bx = bx + 97
    [es:bx] = 3
    CALL RT_2732_62BC(70)
    PUSH DS
    PUSH 70
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(70, 1, 1)
    bx = bx + 27
    CALL RT_2732_6404(ES, BX, 70)
    bx = addr(local_1C)
    CALL array_element(1, 1)
    bx = bx + 99
    [es:bx] = ax
    bx = addr(local_1C)
    CALL array_element(1, 1)
    bx = bx + 101
    [es:bx] = 0
    [es:bx+0x2] = 0
    bx = addr(local_1C)
    CALL array_element(1, 1)
    bx = bx + 105
    [es:bx] = 999
    [es:bx+0x2] = 0
    bx = addr(local_1C)
    CALL array_element(1, 1)
    bx = bx + 109
    [es:bx] = 0
    [es:bx+0x2] = 0
    ax = "The maximum number of users SB can allocate (Blank or zero for unlimited)"
    PUSH DS
    PUSH "The maximum number of users SB can allocate (Blank or zero for unlimited)"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("The maximum number of users SB can allocate (Blank or zero for unlimited)", 1, 1)
    bx = bx + 113
    CALL RT_2732_6404(ES, BX, 80)
    ax = "MAX (LIVE) CHARACTERS:"
    PUSH DS
    PUSH "MAX (LIVE) CHARACTERS:"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("MAX (LIVE) CHARACTERS:", 2, 1)
    CALL RT_2732_6404(ES, BX, 23)
    bx = addr(local_1C)
    CALL array_element(2, 1)
    bx = bx + 23
    [es:bx] = 3
    bx = addr(local_1C)
    CALL array_element(2, 1)
    bx = bx + 25
    [es:bx] = 40
    bx = addr(local_1C)
    CALL array_element(2, 1)
    bx = bx + 97
    [es:bx] = 2
    CALL RT_2732_62BC(70)
    PUSH DS
    PUSH 70
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(70, 2, 1)
    bx = bx + 27
    CALL RT_2732_6404(ES, BX, 70)
    bx = addr(local_1C)
    CALL array_element(2, 1)
    bx = bx + 99
    [es:bx] = ax
    bx = addr(local_1C)
    CALL array_element(2, 1)
    bx = bx + 101
    [es:bx] = 0
    [es:bx+0x2] = 0
    bx = addr(local_1C)
    CALL array_element(2, 1)
    bx = bx + 105
    [es:bx] = 99
    [es:bx+0x2] = 0
    bx = addr(local_1C)
    CALL array_element(2, 1)
    bx = bx + 109
    [es:bx] = 0
    [es:bx+0x2] = 0
    ax = "The number of live characters each user can have (Blank or zero for unlimited)"
    PUSH DS
    PUSH "The number of live characters each user can have (Blank or zero for unlimited)"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("The number of live characters each user can have (Blank or zero for unlimited)", 2, 1)
    bx = bx + 113
    CALL RT_2732_6404(ES, BX, 80)
    ax = "STARTING BLOCKED HOUR:"
    PUSH DS
    PUSH "STARTING BLOCKED HOUR:"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("STARTING BLOCKED HOUR:", 3, 1)
    CALL RT_2732_6404(ES, BX, 23)
    bx = addr(local_1C)
    CALL array_element(3, 1)
    bx = bx + 23
    [es:bx] = 6
    bx = addr(local_1C)
    CALL array_element(3, 1)
    bx = bx + 25
    [es:bx] = ax
    bx = addr(local_1C)
    CALL array_element(3, 1)
    bx = bx + 97
    [es:bx] = 2
    CALL RT_2732_62BC(70)
    PUSH DS
    PUSH 70
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(70, 3, 1)
    bx = bx + 27
    CALL RT_2732_6404(ES, BX, 70)
    bx = addr(local_1C)
    CALL array_element(3, 1)
    bx = bx + 99
    [es:bx] = ax
    bx = addr(local_1C)
    CALL array_element(3, 1)
    bx = bx + 101
    [es:bx] = 0
    [es:bx+0x2] = 0
    bx = addr(local_1C)
    CALL array_element(3, 1)
    bx = bx + 105
    [es:bx] = 23
    [es:bx+0x2] = 0
    bx = addr(local_1C)
    CALL array_element(3, 1)
    bx = bx + 109
    [es:bx] = 0
    [es:bx+0x2] = 0
    ax = "The starting hour that SB is blocked on this system (Blank or zero for none)"
    PUSH DS
    PUSH "The starting hour that SB is blocked on this system (Blank or zero for none)"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("The starting hour that SB is blocked on this system (Blank or zero for none)", 3, 1)
    bx = bx + 113
    CALL RT_2732_6404(ES, BX, 80)
    ax = "HOURS BLOCKED:"
    PUSH DS
    PUSH "HOURS BLOCKED:"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("HOURS BLOCKED:", 4, 1)
    CALL RT_2732_6404(ES, BX, 23)
    bx = addr(local_1C)
    CALL array_element(4, 1)
    bx = bx + 23
    [es:bx] = 6
    bx = addr(local_1C)
    CALL array_element(4, 1)
    bx = bx + 25
    [es:bx] = 40
    bx = addr(local_1C)
    CALL array_element(4, 1)
    bx = bx + 97
    [es:bx] = 2
    CALL RT_2732_62BC(70)
    PUSH DS
    PUSH 70
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(70, 4, 1)
    bx = bx + 27
    CALL RT_2732_6404(ES, BX, 70)
    bx = addr(local_1C)
    CALL array_element(4, 1)
    bx = bx + 99
    [es:bx] = ax
    bx = addr(local_1C)
    CALL array_element(4, 1)
    bx = bx + 101
    [es:bx] = 0
    [es:bx+0x2] = 0
    bx = addr(local_1C)
    CALL array_element(4, 1)
    bx = bx + 105
    [es:bx] = 23
    [es:bx+0x2] = 0
    bx = addr(local_1C)
    CALL array_element(4, 1)
    bx = bx + 109
    [es:bx] = 0
    [es:bx+0x2] = 0
    ax = "The number of hours you wish to block out (Blank or zero for none)"
    PUSH DS
    PUSH "The number of hours you wish to block out (Blank or zero for none)"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("The number of hours you wish to block out (Blank or zero for none)", 4, 1)
    bx = bx + 113
    CALL RT_2732_6404(ES, BX, 80)
    ax = "MAX MINUTES OF PLAY:"
    PUSH DS
    PUSH "MAX MINUTES OF PLAY:"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("MAX MINUTES OF PLAY:", 5, 1)
    CALL RT_2732_6404(ES, BX, 23)
    bx = addr(local_1C)
    CALL array_element(5, 1)
    bx = bx + 23
    [es:bx] = 8
    bx = addr(local_1C)
    CALL array_element(5, 1)
    bx = bx + 25
    [es:bx] = ax
    bx = addr(local_1C)
    CALL array_element(5, 1)
    bx = bx + 97
    [es:bx] = 4
    CALL RT_2732_62BC(70)
    PUSH DS
    PUSH 70
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(70, 5, 1)
    bx = bx + 27
    CALL RT_2732_6404(ES, BX, 70)
    bx = addr(local_1C)
    CALL array_element(5, 1)
    bx = bx + 99
    [es:bx] = ax
    bx = addr(local_1C)
    CALL array_element(5, 1)
    bx = bx + 101
    [es:bx] = 0
    [es:bx+0x2] = 0
    bx = addr(local_1C)
    CALL array_element(5, 1)
    bx = bx + 105
    [es:bx] = &H5A0
    [es:bx+0x2] = 0
    bx = addr(local_1C)
    CALL array_element(5, 1)
    bx = bx + 109
    [es:bx] = 0
    [es:bx+0x2] = 0
    ax = "The number of minutes a character can play SB (Blank or zero for unlimited)"
    PUSH DS
    PUSH "The number of minutes a character can play SB (Blank or zero for unlimited)"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("The number of minutes a character can play SB (Blank or zero for unlimited)", 5, 1)
    bx = bx + 113
    CALL RT_2732_6404(ES, BX, 80)
    ax = "SB SYSTEM PASSWORD:"
    PUSH DS
    PUSH "SB SYSTEM PASSWORD:"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("SB SYSTEM PASSWORD:", 6, 1)
    CALL RT_2732_6404(ES, BX, 23)
    bx = addr(local_1C)
    CALL array_element(6, 1)
    bx = bx + 23
    [es:bx] = 11
    bx = addr(local_1C)
    CALL array_element(6, 1)
    bx = bx + 25
    [es:bx] = ax
    bx = addr(local_1C)
    CALL array_element(6, 1)
    bx = bx + 97
    [es:bx] = 10
    CALL RT_2732_62BC(70)
    PUSH DS
    PUSH 70
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(70, 6, 1)
    bx = bx + 27
    CALL RT_2732_6404(ES, BX, 70)
    bx = addr(local_1C)
    CALL array_element(6, 1)
    bx = bx + 99
    [es:bx] = 0
    bx = addr(local_1C)
    CALL array_element(6, 1)
    bx = bx + 101
    [es:bx] = 0
    [es:bx+0x2] = 0
    bx = addr(local_1C)
    CALL array_element(6, 1)
    bx = bx + 105
    [es:bx] = 0
    [es:bx+0x2] = 0
    bx = addr(local_1C)
    CALL array_element(6, 1)
    bx = bx + 109
    [es:bx] = 0
    [es:bx+0x2] = 0
    ax = "Enter the SB ADMINISTRATOR'S PASSWORD (Blank for none)"
    PUSH DS
    PUSH "Enter the SB ADMINISTRATOR'S PASSWORD (Blank for none)"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("Enter the SB ADMINISTRATOR'S PASSWORD (Blank for none)", 6, 1)
    bx = bx + 113
    CALL RT_2732_6404(ES, BX, 80)
    local_1E = 1
    local_20 = 1
    CALL number_must_be_between_23A06(addr(local_1C), addr(local_22), addr(local_1E), addr(local_20))
    CALL near_08DE7()
    CALL RT_2732_02EF(10, long(1), buffer(&HA7A), 21)
    GOTO label_0901A
    local_26 = 1
    local_24 = 0
    CALL number_must_be_between_23A06(addr(local_1C), addr(local_22), addr(local_26), addr(local_24))
    CALL near_08F1D()
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_08E1E
    GOTO label_08F17
    bx = addr(local_1C)
    CALL array_element(1, 1)
    bx = bx + 109
    ax = [es:bx]
    var_0A7B = ax
    bx = addr(local_1C)
    CALL array_element(2, 1)
    bx = bx + 109
    ax = [es:bx]
    var_0A7D = ax
    bx = addr(local_1C)
    CALL array_element(3, 1)
    bx = bx + 109
    ax = [es:bx]
    var_0A7F = ax
    bx = addr(local_1C)
    CALL array_element(4, 1)
    bx = bx + 109
    ax = [es:bx]
    var_0A81 = ax
    bx = addr(local_1C)
    CALL array_element(5, 1)
    bx = bx + 109
    ax = [es:bx]
    var_0A83 = ax
    bx = addr(local_1C)
    CALL array_element(6, 1)
    bx = bx + 27
    CALL RT_2732_63DF(ES, BX, 70)
    di = ax
    si = addr(local_2A)
    CALL near_027A3()
    CALL proc_23059(addr(local_2A))
    di = ax
    si = addr(local_2E)
    CALL near_027A3()
    ax = addr(local_2A)
    PUSH DS
    PUSH addr(local_2A)
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element(addr(local_2A), 6, 1)
    bx = bx + 27
    CALL RT_2732_6404(ES, BX, 70)
    CALL free_string(addr(local_2A))
    ax = addr(local_2E)
    PUSH DS
    PUSH addr(local_2E)
    ' xor ax,ax
    ax = &HA85
    CALL RT_2732_6404(addr(local_2E), DS, &HA85, 10)
    GOTO label_08F1C
    CALL wood_software_development_0D2B8()
    RETURN
    PUSH 1
    PUSH 24
    PUSH 1
    PUSH 1
    PUSH 4
    CALL RT_2732_680E()
    PUSH "Is this the correct system setup?"
    CALL RT_2732_591B()
    local_34 = 24
    local_36 = 35
    local_38 = 1
    CALL y_yes_26031(addr(local_34), addr(local_36), addr(local_38))
    di = ax
    si = addr(local_3C)
    CALL near_027A3()
    di = addr(local_3C)
    si = addr(local_40)
    CALL near_027A3()
    PUSH 1
    PUSH 24
    PUSH 1
    PUSH 1
    PUSH 4
    CALL RT_2732_680E()
    CALL RT_2732_62BC(79)
    PUSH 79
    CALL RT_2732_591B()
    CALL RT_2732_6130(addr(local_40), &H7804)
    IF ? == ? THEN GOTO label_08FA4
    GOTO label_08FAF
    ' float_D9
    ' float_D9
    RETURN
    local_42 = 1
    local_44 = 25
    CALL proc_21194(addr(local_42), addr(local_44))
    local_46 = 15
    local_48 = 0
    CALL color_25283(addr(local_46), addr(local_48))
    local_4A = 1
    local_4C = 34
    di = "SYSTEM SCREEN"
    si = addr(local_50)
    CALL near_027A3()
    local_52 = 0
    CALL locate_print_21DEA(addr(local_4A), addr(local_4C), addr(local_50), addr(local_52))
    CALL free_string(addr(local_50))
    local_22 = 6
    RETURN
    CALL free_string(addr(local_3C))
    CALL free_string(addr(local_2E))
    CALL free_string(addr(local_40))
    CALL erase_array(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_0A589
END SUB

SUB monster_dat_19049  ' image &H19049, locals 630
  ' strings: ALLYN | MAKE A WISH | You picture what you want in your mind's eye and concentrate REAL hard. | After a while, Allyn appears in a cloud of smoke! | 'Look,' he chuckles, 'you can stand there all day with that constipated | look on your face, but until you have a wish granted to you by some of the
    cx = 630
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, var_0139, 4, &H8001, addr(local_1C))
    ' xor ax,ax
    CALL RT_2732_24B9(addr(local_1C), var_0139, 2, 513, addr(local_2E))
    CALL RT_2732_6130(arg_8, "ALLYN")
    ax = 0
    IF ? <> ? THEN GOTO label_09093
    ax = ax - 1
    si = arg_6
    cx = 0
    IF [si] <> 1 THEN GOTO label_0909F
    cx = cx - 1
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 1 THEN GOTO label_090A8
    GOTO label_090B2
    CALL proc_0D0CF()
    CALL name_0AF8B()
    CALL proc_0AA39()
    CALL proc_0A9DA()
    local_F4 = 15
    local_F6 = 0
    CALL color_25283(addr(local_F4), addr(local_F6))
    local_F8 = 11
    local_FA = 34
    di = "MAKE A WISH"
    si = addr(local_FE)
    CALL near_027A3()
    local_100 = 0
    CALL locate_print_21DEA(addr(local_F8), addr(local_FA), addr(local_FE), addr(local_100))
    CALL free_string(addr(local_FE))
    local_102 = 11
    local_104 = 0
    CALL color_25283(addr(local_102), addr(local_104))
    IF var_020C == 0 THEN GOTO label_0913B
    GOTO label_09201
    CALL RT_2732_6130(arg_8, "ALLYN")
    IF var_020C == 0 THEN GOTO label_0914C
    GOTO label_09195
    di = "You picture what you want in your mind's eye and concentrate REAL hard."
    si = addr(local_108)
    CALL near_027A3()
    di = "After a while, Allyn appears in a cloud of smoke!"
    si = addr(local_10C)
    CALL near_027A3()
    di = "'Look,' he chuckles, 'you can stand there all day with that constipated"
    si = addr(local_110)
    CALL near_027A3()
    di = "look on your face, but until you have a wish granted to you by some of the"
    si = addr(local_114)
    CALL near_027A3()
    di = "characters in the dungeon, or by certain magical items, you're just out of"
    si = addr(local_118)
    CALL near_027A3()
    di = "luck!'"
    si = addr(local_11C)
    CALL near_027A3()
    di = "You feel foolish as he disappears."
    si = addr(local_120)
    CALL near_027A3()
    GOTO label_091DB
    di = "You picture what you want in your mind's eye and concentrate REAL hard."
    si = addr(local_108)
    CALL near_027A3()
    di = "After a while a djinni appears in a cloud of smoke!"
    si = addr(local_10C)
    CALL near_027A3()
    di = "'Strange one' the djinni booms. 'Get on with your adventure!  It is"
    si = addr(local_110)
    CALL near_027A3()
    di = "obvious that you should leave the deep concentratration to those with"
    si = addr(local_114)
    CALL near_027A3()
    di = "intelligence.  You cannot make a wish until one is granted to you by"
    si = addr(local_118)
    CALL near_027A3()
    di = "one of the dungeon inhabitants or by certain magical items.'"
    si = addr(local_11C)
    CALL near_027A3()
    di = "You feel foolish as he disappears."
    si = addr(local_120)
    CALL near_027A3()
    CALL near_0A30F()
    local_122 = 7
    local_124 = 0
    CALL color_25283(addr(local_122), addr(local_124))
    CALL hit_any_key_to_continue_2434A()
    GOTO label_0A493
    CALL RT_2732_6130(arg_8, "ALLYN")
    IF var_020C == 0 THEN GOTO label_09212
    GOTO label_09257
    di = "You picture what you want in your mind's eye and concentrate REAL hard."
    si = addr(local_108)
    CALL near_027A3()
    di = "After a while, Allyn appears in a cloud of smoke!  After a fit of coughing"
    si = addr(local_10C)
    CALL near_027A3()
    di = "and muttering something about never finding a djinni when you need one, you"
    si = addr(local_128)
    CALL near_027A3()
    di = "catch his attention.  After a look of consternation, he finally speaks."
    si = addr(local_110)
    CALL near_027A3()
    di = "'Now where were we? Oh yes. Ahem! I AM THE MIGHTY ALLYN!' he bellows. 'What"
    si = addr(local_114)
    CALL near_027A3()
    di = "is it you wish?'"
    si = addr(local_118)
    CALL near_027A3()
    local_12A = 18
    GOTO label_0927B
    di = "You picture what you want in your mind's eye and concentrate REAL hard."
    si = addr(local_108)
    CALL near_027A3()
    di = "After a while a djinni appears in a cloud of smoke! 'Oh mighty one' the"
    si = addr(local_10C)
    CALL near_027A3()
    di = "djinni booms. 'What is your wish?'"
    si = addr(local_128)
    CALL near_027A3()
    local_12A = 15
    CALL near_0A30F()
    local_12C = 7
    local_12E = 0
    CALL color_25283(addr(local_12C), addr(local_12E))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(S) Raise 1 statistic"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(M) Magic items"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(H) More hitpoints and totally healed"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "(E) More experience"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "(G) Gold"
    CALL near_027A3()
    IF var_0153 == 0 THEN GOTO label_09318
    GOTO label_09333
    bx = addr(local_1C)
    CALL array_element(6, 1)
    si = bx
    di = "(P) A dreamwolf to fight with"
    CALL near_027A3()
    GOTO label_093BB
    OPEN "MONSTER.DAT" FOR RANDOM AS #2 LEN = 196
    bx = addr(local_F2)
    PUSH 2
    PUSH long(var_0153)
    PUSH DS
    CALL get_record(ES, BX, 196)
    CLOSE #2
    ax = addr(local_F2)
    CALL RT_2732_63DF(DS, addr(local_F2), 20)
    CALL RT_2732_6374(20)
    di = ax
    si = addr(local_132)
    CALL near_027A3()
    di = addr(local_132)
    si = "(P) A pet "
    CALL near_027AB()
    si = ax
    di = " and a dreamwolf to fight with"
    CALL near_027AB()
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(6, 1)
    di = dx
    si = bx
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(7, 1)
    si = bx
    di = "(Q) Quit"
    CALL near_027A3()
    local_134 = 7
    si = arg_6
    IF [si] == 1 THEN GOTO label_093E4
    GOTO label_0941A
    bx = addr(local_1C)
    CALL array_element(7, 1)
    si = bx
    di = "(K) Kill the monster you are fighting now."
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(8, 1)
    si = bx
    di = "(Q) Quit"
    CALL near_027A3()
    local_134 = 8
    local_136 = 1
    local_138 = 8
    local_13A = 2
    local_13C = 0
    local_13E = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_134), addr(local_136), addr(local_138), addr(local_12A), addr(local_13A), addr(local_13C), addr(local_148), addr(local_13E))
    di = ax
    si = addr(local_142)
    CALL near_027A3()
    di = addr(local_142)
    si = addr(local_14C)
    CALL near_027A3()
    di = addr(local_14C)
    si = addr(local_146)
    CALL near_027A3()
    CALL RT_2732_6130(addr(local_146), &H6280)
    IF [si] <> 1 THEN GOTO label_0949B
    GOTO label_094B9
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_146))
    IF [si] == 1 THEN GOTO label_094B9
    GOTO label_094BC
    GOTO label_0989E
    CALL RT_2732_6130(addr(local_146), &H7B34)
    IF [si] == 1 THEN GOTO label_094CF
    GOTO label_094D5
    CALL near_09906()
    GOTO label_0989E
    CALL RT_2732_6130(addr(local_146), &H6286)
    IF [si] == 1 THEN GOTO label_094E8
    GOTO label_095A5
    CALL proc_0A9DA()
    IF var_01E4 > 150 THEN GOTO label_094F8
    GOTO label_0950F
    di = "You have too many hitpoints already to add any more, but now you're"
    si = addr(local_150)
    CALL near_027A3()
    di = "totally restored, anyway!"
    si = addr(local_154)
    CALL near_027A3()
    GOTO label_09570
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_15C = ax
    var_01E4 = var_01E4 + ax
    local_156 = 0
    CALL proc_25D42(addr(local_156), addr(local_15C))
    di = ax
    si = addr(local_15A)
    CALL near_027A3()
    di = addr(local_15A)
    si = "You have gained "
    CALL near_027AB()
    si = ax
    di = " experience points and are totally healed!"
    CALL near_027AB()
    di = ax
    si = addr(local_150)
    CALL near_027A3()
    var_020C = var_020C - 1
    ax = var_01E4
    var_01E2 = ax
    var_020A = 0
    var_00F4 = 0
    ax = 1
    GOTO label_09599
    si = ax
    si = si * 2
    cx = var_1578[si]
    var_1584[si] = cx
    ax = ax + 1
    local_15E = ax
    IF ax <= 5 THEN GOTO label_0958C
    GOTO label_0989E
    CALL RT_2732_6130(addr(local_146), &H8DCA)
    IF ax == 5 THEN GOTO label_095B8
    GOTO label_09648
    CALL proc_0A9DA()
    var_020C = var_020C - 1
    IF var_01E0 > 8 THEN GOTO label_095CB
    GOTO label_095D8
    di = "You are too experienced already to wish for more!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09645
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_15C = ax
    ' cwd
    ax = ax + var_021C
    ' adc dx,[0x21e]
    var_021C = ax
    var_021E = dx
    local_160 = 0
    CALL proc_25D42(addr(local_160), addr(local_15C))
    di = ax
    si = addr(local_164)
    CALL near_027A3()
    di = addr(local_164)
    si = "You have gained "
    CALL near_027AB()
    si = ax
    di = " experience points!"
    CALL near_027AB()
    di = ax
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_0989E
    CALL RT_2732_6130(addr(local_146), &H8E32)
    IF var_01E0 == 8 THEN GOTO label_0965B
    GOTO label_096F9
    CALL proc_0A9DA()
    var_020C = var_020C - 1
    CALL RT_2732_7413(var_0222, var_0220, long(&H2710))
    IF var_01E0 > 8 THEN GOTO label_0967C
    GOTO label_09689
    di = "A HUGE gold bar appears before you. Unfortunately, you cannot carry more."
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_096F6
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_15C = ax
    ' cwd
    ax = ax + var_0220
    ' adc dx,[0x222]
    var_0220 = ax
    var_0222 = dx
    local_166 = 0
    CALL proc_25D42(addr(local_166), addr(local_15C))
    di = ax
    si = addr(local_16A)
    CALL near_027A3()
    di = addr(local_16A)
    si = "A gold bar worth "
    CALL near_027AB()
    si = ax
    di = "appears before you. You pick it up."
    CALL near_027AB()
    di = ax
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_0989E
    CALL RT_2732_6130(addr(local_146), &H8EC8)
    IF var_01E0 == 8 THEN GOTO label_0970C
    GOTO label_09770
    IF var_0153 <> 0 THEN GOTO label_09716
    GOTO label_09767
    ax = var_0153
    var_0238 = ax
    ax = addr(local_132)
    PUSH DS
    PUSH addr(local_132)
    ' xor ax,ax
    ax = 548
    CALL RT_2732_6404(addr(local_132), DS, 548, 20)
    ax = local_BC
    var_023E = ax
    ax = local_DA
    var_0240 = ax
    ax = local_B6
    var_0242 = ax
    ax = local_C2
    var_0244 = ax
    ax = local_C0
    var_0246 = ax
    ax = local_BE
    var_0248 = ax
    ax = local_C6
    var_023A = ax
    var_023C = ax
    var_021A = 1
    GOTO label_0989E
    CALL RT_2732_6130(addr(local_146), &H7AD8)
    IF var_0153 == 0 THEN GOTO label_09783
    GOTO label_09789
    CALL near_09DED()
    GOTO label_0989E
    CALL RT_2732_6130(addr(local_14C), &H8ECE)
    ax = 0
    IF var_0153 <> 0 THEN GOTO label_0979D
    ax = ax - 1
    si = arg_6
    cx = 0
    IF [si] <> 1 THEN GOTO label_097A9
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF [si] <> 1 THEN GOTO label_097B2
    GOTO label_09840
    var_020C = var_020C - 1
    CALL proc_0A9DA()
    IF var_0AFC < 8 THEN GOTO label_097C5
    GOTO label_097F7
    var_015A = 1
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    di = ax
    si = "The battle seems rather one sided as the djinni rips the "
    CALL near_027AB()
    di = ax
    si = addr(local_150)
    CALL near_027A3()
    di = "to shreads"
    si = addr(local_154)
    CALL near_027A3()
    GOTO label_0983D
    IF var_0AFC < 16 THEN GOTO label_09801
    GOTO label_09833
    var_015A = 1
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    di = ax
    si = "After a fierce and drawn-out battle, the djinni rips the "
    CALL near_027AB()
    di = ax
    si = addr(local_150)
    CALL near_027A3()
    di = "to shreads"
    si = addr(local_154)
    CALL near_027A3()
    GOTO label_0983D
    di = "After a quick examination of your opponent, the djinni runs in terror!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_0989E
    di = "I don't understand. Please retype"
    si = addr(local_16E)
    CALL near_027A3()
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    di = ax
    si = addr(local_172)
    CALL near_027A3()
    CALL proc_2311E(addr(local_16E), addr(local_172))
    ax = addr(local_172)
    PUSH DS
    PUSH addr(local_172)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_172), DS, 79, 1)
    CALL free_string(addr(local_16E))
    CALL free_string(addr(local_172))
    GOTO label_0941A
    local_174 = 12
    local_176 = 3
    local_178 = 0
    CALL locate_print_21DEA(addr(local_174), addr(local_176), addr(local_150), addr(local_178))
    local_17A = 13
    local_17C = 3
    local_17E = 0
    CALL locate_print_21DEA(addr(local_17A), addr(local_17C), addr(local_154), addr(local_17E))
    CALL mage_0C4A1()
    CALL name_0AF8B()
    CALL hit_any_key_to_continue_2434A()
    GOTO label_0A493
    CALL proc_0A9DA()
    local_180 = 15
    local_182 = 0
    CALL color_25283(addr(local_180), addr(local_182))
    local_184 = 11
    local_186 = 32
    di = "RAISE A STATISTIC"
    si = addr(local_18A)
    CALL near_027A3()
    local_18C = 0
    CALL locate_print_21DEA(addr(local_184), addr(local_186), addr(local_18A), addr(local_18C))
    CALL free_string(addr(local_18A))
    local_18E = 11
    local_190 = 0
    CALL color_25283(addr(local_18E), addr(local_190))
    local_192 = 13
    local_194 = 3
    di = "Which statistic would you like to raise?"
    si = addr(local_198)
    CALL near_027A3()
    local_19A = 0
    CALL locate_print_21DEA(addr(local_192), addr(local_194), addr(local_198), addr(local_19A))
    CALL free_string(addr(local_198))
    local_19C = 7
    local_19E = 0
    CALL color_25283(addr(local_19C), addr(local_19E))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(S) Strength"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(I) Intelligence"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(C) Constitution"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "(D) Dexterity"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "(R) Charisma"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(6, 1)
    si = bx
    di = "(L) Luck"
    CALL near_027A3()
    bx = addr(local_1C)
    CALL array_element(7, 1)
    si = bx
    di = "(Q) Quit"
    CALL near_027A3()
    local_1A0 = 7
    local_1A2 = 1
    local_1A4 = 8
    local_1A6 = 15
    local_1A8 = 2
    local_1AA = 0
    local_1AC = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_1A0), addr(local_1A2), addr(local_1A4), addr(local_1A6), addr(local_1A8), addr(local_1AA), addr(local_148), addr(local_1AC))
    di = ax
    si = addr(local_1B0)
    CALL near_027A3()
    di = addr(local_1B0)
    si = addr(local_14C)
    CALL near_027A3()
    di = addr(local_14C)
    si = addr(local_1B4)
    CALL near_027A3()
    CALL RT_2732_6130(addr(local_1B4), &H6280)
    IF var_0AFC <> 16 THEN GOTO label_09B0C
    GOTO label_09B2A
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_1B4))
    IF var_0AFC == 16 THEN GOTO label_09B2A
    GOTO label_09B2B
    RETURN
    CALL RT_2732_6130(addr(local_1B4), &H7B34)
    IF var_0AFC == 16 THEN GOTO label_09B3E
    GOTO label_09B89
    CALL proc_0A9DA()
    var_01E6 = var_01E6 + 2
    IF var_01E6 > 20 THEN GOTO label_09B52
    GOTO label_09B5F
    di = "Your strength is at maximum!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09B86
    IF var_01E6 < 16 THEN GOTO label_09B69
    GOTO label_09B7C
    var_01E6 = 16
    di = "You feel MUCH stronger now!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09B86
    di = "You feel stronger now!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09DBD
    CALL RT_2732_6130(addr(local_1B4), &H7B40)
    IF var_01E6 == 16 THEN GOTO label_09B9C
    GOTO label_09BE7
    CALL proc_0A9DA()
    var_01E8 = var_01E8 + 2
    IF var_01E8 > 20 THEN GOTO label_09BB0
    GOTO label_09BBD
    di = "Your intelligence is at maximum!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09BE4
    IF var_01E8 < 16 THEN GOTO label_09BC7
    GOTO label_09BDA
    var_01E8 = 16
    di = "You feel MUCH more intelligent now!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09BE4
    di = "You feel more intelligent now!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09DBD
    CALL RT_2732_6130(addr(local_1B4), &H7B3A)
    IF var_01E8 == 16 THEN GOTO label_09BFA
    GOTO label_09C45
    CALL proc_0A9DA()
    var_01EA = var_01EA + 2
    IF var_01EA > 20 THEN GOTO label_09C0E
    GOTO label_09C1B
    di = "Your constitution is at maximum!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09C42
    IF var_01EA < 16 THEN GOTO label_09C25
    GOTO label_09C38
    var_01EA = 16
    di = "You feel MUCH sturdier now!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09C42
    di = "You feel sturdier now!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09DBD
    CALL RT_2732_6130(addr(local_1B4), &H79D2)
    IF var_01EA == 16 THEN GOTO label_09C58
    GOTO label_09CA3
    CALL proc_0A9DA()
    var_01EC = var_01EC + 2
    IF var_01EC > 20 THEN GOTO label_09C6C
    GOTO label_09C79
    di = "Your dexterity is at maximum!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09CA0
    IF var_01EC < 16 THEN GOTO label_09C83
    GOTO label_09C96
    var_01EC = 16
    di = "You feel MUCH more graceful now!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09CA0
    di = "You feel more graceful now!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09DBD
    CALL RT_2732_6130(addr(local_1B4), &H7AE4)
    IF var_01EC == 16 THEN GOTO label_09CB6
    GOTO label_09D01
    CALL proc_0A9DA()
    var_01EE = var_01EE + 2
    IF var_01EE > 20 THEN GOTO label_09CCA
    GOTO label_09CD7
    di = "Your charisma is at maximum!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09CFE
    IF var_01EE < 16 THEN GOTO label_09CE1
    GOTO label_09CF4
    var_01EE = 16
    di = "You feel MUCH more beautiful now!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09CFE
    di = "You feel more beautiful now!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09DBD
    CALL RT_2732_6130(addr(local_1B4), &H9282)
    IF var_01EE == 16 THEN GOTO label_09D14
    GOTO label_09D5F
    CALL proc_0A9DA()
    var_01F0 = var_01F0 + 2
    IF var_01F0 > 20 THEN GOTO label_09D28
    GOTO label_09D35
    di = "Your luck is at maximum!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09D5C
    IF var_01F0 < 16 THEN GOTO label_09D3F
    GOTO label_09D52
    var_01F0 = 16
    di = "You feel MUCH luckier now!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09D5C
    di = "You feel luckier now!"
    si = addr(local_150)
    CALL near_027A3()
    GOTO label_09DBD
    di = "What was that again?"
    si = addr(local_1B8)
    CALL near_027A3()
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    di = ax
    si = addr(local_1BC)
    CALL near_027A3()
    CALL proc_2311E(addr(local_1B8), addr(local_1BC))
    ax = addr(local_1BC)
    PUSH DS
    PUSH addr(local_1BC)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_1BC), DS, 79, 1)
    CALL free_string(addr(local_1B8))
    CALL free_string(addr(local_1BC))
    GOTO label_09A7F
    local_1BE = 12
    local_1C0 = 3
    local_1C2 = 0
    CALL locate_print_21DEA(addr(local_1BE), addr(local_1C0), addr(local_150), addr(local_1C2))
    var_020C = var_020C - 1
    RETURN
    CALL proc_0A9DA()
    local_1C4 = 15
    local_1C6 = 0
    CALL color_25283(addr(local_1C4), addr(local_1C6))
    local_1C8 = 11
    local_1CA = 29
    di = "WISH FOR A MAGIC ITEM"
    si = addr(local_1CE)
    CALL near_027A3()
    local_1D0 = 0
    CALL locate_print_21DEA(addr(local_1C8), addr(local_1CA), addr(local_1CE), addr(local_1D0))
    CALL free_string(addr(local_1CE))
    local_1D2 = 11
    local_1D4 = 0
    CALL color_25283(addr(local_1D2), addr(local_1D4))
    IF var_012F >= 34 THEN GOTO label_09E71
    GOTO label_09EB1
    local_1D6 = 23
    local_1D8 = 3
    di = "You are carrying too much inventory.  Drop something first."
    si = addr(local_1DC)
    CALL near_027A3()
    local_1DE = 0
    CALL locate_print_21DEA(addr(local_1D6), addr(local_1D8), addr(local_1DC), addr(local_1DE))
    CALL free_string(addr(local_1DC))
    RETURN
    local_1E0 = 12
    local_1E2 = 3
    di = "You may choose an item.  Which item do you want? "
    si = addr(local_1E6)
    CALL near_027A3()
    local_1E8 = 0
    CALL locate_print_21DEA(addr(local_1E0), addr(local_1E2), addr(local_1E6), addr(local_1E8))
    CALL free_string(addr(local_1E6))
    local_1EA = 13
    local_1EC = 3
    di = "(Use the arrow keys to select, ENTER to choose, Q to quit.)"
    si = addr(local_1F0)
    CALL near_027A3()
    local_1F2 = 0
    CALL locate_print_21DEA(addr(local_1EA), addr(local_1EC), addr(local_1F0), addr(local_1F2))
    CALL free_string(addr(local_1F0))
    local_1F4 = 7
    local_1F6 = 0
    CALL color_25283(addr(local_1F4), addr(local_1F6))
    OPEN "ITEMFILE.DAT" FOR RANDOM AS #1 LEN = 44
    ax = var_0135
    local_1F8 = ax
    ax = 1
    GOTO label_0A003
    GET #1, long(local_15E), buffer(606) LEN = 44
    ax = 0
    IF var_027E == 0 THEN GOTO label_09F92
    ax = ax - 1
    ' float_DD
    ' float_DD
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_027E <= 0 THEN GOTO label_09FAB
    ax = ax - 1
    ' and ax,bx
    ' and ax,ax
    IF var_027E <> 0 THEN GOTO label_09FB4
    GOTO label_09FFE
    local_1FA = local_1FA + 1
    bx = addr(local_2E)
    CALL array_element(local_1FA, 1)
    cx = local_15E
    [es:bx] = cx
    ax = 606
    CALL RT_2732_63DF(DS, 606, 26)
    CALL RT_2732_6374(26)
    bx = ax
    dx = bx
    bx = addr(local_1C)
    CALL array_element(local_1FA, 1)
    di = dx
    si = bx
    CALL near_027A3()
    ax = local_15E
    ax = ax + 1
    local_15E = ax
    IF ax > local_1F8 THEN GOTO label_0A010
    GOTO label_09F6C
    CLOSE #1
    local_1FC = 2
    local_1FE = 3
    local_200 = 15
    local_202 = 0
    local_204 = 0
    local_206 = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_1FA), addr(local_1FC), addr(local_1FE), addr(local_200), addr(local_202), addr(local_204), addr(local_148), addr(local_206))
    di = ax
    si = addr(local_20A)
    CALL near_027A3()
    di = addr(local_20A)
    si = addr(local_14C)
    CALL near_027A3()
    CALL RT_2732_6130(addr(local_14C), &H6280)
    ax = 0
    IF ax <> local_1F8 THEN GOTO label_0A097
    ax = ax - 1
    bx = ax
    ax = 74
    local_20C = bx
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_14C))
    ax = 0
    IF ax <> local_1F8 THEN GOTO label_0A0BC
    ax = ax - 1
    ' or ax,[bp-0x20c]
    ' and ax,ax
    IF ax <> local_1F8 THEN GOTO label_0A0C7
    GOTO label_0A0C8
    RETURN
    bx = addr(local_2E)
    CALL array_element(local_148, 1)
    ax = [es:bx]
    local_20E = ax
    CALL itemfile_dat_0816C(addr(local_20E))
    bx = addr(local_2E)
    CALL array_element(local_148, 1)
    ax = local_20E
    [es:bx] = ax
    ax = var_012F
    ax = ax + 1
    local_214 = ax
    CALL proc_07F08(addr(local_214), addr(local_212))
    ' float_D9
    ' float_D9
    CALL proc_0AA39()
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == local_1F8 THEN GOTO label_0A13E
    GOTO label_0A180
    local_21A = 2
    local_21C = 42
    di = "You load is too heavy to lift it."
    si = addr(local_220)
    CALL near_027A3()
    local_222 = 0
    CALL locate_print_21DEA(addr(local_21A), addr(local_21C), addr(local_220), addr(local_222))
    CALL free_string(addr(local_220))
    GOTO label_0A30E
    ax = 606
    ax = 68
    PUSH DS
    PUSH 606
    PUSH 26
    ' imul word [bp-0x214]
    ax = ax + &HBEE
    CALL RT_2732_6404(DS, ax, 26)
    ax = 606
    CALL RT_2732_63DF(DS, 606, 26)
    di = ax
    si = addr(local_226)
    CALL near_027A3()
    CALL proc_23059(addr(local_226))
    di = ax
    si = addr(local_22A)
    CALL near_027A3()
    ax = addr(local_226)
    PUSH DS
    PUSH addr(local_226)
    ' xor ax,ax
    ax = 606
    CALL RT_2732_6404(addr(local_226), DS, 606, 26)
    CALL free_string(addr(local_226))
    ax = addr(local_22A)
    PUSH DS
    PUSH addr(local_22A)
    ' xor ax,ax
    ax = 68
    PUSH addr(local_22A)
    ' imul word [bp-0x214]
    bx = ax
    ax = ax + &HBEE
    ax = ax + 26
    local_236 = bx
    CALL RT_2732_6404(DS, ax, 26)
    ax = local_236
    ax = ax + &HBEE
    bx = ax
    ax = ax + 60
    si = ax
    [si] = 1
    dx = bx
    bx = bx + 56
    si = bx
    ax = var_027C
    [bx] = ax
    ' float_D9
    CALL RT_2F00_056C()
    cx = 68
    bx = dx
    ' imul cx
    ax = ax + &HBEE
    ax = ax + 58
    si = ax
    cx = var_027C
    [si] = cx
    bx = bx + 64
    si = bx
    [bx] = 0
    var_020C = var_020C - 1
    local_22C = 2
    local_22E = 42
    di = "You pick up the "
    si = addr(local_232)
    CALL near_027A3()
    local_234 = 0
    CALL locate_print_21DEA(addr(local_22C), addr(local_22E), addr(local_232), addr(local_234))
    CALL free_string(addr(local_232))
    local_23C = 3
    local_23E = 42
    ax = 68
    ' imul word [bp-0x214]
    ax = ax + &HBEE
    bx = ax
    local_246 = bx
    CALL RT_2732_63DF(DS, ax, 26)
    di = ax
    si = addr(local_242)
    CALL near_027A3()
    local_244 = 0
    CALL locate_print_21DEA(addr(local_23C), addr(local_23E), addr(local_242), addr(local_244))
    ax = addr(local_242)
    PUSH DS
    PUSH addr(local_242)
    ' xor ax,ax
    CALL RT_2732_6404(addr(local_242), DS, local_246, 26)
    CALL free_string(addr(local_242))
    RETURN
    local_248 = 11
    local_24A = 3
    local_24C = 0
    CALL locate_print_21DEA(addr(local_248), addr(local_24A), addr(local_108), addr(local_24C))
    local_24E = 12
    local_250 = 3
    local_252 = 0
    CALL locate_print_21DEA(addr(local_24E), addr(local_250), addr(local_10C), addr(local_252))
    local_254 = 13
    local_256 = 3
    local_258 = 0
    CALL locate_print_21DEA(addr(local_254), addr(local_256), addr(local_128), addr(local_258))
    local_25A = 14
    local_25C = 3
    local_25E = 0
    CALL locate_print_21DEA(addr(local_25A), addr(local_25C), addr(local_110), addr(local_25E))
    local_260 = 15
    local_262 = 3
    local_264 = 0
    CALL locate_print_21DEA(addr(local_260), addr(local_262), addr(local_114), addr(local_264))
    local_266 = 16
    local_268 = 3
    local_26A = 0
    CALL locate_print_21DEA(addr(local_266), addr(local_268), addr(local_118), addr(local_26A))
    local_26C = 17
    local_26E = 3
    local_270 = 0
    CALL locate_print_21DEA(addr(local_26C), addr(local_26E), addr(local_11C), addr(local_270))
    local_272 = 18
    local_274 = 3
    local_276 = 0
    CALL locate_print_21DEA(addr(local_272), addr(local_274), addr(local_27A), addr(local_276))
    local_27C = 19
    local_27E = 3
    local_280 = 0
    CALL locate_print_21DEA(addr(local_27C), addr(local_27E), addr(local_120), addr(local_280))
    RETURN
    CALL free_string(addr(local_22A))
    CALL free_string(addr(local_20A))
    CALL free_string(addr(local_1B4))
    CALL free_string(addr(local_1B0))
    CALL free_string(addr(local_16A))
    CALL free_string(addr(local_164))
    CALL free_string(addr(local_15A))
    CALL free_string(addr(local_146))
    CALL free_string(addr(local_142))
    CALL free_string(addr(local_14C))
    CALL erase_array(addr(local_1C))
    CALL free_string(addr(local_132))
    CALL free_string(addr(local_27A))
    CALL free_string(addr(local_154))
    CALL free_string(addr(local_150))
    CALL free_string(addr(local_128))
    CALL free_string(addr(local_120))
    CALL free_string(addr(local_11C))
    CALL free_string(addr(local_118))
    CALL free_string(addr(local_114))
    CALL free_string(addr(local_110))
    CALL free_string(addr(local_10C))
    CALL free_string(addr(local_108))
    CALL erase_array(addr(local_2E))
    PROC_EXIT
    RETURN
    GOTO label_0A647
END SUB

SUB dun_1A58C  ' image &H1A58C, locals 8
  ' strings: .DUN
    cx = 8
    CALL frame_enter()
    ax = 460
    CALL RT_2732_63DF(DS, 460, 8)
    CALL RT_2732_6374(8)
    si = ax
    di = ".DUN"
    CALL near_027AB()
    di = ax
    si = addr(local_E)
    CALL near_027A3()
    OPEN addr(local_E) FOR RANDOM AS #5 LEN = &H7F0
    CALL file_ah4(5)
    CALL RT_2F00_0559()
    ' float_DC
    ' float_D9
    ' float_D9
    ax = var_01F4
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF ? > ? THEN GOTO label_0A5FE
    GOTO label_0A60F
    ' float_D9
    ' float_D8
    CALL RT_2F00_056C()
    var_01F4 = ax
    CALL RT_2732_02EF(5, long(var_01F4), buffer(650), &H7F0)
    CLOSE #5
    CALL free_string(addr(local_E))
    PROC_EXIT
    RETURN
    CALL RT_2732_4E0A()
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    ' decode stopped: unknown opcode 0x62 at 0x1a650 at 0x1a650
END SUB

SUB character_monster_match_up_1A696  ' image &H1A696, locals 360
  ' strings: CHARACTER/MONSTER MATCH UP | Throughout your earlier travels and conversations, you can recall certain | characteristics of the being that now faces you. | Level | Ability to hit | Magic resistance
    cx = 360
    CALL frame_enter()
    local_C = 1
    local_E = 25
    CALL proc_21194(addr(local_C), addr(local_E))
    local_10 = 15
    local_12 = 0
    CALL color_25283(addr(local_10), addr(local_12))
    local_14 = 1
    local_16 = 25
    di = "CHARACTER/MONSTER MATCH UP"
    si = addr(local_1A)
    CALL near_0A683()
    local_1C = 1
    CALL locate_print_21DEA(addr(local_14), addr(local_16), addr(local_1A), addr(local_1C))
    CALL free_string(addr(local_1A))
    local_1E = 11
    local_20 = 0
    CALL color_25283(addr(local_1E), addr(local_20))
    local_22 = 3
    local_24 = 1
    di = "Throughout your earlier travels and conversations, you can recall certain"
    si = addr(local_28)
    CALL near_0A683()
    local_2A = 1
    CALL locate_print_21DEA(addr(local_22), addr(local_24), addr(local_28), addr(local_2A))
    CALL free_string(addr(local_28))
    di = "characteristics of the being that now faces you."
    si = addr(local_2E)
    CALL near_0A683()
    local_30 = 1
    CALL print_more_21DB9(addr(local_2E), addr(local_30))
    CALL free_string(addr(local_2E))
    local_32 = 15
    local_34 = 0
    CALL color_25283(addr(local_32), addr(local_34))
    local_36 = 6
    local_38 = 1
    ax = 440
    CALL RT_2732_63DF(DS, 440, 20)
    di = ax
    si = addr(local_3C)
    CALL near_0A683()
    local_3E = 0
    CALL locate_print_21DEA(addr(local_36), addr(local_38), addr(local_3C), addr(local_3E))
    ax = addr(local_3C)
    PUSH DS
    PUSH addr(local_3C)
    ' xor ax,ax
    ax = 440
    CALL RT_2732_6404(addr(local_3C), DS, 440, 20)
    CALL free_string(addr(local_3C))
    local_40 = 6
    local_42 = 60
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    di = ax
    si = addr(local_46)
    CALL near_0A683()
    local_48 = 1
    CALL locate_print_21DEA(addr(local_40), addr(local_42), addr(local_46), addr(local_48))
    ax = addr(local_46)
    PUSH DS
    PUSH addr(local_46)
    ' xor ax,ax
    ax = &HAE8
    CALL RT_2732_6404(addr(local_46), DS, &HAE8, 20)
    CALL free_string(addr(local_46))
    local_4A = 10
    local_4C = 0
    CALL color_25283(addr(local_4A), addr(local_4C))
    local_4E = 0
    CALL proc_25D42(addr(local_4E), 480)
    di = ax
    si = addr(local_52)
    CALL near_0A683()
    local_54 = 0
    CALL print_more_21DB9(addr(local_52), addr(local_54))
    local_56 = 7
    local_58 = 30
    di = "Level"
    si = addr(local_5C)
    CALL near_0A683()
    local_5E = 0
    CALL locate_print_21DEA(addr(local_56), addr(local_58), addr(local_5C), addr(local_5E))
    CALL free_string(addr(local_5C))
    local_60 = 7
    local_62 = 60
    local_64 = 0
    CALL proc_25D42(addr(local_64), &HAFC)
    di = ax
    si = addr(local_68)
    CALL near_0A683()
    local_6A = 1
    CALL locate_print_21DEA(addr(local_60), addr(local_62), addr(local_68), addr(local_6A))
    local_6C = 0
    CALL proc_25D42(addr(local_6C), 154)
    di = ax
    si = addr(local_70)
    CALL near_0A683()
    local_72 = 0
    CALL print_more_21DB9(addr(local_70), addr(local_72))
    local_74 = 8
    local_76 = 30
    di = "Ability to hit"
    si = addr(local_7A)
    CALL near_0A683()
    local_7C = 0
    CALL locate_print_21DEA(addr(local_74), addr(local_76), addr(local_7A), addr(local_7C))
    CALL free_string(addr(local_7A))
    local_7E = 8
    local_80 = 60
    local_82 = 0
    CALL proc_25D42(addr(local_82), &HB18)
    di = ax
    si = addr(local_86)
    CALL near_0A683()
    local_88 = 1
    CALL locate_print_21DEA(addr(local_7E), addr(local_80), addr(local_86), addr(local_88))
    local_8A = 0
    CALL proc_25D42(addr(local_8A), 164)
    di = ax
    si = addr(local_8E)
    CALL near_0A683()
    local_90 = 0
    CALL print_more_21DB9(addr(local_8E), addr(local_90))
    local_92 = 9
    local_94 = 30
    di = "Magic resistance"
    si = addr(local_98)
    CALL near_0A683()
    local_9A = 0
    CALL locate_print_21DEA(addr(local_92), addr(local_94), addr(local_98), addr(local_9A))
    CALL free_string(addr(local_98))
    local_9C = 9
    local_9E = 60
    local_A0 = 0
    CALL proc_25D42(addr(local_A0), &HB20)
    di = ax
    si = addr(local_A4)
    CALL near_0A683()
    local_A6 = 1
    CALL locate_print_21DEA(addr(local_9C), addr(local_9E), addr(local_A4), addr(local_A6))
    local_A8 = 0
    CALL proc_25D42(addr(local_A8), 156)
    di = ax
    si = addr(local_AC)
    CALL near_0A683()
    local_AE = 0
    CALL print_more_21DB9(addr(local_AC), addr(local_AE))
    local_B0 = 10
    local_B2 = 30
    di = "To damage"
    si = addr(local_B6)
    CALL near_0A683()
    local_B8 = 0
    CALL locate_print_21DEA(addr(local_B0), addr(local_B2), addr(local_B6), addr(local_B8))
    CALL free_string(addr(local_B6))
    local_BA = 10
    local_BC = 60
    local_BE = 0
    CALL proc_25D42(addr(local_BE), &HB1A)
    di = ax
    si = addr(local_C2)
    CALL near_0A683()
    local_C4 = 1
    CALL locate_print_21DEA(addr(local_BA), addr(local_BC), addr(local_C2), addr(local_C4))
    local_C6 = 0
    CALL proc_25D42(addr(local_C6), 160)
    di = ax
    si = addr(local_CA)
    CALL near_0A683()
    local_CC = 0
    CALL print_more_21DB9(addr(local_CA), addr(local_CC))
    local_CE = 11
    local_D0 = 30
    di = "To avoid dam"
    si = addr(local_D4)
    CALL near_0A683()
    local_D6 = 0
    CALL locate_print_21DEA(addr(local_CE), addr(local_D0), addr(local_D4), addr(local_D6))
    CALL free_string(addr(local_D4))
    local_D8 = 11
    local_DA = 60
    local_DC = 0
    CALL proc_25D42(addr(local_DC), &HB1C)
    di = ax
    si = addr(local_E0)
    CALL near_0A683()
    local_E2 = 1
    CALL locate_print_21DEA(addr(local_D8), addr(local_DA), addr(local_E0), addr(local_E2))
    local_E4 = 0
    ax = var_0210
    ax = ax + var_00BC
    local_E6 = ax
    CALL proc_25D42(addr(local_E4), addr(local_E6))
    di = ax
    si = addr(local_EA)
    CALL near_0A683()
    local_EC = 0
    CALL print_more_21DB9(addr(local_EA), addr(local_EC))
    local_EE = 12
    local_F0 = 30
    di = "Speed"
    si = addr(local_F4)
    CALL near_0A683()
    local_F6 = 0
    CALL locate_print_21DEA(addr(local_EE), addr(local_F0), addr(local_F4), addr(local_F6))
    CALL free_string(addr(local_F4))
    local_F8 = 12
    local_FA = 60
    local_FC = 0
    CALL proc_25D42(addr(local_FC), &HB24)
    di = ax
    si = addr(local_100)
    CALL near_0A683()
    local_102 = 1
    CALL locate_print_21DEA(addr(local_F8), addr(local_FA), addr(local_100), addr(local_102))
    local_104 = 13
    local_106 = 30
    di = "Minimum hitpoints"
    si = addr(local_10A)
    CALL near_0A683()
    local_10C = 0
    CALL locate_print_21DEA(addr(local_104), addr(local_106), addr(local_10A), addr(local_10C))
    CALL free_string(addr(local_10A))
    local_10E = 13
    local_110 = 60
    local_112 = 0
    CALL proc_25D42(addr(local_112), &HB12)
    di = ax
    si = addr(local_116)
    CALL near_0A683()
    local_118 = 1
    CALL locate_print_21DEA(addr(local_10E), addr(local_110), addr(local_116), addr(local_118))
    local_11A = 0
    CALL proc_25D42(addr(local_11A), 484)
    di = ax
    si = addr(local_11E)
    CALL near_0A683()
    local_120 = 0
    CALL print_more_21DB9(addr(local_11E), addr(local_120))
    local_122 = 14
    local_124 = 30
    di = "Maximum hitpoints"
    si = addr(local_128)
    CALL near_0A683()
    local_12A = 0
    CALL locate_print_21DEA(addr(local_122), addr(local_124), addr(local_128), addr(local_12A))
    CALL free_string(addr(local_128))
    local_12C = 14
    local_12E = 60
    local_130 = 0
    CALL proc_25D42(addr(local_130), &HB14)
    di = ax
    si = addr(local_134)
    CALL near_0A683()
    local_136 = 1
    CALL locate_print_21DEA(addr(local_12C), addr(local_12E), addr(local_134), addr(local_136))
    local_138 = 0
    CALL proc_25D42(addr(local_138), 174)
    di = ax
    si = addr(local_13C)
    CALL near_0A683()
    local_13E = 0
    CALL print_more_21DB9(addr(local_13C), addr(local_13E))
    local_140 = 15
    local_142 = 30
    di = "Ability to run"
    si = addr(local_146)
    CALL near_0A683()
    local_148 = 1
    CALL locate_print_21DEA(addr(local_140), addr(local_142), addr(local_146), addr(local_148))
    CALL free_string(addr(local_146))
    local_14A = 16
    local_14C = 30
    di = "Ability to stop your running"
    si = addr(local_150)
    CALL near_0A683()
    local_152 = 0
    CALL locate_print_21DEA(addr(local_14A), addr(local_14C), addr(local_150), addr(local_152))
    CALL free_string(addr(local_150))
    local_154 = 16
    local_156 = 60
    local_158 = 0
    CALL proc_25D42(addr(local_158), &HB22)
    di = ax
    si = addr(local_15C)
    CALL near_0A683()
    local_15E = 1
    CALL locate_print_21DEA(addr(local_154), addr(local_156), addr(local_15C), addr(local_15E))
    local_160 = 12
    local_162 = 0
    CALL color_25283(addr(local_160), addr(local_162))
    local_164 = 18
    local_166 = 1
    ax = &HB28
    CALL RT_2732_63DF(DS, &HB28, 65)
    di = ax
    si = addr(local_16A)
    CALL near_0A683()
    local_16C = 1
    CALL locate_print_21DEA(addr(local_164), addr(local_166), addr(local_16A), addr(local_16C))
    ax = addr(local_16A)
    PUSH DS
    PUSH addr(local_16A)
    ' xor ax,ax
    ax = &HB28
    CALL RT_2732_6404(addr(local_16A), DS, &HB28, 65)
    CALL free_string(addr(local_16A))
    ax = &HB69
    CALL RT_2732_63DF(DS, &HB69, 65)
    di = ax
    si = addr(local_170)
    CALL near_0A683()
    local_172 = 0
    CALL print_more_21DB9(addr(local_170), addr(local_172))
    ax = addr(local_170)
    PUSH DS
    PUSH addr(local_170)
    ' xor ax,ax
    ax = &HB69
    CALL RT_2732_6404(addr(local_170), DS, &HB69, 65)
    CALL free_string(addr(local_170))
    CALL hit_any_key_to_continue_2434A()
    CALL free_string(addr(local_15C))
    CALL free_string(addr(local_13C))
    CALL free_string(addr(local_134))
    CALL free_string(addr(local_11E))
    CALL free_string(addr(local_116))
    CALL free_string(addr(local_100))
    CALL free_string(addr(local_EA))
    CALL free_string(addr(local_E0))
    CALL free_string(addr(local_CA))
    CALL free_string(addr(local_C2))
    CALL free_string(addr(local_AC))
    CALL free_string(addr(local_A4))
    CALL free_string(addr(local_8E))
    CALL free_string(addr(local_86))
    CALL free_string(addr(local_70))
    CALL free_string(addr(local_68))
    CALL free_string(addr(local_52))
    PROC_EXIT
    RETURN
    GOTO label_0B08E
END SUB

SUB proc_1B043  ' image &H1B043, locals 2
    cx = 2
    CALL frame_enter()
    CALL dragonslair_1B091()
    local_C = 1
    CALL she_1B3FD(addr(local_C))
    IF var_0112 == 0 THEN GOTO label_0B068
    GOTO label_0B077
    CALL proc_0D0CF()
    CALL name_0AF8B()
    CALL proc_0C32E()
    IF var_015A == 1 THEN GOTO label_0B081
    GOTO label_0B086
    CALL proc_1D11B()
    PROC_EXIT
    RETURN
    GOTO label_0B3FA
END SUB

SUB dragonslair_1B091  ' image &H1B091, locals 6
  ' strings: DRAGONSLAIR | RED DRAGON | A red dragon is the weakest of all dragons, but it still packs a wallop | in a fight. For some reason, no mage has ever survived a fight with one. | GOLD DRAGON | A gold dragon is a very tough monster, even for a dragon!  Probably, it is
    cx = 6
    CALL frame_enter()
    di = "DRAGONSLAIR"
    si = addr(local_E)
    CALL near_0A683()
    CALL sb_dat_21E13(addr(local_E))
    CALL free_string(addr(local_E))
    CALL hit_any_key_to_continue_2434A()
    var_015A = 0
    var_015C = 0
    var_015E = 0
    var_0160 = 0
    var_018C = 0
    var_018E = 0
    var_0192 = 0
    var_0162 = 0
    var_0164 = 0
    var_0166 = 0
    var_0168 = 0
    var_016A = 0
    var_016C = 0
    var_016E = 1
    var_0170 = 0
    var_0174 = 0
    var_0176 = 0
    var_0178 = 1
    var_017A = 0
    var_017C = 0
    var_017E = 0
    var_0180 = 0
    var_0184 = 0
    var_0186 = 0
    var_0188 = 0
    var_0190 = 1
    var_01B6 = 1
    var_018A = 0
    var_0194 = 0
    var_0172 = 0
    var_0198 = 0
    var_0182 = 0
    var_019A = 0
    var_019C = 0
    var_019E = 0
    var_01A0 = 0
    var_01A2 = 0
    var_01A4 = 0
    var_0B0C = &HBB8
    var_0B0E = 0
    var_0B10 = 30
    var_0AFC = 29
    var_0B00 = 1
    var_0B18 = 42
    var_0B1A = 42
    var_0B1C = 32
    var_0B1E = 32
    var_0B20 = 55
    var_0B22 = 55
    var_0B24 = 4
    var_0BAA = 0
    var_0B26 = 15
    ax = var_00F0
    local_10 = ax
    IF local_10 == 16 THEN GOTO label_0B200
    GOTO label_0B263
    var_0B16 = 1
    var_0B12 = 65
    var_0B14 = 85
    ax = "RED DRAGON"
    PUSH DS
    PUSH "RED DRAGON"
    ' xor ax,ax
    ax = &HAE8
    CALL RT_2732_6404("RED DRAGON", DS, &HAE8, 20)
    var_0AFE = &HFFFF
    ax = "A red dragon is the weakest of all dragons, but it still packs a wallop"
    PUSH DS
    PUSH "A red dragon is the weakest of all dragons, but it still packs a wallop"
    ' xor ax,ax
    ax = &HB28
    CALL RT_2732_6404("A red dragon is the weakest of all dragons, but it still packs a wallop", DS, &HB28, 65)
    ax = "in a fight. For some reason, no mage has ever survived a fight with one."
    PUSH DS
    PUSH "in a fight. For some reason, no mage has ever survived a fight with one."
    ' xor ax,ax
    ax = &HB69
    CALL RT_2732_6404("in a fight. For some reason, no mage has ever survived a fight with one.", DS, &HB69, 65)
    var_0194 = 1
    GOTO label_0B3BF
    IF local_10 == 17 THEN GOTO label_0B26C
    GOTO label_0B2D5
    var_0B16 = 4
    var_0B12 = 130
    var_0B14 = 140
    ax = "GOLD DRAGON"
    PUSH DS
    PUSH "GOLD DRAGON"
    ' xor ax,ax
    ax = &HAE8
    CALL RT_2732_6404("GOLD DRAGON", DS, &HAE8, 20)
    var_0AFE = 0
    ax = "A gold dragon is a very tough monster, even for a dragon!  Probably, it is"
    PUSH DS
    PUSH "A gold dragon is a very tough monster, even for a dragon!  Probably, it is"
    ' xor ax,ax
    ax = &HB28
    CALL RT_2732_6404("A gold dragon is a very tough monster, even for a dragon!  Probably, it is", DS, &HB28, 65)
    ax = "the most reasonable of all dragons, but for a dragon, that's not saying much."
    PUSH DS
    PUSH "the most reasonable of all dragons, but for a dragon, that's not saying much."
    ' xor ax,ax
    ax = &HB69
    CALL RT_2732_6404("the most reasonable of all dragons, but for a dragon, that's not saying much.", DS, &HB69, 65)
    var_0198 = 1
    var_018A = 1
    GOTO label_0B3BF
    IF local_10 == 18 THEN GOTO label_0B2DE
    GOTO label_0B347
    var_0B16 = 4
    var_0B12 = 85
    var_0B14 = 95
    ax = "WHITE DRAGON"
    PUSH DS
    PUSH "WHITE DRAGON"
    ' xor ax,ax
    ax = &HAE8
    CALL RT_2732_6404("WHITE DRAGON", DS, &HAE8, 20)
    ax = "A white dragon is a dragon from the bitter arctic.  It has powers over cold,"
    PUSH DS
    PUSH "A white dragon is a dragon from the bitter arctic.  It has powers over cold,"
    ' xor ax,ax
    ax = &HB28
    CALL RT_2732_6404("A white dragon is a dragon from the bitter arctic.  It has powers over cold,", DS, &HB28, 65)
    ax = "and a cold heart to match.  Be careful around this one."
    PUSH DS
    PUSH "and a cold heart to match.  Be careful around this one."
    ' xor ax,ax
    ax = &HB69
    CALL RT_2732_6404("and a cold heart to match.  Be careful around this one.", DS, &HB69, 65)
    var_0AFE = &HFFFF
    var_0172 = 1
    var_0182 = 1
    GOTO label_0B3BF
    IF local_10 == 19 THEN GOTO label_0B350
    GOTO label_0B3BF
    var_0B16 = 4
    var_0B12 = 130
    var_0B14 = 140
    ax = "PHASE DRAGON"
    PUSH DS
    PUSH "PHASE DRAGON"
    ' xor ax,ax
    ax = &HAE8
    CALL RT_2732_6404("PHASE DRAGON", DS, &HAE8, 20)
    ax = "A phase dragon is a dragon from the outer planes.  Be careful with this one."
    PUSH DS
    PUSH "A phase dragon is a dragon from the outer planes.  Be careful with this one."
    ' xor ax,ax
    ax = &HB28
    CALL RT_2732_6404("A phase dragon is a dragon from the outer planes.  Be careful with this one.", DS, &HB28, 65)
    ax = "Phase dragons are the toughest of all dragons!"
    PUSH DS
    PUSH "Phase dragons are the toughest of all dragons!"
    ' xor ax,ax
    ax = &HB69
    CALL RT_2732_6404("Phase dragons are the toughest of all dragons!", DS, &HB69, 65)
    var_0172 = 1
    var_019C = 1
    var_0164 = 1
    var_0AFE = &HFFFF
    GOTO label_0B3BF
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0B14
    ax = ax - var_0B12
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ax = var_0B12
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_056C()
    var_0158 = ax
    PROC_EXIT
    RETURN
    GOTO label_0C13D
END SUB

SUB she_1B3FD  ' image &H1B3FD, locals 198
  ' strings: It | He | She | it | him | her
    cx = 198
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 2, 3, 513, addr(local_1C))
    ' xor ax,ax
    CALL RT_2732_24B9(addr(local_1C), 2, 3, 513, addr(local_2E))
    si = arg_6
    IF [si] == 0 THEN GOTO label_0B440
    GOTO label_0B445
    CALL monster_dat_0ED1E()
    ax = "It"
    PUSH DS
    PUSH "It"
    ' xor ax,ax
    PUSH "It"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("It", 1)
    CALL RT_2732_6404(ES, BX, 3)
    ax = "He"
    PUSH DS
    PUSH "He"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("He", 1, 1)
    CALL RT_2732_6404(ES, BX, 3)
    ax = "She"
    PUSH DS
    PUSH "She"
    ' xor ax,ax
    bx = addr(local_1C)
    CALL array_element("She", 2, 1)
    CALL RT_2732_6404(ES, BX, 3)
    ax = "it"
    PUSH DS
    PUSH "it"
    ' xor ax,ax
    PUSH "it"
    ' xor ax,ax
    bx = addr(local_2E)
    CALL array_element("it", 1)
    CALL RT_2732_6404(ES, BX, 3)
    ax = "him"
    PUSH DS
    PUSH "him"
    ' xor ax,ax
    bx = addr(local_2E)
    CALL array_element("him", 1, 1)
    CALL RT_2732_6404(ES, BX, 3)
    ax = "her"
    PUSH DS
    PUSH "her"
    ' xor ax,ax
    bx = addr(local_2E)
    CALL array_element("her", 2, 1)
    CALL RT_2732_6404(ES, BX, 3)
    bx = addr(local_1C)
    CALL array_element(var_0BAA, 1)
    ax = 432
    CALL RT_2732_6404(ES, BX, 3, DS, 432, 3)
    bx = addr(local_2E)
    CALL array_element(var_0BAA, 1)
    ax = 435
    CALL RT_2732_6404(ES, BX, 3, DS, 435, 3)
    CALL near_0B603()
    CALL near_0B6FD()
    ax = 0
    IF var_015A <> 0 THEN GOTO label_0B568
    ax = ax - 1
    cx = 0
    IF var_015C <> 0 THEN GOTO label_0B573
    cx = cx - 1
    ' and cx,ax
    ax = 0
    IF var_0112 <> 0 THEN GOTO label_0B580
    ax = ax - 1
    bx = ax
    ' and ax,cx
    cx = 0
    IF local_30 <> 0 THEN GOTO label_0B58E
    cx = cx - 1
    dx = cx
    ' and cx,ax
    ' and cx,cx
    IF local_30 <> 0 THEN GOTO label_0B55A
    ' and bx,dx
    ' and bx,bx
    IF local_30 <> 0 THEN GOTO label_0B59F
    GOTO label_0B600
    IF var_015A == 1 THEN GOTO label_0B5A9
    GOTO label_0B5AE
    CALL you_have_been_damaged_for_1C2E6()
    ax = 0
    IF local_32 <= 0 THEN GOTO label_0B5B8
    ax = ax - 1
    cx = 0
    IF local_34 <= 0 THEN GOTO label_0B5C2
    cx = cx - 1
    ' or cx,ax
    ax = 0
    IF local_36 <= 0 THEN GOTO label_0B5CE
    ax = ax - 1
    ' or ax,cx
    cx = 0
    IF local_38 <= 0 THEN GOTO label_0B5DA
    cx = cx - 1
    ' or cx,ax
    ax = 0
    IF local_3A <= 0 THEN GOTO label_0B5E6
    ax = ax - 1
    ' or ax,cx
    ' and ax,ax
    IF local_3A <> 0 THEN GOTO label_0B5EF
    GOTO label_0B5FB
    di = "You feel much better now."
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    CALL hit_any_key_to_continue_2434A()
    GOTO label_0C0DF
    var_0094 = 0
    local_40 = 1
    ' float_D9
    ' float_D9
    ax = var_0210
    ax = ax + var_00BC
    CALL RT_2F00_0558()
    ' float_D9
    IF var_0238 > 0 THEN GOTO label_0B635
    GOTO label_0B646
    ax = var_0242
    CALL RT_2F00_0558()
    ' float_D9
    GOTO label_0B651
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ax = var_0B24
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF var_0238 > 0 THEN GOTO label_0B673
    GOTO label_0B681
    ax = var_0B24
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0238 > 0 THEN GOTO label_0B695
    GOTO label_0B69F
    ' float_D9
    ' float_D9
    CALL proc_1C494(addr(local_40), addr(local_56))
    local_58 = 3
    local_5A = 1
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    di = ax
    si = "You encounter a "
    CALL near_0A68B()
    di = ax
    si = addr(local_5E)
    CALL near_0A683()
    local_60 = 1
    CALL locate_print_21DEA(addr(local_58), addr(local_5A), addr(local_5E), addr(local_60))
    CALL free_string(addr(local_5E))
    local_56 = 4
    RETURN
    CALL name_1C5C5(addr(local_40), addr(local_56))
    CALL proc_1D0EC(addr(local_40), addr(local_56))
    local_62 = local_62 + 1
    CALL proc_1D0B6(addr(local_40), addr(local_56))
    CALL is_voided_out_202C6()
    ax = 0
    IF var_015A <> 0 THEN GOTO label_0B737
    ax = ax - 1
    cx = 0
    IF var_015C <> 0 THEN GOTO label_0B742
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_015C <> 0 THEN GOTO label_0B74B
    GOTO label_0B907
    IF local_62 > 1 THEN GOTO label_0B754
    GOTO label_0B761
    CALL you_are_shocked_for_1E3C3(addr(local_34), addr(local_36))
    ax = 0
    IF var_0112 <> 0 THEN GOTO label_0B76C
    ax = ax - 1
    cx = 0
    IF local_30 <> 0 THEN GOTO label_0B776
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF local_30 <> 0 THEN GOTO label_0B77F
    GOTO label_0B907
    CALL near_0B908()
    CALL proc_1D0EC(addr(local_40), addr(local_56))
    CALL proc_1D0B6(addr(local_40), addr(local_56))
    ax = 0
    IF local_56 <= 13 THEN GOTO label_0B7A6
    ax = ax - 1
    cx = 0
    IF var_0094 <> 0 THEN GOTO label_0B7B1
    cx = cx - 1
    ' and cx,ax
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF var_0094 <> 0 THEN GOTO label_0B7C9
    ax = ax - 1
    ' and ax,cx
    ' and ax,ax
    IF var_0094 <> 0 THEN GOTO label_0B7D2
    GOTO label_0B7F3
    CALL hit_any_key_to_continue_2434A()
    local_68 = 3
    local_6A = 16
    CALL proc_21194(addr(local_68), addr(local_6A))
    local_56 = 3
    local_6C = 0
    CALL proc_25D42(addr(local_6C), addr(local_62))
    di = ax
    si = addr(local_70)
    CALL near_0A683()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    si = ax
    di = "Round "
    CALL near_0A68B()
    si = ax
    di = addr(local_70)
    CALL near_0A68B()
    di = ax
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0094 == 0 THEN GOTO label_0B84B
    GOTO label_0B84E
    CALL near_0BA44()
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF var_0094 <> 0 THEN GOTO label_0B864
    ax = ax - 1
    cx = 0
    IF var_015A <> 0 THEN GOTO label_0B86F
    cx = cx - 1
    ' and cx,ax
    ax = 0
    IF var_015C <> 0 THEN GOTO label_0B87C
    ax = ax - 1
    ' and ax,cx
    ' and ax,ax
    IF var_015C <> 0 THEN GOTO label_0B885
    GOTO label_0B893
    local_76 = 0
    CALL proc_1E1BB(addr(local_30))
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF var_015C <> 0 THEN GOTO label_0B8A9
    ax = ax - 1
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_015C <> 0 THEN GOTO label_0B8C1
    ax = ax - 1
    ' and ax,bx
    cx = 0
    IF var_015A <> 0 THEN GOTO label_0B8CE
    cx = cx - 1
    ' and cx,ax
    ax = 0
    IF var_015C <> 0 THEN GOTO label_0B8DB
    ax = ax - 1
    ' and ax,cx
    cx = 0
    IF var_0112 <> 0 THEN GOTO label_0B8E8
    cx = cx - 1
    ' and cx,ax
    ax = 0
    IF local_30 <> 0 THEN GOTO label_0B8F4
    ax = ax - 1
    ' and ax,cx
    ' and ax,ax
    IF local_30 <> 0 THEN GOTO label_0B8FD
    GOTO label_0B907
    local_7C = 0
    CALL the_monster_phases_as_your_1FFAD()
    RETURN
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D9
    ax = local_7C
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    local_7C = ax
    ax = var_0B24
    local_76 = local_76 + ax
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    ' jc 0xb966
    ax = ax - 1
    cx = 0
    IF local_62 <> 1 THEN GOTO label_0B970
    cx = cx - 1
    dx = 0
    IF var_0AFE <= &HFFFF THEN GOTO label_0B97B
    dx = dx - 1
    ' and dx,cx
    ' or dx,ax
    ' and dx,dx
    IF var_0AFE <> &HFFFF THEN GOTO label_0B986
    GOTO label_0B994
    ' float_D9
    ' float_D9
    GOTO label_0B99F
    ' float_D9
    ' float_D9
    ' float_D9
    ax = local_7C
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ax = 0
    ' jnc 0xb9b8
    ax = ax - 1
    cx = 0
    IF local_62 <> 1 THEN GOTO label_0B9C2
    cx = cx - 1
    dx = 0
    IF var_0AFE <= &HFFFF THEN GOTO label_0B9CD
    dx = dx - 1
    ' and dx,cx
    ' or dx,ax
    ' and dx,dx
    IF var_0AFE <> &HFFFF THEN GOTO label_0B9D8
    GOTO label_0B9E6
    ' float_D9
    ' float_D9
    GOTO label_0B9F1
    ' float_D9
    ' float_D9
    ' float_D9
    ax = local_76
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ax = 0
    ' jnc 0xba0a
    ax = ax - 1
    cx = 0
    IF local_62 <> 1 THEN GOTO label_0BA14
    cx = cx - 1
    dx = 0
    IF var_0AFE <= &HFFFF THEN GOTO label_0BA1F
    dx = dx - 1
    ' and dx,cx
    ' or dx,ax
    ' and dx,dx
    IF var_0AFE <> &HFFFF THEN GOTO label_0BA2A
    GOTO label_0BA38
    ' float_D9
    ' float_D9
    GOTO label_0BA43
    ' float_D9
    ' float_D9
    RETURN
    ' float_D9
    ' float_D9
    ax = 0
    IF var_00B2 <> 1 THEN GOTO label_0BA5A
    ax = ax - 1
    bx = ax
    ax = var_01E4
    cx = 0
    IF ax <= var_01E2 THEN GOTO label_0BA69
    cx = cx - 1
    ' and cx,bx
    ' and cx,cx
    IF ax <> var_01E2 THEN GOTO label_0BA72
    GOTO label_0BA76
    var_01E2 = var_01E2 + 1
    IF var_00B0 <> 0 THEN GOTO label_0BA80
    GOTO label_0BAD2
    di = "You are incapacitated!"
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_00B0 == 0 THEN GOTO label_0BABF
    GOTO label_0BAD1
    di = "You start to move again!"
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    var_00B0 = 0
    RETURN
    IF var_00BE == 1 THEN GOTO label_0BADC
    GOTO label_0BAFB
    IF var_0208 == 1 THEN GOTO label_0BAE6
    GOTO label_0BAF5
    di = "It appears that Gilcrest is blocking your BAZERKER curse!"
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    GOTO label_0BAFB
    var_0094 = 1
    IF var_0094 == 0 THEN GOTO label_0BB05
    GOTO label_0BBF3
    CALL proc_1D0EC(addr(local_40), addr(local_56))
    local_86 = 15
    local_88 = 0
    CALL color_25283(addr(local_86), addr(local_88))
    local_8A = 21
    local_8C = 1
    di = "What do you wish to do?"
    si = addr(local_90)
    CALL near_0A683()
    local_92 = 0
    CALL locate_print_21DEA(addr(local_8A), addr(local_8C), addr(local_90), addr(local_92))
    CALL free_string(addr(local_90))
    ax = 72
    ax = 112
    CALL RT_2732_6404(DS, 72, 1, DS, 112, 2)
    ax = &H9910
    PUSH DS
    PUSH &H9910
    ' xor ax,ax
    ax = 114
    CALL RT_2732_6404(&H9910, DS, 114, 2)
    ax = "ENTER"
    PUSH DS
    PUSH "ENTER"
    ' xor ax,ax
    ax = 116
    CALL RT_2732_6404("ENTER", DS, 116, 10)
    ax = "RUN"
    PUSH DS
    PUSH "RUN"
    ' xor ax,ax
    ax = 126
    CALL RT_2732_6404("RUN", DS, 126, 10)
    CALL f_fight_1C730(addr(local_98))
    di = ax
    si = addr(local_96)
    CALL near_0A683()
    di = addr(local_96)
    si = addr(local_9C)
    CALL near_0A683()
    CALL proc_1D0B6(addr(local_40), addr(local_56))
    GOTO label_0BBFD
    di = &H9928
    si = addr(local_9C)
    CALL near_0A683()
    CALL proc_1D0EC(addr(local_40), addr(local_56))
    di = addr(local_9C)
    si = addr(local_A0)
    CALL near_0A683()
    CALL RT_2732_6130(addr(local_A0), &H992E)
    IF var_0094 == 0 THEN GOTO label_0BC28
    GOTO label_0BC65
    di = &H9934
    si = addr(local_A4)
    CALL near_0A683()
    local_A6 = 1
    CALL monster_dat_19049(addr(local_A4), addr(local_A6))
    CALL free_string(addr(local_A4))
    CALL round_1CE5C(addr(local_62), addr(local_40), addr(local_56))
    GOTO label_0C0B3
    CALL RT_2732_6130(addr(local_A0), &H9938)
    IF var_0094 == 0 THEN GOTO label_0BC78
    GOTO label_0BCCA
    local_A8 = 1
    local_AA = 25
    CALL proc_21194(addr(local_A8), addr(local_AA))
    di = "HELPFIGHT"
    si = addr(local_AE)
    CALL near_0A683()
    CALL sb_dat_21E13(addr(local_AE))
    CALL free_string(addr(local_AE))
    CALL hit_any_key_to_continue_2434A()
    CALL round_1CE5C(addr(local_62), addr(local_40), addr(local_56))
    GOTO label_0BA44
    CALL RT_2732_6130(addr(local_A0), &H994C)
    IF var_0094 == 0 THEN GOTO label_0BCDD
    GOTO label_0BD01
    local_B0 = 1
    CALL wield_0684E(addr(local_B0))
    CALL round_1CE5C(addr(local_62), addr(local_40), addr(local_56))
    GOTO label_0C0B3
    CALL RT_2732_6130(addr(local_A0), &H9952)
    IF var_0094 == 0 THEN GOTO label_0BD14
    GOTO label_0BD37
    CALL proc_0D0CF()
    CALL name_0AF8B()
    CALL sing_a_song_108A6()
    CALL round_1CE5C(addr(local_62), addr(local_40), addr(local_56))
    GOTO label_0C0B3
    CALL RT_2732_6130(addr(local_A0), &H9958)
    IF var_0094 == 0 THEN GOTO label_0BD4A
    GOTO label_0BDA7
    CALL proc_0D0CF()
    CALL name_0AF8B()
    local_B2 = 1
    CALL cast_a_spell_00423(addr(local_B2))
    IF var_015A == 0 THEN GOTO label_0BD6E
    GOTO label_0BD82
    CALL round_1CE5C(addr(local_62), addr(local_40), addr(local_56))
    GOTO label_0BDA4
    ax = var_0158
    ' imul word [0xafc]
    ' cwd
    ax = ax + var_021C
    ' adc dx,[0x21e]
    ax = ax + var_0B0C
    ' adc dx,[0xb0e]
    var_021C = ax
    var_021E = dx
    GOTO label_0C0DF
    GOTO label_0C0B3
    CALL RT_2732_6130(addr(local_A0), &H995E)
    IF var_015A == 0 THEN GOTO label_0BDBA
    GOTO label_0BDD3
    CALL character_monster_match_up_1A696()
    CALL round_1CE5C(addr(local_62), addr(local_40), addr(local_56))
    GOTO label_0BA44
    CALL proc_1D0B6(addr(local_40), addr(local_56))
    di = addr(local_9C)
    si = addr(local_B6)
    CALL near_0A683()
    CALL RT_2732_6130(addr(local_B6), &H9964)
    IF var_015A <> 0 THEN GOTO label_0BDFE
    GOTO label_0BE11
    CALL RT_2732_6130(addr(local_B6), &H9928)
    IF var_015A == 0 THEN GOTO label_0BE11
    GOTO label_0BEDE
    CALL RT_2732_6130(addr(local_9C), &H9928)
    IF var_015A == 0 THEN GOTO label_0BE24
    GOTO label_0BE2A
    var_0094 = 1
    ax = 0
    IF var_0208 <> 1 THEN GOTO label_0BE35
    ax = ax - 1
    cx = 0
    IF var_0AFE < 0 THEN GOTO label_0BE40
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0AFE <> 0 THEN GOTO label_0BE49
    GOTO label_0BE76
    var_0094 = 0
    di = "As you are about to attack, your staff starts to glow.  You are appalled"
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    di = "that you would even THINK of attacking such a noble creature.  (Of course"
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    di = "NOW is the perfect time for an attack of consience.)"
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    GOTO label_0BEDB
    ax = 0
    IF var_0208 <> 1 THEN GOTO label_0BE81
    ax = ax - 1
    cx = var_01E0
    cx = cx * 2
    cx = cx + &HFFF6
    dx = 0
    IF cx <= var_0AFC THEN GOTO label_0BE94
    dx = dx - 1
    ' and dx,ax
    ' and dx,dx
    IF cx <> var_0AFC THEN GOTO label_0BE9D
    GOTO label_0BED6
    var_0094 = 0
    di = "As you are about to attack, your staff starts to glow.  OH MY GOD! HOW"
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    di = "could you even THINK of attacking such a weak and pathetic creature."
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    di = "(Hmmm. You also find it odd that such one-sidedness never used to bother you"
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    di = "at all.)"
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    GOTO label_0BEDB
    CALL you_hit_1C8BF()
    GOTO label_0BFD5
    CALL RT_2732_6130(addr(local_B6), &H9B2A)
    IF cx == var_0AFC THEN GOTO label_0BEF1
    GOTO label_0BF11
    IF local_62 == 1 THEN GOTO label_0BEFA
    GOTO label_0BF02
    CALL then_takes_a_208DD()
    GOTO label_0BF0E
    di = "It's too late for talking!"
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    GOTO label_0BFD5
    CALL RT_2732_6130(addr(local_B6), &H9910)
    IF local_62 <> 1 THEN GOTO label_0BF24
    GOTO label_0BF55
    CALL RT_2732_6130(addr(local_B6), &H9B4E)
    IF local_62 <> 1 THEN GOTO label_0BF37
    GOTO label_0BF55
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_B6))
    IF local_62 == 1 THEN GOTO label_0BF55
    GOTO label_0BF5D
    CALL you_cannot_get_away_1CF1A()
    GOTO label_0BFD5
    CALL proc_1D0EC(addr(local_40), addr(local_56))
    di = "Unknown key was hit.  Hit 'H' for help."
    si = addr(local_BA)
    CALL near_0A683()
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    di = ax
    si = addr(local_BE)
    CALL near_0A683()
    CALL proc_2311E(addr(local_BA), addr(local_BE))
    ax = addr(local_BE)
    PUSH DS
    PUSH addr(local_BE)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_BE), DS, 79, 1)
    CALL free_string(addr(local_BA))
    CALL free_string(addr(local_BE))
    CALL proc_1D0B6(addr(local_40), addr(local_56))
    GOTO label_0BA44
    ax = 0
    IF var_0208 <> 1 THEN GOTO label_0BFE0
    ax = ax - 1
    cx = 0
    IF var_0AFE <> &HFFFF THEN GOTO label_0BFEB
    cx = cx - 1
    ' and cx,ax
    ax = var_01E0
    ax = ax * 2
    ax = ax + &HFFF6
    dx = 0
    IF ax >= var_0AFC THEN GOTO label_0BFFF
    dx = dx - 1
    ' and dx,cx
    ' and dx,dx
    IF ax <> var_0AFC THEN GOTO label_0C008
    GOTO label_0C0B3
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == var_0AFC THEN GOTO label_0C03B
    GOTO label_0C0B3
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_C4 = ax
    di = "Lightning bolts shoot out of your STAFF OF POWER and damages the monster"
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    local_C6 = 0
    CALL proc_25D42(addr(local_C6), addr(local_C4))
    di = ax
    si = addr(local_CA)
    CALL near_0A683()
    di = addr(local_CA)
    si = "for "
    CALL near_0A68B()
    si = ax
    di = " hitpoints!"
    CALL near_0A68B()
    di = ax
    si = addr(local_3E)
    CALL near_0A683()
    CALL near_0C0B4()
    ax = local_C4
    var_0158 = var_0158 - ax
    CALL you_ve_killed_1D25D()
    RETURN
    local_CC = 3
    local_CE = 16
    local_D0 = 1
    CALL proc_2255D(addr(local_CC), addr(local_CE), addr(local_3E), addr(local_D0))
    RETURN
    CALL free_string(addr(local_CA))
    CALL free_string(addr(local_B6))
    CALL free_string(addr(local_A0))
    CALL free_string(addr(local_96))
    CALL free_string(addr(local_70))
    CALL free_string(addr(local_9C))
    CALL erase_array(addr(local_2E))
    CALL erase_array(addr(local_1C))
    CALL free_string(addr(local_3E))
    PROC_EXIT
    RETURN
    GOTO label_0C2E3
END SUB

SUB proc_1C140  ' image &H1C140, locals 64
  ' strings: The monster swipes at your DREAMWOLF | As the blades passes through the wolf, the monster realizes that since wolves | can't phase, this must be an illusion! As the illusion is discovered, it  | fades away.  No more DREAMWOLF! | The wolf seems to phase as the strike passes through it.  The monster looks | more than a little shaken and backs off!
    cx = 64
    CALL frame_enter()
    local_C = 3
    local_E = 16
    di = "The monster swipes at your DREAMWOLF"
    si = addr(local_12)
    CALL near_0A683()
    local_14 = 1
    CALL proc_2255D(addr(local_C), addr(local_E), addr(local_12), addr(local_14))
    CALL free_string(addr(local_12))
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF ? <> ? THEN GOTO label_0C1B0
    ax = ax - 1
    cx = 0
    IF var_0B00 <> 1 THEN GOTO label_0C1BB
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0B00 <> 1 THEN GOTO label_0C1C4
    GOTO label_0C26F
    local_16 = 3
    local_18 = 16
    di = "As the blades passes through the wolf, the monster realizes that since wolves"
    si = addr(local_1C)
    CALL near_0A683()
    local_1E = 1
    CALL proc_2255D(addr(local_16), addr(local_18), addr(local_1C), addr(local_1E))
    CALL free_string(addr(local_1C))
    local_24 = 3
    local_26 = 16
    di = "can't phase, this must be an illusion! As the illusion is discovered, it "
    si = addr(local_2A)
    CALL near_0A683()
    local_2C = 1
    CALL proc_2255D(addr(local_24), addr(local_26), addr(local_2A), addr(local_2C))
    CALL free_string(addr(local_2A))
    local_2E = 3
    local_30 = 16
    di = "fades away.  No more DREAMWOLF!"
    si = addr(local_34)
    CALL near_0A683()
    local_36 = 1
    CALL proc_2255D(addr(local_2E), addr(local_30), addr(local_34), addr(local_36))
    CALL free_string(addr(local_34))
    var_021A = 0
    GOTO label_0C2DB
    local_38 = 3
    local_3A = 16
    di = "The wolf seems to phase as the strike passes through it.  The monster looks"
    si = addr(local_3E)
    CALL near_0A683()
    local_40 = 1
    CALL proc_2255D(addr(local_38), addr(local_3A), addr(local_3E), addr(local_40))
    CALL free_string(addr(local_3E))
    local_42 = 3
    local_44 = 16
    di = "more than a little shaken and backs off!"
    si = addr(local_48)
    CALL near_0A683()
    local_4A = 1
    CALL proc_2255D(addr(local_42), addr(local_44), addr(local_48), addr(local_4A))
    CALL free_string(addr(local_48))
    PROC_EXIT
    RETURN
    GOTO label_0C491
END SUB

SUB you_have_been_damaged_for_1C2E6  ' image &H1C2E6, locals 42
  ' strings:  was really a SPORE CLOUD.  It exploded when you hit it! | You have been damaged for  |  hitpoints! | You've killed  | !!
    cx = 42
    CALL frame_enter()
    ax = var_0158
    ' imul word [0xafc]
    ' cwd
    ax = ax + var_021C
    ' adc dx,[0x21e]
    ax = ax + var_0B0C
    ' adc dx,[0xb0e]
    var_021C = ax
    var_021E = dx
    IF var_019A == 1 THEN GOTO label_0C317
    GOTO label_0C42D
    local_C = 3
    local_E = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " was really a SPORE CLOUD.  It exploded when you hit it!"
    CALL near_0A68B()
    di = ax
    si = addr(local_12)
    CALL near_0A683()
    local_14 = 1
    CALL proc_2255D(addr(local_C), addr(local_E), addr(local_12), addr(local_14))
    CALL free_string(addr(local_12))
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_26 = ax
    local_16 = 3
    local_18 = 16
    local_1A = 0
    CALL proc_25D42(addr(local_1A), addr(local_26))
    di = ax
    si = addr(local_1E)
    CALL near_0A683()
    di = addr(local_1E)
    si = "You have been damaged for "
    CALL near_0A68B()
    si = ax
    di = " hitpoints!"
    CALL near_0A68B()
    di = ax
    si = addr(local_22)
    CALL near_0A683()
    local_24 = 1
    CALL proc_2255D(addr(local_16), addr(local_18), addr(local_22), addr(local_24))
    CALL free_string(addr(local_22))
    ax = local_26
    var_01E2 = var_01E2 - ax
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    di = ax
    si = addr(local_2A)
    CALL near_0A683()
    CALL loss_of_str_007A9(addr(local_2A))
    ax = addr(local_2A)
    PUSH DS
    PUSH addr(local_2A)
    ' xor ax,ax
    ax = &HAE8
    CALL RT_2732_6404(addr(local_2A), DS, &HAE8, 20)
    CALL free_string(addr(local_2A))
    GOTO label_0C480
    local_2C = 3
    local_2E = 16
    ax = 435
    CALL RT_2732_63DF(DS, 435, 3)
    di = ax
    si = "You've killed "
    CALL near_0A68B()
    si = ax
    di = "!!"
    CALL near_0A68B()
    di = ax
    si = addr(local_32)
    CALL near_0A683()
    local_34 = 1
    CALL proc_2255D(addr(local_2C), addr(local_2E), addr(local_32), addr(local_34))
    CALL free_string(addr(local_32))
    CALL free_string(addr(local_1E))
    PROC_EXIT
    RETURN
    GOTO label_0C5C2
END SUB

SUB proc_1C494  ' image &H1C494, locals 34
    cx = 34
    CALL frame_enter()
    local_C = 1
    local_E = 25
    CALL proc_21194(addr(local_C), addr(local_E))
    CALL RT_2732_62BC(80)
    di = ax
    si = addr(local_16)
    CALL near_0A683()
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    CALL RT_2732_6374(20)
    di = ax
    si = addr(local_1A)
    CALL near_0A683()
    ' float_D9
    CALL RT_2732_6199(addr(local_1A))
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_DE
    ' float_D9
    ax = addr(local_16)
    PUSH DS
    PUSH addr(local_16)
    ' xor ax,ax
    PUSH addr(local_16)
    PUSH addr(local_1A)
    CALL RT_2732_6199(addr(local_1A))
    ' float_D9
    PUSH addr(local_1A)
    CALL RT_2F00_056C()
    CALL RT_2732_650E(addr(local_1A))
    local_10 = 0
    local_12 = 6
    CALL color_25283(addr(local_10), addr(local_12))
    local_20 = 0
    CALL print_more_21DB9(addr(local_16), addr(local_20))
    local_22 = 17
    local_24 = 1
    di = &H9DDA
    si = addr(local_28)
    CALL near_0A683()
    local_2A = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_24), addr(local_28), addr(local_2A))
    CALL free_string(addr(local_28))
    local_2C = 1
    CALL proc_253B3(arg_6, addr(local_2C))
    CALL name_1C5C5(arg_8, arg_6)
    CALL free_string(addr(local_1A))
    CALL free_string(addr(local_16))
    PROC_EXIT
    RETURN
    GOTO label_0C72D
END SUB

SUB name_1C5C5  ' image &H1C5C5, locals 40
  ' strings: NAME -  | HITPOINTS -  | MONSTER YOU ARE CURRENTLY FIGHTING - 
    cx = 40
    CALL frame_enter()
    CALL proc_1D0EC(addr(local_C), arg_6)
    local_E = 15
    local_10 = 0
    CALL color_25283(addr(local_E), addr(local_10))
    ax = 440
    CALL RT_2732_63DF(DS, 440, 20)
    CALL RT_2732_6374(20)
    di = ax
    si = "NAME - "
    CALL near_0A68B()
    di = ax
    si = addr(local_1A)
    CALL near_0A683()
    local_12 = 18
    local_14 = 1
    local_16 = 0
    CALL locate_print_21DEA(addr(local_12), addr(local_14), addr(local_1A), addr(local_16))
    local_1C = 3
    CALL proc_25D42(addr(local_1C), 482)
    di = ax
    si = addr(local_20)
    CALL near_0A683()
    local_22 = 3
    CALL proc_25D42(addr(local_22), 484)
    di = ax
    si = addr(local_26)
    CALL near_0A683()
    di = addr(local_20)
    si = "HITPOINTS - "
    CALL near_0A68B()
    si = ax
    di = &H9E4A
    CALL near_0A68B()
    si = ax
    di = addr(local_26)
    CALL near_0A68B()
    di = ax
    si = addr(local_1A)
    CALL near_0A683()
    local_28 = 18
    local_2A = 40
    local_2C = 1
    CALL locate_print_21DEA(addr(local_28), addr(local_2A), addr(local_1A), addr(local_2C))
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    CALL RT_2732_6374(20)
    di = ax
    si = "MONSTER YOU ARE CURRENTLY FIGHTING - "
    CALL near_0A68B()
    di = ax
    si = addr(local_1A)
    CALL near_0A683()
    local_2E = 0
    CALL print_more_21DB9(addr(local_1A), addr(local_2E))
    CALL proc_1D0B6(addr(local_C), arg_6)
    local_30 = 7
    local_32 = 0
    CALL color_25283(addr(local_30), addr(local_32))
    CALL free_string(addr(local_26))
    CALL free_string(addr(local_20))
    CALL free_string(addr(local_1A))
    PROC_EXIT
    RETURN
    GOTO label_0C8BC
END SUB

SUB f_fight_1C730  ' image &H1C730, locals 40
  ' strings: (F) Fight | (K) Kill | (T) Talk | (R) Run | (M) Monster info | (C) Cast
    cx = 40
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 10, 4, &H8001, addr(local_1C))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(F) Fight"
    CALL near_0A683()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(K) Kill"
    CALL near_0A683()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(T) Talk"
    CALL near_0A683()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "(R) Run"
    CALL near_0A683()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "(M) Monster info"
    CALL near_0A683()
    bx = addr(local_1C)
    CALL array_element(6, 1)
    si = bx
    di = "(C) Cast"
    CALL near_0A683()
    bx = addr(local_1C)
    CALL array_element(7, 1)
    si = bx
    di = "(S) Sing"
    CALL near_0A683()
    bx = addr(local_1C)
    CALL array_element(8, 1)
    si = bx
    di = "(I) Inventory"
    CALL near_0A683()
    bx = addr(local_1C)
    CALL array_element(9, 1)
    si = bx
    di = "(W) Wish"
    CALL near_0A683()
    bx = addr(local_1C)
    CALL array_element(10, 1)
    si = bx
    di = "(H) Help"
    CALL near_0A683()
    local_1E = 10
    local_20 = 5
    local_22 = 1
    local_24 = 22
    local_26 = 2
    local_28 = 0
    local_2A = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_1E), addr(local_20), addr(local_22), addr(local_24), addr(local_26), addr(local_28), arg_6, addr(local_2A))
    di = ax
    si = addr(local_2E)
    CALL near_0A683()
    di = addr(local_2E)
    si = addr(local_32)
    CALL near_0A683()
    CALL free_string(addr(local_2E))
    CALL erase_array(addr(local_1C))
    CALL RT_2732_64F5(addr(local_32))
    PROC_EXIT
    RETURN
    GOTO label_0CC22
END SUB

SUB you_hit_1C8BF  ' image &H1C8BF, locals 86
  ' strings: The monster phases as you hit  | !! | As you miss, you realize that you need a magic weapon to hit this one! | You hit  |  for  |  hitpoints. It's good that you have some magical artifacts!
    cx = 86
    CALL frame_enter()
    CALL proc_25C7F(&HB1C, 154, addr(local_E))
    ' float_D9
    CALL RT_2F00_056C()
    local_1E = ax
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_009C
    CALL RT_2F00_0558()
    ' float_DE
    ax = var_0B1E
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_20 = ax
    CALL proc_25C7F(&HB1C, 154, addr(local_12))
    ' float_D9
    CALL RT_2F00_056C()
    local_22 = ax
    cx = 0
    IF var_0164 <> 1 THEN GOTO label_0C940
    cx = cx - 1
    dx = 0
    IF ax <> 1 THEN GOTO label_0C949
    dx = dx - 1
    ' and dx,cx
    ax = 0
    IF var_00F2 <> 0 THEN GOTO label_0C956
    ax = ax - 1
    ' and ax,dx
    cx = 0
    IF var_015E <> 0 THEN GOTO label_0C963
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_015E <> 0 THEN GOTO label_0C96C
    GOTO label_0C9C2
    local_14 = 3
    local_16 = 16
    ax = 435
    CALL RT_2732_63DF(DS, 435, 3)
    di = ax
    si = "The monster phases as you hit "
    CALL near_0A68B()
    si = ax
    di = "!!"
    CALL near_0A68B()
    di = ax
    si = addr(local_1A)
    CALL near_0A683()
    local_1C = 1
    CALL proc_2255D(addr(local_14), addr(local_16), addr(local_1A), addr(local_1C))
    CALL free_string(addr(local_1A))
    GOTO label_0CC08
    ax = 0
    IF var_0190 <> 1 THEN GOTO label_0C9CD
    ax = ax - 1
    cx = 0
    IF var_00F8 <> 0 THEN GOTO label_0C9D8
    cx = cx - 1
    ' and cx,ax
    ax = 0
    IF var_00F2 <> 0 THEN GOTO label_0C9E5
    ax = ax - 1
    ' and ax,cx
    cx = 0
    IF var_015E <> 0 THEN GOTO label_0C9F2
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_015E <> 0 THEN GOTO label_0C9FB
    GOTO label_0CA3A
    local_24 = 3
    local_26 = 16
    di = "As you miss, you realize that you need a magic weapon to hit this one!"
    si = addr(local_2A)
    CALL near_0A683()
    local_2C = 1
    CALL proc_2255D(addr(local_24), addr(local_26), addr(local_2A), addr(local_2C))
    CALL free_string(addr(local_2A))
    var_0094 = 0
    GOTO label_0CC08
    ax = 0
    IF local_20 <= 0 THEN GOTO label_0CA44
    ax = ax - 1
    cx = 0
    IF local_1E <> 0 THEN GOTO label_0CA4E
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF local_1E <> 0 THEN GOTO label_0CA57
    GOTO label_0CB90
    ax = var_0158
    IF ax < local_20 THEN GOTO label_0CA62
    GOTO label_0CA65
    local_20 = ax
    ax = 0
    IF var_0190 <> 1 THEN GOTO label_0CA70
    ax = ax - 1
    cx = 0
    IF var_00F8 <> 1 THEN GOTO label_0CA7B
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_00F8 <> 1 THEN GOTO label_0CA84
    GOTO label_0CB04
    local_2E = 3
    local_30 = 16
    local_32 = 0
    CALL proc_25D42(addr(local_32), addr(local_20))
    di = ax
    si = addr(local_36)
    CALL near_0A683()
    ax = 435
    CALL RT_2732_63DF(DS, 435, 3)
    di = ax
    si = "You hit "
    CALL near_0A68B()
    si = ax
    di = " for "
    CALL near_0A68B()
    si = ax
    di = addr(local_36)
    CALL near_0A68B()
    si = ax
    di = " hitpoints. It's good that you have some magical artifacts!"
    CALL near_0A68B()
    di = ax
    si = addr(local_3A)
    CALL near_0A683()
    local_3C = 1
    CALL proc_2255D(addr(local_2E), addr(local_30), addr(local_3A), addr(local_3C))
    CALL free_string(addr(local_3A))
    GOTO label_0CB81
    local_3E = 3
    local_40 = 16
    local_42 = 0
    CALL proc_25D42(addr(local_42), addr(local_20))
    di = ax
    si = addr(local_46)
    CALL near_0A683()
    ax = 435
    CALL RT_2732_63DF(DS, 435, 3)
    di = ax
    si = "You hit "
    CALL near_0A68B()
    si = ax
    di = " for "
    CALL near_0A68B()
    si = ax
    di = addr(local_46)
    CALL near_0A68B()
    si = ax
    di = " hitpoints!"
    CALL near_0A68B()
    di = ax
    si = addr(local_4A)
    CALL near_0A683()
    local_4C = 1
    CALL proc_2255D(addr(local_3E), addr(local_40), addr(local_4A), addr(local_4C))
    CALL free_string(addr(local_4A))
    ax = local_20
    var_0158 = var_0158 - ax
    CALL you_ve_killed_1D25D()
    GOTO label_0CC08
    IF local_1E == 1 THEN GOTO label_0CB99
    GOTO label_0CBD2
    local_4E = 3
    local_50 = 16
    di = "You missed."
    si = addr(local_54)
    CALL near_0A683()
    local_56 = 1
    CALL proc_2255D(addr(local_4E), addr(local_50), addr(local_54), addr(local_56))
    CALL free_string(addr(local_54))
    GOTO label_0CC08
    local_58 = 3
    local_5A = 16
    di = "Your blow glanced off the monster."
    si = addr(local_5E)
    CALL near_0A683()
    local_60 = 1
    CALL proc_2255D(addr(local_58), addr(local_5A), addr(local_5E), addr(local_60))
    CALL free_string(addr(local_5E))
    CALL free_string(addr(local_46))
    CALL free_string(addr(local_36))
    PROC_EXIT
    RETURN
    GOTO label_0CE59
END SUB

SUB hit_your_1CC25  ' image &H1CC25, locals 60
  ' strings:  hit your  |  for  |  hitpoints! | Your  |  has died! | The blow glanced off your 
    cx = 60
    CALL frame_enter()
    ax = 548
    CALL RT_2732_63DF(DS, 548, 20)
    CALL RT_2732_6374(20)
    di = ax
    si = addr(local_22)
    CALL near_0A683()
    CALL proc_25C7F(&HB18, 584, addr(local_E))
    ' float_D9
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0B1A
    CALL RT_2F00_0558()
    ' float_DE
    ax = var_023E
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_28 = ax
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0CCAD
    GOTO label_0CDE4
    IF local_28 > 0 THEN GOTO label_0CCB6
    GOTO label_0CD9B
    ax = local_28
    var_023C = var_023C - ax
    local_10 = 3
    local_12 = 16
    local_14 = 0
    CALL proc_25D42(addr(local_14), addr(local_28))
    di = ax
    si = addr(local_18)
    CALL near_0A683()
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " hit your "
    CALL near_0A68B()
    si = ax
    di = addr(local_22)
    CALL near_0A68B()
    si = ax
    di = " for "
    CALL near_0A68B()
    si = ax
    di = addr(local_18)
    CALL near_0A68B()
    si = ax
    di = " hitpoints!"
    CALL near_0A68B()
    di = ax
    si = addr(local_1C)
    CALL near_0A683()
    local_1E = 1
    CALL proc_2255D(addr(local_10), addr(local_12), addr(local_1C), addr(local_1E))
    CALL free_string(addr(local_1C))
    IF var_023C < 1 THEN GOTO label_0CD4C
    GOTO label_0CD98
    var_0238 = 0
    local_2A = 3
    local_2C = 16
    di = addr(local_22)
    si = "Your "
    CALL near_0A68B()
    si = ax
    di = " has died!"
    CALL near_0A68B()
    di = ax
    si = addr(local_30)
    CALL near_0A683()
    local_32 = 1
    CALL proc_2255D(addr(local_2A), addr(local_2C), addr(local_30), addr(local_32))
    CALL free_string(addr(local_30))
    GOTO label_0CDE1
    local_34 = 3
    local_36 = 16
    di = addr(local_22)
    si = "The blow glanced off your "
    CALL near_0A68B()
    si = ax
    di = &HA06E
    CALL near_0A68B()
    di = ax
    si = addr(local_3A)
    CALL near_0A683()
    local_3C = 1
    CALL proc_2255D(addr(local_34), addr(local_36), addr(local_3A), addr(local_3C))
    CALL free_string(addr(local_3A))
    GOTO label_0CE3F
    local_3E = 3
    local_40 = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " missed your "
    CALL near_0A68B()
    si = ax
    di = addr(local_22)
    CALL near_0A68B()
    si = ax
    di = &HA06E
    CALL near_0A68B()
    di = ax
    si = addr(local_44)
    CALL near_0A683()
    local_46 = 1
    CALL proc_2255D(addr(local_3E), addr(local_40), addr(local_44), addr(local_46))
    CALL free_string(addr(local_44))
    CALL free_string(addr(local_18))
    CALL free_string(addr(local_22))
    PROC_EXIT
    RETURN
    GOTO label_0CF17
END SUB

SUB round_1CE5C  ' image &H1CE5C, locals 20
  ' strings: Round 
    cx = 20
    CALL frame_enter()
    CALL proc_1C494(arg_8, arg_6)
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_0CE84
    GOTO label_0CEE7
    local_C = 0
    CALL proc_25D42(addr(local_C), arg_A)
    di = ax
    si = addr(local_10)
    CALL near_0A683()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    si = ax
    di = "Round "
    CALL near_0A68B()
    si = ax
    di = addr(local_10)
    CALL near_0A68B()
    di = ax
    si = addr(local_1E)
    CALL near_0A683()
    local_12 = 3
    local_14 = 16
    local_16 = 1
    CALL proc_2255D(addr(local_12), addr(local_14), addr(local_1E), addr(local_16))
    CALL proc_1D0EC(arg_8, arg_6)
    CALL proc_1D0B6(arg_8, arg_6)
    CALL free_string(addr(local_10))
    CALL free_string(addr(local_1E))
    PROC_EXIT
    RETURN
    GOTO label_0D0B3
END SUB

SUB you_cannot_get_away_1CF1A  ' image &H1CF1A, locals 58
  ' strings: Your boots won't let you run! | You run as fast as your feet will take you!  You get away! | 'Come back, you sniveling coward!' You will live to fight another day! | A brave man dies but once, but once is enough! You escape with your life! | You cannot get away!
    cx = 58
    CALL frame_enter()
    CALL proc_25C7F(174, &HB22, addr(local_E))
    ' float_D9
    ' float_D9
    IF var_00D4 < 0 THEN GOTO label_0CF47
    GOTO label_0CF80
    local_10 = 3
    local_12 = 16
    di = "Your boots won't let you run!"
    si = addr(local_16)
    CALL near_0A683()
    local_18 = 1
    CALL proc_2255D(addr(local_10), addr(local_12), addr(local_16), addr(local_18))
    CALL free_string(addr(local_16))
    GOTO label_0D0AB
    IF var_0AFE == 1 THEN GOTO label_0CF8A
    GOTO label_0CFC9
    var_015C = 1
    local_1E = 3
    local_20 = 16
    di = "You run as fast as your feet will take you!  You get away!"
    si = addr(local_24)
    CALL near_0A683()
    local_26 = 1
    CALL proc_2255D(addr(local_1E), addr(local_20), addr(local_24), addr(local_26))
    CALL free_string(addr(local_24))
    GOTO label_0D0AB
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF var_0AFE <> 1 THEN GOTO label_0CFDF
    ax = ax - 1
    cx = 0
    IF var_00D4 <= 0 THEN GOTO label_0CFEA
    cx = cx - 1
    ' or cx,ax
    ' and cx,cx
    IF var_00D4 <> 0 THEN GOTO label_0CFF3
    GOTO label_0D075
    var_015C = 1
    IF var_0B00 == 1 THEN GOTO label_0D003
    GOTO label_0D03C
    local_28 = 3
    local_2A = 16
    di = "'Come back, you sniveling coward!' You will live to fight another day!"
    si = addr(local_2E)
    CALL near_0A683()
    local_30 = 1
    CALL proc_2255D(addr(local_28), addr(local_2A), addr(local_2E), addr(local_30))
    CALL free_string(addr(local_2E))
    GOTO label_0D072
    local_32 = 3
    local_34 = 16
    di = "A brave man dies but once, but once is enough! You escape with your life!"
    si = addr(local_38)
    CALL near_0A683()
    local_3A = 1
    CALL proc_2255D(addr(local_32), addr(local_34), addr(local_38), addr(local_3A))
    CALL free_string(addr(local_38))
    GOTO label_0D0AB
    local_3C = 3
    local_3E = 16
    di = "You cannot get away!"
    si = addr(local_42)
    CALL near_0A683()
    local_44 = 1
    CALL proc_2255D(addr(local_3C), addr(local_3E), addr(local_42), addr(local_44))
    CALL free_string(addr(local_42))
    PROC_EXIT
    RETURN
    GOTO label_0D0E9
END SUB

SUB proc_1D0B6  ' image &H1D0B6, locals 2
    cx = 2
    CALL frame_enter()
    si = arg_8
    IF [si] == 1 THEN GOTO label_0D0C9
    GOTO label_0D0DA
    local_C = 1
    CALL proc_253B3(arg_6, addr(local_C))
    si = arg_8
    [si] = 0
    PROC_EXIT
    RETURN
    GOTO label_0D118
END SUB

SUB proc_1D0EC  ' image &H1D0EC, locals 0
    cx = 0
    CALL frame_enter()
    si = arg_8
    IF [si] == 0 THEN GOTO label_0D0FF
    GOTO label_0D109
    si = arg_6
    CALL RT_2732_68ED()
    [si] = ax
    si = arg_8
    [si] = 1
    PROC_EXIT
    RETURN
    GOTO label_0D25A
END SUB

SUB proc_1D11B  ' image &H1D11B, locals 14
  ' strings: You pick up the red quarterstaff | You pick up the black quarterstaff | You pick up the white quarterstaff
    cx = 14
    CALL frame_enter()
    IF var_0208 == 0 THEN GOTO label_0D12D
    GOTO label_0D1BD
    ax = 0
    IF var_00F0 <> 16 THEN GOTO label_0D138
    ax = ax - 1
    cx = 0
    IF var_0202 <> 0 THEN GOTO label_0D143
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0202 <> 0 THEN GOTO label_0D14C
    GOTO label_0D15E
    di = "You pick up the red quarterstaff"
    si = addr(local_E)
    CALL near_0A683()
    var_0202 = 1
    GOTO label_0D1BD
    ax = 0
    IF var_00F0 <> 19 THEN GOTO label_0D169
    ax = ax - 1
    cx = 0
    IF var_0204 <> 0 THEN GOTO label_0D174
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0204 <> 0 THEN GOTO label_0D17D
    GOTO label_0D18F
    di = "You pick up the black quarterstaff"
    si = addr(local_E)
    CALL near_0A683()
    var_0204 = 1
    GOTO label_0D1BD
    ax = 0
    IF var_00F0 <> 18 THEN GOTO label_0D19A
    ax = ax - 1
    cx = 0
    IF var_0206 <> 0 THEN GOTO label_0D1A5
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0206 <> 0 THEN GOTO label_0D1AE
    GOTO label_0D1BD
    di = "You pick up the white quarterstaff"
    si = addr(local_E)
    CALL near_0A683()
    var_0206 = 1
    local_10 = 2
    local_12 = 42
    local_14 = 0
    CALL locate_print_21DEA(addr(local_10), addr(local_12), addr(local_E), addr(local_14))
    IF var_015A == 1 THEN GOTO label_0D1EB
    GOTO label_0D244
    ax = 78
    ' imul word [0x28c]
    ax = ax + var_028A
    ax = ax + &HFFB2
    CALL RT_2F00_0558()
    ' float_D9
    ax = &H684
    ' float_D9
    PUSH DS
    PUSH &H684
    PUSH &H3F6
    PUSH &HA210
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
    ax = 654
    ' float_D9
    PUSH DS
    PUSH 654
    PUSH &H3F6
    PUSH &HA216
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
    CALL mage_0C4A1()
    CALL free_string(addr(local_E))
    PROC_EXIT
    RETURN
    GOTO label_0D35E
END SUB

SUB you_ve_killed_1D25D  ' image &H1D25D, locals 22
  ' strings: Having enough, the monster teleports away! | You've killed  | .  |  then resurrected!
    cx = 22
    CALL frame_enter()
    IF var_0158 < 1 THEN GOTO label_0D26F
    GOTO label_0D356
    IF var_0186 == 1 THEN GOTO label_0D279
    GOTO label_0D2B8
    var_015C = 1
    local_C = 3
    local_E = 16
    di = "Having enough, the monster teleports away!"
    si = addr(local_12)
    CALL near_0A683()
    local_14 = 1
    CALL proc_2255D(addr(local_C), addr(local_E), addr(local_12), addr(local_14))
    CALL free_string(addr(local_12))
    GOTO label_0D356
    ax = 0
    IF var_0184 <> 1 THEN GOTO label_0D2C3
    ax = ax - 1
    cx = 0
    IF var_015E <> 0 THEN GOTO label_0D2CE
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_015E <> 0 THEN GOTO label_0D2D7
    GOTO label_0D350
    local_16 = 3
    local_18 = 16
    ax = 435
    CALL RT_2732_63DF(DS, 435, 3)
    di = ax
    si = "You've killed "
    CALL near_0A68B()
    si = ax
    di = ". "
    CALL near_0A68B()
    bx = ax
    ax = 432
    local_20 = bx
    CALL RT_2732_63DF(DS, 432, 3)
    di = ax
    si = local_20
    CALL near_0A68B()
    si = ax
    di = " then resurrected!"
    CALL near_0A68B()
    di = ax
    si = addr(local_1C)
    CALL near_0A683()
    local_1E = 1
    CALL proc_2255D(addr(local_16), addr(local_18), addr(local_1C), addr(local_1E))
    CALL free_string(addr(local_1C))
    GOTO label_0D356
    var_015A = 1
    PROC_EXIT
    RETURN
    GOTO label_0DD22
END SUB

SUB stabbed_1D361  ' image &H1D361, locals 170
  ' strings:  stabbed |  tail-stung |  bit |  clawed |  hit |  casts PRISIMATIC SPHERES at you!  They start crushing you!
    cx = 170
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 5, 4, &H8001, addr(local_1C))
    ax = var_0B26
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jnc 0xd3a4
    GOTO label_0D3E0
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_1C)
    CALL array_element(var_0B26, 1)
    si = bx
    di = " stabbed"
    CALL near_0A683()
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jnc 0xd3f5
    GOTO label_0D431
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = " tail-stung"
    CALL near_0A683()
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jnc 0xd446
    GOTO label_0D482
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = " bit"
    CALL near_0A683()
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jnc 0xd497
    GOTO label_0D4D3
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = " clawed"
    CALL near_0A683()
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jnc 0xd4e8
    GOTO label_0D515
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = " hit"
    CALL near_0A683()
    IF var_0198 == 1 THEN GOTO label_0D51F
    GOTO label_0DA45
    IF var_01AE > 0 THEN GOTO label_0D529
    GOTO label_0D564
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " casts PRISIMATIC SPHERES at you!  They start crushing you!"
    CALL near_0A68B()
    di = ax
    si = addr(local_28)
    CALL near_0A683()
    var_01AE = var_01AE - 1
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    GOTO label_0D7AD
    IF var_01AC > 0 THEN GOTO label_0D56E
    GOTO label_0D5A9
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " casts a FIREBALL at you!  You get singed!!"
    CALL near_0A68B()
    di = ax
    si = addr(local_28)
    CALL near_0A683()
    var_01AC = var_01AC - 1
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    GOTO label_0D7AD
    ax = 0
    IF var_01AA <= 0 THEN GOTO label_0D5B4
    ax = ax - 1
    cx = 0
    IF var_0196 <> 0 THEN GOTO label_0D5BF
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0196 <> 0 THEN GOTO label_0D5C8
    GOTO label_0D626
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " casts a HASTE SPELL on itself! "
    CALL near_0A68B()
    bx = ax
    ax = 432
    local_32 = bx
    CALL RT_2732_63DF(DS, 432, 3)
    di = ax
    si = local_32
    CALL near_0A68B()
    si = ax
    di = " starts to speed up!"
    CALL near_0A68B()
    di = ax
    si = addr(local_28)
    CALL near_0A683()
    var_01AA = var_01AA - 1
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    GOTO label_0D7AD
    ax = 0
    IF var_01A8 <= 0 THEN GOTO label_0D631
    ax = ax - 1
    cx = 0
    IF var_00B0 <> 0 THEN GOTO label_0D63C
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_00B0 <> 0 THEN GOTO label_0D645
    GOTO label_0D680
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " casts a SLEEP SPELL at you!  You start to doze off!"
    CALL near_0A68B()
    di = ax
    si = addr(local_28)
    CALL near_0A683()
    var_01A8 = var_01A8 - 1
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    GOTO label_0D7AD
    IF var_01AA > 0 THEN GOTO label_0D68A
    GOTO label_0D6C5
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " casts a MIND WRENCH at you!  You clasp your ears in pain!"
    CALL near_0A68B()
    di = ax
    si = addr(local_28)
    CALL near_0A683()
    var_01AA = var_01AA - 1
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    GOTO label_0D7AD
    IF var_01A8 > 0 THEN GOTO label_0D6CF
    GOTO label_0D70A
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " casts AIR CONSTRICTION!  You turn blue as you lungs start to hurt!"
    CALL near_0A68B()
    di = ax
    si = addr(local_28)
    CALL near_0A683()
    var_01A8 = var_01A8 - 1
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    GOTO label_0D7AD
    IF var_01A6 > 0 THEN GOTO label_0D714
    GOTO label_0D74F
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " casts a MAGIC MISSILE at you!"
    CALL near_0A68B()
    di = ax
    si = addr(local_28)
    CALL near_0A683()
    var_01A6 = var_01A6 - 1
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    GOTO label_0D7AD
    var_0198 = 0
    IF var_0B26 >= 16 THEN GOTO label_0D75F
    GOTO label_0D7AD
    local_34 = 3
    local_36 = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " draws a weapon! (At least no more spells!)"
    CALL near_0A68B()
    di = ax
    si = addr(local_3A)
    CALL near_0A683()
    local_3C = 1
    CALL proc_2255D(addr(local_34), addr(local_36), addr(local_3A), addr(local_3C))
    CALL free_string(addr(local_3A))
    GOTO label_0DCF5
    IF var_0198 == 1 THEN GOTO label_0D7B7
    GOTO label_0D9F3
    ax = var_0B20
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    local_3E = ax
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF var_0198 <> 1 THEN GOTO label_0D7E1
    ax = ax - 1
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_0198 <> 1 THEN GOTO label_0D7F9
    ax = ax - 1
    ' and ax,bx
    ' and ax,ax
    IF var_0198 <> 1 THEN GOTO label_0D802
    GOTO label_0D80A
    local_40 = 5
    GOTO label_0D810
    ax = var_00A4
    local_40 = ax
    CALL proc_25C7F(addr(local_3E), addr(local_40), addr(local_44))
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0198 == 1 THEN GOTO label_0D840
    GOTO label_0D87C
    local_46 = 3
    local_48 = 16
    di = "Its spell goes awry! (Doesn't that make you feel better?)"
    si = addr(local_4C)
    CALL near_0A683()
    local_4E = 1
    CALL proc_2255D(addr(local_46), addr(local_48), addr(local_4C), addr(local_4E))
    CALL free_string(addr(local_4C))
    GOTO label_0DCF5
    GOTO label_0D9F0
    ax = 0
    IF var_00F2 <> 1 THEN GOTO label_0D887
    ax = ax - 1
    cx = 0
    IF var_015E <> 1 THEN GOTO label_0D892
    cx = cx - 1
    ' or cx,ax
    ' and cx,cx
    IF var_015E <> 1 THEN GOTO label_0D89B
    GOTO label_0D8F5
    local_54 = 3
    local_56 = 16
    di = "Its spell approaches you, then fizzles. (Thank God for small favors!)"
    si = addr(local_5A)
    CALL near_0A683()
    local_5C = 1
    CALL proc_2255D(addr(local_54), addr(local_56), addr(local_5A), addr(local_5C))
    CALL free_string(addr(local_5A))
    var_01A6 = 0
    var_01A8 = 0
    var_01AA = 0
    var_01AC = 0
    var_01AE = 0
    GOTO label_0DCF5
    GOTO label_0D9F0
    local_5E = 3
    local_60 = 16
    local_62 = 1
    CALL proc_2255D(addr(local_5E), addr(local_60), addr(local_28), addr(local_62))
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_015E == 1 THEN GOTO label_0D92E
    GOTO label_0D9AC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_015E == 1 THEN GOTO label_0D943
    GOTO label_0D976
    var_0196 = 1
    var_0B24 = var_0B24 + 1
    ' float_D9
    ax = var_0B24
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF var_015E > 1 THEN GOTO label_0D965
    GOTO label_0D973
    ax = var_0B24
    CALL RT_2F00_0558()
    ' float_D9
    GOTO label_0D9A6
    ax = var_00B0
    ax = ax + 1
    CALL RT_2F00_0558()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0AFC
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_DE
    CALL RT_2F00_056C()
    var_00B0 = ax
    GOTO label_0DCF5
    GOTO label_0D9F0
    ' float_D9
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    local_6C = ax
    GOTO label_0DA42
    CALL proc_25C7F(&HB18, 160, addr(local_70))
    ' float_D9
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0B1A
    CALL RT_2F00_0558()
    ' float_DE
    ax = var_009E
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_6C = ax
    GOTO label_0DA94
    CALL proc_25C7F(&HB18, 160, addr(local_74))
    ' float_D9
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0B1A
    CALL RT_2F00_0558()
    ' float_DE
    ax = var_009E
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_6C = ax
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_015E == 1 THEN GOTO label_0DAA9
    GOTO label_0DCB6
    IF local_6C > 0 THEN GOTO label_0DAB2
    GOTO label_0DC74
    ax = local_6C
    var_01E2 = var_01E2 - ax
    IF var_0198 == 1 THEN GOTO label_0DAC3
    GOTO label_0DB2B
    local_76 = 3
    local_78 = 16
    local_7A = 0
    CALL proc_25D42(addr(local_7A), addr(local_6C))
    di = ax
    si = addr(local_7E)
    CALL near_0A683()
    di = addr(local_7E)
    si = "The spell hurt you for "
    CALL near_0A68B()
    si = ax
    di = " hitpoints!"
    CALL near_0A68B()
    di = ax
    si = addr(local_82)
    CALL near_0A683()
    local_84 = 1
    CALL proc_2255D(addr(local_76), addr(local_78), addr(local_82), addr(local_84))
    CALL free_string(addr(local_82))
    GOTO label_0DBF1
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    ' float_D9
    local_86 = 3
    local_88 = 16
    local_8A = 0
    CALL proc_25D42(addr(local_8A), addr(local_6C))
    di = ax
    si = addr(local_8E)
    CALL near_0A683()
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    ' float_D9
    bx = ax
    CALL RT_2F00_056C()
    dx = bx
    bx = addr(local_1C)
    CALL array_element(3, 1)
    di = bx
    si = dx
    CALL near_0A68B()
    si = ax
    di = " you for "
    CALL near_0A68B()
    si = ax
    di = addr(local_8E)
    CALL near_0A68B()
    si = ax
    di = " hitpoints!"
    CALL near_0A68B()
    di = ax
    si = addr(local_92)
    CALL near_0A683()
    local_94 = 1
    CALL proc_2255D(addr(local_86), addr(local_88), addr(local_92), addr(local_94))
    CALL free_string(addr(local_92))
    ax = 0
    IF var_01B6 <> 1 THEN GOTO label_0DBFC
    ax = ax - 1
    cx = 0
    IF var_0198 <> 0 THEN GOTO label_0DC07
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0198 <> 0 THEN GOTO label_0DC10
    GOTO label_0DC1E
    CALL this_monster_is_diseased_1F18C(arg_C, arg_A, arg_8)
    IF var_01E2 < 1 THEN GOTO label_0DC28
    GOTO label_0DC2F
    si = arg_6
    [si] = 1
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    di = ax
    si = addr(local_A0)
    CALL near_0A683()
    CALL loss_of_str_007A9(addr(local_A0))
    ax = addr(local_A0)
    PUSH DS
    PUSH addr(local_A0)
    ' xor ax,ax
    ax = &HAE8
    CALL RT_2732_6404(addr(local_A0), DS, &HAE8, 20)
    CALL free_string(addr(local_A0))
    GOTO label_0DCB3
    local_A2 = 3
    local_A4 = 16
    di = "The blow glanced off you!"
    si = addr(local_A8)
    CALL near_0A683()
    local_AA = 1
    CALL proc_2255D(addr(local_A2), addr(local_A4), addr(local_A8), addr(local_AA))
    CALL free_string(addr(local_A8))
    GOTO label_0DCF5
    local_AC = 3
    local_AE = 16
    di = "You dodge the blow!"
    si = addr(local_B2)
    CALL near_0A683()
    local_B4 = 1
    CALL proc_2255D(addr(local_AC), addr(local_AE), addr(local_B2), addr(local_B4))
    CALL free_string(addr(local_B2))
    CALL free_string(addr(local_8E))
    CALL free_string(addr(local_7E))
    CALL erase_array(addr(local_1C))
    CALL free_string(addr(local_28))
    PROC_EXIT
    RETURN
    GOTO label_0E1B8
END SUB

SUB golddragon_1DD25  ' image &H1DD25, locals 138
  ' strings: GOLDDRAGON |  was impressed with your courage, tact, and eloquence.  | has granted, | you a wish! | Alas, your weak, pathetic mind was not able to handle all of the magical | energy.  In trying (in vain) to handle all of the magical energy, you have
    cx = 138
    CALL frame_enter()
    var_015C = 1
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_056C()
    local_10 = ax
    ax = 0
    IF var_00F0 <> 17 THEN GOTO label_0DD55
    ax = ax - 1
    cx = 0
    IF var_0200 <> 0 THEN GOTO label_0DD60
    cx = cx - 1
    ' and cx,ax
    ax = 0
    IF var_0208 <> 0 THEN GOTO label_0DD6D
    ax = ax - 1
    ' and ax,cx
    ' and ax,ax
    IF var_0208 <> 0 THEN GOTO label_0DD76
    GOTO label_0DDBD
    local_C = 2
    local_E = 16
    CALL proc_21194(addr(local_C), addr(local_E))
    di = "GOLDDRAGON"
    si = addr(local_14)
    CALL near_0A683()
    CALL sb_dat_21E13(addr(local_14))
    CALL free_string(addr(local_14))
    var_0220 = 0
    var_0222 = 0
    var_0200 = 1
    GOTO label_0E1A7
    ax = 0
    IF var_018A <> 1 THEN GOTO label_0DDC8
    ax = ax - 1
    cx = 0
    IF local_10 <> 1 THEN GOTO label_0DDD2
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF local_10 <> 1 THEN GOTO label_0DDDB
    GOTO label_0DFF8
    ax = 12
    ' imul word [0x20c]
    cx = var_01E8
    cx = cx - ax
    cx = cx + var_01E0
    ax = cx
    CALL RT_2F00_0558()
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_16 = ax
    local_18 = 12
    CALL proc_25C7F(addr(local_16), addr(local_18), addr(local_1C))
    ' float_D9
    CALL RT_2F00_056C()
    local_28 = ax
    local_1E = 3
    local_20 = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " was impressed with your courage, tact, and eloquence. "
    CALL near_0A68B()
    bx = ax
    ax = 432
    local_2A = bx
    CALL RT_2732_63DF(DS, 432, 3)
    di = ax
    si = local_2A
    CALL near_0A68B()
    si = ax
    di = "has granted,"
    CALL near_0A68B()
    di = ax
    si = addr(local_24)
    CALL near_0A683()
    local_26 = 1
    CALL proc_2255D(addr(local_1E), addr(local_20), addr(local_24), addr(local_26))
    CALL free_string(addr(local_24))
    local_2C = 3
    local_2E = 16
    di = "you a wish!"
    si = addr(local_32)
    CALL near_0A683()
    local_34 = 1
    CALL proc_2255D(addr(local_2C), addr(local_2E), addr(local_32), addr(local_34))
    CALL free_string(addr(local_32))
    IF local_28 == 1 THEN GOTO label_0DED1
    GOTO label_0DED8
    var_020C = var_020C + 1
    GOTO label_0DFF5
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    ' float_D8
    CALL RT_2F00_056C()
    local_40 = ax
    var_01E2 = var_01E2 - ax
    var_01E8 = var_01E8 - 1
    local_36 = 3
    local_38 = 16
    di = &HA210
    si = addr(local_3C)
    CALL near_0A683()
    local_3E = 1
    CALL proc_2255D(addr(local_36), addr(local_38), addr(local_3C), addr(local_3E))
    CALL free_string(addr(local_3C))
    local_42 = 3
    local_44 = 16
    di = "Alas, your weak, pathetic mind was not able to handle all of the magical"
    si = addr(local_48)
    CALL near_0A683()
    local_4A = 1
    CALL proc_2255D(addr(local_42), addr(local_44), addr(local_48), addr(local_4A))
    CALL free_string(addr(local_48))
    local_4C = 3
    local_4E = 16
    di = "energy.  In trying (in vain) to handle all of the magical energy, you have"
    si = addr(local_52)
    CALL near_0A683()
    local_54 = 1
    CALL proc_2255D(addr(local_4C), addr(local_4E), addr(local_52), addr(local_54))
    CALL free_string(addr(local_52))
    local_56 = 3
    local_58 = 16
    CALL RT_2732_63B4(local_40)
    di = ax
    si = "lost 1 intelligence and have lost "
    CALL near_0A68B()
    si = ax
    di = " hitpoints!"
    CALL near_0A68B()
    di = ax
    si = addr(local_5C)
    CALL near_0A683()
    local_5E = 1
    CALL proc_2255D(addr(local_56), addr(local_58), addr(local_5C), addr(local_5E))
    CALL free_string(addr(local_5C))
    CALL hit_any_key_to_continue_2434A()
    CALL mage_0C4A1()
    GOTO label_0E1A7
    IF var_0192 == 1 THEN GOTO label_0E002
    GOTO label_0E00A
    CALL deck_13DE3()
    GOTO label_0E1A7
    IF var_018C == 1 THEN GOTO label_0E014
    GOTO label_0E032
    di = "The cleric"
    si = addr(local_62)
    CALL near_0A683()
    CALL enter_00E6E(addr(local_62))
    CALL free_string(addr(local_62))
    GOTO label_0E1A7
    IF var_018E == 1 THEN GOTO label_0E03C
    GOTO label_0E05A
    di = "The salesperson"
    si = addr(local_66)
    CALL near_0A683()
    CALL enter_08320(addr(local_66))
    CALL free_string(addr(local_66))
    GOTO label_0E1A7
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    sp = sp - 4
    bx = sp
    ' float_D9
    CALL RT_2732_69C8()
    CALL RT_2732_6371(addr(local_66))
    CALL RT_2732_6374(addr(local_66))
    di = ax
    si = "HINT"
    CALL near_0A68B()
    di = ax
    si = addr(local_6E)
    CALL near_0A683()
    local_68 = 1
    local_6A = 25
    CALL proc_21194(addr(local_68), addr(local_6A))
    local_70 = 7
    local_72 = 0
    CALL color_25283(addr(local_70), addr(local_72))
    local_74 = 2
    local_76 = 1
    di = "The creature starts to speak!"
    si = addr(local_7A)
    CALL near_0A683()
    local_7C = 0
    CALL locate_print_21DEA(addr(local_74), addr(local_76), addr(local_7A), addr(local_7C))
    CALL free_string(addr(local_7A))
    local_7E = 4
    local_80 = 1
    CALL proc_253B3(addr(local_7E), addr(local_80))
    CALL sb_dat_21E13(addr(local_6E))
    local_82 = 7
    local_84 = 0
    CALL color_25283(addr(local_82), addr(local_84))
    local_86 = 10
    local_88 = 1
    di = "With that the creature leaves you.  Of course, this all seems perfectly normal"
    si = addr(local_8C)
    CALL near_0A683()
    local_8E = 0
    CALL locate_print_21DEA(addr(local_86), addr(local_88), addr(local_8C), addr(local_8E))
    CALL free_string(addr(local_8C))
    di = "to you.  (Creatures always act like that, don't they?)"
    si = addr(local_92)
    CALL near_0A683()
    local_94 = 0
    CALL print_more_21DB9(addr(local_92), addr(local_94))
    CALL free_string(addr(local_92))
    CALL free_string(addr(local_6E))
    PROC_EXIT
    RETURN
    GOTO label_0E3C0
END SUB

SUB proc_1E1BB  ' image &H1E1BB, locals 52
  ' strings: This creature will sleep for a while! | This creature starts to awaken! | This creature is still sleeping!
    cx = 52
    CALL frame_enter()
    IF var_0160 > 0 THEN GOTO label_0E1CD
    GOTO label_0E2BF
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0160
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D9
    IF var_0182 == 1 THEN GOTO label_0E1F9
    GOTO label_0E232
    local_C = 3
    local_E = 16
    di = "This creature will sleep for a while!"
    si = addr(local_12)
    CALL near_0A683()
    local_14 = 1
    CALL proc_2255D(addr(local_C), addr(local_E), addr(local_12), addr(local_14))
    CALL free_string(addr(local_12))
    GOTO label_0E2BC
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0182 == 1 THEN GOTO label_0E247
    GOTO label_0E286
    local_1A = 3
    local_1C = 16
    di = "This creature starts to awaken!"
    si = addr(local_20)
    CALL near_0A683()
    local_22 = 1
    CALL proc_2255D(addr(local_1A), addr(local_1C), addr(local_20), addr(local_22))
    CALL free_string(addr(local_20))
    var_0160 = 0
    GOTO label_0E2BC
    local_24 = 3
    local_26 = 16
    di = "This creature is still sleeping!"
    si = addr(local_2A)
    CALL near_0A683()
    local_2C = 1
    CALL proc_2255D(addr(local_24), addr(local_26), addr(local_2A), addr(local_2C))
    CALL free_string(addr(local_2A))
    GOTO label_0E3B8
    ' float_D9
    ' float_D9
    IF var_0238 > 0 THEN GOTO label_0E2D4
    GOTO label_0E2E3
    ' float_D9
    ' float_D8
    ' float_D9
    IF var_021A == 1 THEN GOTO label_0E2ED
    GOTO label_0E2FC
    ' float_D9
    ' float_D8
    ' float_D9
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_021A == 1 THEN GOTO label_0E336
    GOTO label_0E34D
    CALL stabbed_1D361(addr(local_3A), addr(local_3C), addr(local_3E), arg_6)
    GOTO label_0E3B8
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_021A == 1 THEN GOTO label_0E362
    GOTO label_0E39B
    ax = 0
    IF var_0238 <= 0 THEN GOTO label_0E36D
    ax = ax - 1
    cx = 0
    IF var_0198 <> 0 THEN GOTO label_0E378
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0198 <> 0 THEN GOTO label_0E381
    GOTO label_0E389
    CALL hit_your_1CC25()
    GOTO label_0E398
    IF var_0198 == 0 THEN GOTO label_0E393
    GOTO label_0E398
    CALL proc_1C140()
    GOTO label_0E3B8
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0198 == 0 THEN GOTO label_0E3B0
    GOTO label_0E3B8
    CALL proc_1C140()
    GOTO label_0E3B8
    PROC_EXIT
    RETURN
    GOTO label_0F189
END SUB

SUB you_are_shocked_for_1E3C3  ' image &H1E3C3, locals 388
  ' strings: Lightning shoots our from its STAFF! | Somehow, the magical bolt gets through all of your defenses! (Gasp!) | You are shocked for  |  hitpoints! | The creature screaches a high-pitched SONIC SCREAM!  Although you hear it, | it doesn't seem to affect you.  You are NOT impressed.
    cx = 388
    CALL frame_enter()
    IF var_019E == 1 THEN GOTO label_0E3D5
    GOTO label_0E4F4
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_16 = ax
    var_01E2 = var_01E2 - ax
    local_C = 3
    local_E = 16
    di = "Lightning shoots our from its STAFF!"
    si = addr(local_12)
    CALL near_0A683()
    local_14 = 0
    CALL proc_2255D(addr(local_C), addr(local_E), addr(local_12), addr(local_14))
    CALL free_string(addr(local_12))
    ax = 0
    IF var_00C8 <> 1 THEN GOTO label_0E43D
    ax = ax - 1
    cx = 0
    IF var_015E <> 1 THEN GOTO label_0E448
    cx = cx - 1
    ' or cx,ax
    ax = 0
    IF var_00F2 <> 1 THEN GOTO label_0E455
    ax = ax - 1
    ' or ax,cx
    ' and ax,ax
    IF var_00F2 <> 1 THEN GOTO label_0E45E
    GOTO label_0E494
    local_18 = 3
    local_1A = 16
    di = "Somehow, the magical bolt gets through all of your defenses! (Gasp!)"
    si = addr(local_1E)
    CALL near_0A683()
    local_20 = 0
    CALL proc_2255D(addr(local_18), addr(local_1A), addr(local_1E), addr(local_20))
    CALL free_string(addr(local_1E))
    local_22 = 3
    local_24 = 16
    local_26 = 0
    CALL proc_25D42(addr(local_26), addr(local_16))
    di = ax
    si = addr(local_2A)
    CALL near_0A683()
    di = addr(local_2A)
    si = "You are shocked for "
    CALL near_0A68B()
    si = ax
    di = " hitpoints!"
    CALL near_0A68B()
    di = ax
    si = addr(local_2E)
    CALL near_0A683()
    local_30 = 1
    CALL proc_2255D(addr(local_22), addr(local_24), addr(local_2E), addr(local_30))
    CALL free_string(addr(local_2E))
    IF var_0160 == 0 THEN GOTO label_0E4FE
    GOTO label_0F14C
    IF var_0174 == 1 THEN GOTO label_0E508
    GOTO label_0E65B
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0AFC
    CALL RT_2F00_0558()
    ' float_DE
    ax = var_00AC
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_16 = ax
    IF var_00C2 == 1 THEN GOTO label_0E546
    GOTO label_0E5B5
    local_32 = 3
    local_34 = 16
    di = "The creature screaches a high-pitched SONIC SCREAM!  Although you hear it,"
    si = addr(local_38)
    CALL near_0A683()
    local_3A = 1
    CALL proc_2255D(addr(local_32), addr(local_34), addr(local_38), addr(local_3A))
    CALL free_string(addr(local_38))
    local_3C = 3
    local_3E = 16
    di = "it doesn't seem to affect you.  You are NOT impressed."
    si = addr(local_42)
    CALL near_0A683()
    local_44 = 1
    CALL proc_2255D(addr(local_3C), addr(local_3E), addr(local_42), addr(local_44))
    CALL free_string(addr(local_42))
    GOTO label_0E65B
    IF local_16 > 7 THEN GOTO label_0E5BE
    GOTO label_0E65B
    ax = local_16
    var_01E2 = var_01E2 - ax
    local_46 = 3
    local_48 = 16
    di = "You clutch your ears as the creature emits a high - pitched SONIC SCREAM!"
    si = addr(local_4C)
    CALL near_0A683()
    local_4E = 1
    CALL proc_2255D(addr(local_46), addr(local_48), addr(local_4C), addr(local_4E))
    CALL free_string(addr(local_4C))
    local_50 = 3
    local_52 = 16
    local_54 = 0
    CALL proc_25D42(addr(local_54), addr(local_16))
    di = ax
    si = addr(local_58)
    CALL near_0A683()
    di = addr(local_58)
    si = "Your brain is pierced for "
    CALL near_0A68B()
    si = ax
    di = " hitpoints!"
    CALL near_0A68B()
    di = ax
    si = addr(local_5C)
    CALL near_0A683()
    local_5E = 1
    CALL proc_2255D(addr(local_50), addr(local_52), addr(local_5C), addr(local_5E))
    CALL free_string(addr(local_5C))
    ax = 0
    IF var_015E <> 0 THEN GOTO label_0E666
    ax = ax - 1
    cx = 0
    IF var_00F2 <> 0 THEN GOTO label_0E671
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_00F2 <> 0 THEN GOTO label_0E67A
    GOTO label_0F14C
    IF var_0162 == 1 THEN GOTO label_0E684
    GOTO label_0E773
    CALL proc_25C7F(&HAFC, 164, addr(local_62))
    ' float_D9
    CALL RT_2F00_056C()
    local_6E = ax
    IF ax == 1 THEN GOTO label_0E6A9
    GOTO label_0E773
    local_64 = 3
    local_66 = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " casts a sickness spell!"
    CALL near_0A68B()
    di = ax
    si = addr(local_6A)
    CALL near_0A683()
    local_6C = 1
    CALL proc_2255D(addr(local_64), addr(local_66), addr(local_6A), addr(local_6C))
    CALL free_string(addr(local_6A))
    IF var_00CC == 1 THEN GOTO label_0E6FE
    GOTO label_0E737
    local_70 = 3
    local_72 = 16
    di = "The spell approaches you, then fizzles."
    si = addr(local_76)
    CALL near_0A683()
    local_78 = 1
    CALL proc_2255D(addr(local_70), addr(local_72), addr(local_76), addr(local_78))
    CALL free_string(addr(local_76))
    GOTO label_0E773
    local_7A = 3
    local_7C = 16
    di = "You don't feel so good!"
    si = addr(local_80)
    CALL near_0A683()
    local_82 = 1
    CALL proc_2255D(addr(local_7A), addr(local_7C), addr(local_80), addr(local_82))
    CALL free_string(addr(local_80))
    var_020A = var_020A + 1
    ax = 0
    IF var_016E <> 1 THEN GOTO label_0E77E
    ax = ax - 1
    cx = 0
    IF var_00B0 <> 0 THEN GOTO label_0E789
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_00B0 <> 0 THEN GOTO label_0E792
    GOTO label_0E918
    CALL proc_25C7F(&HAFC, 164, addr(local_86))
    ' float_D9
    CALL RT_2F00_056C()
    local_6E = ax
    ax = 0
    IF var_00C0 <> 1 THEN GOTO label_0E7BC
    ax = ax - 1
    cx = 0
    IF var_00CE <> 1 THEN GOTO label_0E7C7
    cx = cx - 1
    ' or cx,ax
    ' and cx,cx
    IF var_00CE <> 1 THEN GOTO label_0E7D0
    GOTO label_0E866
    local_88 = 3
    local_8A = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " looks deeply into your eyes and tries to paralyze you!"
    CALL near_0A68B()
    di = ax
    si = addr(local_8E)
    CALL near_0A683()
    local_90 = 1
    CALL proc_2255D(addr(local_88), addr(local_8A), addr(local_8E), addr(local_90))
    CALL free_string(addr(local_8E))
    local_92 = 3
    local_94 = 16
    di = "You see the pupil, the iris, and several rods and cones."
    si = addr(local_98)
    CALL near_0A683()
    local_9A = 1
    CALL proc_2255D(addr(local_92), addr(local_94), addr(local_98), addr(local_9A))
    CALL free_string(addr(local_98))
    GOTO label_0E918
    IF local_6E == 1 THEN GOTO label_0E86F
    GOTO label_0E918
    local_9C = 3
    local_9E = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " looks deeply into your eyes.  You're paralyzed!"
    CALL near_0A68B()
    di = ax
    si = addr(local_A2)
    CALL near_0A683()
    local_A4 = 1
    CALL proc_2255D(addr(local_9C), addr(local_9E), addr(local_A2), addr(local_A4))
    CALL free_string(addr(local_A2))
    ax = var_0AFC
    var_00B0 = ax
    IF var_0B18 == 0 THEN GOTO label_0E8D3
    GOTO label_0E918
    var_015C = 1
    local_A6 = 3
    local_A8 = 16
    di = "The monster wanders off"
    si = addr(local_AC)
    CALL near_0A683()
    local_AE = 1
    CALL proc_2255D(addr(local_A6), addr(local_A8), addr(local_AC), addr(local_AE))
    CALL free_string(addr(local_AC))
    IF var_0172 == 1 THEN GOTO label_0E922
    GOTO label_0EA88
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0AFC
    CALL RT_2F00_0558()
    ' float_DE
    ax = var_00AC
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_16 = ax
    IF var_00C6 == 1 THEN GOTO label_0E960
    GOTO label_0E9F6
    local_B0 = 3
    local_B2 = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " sends an ice cone your way!  You fight the near-overpowering urge to start"
    CALL near_0A68B()
    di = ax
    si = addr(local_B6)
    CALL near_0A683()
    local_B8 = 1
    CALL proc_2255D(addr(local_B0), addr(local_B2), addr(local_B6), addr(local_B8))
    CALL free_string(addr(local_B6))
    local_BA = 3
    local_BC = 16
    di = "building a snowman."
    si = addr(local_C0)
    CALL near_0A683()
    local_C2 = 1
    CALL proc_2255D(addr(local_BA), addr(local_BC), addr(local_C0), addr(local_C2))
    CALL free_string(addr(local_C0))
    GOTO label_0EA88
    IF local_16 > 10 THEN GOTO label_0E9FF
    GOTO label_0EA88
    ax = local_16
    var_01E2 = var_01E2 - ax
    local_C4 = 3
    local_C6 = 16
    local_C8 = 0
    CALL proc_25D42(addr(local_C8), addr(local_16))
    di = ax
    si = addr(local_CC)
    CALL near_0A683()
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " sends an ice cone your way!  You are frozen for "
    CALL near_0A68B()
    si = ax
    di = addr(local_CC)
    CALL near_0A68B()
    si = ax
    di = " hitpoints!"
    CALL near_0A68B()
    di = ax
    si = addr(local_D0)
    CALL near_0A683()
    local_D2 = 1
    CALL proc_2255D(addr(local_C4), addr(local_C6), addr(local_D0), addr(local_D2))
    CALL free_string(addr(local_D0))
    ax = 0
    IF var_0176 <> 1 THEN GOTO label_0EA93
    ax = ax - 1
    cx = 0
    IF var_015E <> 0 THEN GOTO label_0EA9E
    cx = cx - 1
    ' and cx,ax
    ax = 0
    IF var_00F2 <> 0 THEN GOTO label_0EAAB
    ax = ax - 1
    ' and ax,cx
    ' and ax,ax
    IF var_00F2 <> 0 THEN GOTO label_0EAB4
    GOTO label_0EC8A
    CALL proc_25C7F(&HAFC, 164, addr(local_D6))
    ' float_D9
    CALL RT_2F00_056C()
    local_6E = ax
    IF ax == 1 THEN GOTO label_0EADB
    GOTO label_0EC8A
    local_D8 = 3
    local_DA = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " tries to come over to his side!  His persuasion is magically overwelming!"
    CALL near_0A68B()
    di = ax
    si = addr(local_DE)
    CALL near_0A683()
    local_E0 = 1
    CALL proc_2255D(addr(local_D8), addr(local_DA), addr(local_DE), addr(local_E0))
    CALL free_string(addr(local_DE))
    IF var_00CE == 1 THEN GOTO label_0EB39
    GOTO label_0EB7B
    local_E2 = 3
    local_E4 = 16
    di = "Still, you have to laugh. 'Come over to YOUR SIDE?  BWAA-HA-HA-HA-HA'"
    si = addr(local_E8)
    CALL near_0A683()
    local_EA = 1
    CALL proc_2255D(addr(local_E2), addr(local_E4), addr(local_E8), addr(local_EA))
    CALL free_string(addr(local_E8))
    GOTO label_0EC8A
    si = arg_8
    [si] = [si] + 1
    IF [si] < 3 THEN GOTO label_0EB88
    GOTO label_0EBCA
    local_EC = 3
    local_EE = 16
    di = "You begin to see the monster's point of view!"
    si = addr(local_F2)
    CALL near_0A683()
    local_F4 = 1
    CALL proc_2255D(addr(local_EC), addr(local_EE), addr(local_F2), addr(local_F4))
    CALL free_string(addr(local_F2))
    GOTO label_0EC8A
    local_F6 = 3
    local_F8 = 16
    di = "You become the monster's willing slave!  It looks like the mission is over for you!"
    si = addr(local_FC)
    CALL near_0A683()
    local_FE = 1
    CALL proc_2255D(addr(local_F6), addr(local_F8), addr(local_FC), addr(local_FE))
    CALL free_string(addr(local_FC))
    local_100 = 3
    local_102 = 16
    di = "(So is your life!!!)"
    si = addr(local_106)
    CALL near_0A683()
    local_108 = 1
    CALL proc_2255D(addr(local_100), addr(local_102), addr(local_106), addr(local_108))
    CALL free_string(addr(local_106))
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    di = ax
    si = addr(local_10C)
    CALL near_0A683()
    CALL dun_0E905(addr(local_10C))
    ax = addr(local_10C)
    PUSH DS
    PUSH addr(local_10C)
    ' xor ax,ax
    ax = &HAE8
    CALL RT_2732_6404(addr(local_10C), DS, &HAE8, 20)
    CALL free_string(addr(local_10C))
    IF var_019C == 1 THEN GOTO label_0EC94
    GOTO label_0EE39
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0AFC
    CALL RT_2F00_0558()
    ' float_DE
    ax = var_00AC
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_16 = ax
    IF var_00C8 == 1 THEN GOTO label_0ECD2
    GOTO label_0EDA7
    local_10E = 3
    local_110 = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " rolls a ball of lightning your way!"
    CALL near_0A68B()
    di = ax
    si = addr(local_114)
    CALL near_0A683()
    local_116 = 1
    CALL proc_2255D(addr(local_10E), addr(local_110), addr(local_114), addr(local_116))
    CALL free_string(addr(local_114))
    local_118 = 3
    local_11A = 16
    di = "You get a charge out of it.  (Get it?  BWAA-HA-HA-HA-HA)"
    si = addr(local_11E)
    CALL near_0A683()
    local_120 = 1
    CALL proc_2255D(addr(local_118), addr(local_11A), addr(local_11E), addr(local_120))
    CALL free_string(addr(local_11E))
    local_122 = 3
    local_124 = 16
    di = "Lightning doesn't seem to affect you."
    si = addr(local_128)
    CALL near_0A683()
    local_12A = 1
    CALL proc_2255D(addr(local_122), addr(local_124), addr(local_128), addr(local_12A))
    CALL free_string(addr(local_128))
    GOTO label_0EE39
    IF local_16 > 13 THEN GOTO label_0EDB0
    GOTO label_0EE39
    ax = local_16
    var_01E2 = var_01E2 - ax
    local_12C = 3
    local_12E = 16
    local_130 = 0
    CALL proc_25D42(addr(local_130), addr(local_16))
    di = ax
    si = addr(local_134)
    CALL near_0A683()
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " rolls a ball of lightning your way. You are shocked for "
    CALL near_0A68B()
    si = ax
    di = addr(local_134)
    CALL near_0A68B()
    si = ax
    di = " hitpoints!"
    CALL near_0A68B()
    di = ax
    si = addr(local_138)
    CALL near_0A683()
    local_13A = 1
    CALL proc_2255D(addr(local_12C), addr(local_12E), addr(local_138), addr(local_13A))
    CALL free_string(addr(local_138))
    IF var_0178 == 1 THEN GOTO label_0EE43
    GOTO label_0EF6A
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0AFC
    CALL RT_2F00_0558()
    ' float_DE
    ax = var_00AC
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_16 = ax
    IF var_00C4 == 1 THEN GOTO label_0EE81
    GOTO label_0EED8
    local_13C = 3
    local_13E = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " emits a stream of fire!  (And YOU forgot the marshmallows!)"
    CALL near_0A68B()
    di = ax
    si = addr(local_142)
    CALL near_0A683()
    local_144 = 1
    CALL proc_2255D(addr(local_13C), addr(local_13E), addr(local_142), addr(local_144))
    CALL free_string(addr(local_142))
    GOTO label_0EF6A
    IF local_16 > 13 THEN GOTO label_0EEE1
    GOTO label_0EF6A
    ax = local_16
    var_01E2 = var_01E2 - ax
    local_146 = 3
    local_148 = 16
    local_14A = 0
    CALL proc_25D42(addr(local_14A), addr(local_16))
    di = ax
    si = addr(local_14E)
    CALL near_0A683()
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " emits a stream of fire!  You are burned for "
    CALL near_0A68B()
    si = ax
    di = addr(local_14E)
    CALL near_0A68B()
    si = ax
    di = " hitpoints!"
    CALL near_0A68B()
    di = ax
    si = addr(local_152)
    CALL near_0A683()
    local_154 = 1
    CALL proc_2255D(addr(local_146), addr(local_148), addr(local_152), addr(local_154))
    CALL free_string(addr(local_152))
    IF var_016A == 1 THEN GOTO label_0EF74
    GOTO label_0F14C
    CALL proc_25C7F(&HAFC, 164, addr(local_158))
    ' float_D9
    CALL RT_2F00_056C()
    local_6E = ax
    IF ax == 1 THEN GOTO label_0EF9B
    GOTO label_0F14C
    local_15A = 3
    local_15C = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " stares at you with a stony glance!"
    CALL near_0A68B()
    di = ax
    si = addr(local_160)
    CALL near_0A683()
    local_162 = 1
    CALL proc_2255D(addr(local_15A), addr(local_15C), addr(local_160), addr(local_162))
    CALL free_string(addr(local_160))
    IF var_00C0 == 1 THEN GOTO label_0EFF9
    GOTO label_0F07A
    local_164 = 3
    local_166 = 16
    di = "You've seen ugly in your time, but this is UGLY! (Kinda reminds you of your"
    si = addr(local_16A)
    CALL near_0A683()
    local_16C = 1
    CALL proc_2255D(addr(local_164), addr(local_166), addr(local_16A), addr(local_16C))
    CALL free_string(addr(local_16A))
    local_16E = 3
    local_170 = 16
    di = "last date. BWAA-HA-HA-HA)"
    si = addr(local_174)
    CALL near_0A683()
    local_176 = 1
    CALL proc_2255D(addr(local_16E), addr(local_170), addr(local_174), addr(local_176))
    CALL free_string(addr(local_174))
    GOTO label_0F14C
    si = arg_6
    [si] = [si] + 1
    ax = var_01E0
    IF ax >= [si] THEN GOTO label_0F089
    GOTO label_0F0CB
    local_178 = 3
    local_17A = 16
    di = "You stiffen up!"
    si = addr(local_17E)
    CALL near_0A683()
    local_180 = 1
    CALL proc_2255D(addr(local_178), addr(local_17A), addr(local_17E), addr(local_180))
    CALL free_string(addr(local_17E))
    GOTO label_0F14C
    local_182 = 3
    local_184 = 16
    di = "You turn completely to stone!"
    si = addr(local_188)
    CALL near_0A683()
    local_18A = 1
    CALL proc_2255D(addr(local_182), addr(local_184), addr(local_188), addr(local_18A))
    CALL free_string(addr(local_188))
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    di = ax
    si = addr(local_18E)
    CALL near_0A683()
    CALL dun_0E905(addr(local_18E))
    ax = addr(local_18E)
    PUSH DS
    PUSH addr(local_18E)
    ' xor ax,ax
    ax = &HAE8
    CALL RT_2732_6404(addr(local_18E), DS, &HAE8, 20)
    CALL free_string(addr(local_18E))
    CALL mage_0C4A1()
    CALL free_string(addr(local_14E))
    CALL free_string(addr(local_134))
    CALL free_string(addr(local_CC))
    CALL free_string(addr(local_58))
    CALL free_string(addr(local_2A))
    PROC_EXIT
    RETURN
    GOTO label_0FFAA
END SUB

SUB this_monster_is_diseased_1F18C  ' image &H1F18C, locals 410
  ' strings: This monster is diseased! | Just thinking about this filthy monster fills you with disgust. | You don't feel so good! |  drains your energy! | After finishing with you, the creature leaves you!  You feel a little | worse off than before.
    cx = 410
    CALL frame_enter()
    IF var_0166 == 1 THEN GOTO label_0F19E
    GOTO label_0F276
    CALL proc_25C7F(&HAFC, 164, addr(local_E))
    ' float_D9
    CALL RT_2F00_056C()
    local_1A = ax
    IF ax == 1 THEN GOTO label_0F1C3
    GOTO label_0F276
    local_10 = 3
    local_12 = 16
    di = "This monster is diseased!"
    si = addr(local_16)
    CALL near_0A683()
    local_18 = 1
    CALL proc_2255D(addr(local_10), addr(local_12), addr(local_16), addr(local_18))
    CALL free_string(addr(local_16))
    IF var_00CC == 1 THEN GOTO label_0F203
    GOTO label_0F23C
    local_1C = 3
    local_1E = 16
    di = "Just thinking about this filthy monster fills you with disgust."
    si = addr(local_22)
    CALL near_0A683()
    local_24 = 1
    CALL proc_2255D(addr(local_1C), addr(local_1E), addr(local_22), addr(local_24))
    CALL free_string(addr(local_22))
    GOTO label_0F276
    var_020A = var_020A + 1
    local_26 = 3
    local_28 = 16
    di = "You don't feel so good!"
    si = addr(local_2C)
    CALL near_0A683()
    local_2E = 1
    CALL proc_2255D(addr(local_26), addr(local_28), addr(local_2C), addr(local_2E))
    CALL free_string(addr(local_2C))
    ax = 0
    IF var_017A <> 1 THEN GOTO label_0F281
    ax = ax - 1
    cx = 0
    IF var_015E <> 0 THEN GOTO label_0F28C
    cx = cx - 1
    ' and cx,ax
    ax = 0
    IF var_00F2 <> 0 THEN GOTO label_0F299
    ax = ax - 1
    ' and ax,cx
    ' and ax,ax
    IF var_00F2 <> 0 THEN GOTO label_0F2A2
    GOTO label_0F398
    CALL proc_25C7F(&HAFC, 164, addr(local_32))
    ' float_D9
    CALL RT_2F00_056C()
    local_1A = ax
    IF ax == 1 THEN GOTO label_0F2C7
    GOTO label_0F398
    local_34 = 3
    local_36 = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " drains your energy!"
    CALL near_0A68B()
    di = ax
    si = addr(local_3A)
    CALL near_0A683()
    local_3C = 1
    CALL proc_2255D(addr(local_34), addr(local_36), addr(local_3A), addr(local_3C))
    CALL free_string(addr(local_3A))
    local_3E = 3
    local_40 = 16
    di = "After finishing with you, the creature leaves you!  You feel a little"
    si = addr(local_44)
    CALL near_0A683()
    local_46 = 1
    CALL proc_2255D(addr(local_3E), addr(local_40), addr(local_44), addr(local_46))
    CALL free_string(addr(local_44))
    local_48 = 3
    local_4A = 16
    di = "worse off than before."
    si = addr(local_4E)
    CALL near_0A683()
    local_50 = 1
    CALL proc_2255D(addr(local_48), addr(local_4A), addr(local_4E), addr(local_50))
    CALL free_string(addr(local_4E))
    ax = var_010E
    dx = var_0110
    ax = ax + &HFC18
    ' adc dx,0xffffffffffffffff
    var_021C = ax
    var_021E = dx
    var_015C = 1
    IF var_0168 == 1 THEN GOTO label_0F3A2
    GOTO label_0F427
    CALL proc_25C7F(&HAFC, 164, addr(local_54))
    ' float_D9
    CALL RT_2F00_056C()
    local_1A = ax
    IF ax == 1 THEN GOTO label_0F3C7
    GOTO label_0F424
    local_56 = 3
    local_58 = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " grabs your money pouch and runs! Now you have no more gold!"
    CALL near_0A68B()
    di = ax
    si = addr(local_5C)
    CALL near_0A683()
    local_5E = 1
    CALL proc_2255D(addr(local_56), addr(local_58), addr(local_5C), addr(local_5E))
    CALL free_string(addr(local_5C))
    var_0220 = 0
    var_0222 = 0
    var_015C = 1
    GOTO label_0F780
    IF var_016C == 1 THEN GOTO label_0F431
    GOTO label_0F5B6
    ax = var_0AFC
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_6E = ax
    CALL proc_25C7F(addr(local_6E), 164, addr(local_62))
    ' float_D9
    CALL RT_2F00_056C()
    local_1A = ax
    IF ax == 1 THEN GOTO label_0F472
    GOTO label_0F5B3
    local_64 = 3
    local_66 = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " tries to take your items!"
    CALL near_0A68B()
    di = ax
    si = addr(local_6A)
    CALL near_0A683()
    local_6C = 1
    CALL proc_2255D(addr(local_64), addr(local_66), addr(local_6A), addr(local_6C))
    CALL free_string(addr(local_6A))
    IF var_012F == 0 THEN GOTO label_0F4C7
    GOTO label_0F500
    local_70 = 3
    local_72 = 16
    di = "Finding nothing, the monster leaves."
    si = addr(local_76)
    CALL near_0A683()
    local_78 = 1
    CALL proc_2255D(addr(local_70), addr(local_72), addr(local_76), addr(local_78))
    CALL free_string(addr(local_76))
    GOTO label_0F5AD
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_012F
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_84 = ax
    local_7A = 3
    local_7C = 16
    cx = 68
    ' imul cx
    ax = ax + &HBEE
    CALL RT_2732_63DF(DS, ax, 26)
    di = ax
    si = "The monster takes your "
    CALL near_0A68B()
    di = ax
    si = addr(local_80)
    CALL near_0A683()
    local_82 = 1
    CALL proc_2255D(addr(local_7A), addr(local_7C), addr(local_80), addr(local_82))
    CALL free_string(addr(local_80))
    local_86 = 1
    CALL proc_00A98(addr(local_84), addr(local_86), addr(local_8A))
    ' float_D9
    ' float_D9
    CALL proc_04D9D(addr(local_84))
    var_015C = 1
    GOTO label_0F780
    IF var_0170 == 1 THEN GOTO label_0F5C0
    GOTO label_0F780
    CALL proc_25C7F(&HAFC, 164, addr(local_92))
    ' float_D9
    CALL RT_2F00_056C()
    local_1A = ax
    IF ax == 1 THEN GOTO label_0F5E7
    GOTO label_0F780
    IF var_012F > 0 THEN GOTO label_0F5F1
    GOTO label_0F780
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_012F
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D8
    CALL RT_2F00_056C()
    local_84 = ax
    local_94 = 3
    local_96 = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " touches your "
    CALL near_0A68B()
    bx = ax
    ax = 68
    ' imul word [bp-0x84]
    ax = ax + &HBEE
    local_9E = bx
    CALL RT_2732_63DF(DS, ax, 26)
    CALL RT_2732_6374(26)
    di = ax
    si = local_9E
    CALL near_0A68B()
    si = ax
    di = &HA06E
    CALL near_0A68B()
    di = ax
    si = addr(local_9A)
    CALL near_0A683()
    local_9C = 1
    CALL proc_2255D(addr(local_94), addr(local_96), addr(local_9A), addr(local_9C))
    CALL free_string(addr(local_9A))
    ax = 68
    ' imul word [bp-0x84]
    ax = ax + &HBEE
    ax = ax + 62
    si = ax
    IF [si] == 0 THEN GOTO label_0F6BA
    GOTO label_0F741
    local_A0 = 3
    local_A2 = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " corrodes the item!"
    CALL near_0A68B()
    di = ax
    si = addr(local_A6)
    CALL near_0A683()
    local_A8 = 1
    CALL proc_2255D(addr(local_A0), addr(local_A2), addr(local_A6), addr(local_A8))
    CALL free_string(addr(local_A6))
    local_AA = 1
    CALL proc_00A98(addr(local_84), addr(local_AA), addr(local_AE))
    ' float_D9
    ' float_D9
    CALL proc_04D9D(addr(local_84))
    GOTO label_0F780
    local_B0 = 3
    local_B2 = 16
    di = "Hmm.  Nothing seems to happen."
    si = addr(local_B6)
    CALL near_0A683()
    local_B8 = 1
    CALL proc_2255D(addr(local_B0), addr(local_B2), addr(local_B6), addr(local_B8))
    CALL free_string(addr(local_B6))
    IF var_017C == 1 THEN GOTO label_0F78A
    GOTO label_0F8D8
    CALL proc_25C7F(&HAFC, 164, addr(local_BC))
    ' float_D9
    CALL RT_2F00_056C()
    local_1A = ax
    IF ax == 1 THEN GOTO label_0F7B1
    GOTO label_0F8D8
    si = arg_A
    [si] = [si] + 1
    local_BE = 3
    local_C0 = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " tries to drown you!"
    CALL near_0A68B()
    di = ax
    si = addr(local_C4)
    CALL near_0A683()
    local_C6 = 1
    CALL proc_2255D(addr(local_BE), addr(local_C0), addr(local_C4), addr(local_C6))
    CALL free_string(addr(local_C4))
    si = arg_A
    IF [si] < 3 THEN GOTO label_0F815
    GOTO label_0F857
    local_C8 = 3
    local_CA = 16
    di = "Its harder to breath!"
    si = addr(local_CE)
    CALL near_0A683()
    local_D0 = 1
    CALL proc_2255D(addr(local_C8), addr(local_CA), addr(local_CE), addr(local_D0))
    CALL free_string(addr(local_CE))
    GOTO label_0F8D8
    local_D2 = 3
    local_D4 = 16
    di = "You run out of air!"
    si = addr(local_D8)
    CALL near_0A683()
    local_DA = 1
    CALL proc_2255D(addr(local_D2), addr(local_D4), addr(local_D8), addr(local_DA))
    CALL free_string(addr(local_D8))
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    di = ax
    si = addr(local_DE)
    CALL near_0A683()
    CALL resurrection_16562(addr(local_DE))
    ax = addr(local_DE)
    PUSH DS
    PUSH addr(local_DE)
    ' xor ax,ax
    ax = &HAE8
    CALL RT_2732_6404(addr(local_DE), DS, &HAE8, 20)
    CALL free_string(addr(local_DE))
    CALL proc_25C7F(&HAFC, 164, addr(local_E2))
    ' float_D9
    CALL RT_2F00_056C()
    local_1A = ax
    cx = 0
    IF var_01A2 <> 1 THEN GOTO label_0F902
    cx = cx - 1
    dx = 0
    IF ax <> 1 THEN GOTO label_0F90B
    dx = dx - 1
    ' and dx,cx
    ' and dx,dx
    IF ax <> 1 THEN GOTO label_0F914
    GOTO label_0FA11
    local_E4 = 3
    local_E6 = 16
    di = "You've been hit with sleeping poison!"
    si = addr(local_EA)
    CALL near_0A683()
    local_EC = 1
    CALL proc_2255D(addr(local_E4), addr(local_E6), addr(local_EA), addr(local_EC))
    CALL free_string(addr(local_EA))
    IF var_00CA == 1 THEN GOTO label_0F95D
    GOTO label_0F99F
    local_EE = 3
    local_F0 = 16
    di = "Strangely enough, you don't feel any effects."
    si = addr(local_F4)
    CALL near_0A683()
    local_F6 = 1
    CALL proc_2255D(addr(local_EE), addr(local_F0), addr(local_F4), addr(local_F6))
    CALL free_string(addr(local_F4))
    GOTO label_0FA0E
    local_F8 = 3
    local_FA = 16
    di = "You doze off!"
    si = addr(local_FE)
    CALL near_0A683()
    local_100 = 1
    CALL proc_2255D(addr(local_F8), addr(local_FA), addr(local_FE), addr(local_100))
    CALL free_string(addr(local_FE))
    ax = var_00B0
    ax = ax + 1
    CALL RT_2F00_0558()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0AFC
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_DE
    CALL RT_2F00_056C()
    var_00B0 = ax
    GOTO label_0FB25
    IF var_01A4 == 1 THEN GOTO label_0FA1B
    GOTO label_0FB25
    CALL proc_25C7F(&HAFC, 164, addr(local_104))
    ' float_D9
    CALL RT_2F00_056C()
    local_1A = ax
    IF ax == 1 THEN GOTO label_0FA42
    GOTO label_0FB25
    local_106 = 3
    local_108 = 16
    di = "You've been hit with strong sickness poison!"
    si = addr(local_10C)
    CALL near_0A683()
    local_10E = 1
    CALL proc_2255D(addr(local_106), addr(local_108), addr(local_10C), addr(local_10E))
    CALL free_string(addr(local_10C))
    ax = 0
    IF var_00CA <> 1 THEN GOTO label_0FA8C
    ax = ax - 1
    cx = 0
    IF var_00CC <> 1 THEN GOTO label_0FA97
    cx = cx - 1
    ' or cx,ax
    ' and cx,cx
    IF var_00CC <> 1 THEN GOTO label_0FAA0
    GOTO label_0FAE2
    local_110 = 3
    local_112 = 16
    di = "Strangely enough, you don't feel any effects."
    si = addr(local_116)
    CALL near_0A683()
    local_118 = 1
    CALL proc_2255D(addr(local_110), addr(local_112), addr(local_116), addr(local_118))
    CALL free_string(addr(local_116))
    GOTO label_0FB25
    local_11A = 3
    local_11C = 16
    di = "It makes you sick!"
    si = addr(local_120)
    CALL near_0A683()
    local_122 = 1
    CALL proc_2255D(addr(local_11A), addr(local_11C), addr(local_120), addr(local_122))
    CALL free_string(addr(local_120))
    var_020A = var_020A + 1
    ax = 0
    IF var_0188 <> 1 THEN GOTO label_0FB30
    ax = ax - 1
    cx = 0
    IF var_015E <> 0 THEN GOTO label_0FB3B
    cx = cx - 1
    ' and cx,ax
    ax = 0
    IF var_00F2 <> 0 THEN GOTO label_0FB48
    ax = ax - 1
    ' and ax,cx
    ' and ax,ax
    IF var_00F2 <> 0 THEN GOTO label_0FB51
    GOTO label_0FD27
    CALL proc_25C7F(&HAFC, 164, addr(local_126))
    ' float_D9
    CALL RT_2F00_056C()
    local_1A = ax
    IF ax == 1 THEN GOTO label_0FB78
    GOTO label_0FD27
    local_128 = 3
    local_12A = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " tries to enter you and bend you to its will!"
    CALL near_0A68B()
    di = ax
    si = addr(local_12E)
    CALL near_0A683()
    local_130 = 1
    CALL proc_2255D(addr(local_128), addr(local_12A), addr(local_12E), addr(local_130))
    CALL free_string(addr(local_12E))
    IF var_00CE == 1 THEN GOTO label_0FBD6
    GOTO label_0FC18
    local_132 = 3
    local_134 = 16
    di = "You easily shrug it off."
    si = addr(local_138)
    CALL near_0A683()
    local_13A = 1
    CALL proc_2255D(addr(local_132), addr(local_134), addr(local_138), addr(local_13A))
    CALL free_string(addr(local_138))
    GOTO label_0FD27
    si = arg_6
    [si] = [si] + 1
    IF [si] < 3 THEN GOTO label_0FC25
    GOTO label_0FC67
    local_13C = 3
    local_13E = 16
    di = "You BARELY fight it off!"
    si = addr(local_142)
    CALL near_0A683()
    local_144 = 1
    CALL proc_2255D(addr(local_13C), addr(local_13E), addr(local_142), addr(local_144))
    CALL free_string(addr(local_142))
    GOTO label_0FD27
    local_146 = 3
    local_148 = 16
    di = "The monster's will becomes your own.  Your identity is lost forever!"
    si = addr(local_14C)
    CALL near_0A683()
    local_14E = 1
    CALL proc_2255D(addr(local_146), addr(local_148), addr(local_14C), addr(local_14E))
    CALL free_string(addr(local_14C))
    local_150 = 3
    local_152 = 16
    di = "Your life is gone (and so is your game!)"
    si = addr(local_156)
    CALL near_0A683()
    local_158 = 1
    CALL proc_2255D(addr(local_150), addr(local_152), addr(local_156), addr(local_158))
    CALL free_string(addr(local_156))
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    di = ax
    si = addr(local_15C)
    CALL near_0A683()
    CALL dun_0E905(addr(local_15C))
    ax = addr(local_15C)
    PUSH DS
    PUSH addr(local_15C)
    ' xor ax,ax
    ax = &HAE8
    CALL RT_2732_6404(addr(local_15C), DS, &HAE8, 20)
    CALL free_string(addr(local_15C))
    IF var_01A0 == 1 THEN GOTO label_0FD31
    GOTO label_0FF22
    CALL proc_25C7F(&HAFC, 164, addr(local_160))
    ' float_D9
    CALL RT_2F00_056C()
    local_1A = ax
    IF ax == 1 THEN GOTO label_0FD58
    GOTO label_0FF22
    local_162 = 3
    local_164 = 16
    di = "The monster has lycanthopy, and tries to give you the disease!"
    si = addr(local_168)
    CALL near_0A683()
    local_16A = 1
    CALL proc_2255D(addr(local_162), addr(local_164), addr(local_168), addr(local_16A))
    CALL free_string(addr(local_168))
    IF var_00CC == 1 THEN GOTO label_0FDA1
    GOTO label_0FDE3
    local_16C = 3
    local_16E = 16
    di = "It doesn't affect you (as you breath a sigh of relief)."
    si = addr(local_172)
    CALL near_0A683()
    local_174 = 1
    CALL proc_2255D(addr(local_16C), addr(local_16E), addr(local_172), addr(local_174))
    CALL free_string(addr(local_172))
    GOTO label_0FF22
    si = arg_8
    ax = [si]
    ax = ax + 1
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jc 0xfe0b
    GOTO label_0FE4D
    local_176 = 3
    local_178 = 16
    di = "You feel strange, and you start identifying with the monster!"
    si = addr(local_17C)
    CALL near_0A683()
    local_17E = 1
    CALL proc_2255D(addr(local_176), addr(local_178), addr(local_17C), addr(local_17E))
    CALL free_string(addr(local_17C))
    GOTO label_0FF22
    local_184 = 3
    local_186 = 16
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    di = ax
    si = "As lycanthropy consumes you, you become a "
    CALL near_0A68B()
    di = ax
    si = addr(local_18A)
    CALL near_0A683()
    local_18C = 1
    CALL proc_2255D(addr(local_184), addr(local_186), addr(local_18A), addr(local_18C))
    CALL free_string(addr(local_18A))
    local_18E = 3
    local_190 = 16
    di = "You game, and your life, are over."
    si = addr(local_194)
    CALL near_0A683()
    local_196 = 1
    CALL proc_2255D(addr(local_18E), addr(local_190), addr(local_194), addr(local_196))
    CALL free_string(addr(local_194))
    ax = &HAE8
    CALL RT_2732_63DF(DS, &HAE8, 20)
    di = ax
    si = addr(local_19A)
    CALL near_0A683()
    CALL dun_0E905(addr(local_19A))
    ax = addr(local_19A)
    PUSH DS
    PUSH addr(local_19A)
    ' xor ax,ax
    ax = &HAE8
    CALL RT_2732_6404(addr(local_19A), DS, &HAE8, 20)
    CALL free_string(addr(local_19A))
    ax = 0
    IF var_015C <> 1 THEN GOTO label_0FF2D
    ax = ax - 1
    cx = 0
    IF var_015E <> 0 THEN GOTO label_0FF38
    cx = cx - 1
    ' and cx,ax
    ax = 0
    IF var_00F2 <> 0 THEN GOTO label_0FF45
    ax = ax - 1
    ' and ax,cx
    ' and ax,ax
    IF var_00F2 <> 0 THEN GOTO label_0FF4E
    GOTO label_0FFA2
    local_19C = 3
    local_19E = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " teleports away!"
    CALL near_0A68B()
    di = ax
    si = addr(local_1A2)
    CALL near_0A683()
    local_1A4 = 1
    CALL proc_2255D(addr(local_19C), addr(local_19E), addr(local_1A2), addr(local_1A4))
    CALL free_string(addr(local_1A2))
    PROC_EXIT
    RETURN
    GOTO label_002C3
END SUB

SUB the_monster_phases_as_your_1FFAD  ' image &H1FFAD, locals 88
  ' strings: The monster phases as your  |  hits  | !! | As your  | 's blow bounces off, you realize  | that a magic weapon is needed to hit this monster
    cx = 88
    CALL frame_enter()
    CALL proc_25C7F(&HB1C, 580, addr(local_E))
    ' float_D9
    CALL RT_2F00_056C()
    local_1E = ax
    CALL proc_25C7F(&HB1C, 580, addr(local_12))
    ' float_D9
    CALL RT_2F00_056C()
    local_20 = ax
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ax = var_0246
    CALL RT_2F00_0558()
    ' float_DE
    ax = var_0B1E
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    local_22 = ax
    ax = 548
    CALL RT_2732_63DF(DS, 548, 20)
    CALL RT_2732_6374(20)
    di = ax
    si = addr(local_26)
    CALL near_0A683()
    ax = 0
    IF var_0164 <> 1 THEN GOTO label_0004A
    ax = ax - 1
    cx = 0
    IF local_1E <> 1 THEN GOTO label_00054
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF local_1E <> 1 THEN GOTO label_0005D
    GOTO label_000C9
    local_14 = 3
    local_16 = 16
    di = addr(local_26)
    si = "The monster phases as your "
    CALL near_0A68B()
    si = ax
    di = " hits "
    CALL near_0A68B()
    bx = ax
    ax = 435
    local_28 = bx
    CALL RT_2732_63DF(DS, 435, 3)
    di = ax
    si = local_28
    CALL near_0A68B()
    si = ax
    di = "!!"
    CALL near_0A68B()
    di = ax
    si = addr(local_1A)
    CALL near_0A683()
    local_1C = 1
    CALL proc_2255D(addr(local_14), addr(local_16), addr(local_1A), addr(local_1C))
    CALL free_string(addr(local_1A))
    GOTO label_002A9
    IF var_0190 == 1 THEN GOTO label_000D3
    GOTO label_00152
    local_2A = 3
    local_2C = 16
    di = addr(local_26)
    si = "As your "
    CALL near_0A68B()
    si = ax
    di = "'s blow bounces off, you realize "
    CALL near_0A68B()
    di = ax
    si = addr(local_30)
    CALL near_0A683()
    local_32 = 1
    CALL proc_2255D(addr(local_2A), addr(local_2C), addr(local_30), addr(local_32))
    CALL free_string(addr(local_30))
    local_34 = 3
    local_36 = 16
    di = "that a magic weapon is needed to hit this monster"
    si = addr(local_3A)
    CALL near_0A683()
    local_3C = 1
    CALL proc_2255D(addr(local_34), addr(local_36), addr(local_3A), addr(local_3C))
    CALL free_string(addr(local_3A))
    GOTO label_002A9
    ax = 0
    IF local_22 <= 0 THEN GOTO label_0015C
    ax = ax - 1
    cx = 0
    IF local_20 <> 0 THEN GOTO label_00166
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF local_20 <> 0 THEN GOTO label_0016F
    GOTO label_00211
    local_3E = 3
    local_40 = 16
    local_42 = 0
    CALL proc_25D42(addr(local_42), addr(local_22))
    di = ax
    si = addr(local_46)
    CALL near_0A683()
    di = addr(local_26)
    si = "Your "
    CALL near_0A68B()
    si = ax
    di = " hits "
    CALL near_0A68B()
    bx = ax
    ax = 435
    local_4E = bx
    CALL RT_2732_63DF(DS, 435, 3)
    di = ax
    si = local_4E
    CALL near_0A68B()
    si = ax
    di = " for "
    CALL near_0A68B()
    si = ax
    di = addr(local_46)
    CALL near_0A68B()
    si = ax
    di = " hitpoints!"
    CALL near_0A68B()
    di = ax
    si = addr(local_4A)
    CALL near_0A683()
    local_4C = 1
    CALL proc_2255D(addr(local_3E), addr(local_40), addr(local_4A), addr(local_4C))
    CALL free_string(addr(local_4A))
    ax = local_22
    var_0158 = var_0158 - ax
    CALL you_ve_killed_1D25D()
    GOTO label_002A9
    IF local_20 == 1 THEN GOTO label_0021A
    GOTO label_00263
    local_50 = 3
    local_52 = 16
    di = addr(local_26)
    si = "Your "
    CALL near_0A68B()
    si = ax
    di = " missed."
    CALL near_0A68B()
    di = ax
    si = addr(local_56)
    CALL near_0A683()
    local_58 = 1
    CALL proc_2255D(addr(local_50), addr(local_52), addr(local_56), addr(local_58))
    CALL free_string(addr(local_56))
    GOTO label_002A9
    local_5A = 3
    local_5C = 16
    di = addr(local_26)
    si = "Your "
    CALL near_0A68B()
    si = ax
    di = "'s blow glanced off the monster."
    CALL near_0A68B()
    di = ax
    si = addr(local_60)
    CALL near_0A683()
    local_62 = 1
    CALL proc_2255D(addr(local_5A), addr(local_5C), addr(local_60), addr(local_62))
    CALL free_string(addr(local_60))
    CALL free_string(addr(local_46))
    CALL free_string(addr(local_26))
    PROC_EXIT
    RETURN
    GOTO label_0049F
END SUB

SUB is_voided_out_202C6  ' image &H202C6, locals 40
  ' strings: The monster slowly starts fading away. The fiercesome beast was only | an illusion after all.  (It sure looked and fought real, though.) | The monster writhes in pain as the magic that animated  |  is voided out! |  turns to dust on the floor!
    cx = 40
    CALL frame_enter()
    ax = 0
    IF var_017E <> 1 THEN GOTO label_002D9
    ax = ax - 1
    cx = 0
    IF var_0218 <> 4 THEN GOTO label_002E4
    cx = cx - 1
    dx = 0
    IF var_015E <> 1 THEN GOTO label_002EF
    dx = dx - 1
    ' or dx,cx
    cx = 0
    IF var_00F2 <> 1 THEN GOTO label_002FC
    cx = cx - 1
    ' or cx,dx
    ' and cx,ax
    ' and cx,cx
    IF var_00F2 <> 1 THEN GOTO label_00307
    GOTO label_0039B
    local_C = 3
    local_E = 16
    di = "The monster slowly starts fading away. The fiercesome beast was only"
    si = addr(local_12)
    CALL near_0A683()
    local_14 = 1
    CALL proc_2255D(addr(local_C), addr(local_E), addr(local_12), addr(local_14))
    CALL free_string(addr(local_12))
    local_16 = 3
    local_18 = 16
    di = "an illusion after all.  (It sure looked and fought real, though.)"
    si = addr(local_1C)
    CALL near_0A683()
    local_1E = 1
    CALL proc_2255D(addr(local_16), addr(local_18), addr(local_1C), addr(local_1E))
    CALL free_string(addr(local_1C))
    var_015C = 1
    ax = var_0158
    ' imul word [0xafc]
    ' cwd
    ax = ax + var_021C
    ' adc dx,[0x21e]
    ax = ax + var_0B0C
    ' adc dx,[0xb0e]
    var_021C = ax
    var_021E = dx
    GOTO label_00497
    ax = 0
    IF var_0180 <> 1 THEN GOTO label_003A6
    ax = ax - 1
    cx = 0
    IF var_0218 <> 4 THEN GOTO label_003B1
    cx = cx - 1
    dx = 0
    IF var_015E <> 1 THEN GOTO label_003BC
    dx = dx - 1
    ' or dx,cx
    cx = 0
    IF var_00F2 <> 1 THEN GOTO label_003C9
    cx = cx - 1
    ' or cx,dx
    ' and cx,ax
    ' and cx,cx
    IF var_00F2 <> 1 THEN GOTO label_003D4
    GOTO label_00497
    local_20 = 3
    local_22 = 16
    ax = 435
    CALL RT_2732_63DF(DS, 435, 3)
    di = ax
    si = "The monster writhes in pain as the magic that animated "
    CALL near_0A68B()
    si = ax
    di = " is voided out!"
    CALL near_0A68B()
    di = ax
    si = addr(local_26)
    CALL near_0A683()
    local_28 = 1
    CALL proc_2255D(addr(local_20), addr(local_22), addr(local_26), addr(local_28))
    CALL free_string(addr(local_26))
    local_2A = 3
    local_2C = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    si = ax
    di = " turns to dust on the floor!"
    CALL near_0A68B()
    di = ax
    si = addr(local_30)
    CALL near_0A683()
    local_32 = 1
    CALL proc_2255D(addr(local_2A), addr(local_2C), addr(local_30), addr(local_32))
    CALL free_string(addr(local_30))
    var_015A = 1
    ax = var_0158
    ' imul word [0xafc]
    ' cwd
    ax = ax + var_021C
    ' adc dx,[0x21e]
    ax = ax + var_0B0C
    ' adc dx,[0xb0e]
    var_021C = ax
    var_021E = dx
    PROC_EXIT
    RETURN
    GOTO label_008DA
END SUB

SUB sorcererslair_204A2  ' image &H204A2, locals 38
  ' strings: SORCERERSLAIR | SORCERERNOSTAFF | SORCERERAGAIN | LODI THE SORCERER | This is it. The sorcerer is the most powerful entity in the entire dungeon. | Good luck against this one, because you'll need it!
    cx = 38
    CALL frame_enter()
    local_C = 1
    local_E = 25
    CALL proc_21194(addr(local_C), addr(local_E))
    IF var_0208 == 1 THEN GOTO label_004CB
    GOTO label_004F5
    di = "SORCERERSLAIR"
    si = addr(local_12)
    CALL near_0A683()
    CALL sb_dat_21E13(addr(local_12))
    CALL free_string(addr(local_12))
    var_0208 = 2
    var_019E = 0
    GOTO label_0054F
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0208 == 1 THEN GOTO label_0050A
    GOTO label_0052E
    di = "SORCERERNOSTAFF"
    si = addr(local_16)
    CALL near_0A683()
    CALL sb_dat_21E13(addr(local_16))
    CALL free_string(addr(local_16))
    var_019E = 1
    GOTO label_0054F
    di = "SORCERERAGAIN"
    si = addr(local_1E)
    CALL near_0A683()
    CALL sb_dat_21E13(addr(local_1E))
    CALL free_string(addr(local_1E))
    var_019E = 0
    var_015A = 0
    var_015C = 0
    var_015E = 0
    var_0160 = 0
    var_018C = 0
    var_018E = 0
    var_0192 = 0
    var_0162 = 1
    var_0164 = 0
    var_0166 = 0
    var_0168 = 0
    var_016A = 0
    var_016C = 0
    var_016E = 1
    var_0170 = 0
    var_0174 = 0
    var_0176 = 0
    var_0178 = 0
    var_017A = 0
    var_017C = 0
    var_017E = 0
    var_0180 = 0
    var_0184 = 0
    var_0186 = 0
    var_0188 = 0
    var_0190 = 1
    var_01B6 = 1
    var_018A = 0
    var_0194 = 1
    var_0172 = 1
    var_0198 = 1
    var_0182 = 0
    var_019A = 0
    var_019C = 0
    var_01A0 = 0
    var_01A2 = 0
    var_01A4 = 0
    var_0AFC = 30
    var_0B00 = 1
    var_0B16 = 0
    ' float_D9
    ' float_D9
    ax = var_01E6
    ax = ax * 2
    cx = var_01EC
    cx = cx * 2
    cx = cx * 2
    cx = cx + ax
    cx = cx + var_01E8
    cx = cx + var_01F0
    ax = cx
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_0B18 = ax
    ax = 7
    ' imul word [0x1e6]
    ax = ax + var_01F0
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_0B1A = ax
    ax = 5
    ' imul word [0x1ec]
    ax = ax + var_01E6
    ax = ax + var_01E8
    ax = ax + var_01F0
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_0B1C = ax
    ax = 7
    ' imul word [0x1ea]
    ax = ax + var_01F0
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_0B1E = ax
    ax = 5
    ' imul word [0x1e8]
    cx = var_01EC
    cx = cx * 2
    cx = cx + ax
    cx = cx + var_01F0
    ax = cx
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_0B20 = ax
    ax = 6
    ' imul word [0x1ec]
    ax = ax + var_01E8
    ax = ax + var_01F0
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D8
    CALL RT_2F00_05DF()
    ax = var_01E0
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    var_0B22 = ax
    var_0B24 = 3
    var_0B0C = &H1770
    var_0B0E = 0
    var_0B10 = 60
    ax = var_01E2
    var_0B12 = ax
    ax = var_01E4
    var_0B14 = ax
    ax = "LODI THE SORCERER"
    PUSH DS
    PUSH "LODI THE SORCERER"
    ' xor ax,ax
    ax = &HAE8
    CALL RT_2732_6404("LODI THE SORCERER", DS, &HAE8, 20)
    var_0AFE = &HFFFF
    var_0BAA = 1
    var_0B26 = 16
    ax = "This is it. The sorcerer is the most powerful entity in the entire dungeon."
    PUSH DS
    PUSH "This is it. The sorcerer is the most powerful entity in the entire dungeon."
    ' xor ax,ax
    ax = &HB28
    CALL RT_2732_6404("This is it. The sorcerer is the most powerful entity in the entire dungeon.", DS, &HB28, 65)
    ax = "Good luck against this one, because you'll need it!"
    PUSH DS
    PUSH "Good luck against this one, because you'll need it!"
    ' xor ax,ax
    ax = &HB69
    CALL RT_2732_6404("Good luck against this one, because you'll need it!", DS, &HB69, 65)
    ax = var_01E4
    var_0158 = ax
    CALL hit_any_key_to_continue_2434A()
    local_24 = 1
    CALL she_1B3FD(addr(local_24))
    IF var_015A == 1 THEN GOTO label_00859
    GOTO label_008B4
    local_26 = 1
    local_28 = 25
    CALL proc_21194(addr(local_26), addr(local_28))
    di = "WINGAME"
    si = addr(local_2C)
    CALL near_0A683()
    CALL sb_dat_21E13(addr(local_2C))
    CALL free_string(addr(local_2C))
    CALL hit_any_key_to_continue_2434A()
    var_01F4 = 31
    di = &H9934
    si = addr(local_30)
    CALL near_0A683()
    CALL dun_0E905(addr(local_30))
    CALL free_string(addr(local_30))
    GOTO label_008D2
    IF var_0112 == 0 THEN GOTO label_008BE
    GOTO label_008D2
    CALL proc_0D0CF()
    CALL name_0AF8B()
    CALL proc_0C32E()
    CALL mage_0C4A1()
    PROC_EXIT
    RETURN
    GOTO label_00E03
END SUB

SUB then_takes_a_208DD  ' image &H208DD, locals 190
  ' strings: 'I come in peace!' you shout to the monster.  'That's really rich' the  | creature chuckles.  'The bleeding heart wants to talk.'  |  then takes a | swipe at you! There's just no talking to some monsters! | You speak to the monster in a soothing voice.  The monster growls back in a | harsh voice, while trying to bite you. 
    cx = 190
    CALL frame_enter()
    ax = var_0AFE
    local_C = ax
    IF local_C < 0 THEN GOTO label_008F4
    GOTO label_00A82
    IF var_0B00 == 1 THEN GOTO label_008FE
    GOTO label_009C0
    local_E = 3
    local_10 = 16
    di = "'I come in peace!' you shout to the monster.  'That's really rich' the "
    si = addr(local_14)
    CALL near_0A683()
    local_16 = 1
    CALL proc_2255D(addr(local_E), addr(local_10), addr(local_14), addr(local_16))
    CALL free_string(addr(local_14))
    local_18 = 3
    local_1A = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    di = ax
    si = "creature chuckles.  'The bleeding heart wants to talk.' "
    CALL near_0A68B()
    si = ax
    di = " then takes a"
    CALL near_0A68B()
    di = ax
    si = addr(local_1E)
    CALL near_0A683()
    local_20 = 1
    CALL proc_2255D(addr(local_18), addr(local_1A), addr(local_1E), addr(local_20))
    CALL free_string(addr(local_1E))
    local_22 = 3
    local_24 = 16
    di = "swipe at you! There's just no talking to some monsters!"
    si = addr(local_28)
    CALL near_0A683()
    local_2A = 1
    CALL proc_2255D(addr(local_22), addr(local_24), addr(local_28), addr(local_2A))
    CALL free_string(addr(local_28))
    GOTO label_00A7F
    local_2C = 3
    local_2E = 16
    di = "You speak to the monster in a soothing voice.  The monster growls back in a"
    si = addr(local_32)
    CALL near_0A683()
    local_34 = 1
    CALL proc_2255D(addr(local_2C), addr(local_2E), addr(local_32), addr(local_34))
    CALL free_string(addr(local_32))
    local_36 = 3
    local_38 = 16
    ax = 432
    CALL RT_2732_63DF(DS, 432, 3)
    di = ax
    si = "harsh voice, while trying to bite you. "
    CALL near_0A68B()
    si = ax
    di = " doesn't seem to understand you, nor"
    CALL near_0A68B()
    di = ax
    si = addr(local_3C)
    CALL near_0A683()
    local_3E = 1
    CALL proc_2255D(addr(local_36), addr(local_38), addr(local_3C), addr(local_3E))
    CALL free_string(addr(local_3C))
    local_40 = 3
    local_42 = 16
    di = "would care what you have to say."
    si = addr(local_46)
    CALL near_0A683()
    local_48 = 1
    CALL proc_2255D(addr(local_40), addr(local_42), addr(local_46), addr(local_48))
    CALL free_string(addr(local_46))
    GOTO label_00DFB
    IF local_C > 0 THEN GOTO label_00A8B
    GOTO label_00B65
    IF var_0B00 == 1 THEN GOTO label_00A95
    GOTO label_00A9D
    CALL golddragon_1DD25()
    GOTO label_00B62
    local_4A = 3
    local_4C = 16
    di = "You put your hand out to the creature in a sign of friendship. The creature"
    si = addr(local_50)
    CALL near_0A683()
    local_52 = 1
    CALL proc_2255D(addr(local_4A), addr(local_4C), addr(local_50), addr(local_52))
    CALL free_string(addr(local_50))
    local_54 = 3
    local_56 = 16
    ax = 435
    CALL RT_2732_63DF(DS, 435, 3)
    di = ax
    si = "then cuddles up to you as you start to pet "
    CALL near_0A68B()
    si = ax
    di = ". After a while, you both go"
    CALL near_0A68B()
    di = ax
    si = addr(local_5A)
    CALL near_0A683()
    local_5C = 1
    CALL proc_2255D(addr(local_54), addr(local_56), addr(local_5A), addr(local_5C))
    CALL free_string(addr(local_5A))
    local_5E = 3
    local_60 = 16
    di = "your separate ways."
    si = addr(local_64)
    CALL near_0A683()
    local_66 = 1
    CALL proc_2255D(addr(local_5E), addr(local_60), addr(local_64), addr(local_66))
    CALL free_string(addr(local_64))
    var_015C = 1
    GOTO label_00DFB
    IF local_C == 0 THEN GOTO label_00B6E
    GOTO label_00DFB
    CALL proc_25C7F(168, &HAFC, addr(local_6A))
    ' float_D9
    ' float_D9
    IF var_0B00 == 1 THEN GOTO label_00B93
    GOTO label_00C60
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0B00 == 1 THEN GOTO label_00BA8
    GOTO label_00BB0
    CALL golddragon_1DD25()
    GOTO label_00C5D
    local_70 = 3
    local_72 = 16
    di = "'Look,' you say. 'You don't want to kill me, and I really don't"
    si = addr(local_76)
    CALL near_0A683()
    local_78 = 1
    CALL proc_2255D(addr(local_70), addr(local_72), addr(local_76), addr(local_78))
    CALL free_string(addr(local_76))
    local_7A = 3
    local_7C = 16
    di = "want to die. Why don't we just go our own ways?' The creature thinks"
    si = addr(local_80)
    CALL near_0A683()
    local_82 = 1
    CALL proc_2255D(addr(local_7A), addr(local_7C), addr(local_80), addr(local_82))
    CALL free_string(addr(local_80))
    local_84 = 3
    local_86 = 16
    di = "but then replies 'Nah. What's in it for me?'"
    si = addr(local_8A)
    CALL near_0A683()
    local_8C = 1
    CALL proc_2255D(addr(local_84), addr(local_86), addr(local_8A), addr(local_8C))
    CALL free_string(addr(local_8A))
    GOTO label_00DF8
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF var_0B00 == 1 THEN GOTO label_00C75
    GOTO label_00D3B
    local_8E = 3
    local_90 = 16
    di = "There are a couple tense moments as you speak soothingly to the"
    si = addr(local_94)
    CALL near_0A683()
    local_96 = 1
    CALL proc_2255D(addr(local_8E), addr(local_90), addr(local_94), addr(local_96))
    CALL free_string(addr(local_94))
    local_98 = 3
    local_9A = 16
    di = "creature. Then as your eyes lock, a special bond develops as the"
    si = addr(local_9E)
    CALL near_0A683()
    local_A0 = 1
    CALL proc_2255D(addr(local_98), addr(local_9A), addr(local_9E), addr(local_A0))
    CALL free_string(addr(local_9E))
    local_A2 = 3
    local_A4 = 16
    di = "creature almost seems to understand you. You both go your own ways."
    si = addr(local_A8)
    CALL near_0A683()
    local_AA = 1
    CALL proc_2255D(addr(local_A2), addr(local_A4), addr(local_A8), addr(local_AA))
    CALL free_string(addr(local_A8))
    var_015C = 1
    GOTO label_00DF8
    local_AC = 3
    local_AE = 16
    di = "You speak soothingly to the animal, but to no avail!  As the monster"
    si = addr(local_B2)
    CALL near_0A683()
    local_B4 = 1
    CALL proc_2255D(addr(local_AC), addr(local_AE), addr(local_B2), addr(local_B4))
    CALL free_string(addr(local_B2))
    local_B6 = 3
    local_B8 = 16
    di = "maintains the attack, you realize how hard dungeon life must be to"
    si = addr(local_BC)
    CALL near_0A683()
    local_BE = 1
    CALL proc_2255D(addr(local_B6), addr(local_B8), addr(local_BC), addr(local_BE))
    CALL free_string(addr(local_BC))
    local_C0 = 3
    local_C2 = 16
    di = "turn a nice animal into such a beast. You vow to pay the sorcerer back."
    si = addr(local_C6)
    CALL near_0A683()
    local_C8 = 1
    CALL proc_2255D(addr(local_C0), addr(local_C2), addr(local_C6), addr(local_C8))
    CALL free_string(addr(local_C6))
    GOTO label_00DFB
    PROC_EXIT
    RETURN
    CALL RT_2732_4E0A()
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    ' decode stopped: unknown opcode 0x62 at 0x20e10 at 0x20e10
END SUB

SUB proc_20E6B  ' image &H20E6B, locals 24
    cx = 24
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_616F(ax)
    bx = ax
    local_C = bx
    CALL RT_2732_616F(72)
    di = ax
    si = local_C
    CALL near_00E51()
    PUSH DS
    PUSH 72
    ' xor ax,ax
    ax = 48
    CALL RT_2732_6404(72, DS, 48, 2)
    ' xor ax,ax
    CALL RT_2732_616F(2)
    bx = ax
    local_E = bx
    CALL RT_2732_616F(80)
    di = ax
    si = local_E
    CALL near_00E51()
    PUSH DS
    PUSH 80
    ' xor ax,ax
    ax = 50
    CALL RT_2732_6404(80, DS, 50, 2)
    ' xor ax,ax
    CALL RT_2732_616F(2)
    bx = ax
    local_10 = bx
    CALL RT_2732_616F(75)
    di = ax
    si = local_10
    CALL near_00E51()
    PUSH DS
    PUSH 75
    ' xor ax,ax
    ax = 52
    CALL RT_2732_6404(75, DS, 52, 2)
    ' xor ax,ax
    CALL RT_2732_616F(2)
    bx = ax
    local_12 = bx
    CALL RT_2732_616F(77)
    di = ax
    si = local_12
    CALL near_00E51()
    PUSH DS
    PUSH 77
    ' xor ax,ax
    ax = 54
    CALL RT_2732_6404(77, DS, 54, 2)
    ' xor ax,ax
    CALL RT_2732_616F(2)
    bx = ax
    local_14 = bx
    CALL RT_2732_616F(73)
    di = ax
    si = local_14
    CALL near_00E51()
    PUSH DS
    PUSH 73
    ' xor ax,ax
    ax = 56
    CALL RT_2732_6404(73, DS, 56, 2)
    ' xor ax,ax
    CALL RT_2732_616F(2)
    bx = ax
    local_16 = bx
    CALL RT_2732_616F(81)
    di = ax
    si = local_16
    CALL near_00E51()
    PUSH DS
    PUSH 81
    ' xor ax,ax
    ax = 58
    CALL RT_2732_6404(81, DS, 58, 2)
    ' xor ax,ax
    CALL RT_2732_616F(2)
    bx = ax
    local_18 = bx
    CALL RT_2732_616F(71)
    di = ax
    si = local_18
    CALL near_00E51()
    PUSH DS
    PUSH 71
    ' xor ax,ax
    ax = 60
    CALL RT_2732_6404(71, DS, 60, 2)
    ' xor ax,ax
    CALL RT_2732_616F(2)
    bx = ax
    local_1A = bx
    CALL RT_2732_616F(79)
    di = ax
    si = local_1A
    CALL near_00E51()
    PUSH DS
    PUSH 79
    ' xor ax,ax
    ax = 62
    CALL RT_2732_6404(79, DS, 62, 2)
    ' xor ax,ax
    CALL RT_2732_616F(2)
    bx = ax
    local_1C = bx
    CALL RT_2732_616F(76)
    di = ax
    si = local_1C
    CALL near_00E51()
    PUSH DS
    PUSH 76
    ' xor ax,ax
    ax = 64
    CALL RT_2732_6404(76, DS, 64, 2)
    ' xor ax,ax
    CALL RT_2732_616F(2)
    bx = ax
    local_1E = bx
    CALL RT_2732_616F(82)
    di = ax
    si = local_1E
    CALL near_00E51()
    PUSH DS
    PUSH 82
    ' xor ax,ax
    ax = 66
    CALL RT_2732_6404(82, DS, 66, 2)
    ' xor ax,ax
    CALL RT_2732_616F(2)
    bx = ax
    local_20 = bx
    CALL RT_2732_616F(83)
    di = ax
    si = local_20
    CALL near_00E51()
    PUSH DS
    PUSH 83
    ' xor ax,ax
    ax = 68
    CALL RT_2732_6404(83, DS, 68, 2)
    ' xor ax,ax
    CALL RT_2732_616F(2)
    bx = ax
    local_22 = bx
    CALL RT_2732_616F(15)
    di = ax
    si = local_22
    CALL near_00E51()
    PUSH DS
    PUSH 15
    ' xor ax,ax
    ax = 70
    CALL RT_2732_6404(15, DS, 70, 2)
    CALL RT_2732_616F(13)
    PUSH DS
    PUSH 13
    ' xor ax,ax
    ax = 72
    CALL RT_2732_6404(13, DS, 72, 1)
    CALL RT_2732_616F(8)
    PUSH DS
    PUSH 8
    ' xor ax,ax
    ax = 73
    CALL RT_2732_6404(8, DS, 73, 1)
    CALL RT_2732_616F(27)
    PUSH DS
    PUSH 27
    ' xor ax,ax
    ax = 74
    CALL RT_2732_6404(27, DS, 74, 1)
    CALL RT_2732_616F(9)
    PUSH DS
    PUSH 9
    ' xor ax,ax
    ax = 75
    CALL RT_2732_6404(9, DS, 75, 1)
    CALL RT_2732_616F(13)
    PUSH DS
    PUSH 13
    ' xor ax,ax
    ax = 77
    CALL RT_2732_6404(13, DS, 77, 1)
    CALL RT_2732_616F(10)
    PUSH DS
    PUSH 10
    ' xor ax,ax
    ax = 76
    CALL RT_2732_6404(10, DS, 76, 1)
    CALL RT_2732_616F(12)
    PUSH DS
    PUSH 12
    ' xor ax,ax
    ax = 78
    CALL RT_2732_6404(12, DS, 78, 1)
    var_0056 = 1
    PROC_EXIT
    RETURN
    GOTO label_0120D
END SUB

SUB proc_21194  ' image &H21194, locals 14
    cx = 14
    CALL frame_enter()
    si = arg_6
    ax = [si]
    local_C = ax
    si = arg_8
    ax = [si]
    GOTO label_011E9
    local_E = 1
    CALL RT_2732_62BC(80)
    di = ax
    si = addr(local_12)
    CALL near_00E43()
    local_14 = 0
    CALL locate_print_21DEA(addr(local_16), addr(local_E), addr(local_12), addr(local_14))
    CALL free_string(addr(local_12))
    ax = local_16
    ax = ax + 1
    local_16 = ax
    ax = local_C
    IF ax >= local_16 THEN GOTO label_011AC
    local_18 = 1
    CALL proc_253B3(arg_8, addr(local_18))
    PROC_EXIT
    RETURN
    GOTO label_012EC
END SUB

SUB proc_21210  ' image &H21210, locals 20
    cx = 20
    CALL frame_enter()
    di = arg_6
    si = addr(local_E)
    CALL near_00E43()
    ' float_D9
    ' float_D9
    CALL RT_2732_6199(addr(local_E))
    local_14 = ax
    ax = 1
    GOTO label_012BB
    ax = 128
    ' cwd
    ' idiv word [bp-0x16]
    dx = dx + 128
    ax = dx
    CALL RT_2F00_0558()
    ' float_D9
    CALL RT_2732_6266(addr(local_E), local_16, 1)
    CALL RT_2732_61A9(1)
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jc 0x1290
    GOTO label_01293
    GOTO label_012C9
    ax = addr(local_E)
    PUSH DS
    PUSH addr(local_E)
    ' xor ax,ax
    ' float_D9
    PUSH addr(local_E)
    CALL RT_2F00_056C()
    CALL RT_2732_616F(addr(local_E))
    CALL RT_2732_650E(addr(local_E), 1, local_16)
    ax = local_16
    ax = ax + 1
    local_16 = ax
    ax = local_14
    IF ax < local_16 THEN GOTO label_012C9
    GOTO label_0123E
    di = addr(local_E)
    si = addr(local_1E)
    CALL near_00E43()
    CALL free_string(addr(local_E))
    CALL RT_2732_64F5(addr(local_1E))
    PROC_EXIT
    RETURN
    GOTO label_01DB6
END SUB

SUB no_212EF  ' image &H212EF, locals 270
  ' strings: NO  | YES | DEFAULTS IN  | Current setup | Color: | Sound (music):
    cx = 270
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 7, 4, &H8001, addr(local_1C))
    ' xor ax,ax
    CALL RT_2732_24B9(addr(local_1C), 1, 4, &H8001, addr(local_2E))
    ' xor ax,ax
    bx = addr(local_2E)
    CALL array_element(addr(local_2E), 1)
    si = bx
    di = "NO "
    CALL near_00E43()
    bx = addr(local_2E)
    CALL array_element(1, 1)
    si = bx
    di = "YES"
    CALL near_00E43()
    local_30 = 1
    local_32 = 25
    CALL proc_21194(addr(local_30), addr(local_32))
    local_34 = 15
    local_36 = 0
    CALL color_25283(addr(local_34), addr(local_36))
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    PUSH 1
    CALL RT_2732_616F(7)
    CALL RT_2732_6130(7)
    IF ? == ? THEN GOTO label_013A4
    GOTO label_013B2
    ' float_D9
    ' float_D9
    GOTO label_013BD
    ' float_D9
    ' float_D9
    local_3C = 1
    local_3E = 28
    di = arg_6
    si = "DEFAULTS IN "
    CALL near_00E51()
    di = ax
    si = addr(local_42)
    CALL near_00E43()
    local_44 = 0
    CALL locate_print_21DEA(addr(local_3C), addr(local_3E), addr(local_42), addr(local_44))
    CALL free_string(addr(local_42))
    local_46 = 3
    local_48 = 33
    di = "Current setup"
    si = addr(local_4C)
    CALL near_00E43()
    local_4E = 0
    CALL locate_print_21DEA(addr(local_46), addr(local_48), addr(local_4C), addr(local_4E))
    CALL free_string(addr(local_4C))
    local_50 = 12
    local_52 = 0
    CALL color_25283(addr(local_50), addr(local_52))
    local_54 = 5
    local_56 = 30
    di = "Color:"
    si = addr(local_5A)
    CALL near_00E43()
    local_5C = 0
    CALL locate_print_21DEA(addr(local_54), addr(local_56), addr(local_5A), addr(local_5C))
    CALL free_string(addr(local_5A))
    local_5E = 5
    local_60 = 50
    bx = addr(local_2E)
    CALL array_element(var_0056, 1)
    di = bx
    si = addr(local_64)
    CALL near_00E43()
    local_66 = 1
    CALL locate_print_21DEA(addr(local_5E), addr(local_60), addr(local_64), addr(local_66))
    bx = addr(local_2E)
    CALL array_element(var_0056, 1)
    si = bx
    di = addr(local_64)
    CALL near_00E43()
    local_68 = 0
    local_6A = 30
    di = "Sound (music):"
    si = addr(local_6E)
    CALL near_00E43()
    local_70 = 0
    CALL locate_print_21DEA(addr(local_68), addr(local_6A), addr(local_6E), addr(local_70))
    CALL free_string(addr(local_6E))
    local_72 = 0
    local_74 = 50
    bx = addr(local_2E)
    CALL array_element(var_0050, 1)
    di = bx
    si = addr(local_78)
    CALL near_00E43()
    local_7A = 1
    CALL locate_print_21DEA(addr(local_72), addr(local_74), addr(local_78), addr(local_7A))
    bx = addr(local_2E)
    CALL array_element(var_0050, 1)
    si = bx
    di = addr(local_78)
    CALL near_00E43()
    local_7C = 0
    local_7E = 30
    di = "Error Alarm:"
    si = addr(local_82)
    CALL near_00E43()
    local_84 = 0
    CALL locate_print_21DEA(addr(local_7C), addr(local_7E), addr(local_82), addr(local_84))
    CALL free_string(addr(local_82))
    local_86 = 0
    local_88 = 50
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_2E)
    CALL array_element(addr(local_82), 1)
    di = bx
    si = addr(local_8C)
    CALL near_00E43()
    local_8E = 1
    CALL locate_print_21DEA(addr(local_86), addr(local_88), addr(local_8C), addr(local_8E))
    ' float_D9
    CALL RT_2F00_056C()
    bx = addr(local_2E)
    CALL array_element(addr(local_8E), 1)
    si = bx
    di = addr(local_8C)
    CALL near_00E43()
    IF var_0064 == 1 THEN GOTO label_0160A
    GOTO label_01789
    local_90 = 0
    local_92 = 30
    di = "Mouse:"
    si = addr(local_96)
    CALL near_00E43()
    local_98 = 0
    CALL locate_print_21DEA(addr(local_90), addr(local_92), addr(local_96), addr(local_98))
    CALL free_string(addr(local_96))
    local_9A = 0
    local_9C = 50
    bx = addr(local_2E)
    CALL array_element(var_0066, 1)
    di = bx
    si = addr(local_A0)
    CALL near_00E43()
    local_A2 = 1
    CALL locate_print_21DEA(addr(local_9A), addr(local_9C), addr(local_A0), addr(local_A2))
    bx = addr(local_2E)
    CALL array_element(var_0066, 1)
    si = bx
    di = addr(local_A0)
    CALL near_00E43()
    IF var_0066 == 1 THEN GOTO label_016B0
    GOTO label_0174F
    local_A4 = 0
    local_A6 = 30
    di = "Mouse description:"
    si = addr(local_AA)
    CALL near_00E43()
    local_AC = 0
    CALL locate_print_21DEA(addr(local_A4), addr(local_A6), addr(local_AA), addr(local_AC))
    CALL free_string(addr(local_AA))
    local_AE = 0
    local_B0 = 50
    bx = addr(local_2E)
    CALL array_element(var_008A, 1)
    di = bx
    si = addr(local_B4)
    CALL near_00E43()
    local_B6 = 1
    CALL locate_print_21DEA(addr(local_AE), addr(local_B0), addr(local_B4), addr(local_B6))
    bx = addr(local_2E)
    CALL array_element(var_008A, 1)
    si = bx
    di = addr(local_B4)
    CALL near_00E43()
    GOTO label_01786
    var_008A = 0
    CALL RT_2732_62BC(79)
    di = ax
    si = addr(local_BA)
    CALL near_00E43()
    local_BC = 1
    CALL print_more_21DB9(addr(local_BA), addr(local_BC))
    CALL free_string(addr(local_BA))
    GOTO label_017F7
    var_0066 = 0
    var_008A = 0
    CALL RT_2732_62BC(79)
    di = ax
    si = addr(local_C0)
    CALL near_00E43()
    local_C2 = 1
    CALL print_more_21DB9(addr(local_C0), addr(local_C2))
    CALL free_string(addr(local_C0))
    CALL RT_2732_62BC(79)
    di = ax
    si = addr(local_C6)
    CALL near_00E43()
    local_C8 = 1
    CALL print_more_21DB9(addr(local_C6), addr(local_C8))
    CALL free_string(addr(local_C6))
    local_CA = 15
    local_CC = 0
    CALL color_25283(addr(local_CA), addr(local_CC))
    local_CE = 13
    local_D0 = 30
    di = "Setup menu options"
    si = addr(local_D4)
    CALL near_00E43()
    local_D6 = 1
    CALL locate_print_21DEA(addr(local_CE), addr(local_D0), addr(local_D4), addr(local_D6))
    CALL free_string(addr(local_D4))
    IF var_0056 == 1 THEN GOTO label_0185B
    GOTO label_01873
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(C) Turn the color off"
    CALL near_00E43()
    GOTO label_01888
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(C) Turn the color on "
    CALL near_00E43()
    IF var_0050 == 1 THEN GOTO label_01892
    GOTO label_018AD
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(S) Turn the sound (music) off"
    CALL near_00E43()
    GOTO label_018C5
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(S) Turn the sound (music) on "
    CALL near_00E43()
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    PUSH 1
    CALL RT_2732_616F(7)
    CALL RT_2732_6130(7)
    IF var_0050 == 1 THEN GOTO label_018E8
    GOTO label_01903
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(E) Turn the error alarm off"
    CALL near_00E43()
    GOTO label_0191B
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "(E) Turn the error alarm on "
    CALL near_00E43()
    local_D8 = 4
    IF var_0064 == 1 THEN GOTO label_0192B
    GOTO label_0196C
    IF var_0066 == 1 THEN GOTO label_01935
    GOTO label_01950
    bx = addr(local_1C)
    CALL array_element(local_D8, 1)
    si = bx
    di = "(M) Turn the mouse off"
    CALL near_00E43()
    GOTO label_01968
    bx = addr(local_1C)
    CALL array_element(local_D8, 1)
    si = bx
    di = "(M) Turn the mouse on "
    CALL near_00E43()
    local_D8 = local_D8 + 1
    IF var_0066 == 1 THEN GOTO label_01976
    GOTO label_019B7
    IF var_008A == 1 THEN GOTO label_01980
    GOTO label_0199B
    bx = addr(local_1C)
    CALL array_element(local_D8, 1)
    si = bx
    di = "(D) Turn the mouse button description off"
    CALL near_00E43()
    GOTO label_019B3
    bx = addr(local_1C)
    CALL array_element(local_D8, 1)
    si = bx
    di = "(D) Turn the mouse button description on "
    CALL near_00E43()
    local_D8 = local_D8 + 1
    bx = addr(local_1C)
    CALL array_element(local_D8, 1)
    si = bx
    di = "(H) Help "
    CALL near_00E43()
    local_D8 = local_D8 + 1
    bx = addr(local_1C)
    CALL array_element(local_D8, 1)
    si = bx
    di = "(Q or ESC) Save and go to the Main or previous Menu"
    CALL near_00E43()
    ax = 1
    GOTO label_01A43
    ax = local_DA
    ax = ax + 15
    local_DC = ax
    local_DE = 1
    CALL RT_2732_62BC(80)
    di = ax
    si = addr(local_E2)
    CALL near_00E43()
    local_E4 = 0
    CALL locate_print_21DEA(addr(local_DC), addr(local_DE), addr(local_E2), addr(local_E4))
    CALL free_string(addr(local_E2))
    ax = local_DA
    ax = ax + 1
    local_DA = ax
    IF local_DA <= 7 THEN GOTO label_019F2
    local_E6 = 24
    local_E8 = 1
    CALL RT_2732_62BC(80)
    di = ax
    si = addr(local_EC)
    CALL near_00E43()
    local_EE = 0
    CALL locate_print_21DEA(addr(local_E6), addr(local_E8), addr(local_EC), addr(local_EE))
    CALL free_string(addr(local_EC))
    local_F0 = 1
    local_F2 = 20
    local_F4 = 15
    local_F6 = 2
    local_F8 = 0
    local_FA = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_D8), addr(local_F0), addr(local_F2), addr(local_F4), addr(local_F6), addr(local_F8), addr(local_100), addr(local_FA))
    di = ax
    si = addr(local_FE)
    CALL near_00E43()
    di = addr(local_FE)
    si = addr(local_104)
    CALL near_00E43()
    di = addr(local_104)
    si = addr(local_108)
    CALL near_00E43()
    CALL RT_2732_6130(addr(local_108), &HBDDA)
    IF local_DA <> 7 THEN GOTO label_01B1C
    GOTO label_01B3A
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_108))
    IF local_DA == 7 THEN GOTO label_01B3A
    GOTO label_01B40
    GOTO label_01D4E
    GOTO label_01D4B
    CALL RT_2732_6130(addr(local_108), &HBDE0)
    IF local_DA == 7 THEN GOTO label_01B53
    GOTO label_01B94
    di = "HELPDEFAULTS"
    si = addr(local_10C)
    CALL near_00E43()
    CALL sb_dat_21E13(addr(local_10C))
    CALL free_string(addr(local_10C))
    CALL hit_any_key_to_continue_2434A()
    local_10E = 1
    local_110 = 25
    CALL proc_21194(addr(local_10E), addr(local_110))
    GOTO label_01D4B
    CALL RT_2732_6130(addr(local_108), &HBDF6)
    IF local_DA == 7 THEN GOTO label_01BA7
    GOTO label_01BC3
    IF var_0056 == 1 THEN GOTO label_01BB1
    GOTO label_01BBA
    var_0056 = 0
    GOTO label_01BC0
    var_0056 = 1
    GOTO label_01D4B
    CALL RT_2732_6130(addr(local_108), &HBDFC)
    IF var_0056 == 1 THEN GOTO label_01BD6
    GOTO label_01BF2
    IF var_0050 == 1 THEN GOTO label_01BE0
    GOTO label_01BE9
    var_0050 = 0
    GOTO label_01BEF
    var_0050 = 1
    GOTO label_01D4B
    CALL RT_2732_6130(addr(local_108), &HBE02)
    IF var_0050 == 1 THEN GOTO label_01C05
    GOTO label_01C65
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    PUSH 1
    CALL RT_2732_616F(7)
    CALL RT_2732_6130(7)
    IF var_0050 == 1 THEN GOTO label_01C28
    GOTO label_01C46
    ' xor ax,ax
    CALL RT_2732_616F(7)
    PUSH DS
    PUSH 7
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(7, DS, 79, 1)
    GOTO label_01C62
    CALL RT_2732_616F(7)
    PUSH DS
    PUSH 7
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(7, DS, 79, 1)
    GOTO label_01D4B
    CALL RT_2732_6130(addr(local_104), &HBE08)
    ax = 0
    IF var_0050 <> 1 THEN GOTO label_01C79
    ax = ax - 1
    cx = 0
    IF var_0064 <> 1 THEN GOTO label_01C84
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0064 <> 1 THEN GOTO label_01C8D
    GOTO label_01CA9
    IF var_0066 == 1 THEN GOTO label_01C97
    GOTO label_01CA0
    var_0066 = 0
    GOTO label_01CA6
    var_0066 = 1
    GOTO label_01D4B
    CALL RT_2732_6130(addr(local_104), &HBE0E)
    ax = 0
    IF var_0066 <> 1 THEN GOTO label_01CBD
    ax = ax - 1
    cx = 0
    IF var_0066 <> 1 THEN GOTO label_01CC8
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_0066 <> 1 THEN GOTO label_01CD1
    GOTO label_01CED
    IF var_008A == 1 THEN GOTO label_01CDB
    GOTO label_01CE4
    var_008A = 0
    GOTO label_01CEA
    var_008A = 1
    GOTO label_01D4B
    di = "An unknown key was hit"
    si = addr(local_114)
    CALL near_00E43()
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    di = ax
    si = addr(local_118)
    CALL near_00E43()
    CALL proc_2311E(addr(local_114), addr(local_118))
    ax = addr(local_118)
    PUSH DS
    PUSH addr(local_118)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_118), DS, 79, 1)
    CALL free_string(addr(local_114))
    CALL free_string(addr(local_118))
    GOTO label_01A95
    GOTO label_0136A
    CALL free_string(addr(local_108))
    CALL free_string(addr(local_FE))
    CALL free_string(addr(local_B4))
    CALL free_string(addr(local_A0))
    CALL free_string(addr(local_8C))
    CALL free_string(addr(local_78))
    CALL free_string(addr(local_64))
    CALL free_string(addr(local_104))
    CALL erase_array(addr(local_1C))
    CALL erase_array(addr(local_2E))
    PROC_EXIT
    RETURN
    GOTO label_01DE7
END SUB

SUB print_more_21DB9  ' image &H21DB9, locals 0
    cx = 0
    CALL frame_enter()
    si = arg_6
    IF [si] == 1 THEN GOTO label_01DCC
    GOTO label_01DD7
    PUSH arg_8
    CALL RT_2732_5920()
    GOTO label_01DDF
    PUSH arg_8
    CALL RT_2732_591B()
    PROC_EXIT
    RETURN
    GOTO label_01E10
END SUB

SUB locate_print_21DEA  ' image &H21DEA, locals 0
    cx = 0
    CALL frame_enter()
    CALL proc_253B3(arg_C, arg_A)
    CALL print_more_21DB9(arg_8, arg_6)
    PROC_EXIT
    RETURN
    GOTO label_0242D
END SUB

SUB sb_dat_21E13  ' image &H21E13, locals 126
  ' strings: SB.DAT |    | not found.  Hit any key to continue
    cx = 126
    CALL frame_enter()
    CALL RT_2732_6374(arg_6)
    di = ax
    si = arg_6
    CALL near_00E43()
    ' float_D9
    ' float_D9
    ' xor ax,ax
    CALL RT_2732_68FD(ax)
    local_10 = ax
    CALL RT_2732_68ED()
    local_12 = ax
    CALL RT_2732_02F6()
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    PUSH "SB.DAT"
    CALL RT_2F00_056C()
    CALL open_random("SB.DAT", &HFFFF, &H4001)
    ax = &H14A8
    CALL RT_2732_7450()
    ' float_D9
    CALL RT_2F00_056C()
    CALL RT_2732_0310(&H14A8)
    bx = ax
    local_1C = bx
    CALL RT_2732_6130(arg_6, addr(local_1A))
    ax = 0
    IF ? <> ? THEN GOTO label_01EA2
    ax = ax - 1
    ' or ax,[bp-0x1c]
    ' and ax,ax
    IF ? == ? THEN GOTO label_01E74
    ax = &H1178
    CALL RT_2732_7450()
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_01EC7
    GOTO label_01ECF
    ax = &H1229
    CALL RT_2732_7450()
    ' float_D9
    ' float_D9
    di = &HBE38
    si = addr(local_24)
    CALL near_00E43()
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? > ? THEN GOTO label_01EF8
    GOTO label_01F01
    ax = local_10
    local_2A = ax
    GOTO label_01F0C
    ' xor ax,ax
    CALL RT_2732_68FD(local_10)
    local_2A = ax
    ax = local_12
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    local_12 = ax
    local_2C = 0
    CALL locate_print_21DEA(addr(local_12), addr(local_2A), addr(local_30), addr(local_2C))
    ax = &H14A8
    CALL RT_2732_7450()
    CALL RT_2732_6130(arg_6, addr(local_1A))
    ax = 0
    IF ? == ? THEN GOTO label_01F54
    ax = ax - 1
    ' float_D9
    bx = ax
    CALL RT_2F00_056C()
    local_32 = bx
    CALL RT_2732_0310(ax)
    ' or ax,[bp-0x32]
    ' and ax,ax
    IF ? <> ? THEN GOTO label_01F72
    GOTO label_01EAA
    ' float_D9
    CALL RT_2F00_056C()
    CLOSE #ax
    GOTO label_023C9
    ' float_D9
    ' float_D9
    ax = &H1297
    CALL RT_2732_7450()
    CALL RT_2732_6199(addr(local_36))
    IF ax < 23 THEN GOTO label_01FAC
    GOTO label_01FBD
    di = "  "
    si = addr(local_36)
    CALL near_00E51()
    di = ax
    si = addr(local_36)
    CALL near_00E43()
    CALL RT_2732_6266(addr(local_36), 22, 1)
    di = ax
    si = addr(local_3A)
    CALL near_00E43()
    CALL RT_2732_6130(addr(local_3A), &HBE42)
    IF ax == 23 THEN GOTO label_01FE8
    GOTO label_02001
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    GOTO label_02015
    CALL RT_2732_76EA(addr(local_3A))
    si = ax
    ' float_DD
    ' float_D9
    CALL RT_2732_6266(addr(local_36), 23, &H7FFF)
    CALL RT_2732_6374(&H7FFF)
    di = ax
    si = addr(local_30)
    CALL near_00E43()
    CALL RT_2732_7473()
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == 23 THEN GOTO label_0204E
    GOTO label_02053
    CALL hit_any_key_to_continue_2434A()
    local_3C = 1
    local_3E = 25
    CALL proc_21194(addr(local_3C), addr(local_3E))
    local_12 = 1
    ' float_D9
    ' float_D9
    local_10 = 1
    local_40 = 0
    CALL proc_253B3(addr(local_40), addr(local_10))
    di = &HBE38
    si = addr(local_44)
    CALL near_00E43()
    ax = &H1297
    CALL RT_2732_7450()
    CALL RT_2732_7473()
    CALL RT_2732_6266(addr(local_36), 21, 1)
    di = ax
    si = addr(local_48)
    CALL near_00E43()
    CALL RT_2732_6130(addr(local_44), addr(local_48))
    IF ax <> 23 THEN GOTO label_020D2
    GOTO label_022B3
    di = addr(local_48)
    si = addr(local_44)
    CALL near_00E43()
    di = addr(local_44)
    si = addr(local_4C)
    CALL near_00E43()
    CALL RT_2732_6130(addr(local_4C), &HBDE0)
    IF ax == 23 THEN GOTO label_020F6
    GOTO label_02110
    local_4E = 15
    local_50 = 0
    CALL color_25283(addr(local_4E), addr(local_50))
    GOTO label_022B3
    CALL RT_2732_6130(addr(local_4C), &HBE48)
    IF ax == 23 THEN GOTO label_02122
    GOTO label_0213C
    local_52 = 14
    local_54 = 0
    CALL color_25283(addr(local_52), addr(local_54))
    GOTO label_022B3
    CALL RT_2732_6130(addr(local_4C), &HBE4E)
    IF ax == 23 THEN GOTO label_0214E
    GOTO label_02168
    local_56 = 10
    local_58 = 0
    CALL color_25283(addr(local_56), addr(local_58))
    GOTO label_022B3
    CALL RT_2732_6130(addr(local_4C), &HBDF6)
    IF ax == 23 THEN GOTO label_0217A
    GOTO label_02194
    local_5A = 3
    local_5C = 0
    CALL color_25283(addr(local_5A), addr(local_5C))
    GOTO label_022B3
    CALL RT_2732_6130(addr(local_4C), &HBE08)
    IF ax == 23 THEN GOTO label_021A6
    GOTO label_021C0
    local_5E = 13
    local_60 = 0
    CALL color_25283(addr(local_5E), addr(local_60))
    GOTO label_022B3
    CALL RT_2732_6130(addr(local_4C), &HBE54)
    IF ax == 23 THEN GOTO label_021D2
    GOTO label_021EC
    local_62 = 9
    local_64 = 0
    CALL color_25283(addr(local_62), addr(local_64))
    GOTO label_022B3
    CALL RT_2732_6130(addr(local_4C), &HBE5A)
    IF ax == 23 THEN GOTO label_021FE
    GOTO label_02218
    local_66 = 7
    local_68 = 0
    CALL color_25283(addr(local_66), addr(local_68))
    GOTO label_022B3
    CALL RT_2732_6130(addr(local_4C), &HBE60)
    IF ax == 23 THEN GOTO label_0222A
    GOTO label_02244
    local_6A = 12
    local_6C = 0
    CALL color_25283(addr(local_6A), addr(local_6C))
    GOTO label_022B3
    CALL RT_2732_6130(addr(local_4C), &HBE66)
    IF ax == 23 THEN GOTO label_02256
    GOTO label_02270
    local_6E = 9
    local_70 = 0
    CALL color_25283(addr(local_6E), addr(local_70))
    GOTO label_022B3
    CALL RT_2732_6130(addr(local_4C), &HBE0E)
    IF ax == 23 THEN GOTO label_02282
    GOTO label_0229C
    local_72 = 6
    local_74 = 0
    CALL color_25283(addr(local_72), addr(local_74))
    GOTO label_022B3
    local_76 = 11
    local_78 = 0
    CALL color_25283(addr(local_76), addr(local_78))
    CALL RT_2732_7473()
    di = &HBE38
    si = addr(local_36)
    CALL near_00E43()
    di = &HBE38
    si = addr(local_1A)
    CALL near_00E43()
    var_0058 = 0
    ax = 79
    CALL RT_2732_655C(CS, 79)
    ' float_D9
    CALL RT_2F00_056C()
    CALL RT_2732_6A9E(79)
    ax = addr(local_36)
    PUSH &HBE38
    PUSH DS
    PUSH addr(local_36)
    ' xor ax,ax
    CALL RT_2732_6C24(addr(local_36), 1)
    ax = &HFFFF
    CALL RT_2732_655C(CS, &HFFFF)
    IF var_0058 > 0 THEN GOTO label_02312
    GOTO label_0238D
    di = "not found.  Hit any key to continue"
    si = arg_6
    CALL near_00E51()
    di = ax
    si = addr(local_7C)
    CALL near_00E43()
    di = &HBE38
    si = addr(local_80)
    CALL near_00E43()
    CALL proc_2311E(addr(local_7C), addr(local_80))
    CALL free_string(addr(local_7C))
    CALL free_string(addr(local_80))
    CALL proc_243D9()
    di = ax
    si = addr(local_84)
    CALL near_00E43()
    di = addr(local_84)
    si = addr(local_88)
    CALL near_00E43()
    CALL RT_2732_6130(addr(local_88), &HBE38)
    IF var_0058 == 0 THEN GOTO label_02312
    ' float_D9
    CALL RT_2F00_056C()
    CLOSE #&HBE38
    GOTO label_023C9
    GOTO label_023C4
    ' float_D9
    CALL RT_2F00_056C()
    CALL RT_2732_0310(1)
    ' not ax
    ' and ax,ax
    IF var_0058 <> 0 THEN GOTO label_023A5
    GOTO label_023C4
    CALL RT_2732_6266(addr(local_36), 1, 20)
    CALL RT_2732_6374(20)
    di = ax
    si = addr(local_1A)
    CALL near_00E43()
    CALL RT_2732_7473()
    CALL free_string(addr(local_84))
    CALL free_string(addr(local_4C))
    CALL free_string(addr(local_88))
    CALL free_string(addr(local_24))
    CALL free_string(addr(local_48))
    CALL free_string(addr(local_44))
    CALL free_string(addr(local_3A))
    CALL free_string(addr(local_36))
    CALL free_string(addr(local_30))
    CALL free_string(addr(local_1A))
    PROC_EXIT
    RETURN
    GOTO label_0255A
END SUB

SUB proc_22430  ' image &H22430, locals 36
    cx = 36
    CALL frame_enter()
    CALL RT_2732_241D()
    di = ax
    si = addr(local_E)
    CALL near_00E43()
    CALL RT_2732_6266(addr(local_E), 1, 2)
    CALL RT_2732_76EA(2)
    si = ax
    ' float_DD
    CALL RT_2F00_056C()
    local_10 = ax
    CALL RT_2732_6266(addr(local_E), 4, 2)
    di = ax
    si = addr(local_14)
    CALL near_00E43()
    ax = local_10
    local_16 = ax
    IF local_16 == 0 THEN GOTO label_02491
    GOTO label_02499
    local_10 = 12
    GOTO label_024A9
    IF local_16 > 12 THEN GOTO label_024A2
    GOTO label_024A9
    local_10 = local_10 + &HFFF4
    GOTO label_024A9
    local_18 = 0
    local_1A = 6
    CALL color_25283(addr(local_18), addr(local_1A))
    local_1C = 1
    local_1E = 75
    local_20 = 2
    CALL proc_25D42(addr(local_20), addr(local_10))
    di = ax
    si = addr(local_24)
    CALL near_00E43()
    di = &HBE94
    si = addr(local_24)
    CALL near_00E51()
    si = ax
    di = addr(local_14)
    CALL near_00E51()
    di = ax
    si = addr(local_28)
    CALL near_00E43()
    local_2A = 0
    CALL locate_print_21DEA(addr(local_1C), addr(local_1E), addr(local_28), addr(local_2A))
    CALL free_string(addr(local_28))
    local_2C = 7
    local_2E = 0
    CALL color_25283(addr(local_2C), addr(local_2E))
    CALL free_string(addr(local_24))
    CALL free_string(addr(local_14))
    CALL free_string(addr(local_E))
    PROC_EXIT
    RETURN
    GOTO label_025B5
END SUB

SUB proc_2255D  ' image &H2255D, locals 2
    cx = 2
    CALL frame_enter()
    CALL RT_2732_68ED()
    si = arg_A
    cx = 0
    IF ax < [si] THEN GOTO label_02575
    cx = cx - 1
    local_C = cx
    CALL RT_2732_68ED()
    si = arg_C
    cx = 0
    IF ax >= [si] THEN GOTO label_02588
    cx = cx - 1
    ' or cx,[bp-0xc]
    ' and cx,cx
    IF ax <> [si] THEN GOTO label_02592
    GOTO label_025A2
    CALL hit_any_key_to_continue_2434A()
    CALL proc_21194(arg_C, arg_A)
    CALL print_more_21DB9(arg_8, arg_6)
    PROC_EXIT
    RETURN
    GOTO label_03056
END SUB

SUB menu_choice_225B8  ' image &H225B8, locals 116
  ' strings: Unknown key was hit
    cx = 116
    CALL frame_enter()
    CALL left_mouse_button_is_24897()
    si = arg_6
    IF [si] == 1 THEN GOTO label_025D0
    GOTO label_025EA
    local_C = 11
    local_E = 0
    CALL color_25283(addr(local_C), addr(local_E))
    GOTO label_02601
    local_10 = 7
    local_12 = 0
    CALL color_25283(addr(local_10), addr(local_12))
    IF var_0050 <> 0 THEN GOTO label_0260B
    GOTO label_02625
    si = arg_A
    IF [si] == 0 THEN GOTO label_02616
    GOTO label_0261F
    var_0052 = 0
    GOTO label_02625
    var_0052 = 1
    si = arg_10
    ax = 80
    ax = ax - [si]
    CALL RT_2F00_0558()
    si = arg_12
    ax = [si]
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D9
    si = arg_E
    ax = 0
    IF [si] >= 1 THEN GOTO label_02658
    ax = ax - 1
    cx = 0
    IF [si] <= 25 THEN GOTO label_02661
    cx = cx - 1
    ' or cx,ax
    ' and cx,cx
    IF [si] <> 25 THEN GOTO label_0266A
    GOTO label_0267F
    si = arg_E
    [si] = 1
    ' float_D9
    ' float_D9
    GOTO label_0269D
    si = arg_E
    IF [si] < 24 THEN GOTO label_0268A
    GOTO label_02698
    si = arg_E
    ax = 24
    ax = ax - [si]
    local_1C = ax
    GOTO label_0269D
    local_1C = 1
    si = arg_12
    ax = [si]
    ' imul word [bp-0x1c]
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jc 0x26c5
    GOTO label_026D0
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D9
    ' float_D9
    si = arg_14
    ax = [si]
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ' jc 0x2708
    GOTO label_02718
    si = arg_14
    ax = [si]
    CALL RT_2F00_0558()
    ' float_D9
    ax = &H200F
    CALL RT_2732_7450()
    si = arg_8
    ax = 0
    IF [si] >= 1 THEN GOTO label_0272C
    ax = ax - 1
    di = arg_14
    cx = [di]
    dx = 0
    IF cx >= [si] THEN GOTO label_02739
    dx = dx - 1
    ' or dx,ax
    ' and dx,dx
    IF cx <> [si] THEN GOTO label_02742
    GOTO label_02749
    si = arg_8
    [si] = 1
    si = arg_8
    ax = [si]
    di = arg_14
    IF ax > [di] THEN GOTO label_02759
    GOTO label_02763
    si = arg_8
    di = arg_14
    ax = [di]
    [si] = ax
    si = arg_8
    IF [si] < 1 THEN GOTO label_0276E
    GOTO label_02775
    si = arg_8
    [si] = 1
    ' float_D9
    si = arg_8
    ax = [si]
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ' jc 0x278f
    GOTO label_027D3
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D9
    ' float_D9
    si = arg_8
    ax = [si]
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ' jc 0x2790
    ax = &H200F
    CALL RT_2732_7450()
    GOTO label_0282E
    ' float_D9
    si = arg_8
    ax = [si]
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF [si] > 1 THEN GOTO label_027ED
    GOTO label_0282E
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D9
    ' float_D9
    si = arg_8
    ax = [si]
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF [si] > 1 THEN GOTO label_027EE
    ax = &H200F
    CALL RT_2732_7450()
    si = arg_6
    IF [si] == 1 THEN GOTO label_02839
    GOTO label_02841
    CALL hit_any_key_to_continue_2434A()
    GOTO label_0300F
    si = arg_8
    ax = [si]
    CALL RT_2F00_0558()
    ' float_D8
    si = arg_12
    ax = [si]
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_D9
    si = arg_12
    si = arg_8
    ax = [si]
    PUSH long([si])
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_057D()
    CALL RT_2732_740E(DX, [si])
    CALL RT_2F00_0559()
    ' float_D9
    si = arg_E
    ax = [si]
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    local_32 = ax
    si = arg_10
    ax = [si]
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D8
    ' float_DE
    CALL RT_2F00_056C()
    local_34 = ax
    local_36 = 1
    local_38 = 7
    CALL color_25283(addr(local_36), addr(local_38))
    si = arg_8
    bx = arg_16
    CALL array_element([si], 1)
    di = bx
    si = addr(local_3C)
    CALL near_00E43()
    local_3E = 0
    CALL locate_print_21DEA(addr(local_32), addr(local_34), addr(local_3C), addr(local_3E))
    si = arg_8
    bx = arg_16
    CALL array_element([si], 1)
    si = bx
    di = addr(local_3C)
    CALL near_00E43()
    local_40 = 7
    local_42 = 0
    CALL color_25283(addr(local_40), addr(local_42))
    CALL proc_243D9()
    di = ax
    si = addr(local_46)
    CALL near_00E43()
    di = addr(local_46)
    si = addr(local_4A)
    CALL near_00E43()
    local_4C = 25
    local_4E = 1
    CALL RT_2732_62BC(80)
    di = ax
    si = addr(local_52)
    CALL near_00E43()
    local_54 = 0
    CALL locate_print_21DEA(addr(local_4C), addr(local_4E), addr(local_52), addr(local_54))
    CALL free_string(addr(local_52))
    si = arg_8
    bx = arg_16
    CALL array_element([si], 1)
    di = bx
    si = addr(local_58)
    CALL near_00E43()
    local_5A = 0
    CALL locate_print_21DEA(addr(local_32), addr(local_34), addr(local_58), addr(local_5A))
    si = arg_8
    bx = arg_16
    CALL array_element([si], 1)
    si = bx
    di = addr(local_58)
    CALL near_00E43()
    di = addr(local_4A)
    si = addr(local_5E)
    CALL near_00E43()
    ax = 48
    CALL RT_2732_63DF(DS, 48, 2)
    CALL RT_2732_6130(2, addr(local_5E))
    IF [si] <> 1 THEN GOTO label_02A09
    GOTO label_02A1B
    CALL RT_2732_6130(addr(local_5E), &HBEA6)
    IF [si] == 1 THEN GOTO label_02A1B
    GOTO label_02A28
    si = arg_12
    ax = [si]
    di = arg_8
    [di] = [di] - ax
    GOTO label_02DF8
    ax = 50
    CALL RT_2732_63DF(DS, 50, 2)
    CALL RT_2732_6130(2, addr(local_5E))
    IF [si] <> 1 THEN GOTO label_02A45
    GOTO label_02A57
    CALL RT_2732_6130(addr(local_5E), &HBEAC)
    IF [si] == 1 THEN GOTO label_02A57
    GOTO label_02A64
    si = arg_12
    ax = [si]
    di = arg_8
    [di] = [di] + ax
    GOTO label_02DF8
    ax = 52
    CALL RT_2732_63DF(DS, 52, 2)
    CALL RT_2732_6130(2, addr(local_5E))
    IF [si] <> 1 THEN GOTO label_02A81
    GOTO label_02AB0
    CALL RT_2732_6130(addr(local_5E), &HBEB2)
    IF [si] <> 1 THEN GOTO label_02A93
    GOTO label_02AB0
    ax = 70
    CALL RT_2732_63DF(DS, 70, 2)
    CALL RT_2732_6130(2, addr(local_5E))
    IF [si] == 1 THEN GOTO label_02AB0
    GOTO label_02AB8
    si = arg_8
    [si] = [si] - 1
    GOTO label_02DF8
    ax = 54
    CALL RT_2732_63DF(DS, 54, 2)
    CALL RT_2732_6130(2, addr(local_5E))
    IF [si] <> 1 THEN GOTO label_02AD5
    GOTO label_02B04
    CALL RT_2732_6130(addr(local_5E), &HBEB8)
    IF [si] <> 1 THEN GOTO label_02AE7
    GOTO label_02B04
    ax = 75
    CALL RT_2732_63DF(DS, 75, 1)
    CALL RT_2732_6130(1, addr(local_5E))
    IF [si] == 1 THEN GOTO label_02B04
    GOTO label_02B0C
    si = arg_8
    [si] = [si] + 1
    GOTO label_02DF8
    ax = 56
    CALL RT_2732_63DF(DS, 56, 2)
    CALL RT_2732_6130(2, addr(local_5E))
    IF [si] <> 1 THEN GOTO label_02B29
    GOTO label_02B3B
    CALL RT_2732_6130(addr(local_5E), &HBEBE)
    IF [si] == 1 THEN GOTO label_02B3B
    GOTO label_02B53
    si = arg_8
    ax = [si]
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    [si] = ax
    GOTO label_02DF8
    ax = 58
    CALL RT_2732_63DF(DS, 58, 2)
    CALL RT_2732_6130(2, addr(local_5E))
    IF [si] <> 1 THEN GOTO label_02B70
    GOTO label_02B82
    CALL RT_2732_6130(addr(local_5E), &HBEC4)
    IF [si] == 1 THEN GOTO label_02B82
    GOTO label_02B9A
    si = arg_8
    ax = [si]
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    [si] = ax
    GOTO label_02DF8
    ax = 60
    CALL RT_2732_63DF(DS, 60, 2)
    CALL RT_2732_6130(2, addr(local_5E))
    IF [si] <> 1 THEN GOTO label_02BB7
    GOTO label_02BC9
    CALL RT_2732_6130(addr(local_5E), &HBECA)
    IF [si] == 1 THEN GOTO label_02BC9
    GOTO label_02BD3
    si = arg_8
    [si] = 1
    GOTO label_02DF8
    ax = 62
    CALL RT_2732_63DF(DS, 62, 2)
    CALL RT_2732_6130(2, addr(local_5E))
    IF [si] <> 1 THEN GOTO label_02BF0
    GOTO label_02C02
    CALL RT_2732_6130(addr(local_5E), &HBED0)
    IF [si] == 1 THEN GOTO label_02C02
    GOTO label_02C0F
    si = arg_8
    di = arg_14
    ax = [di]
    [si] = ax
    GOTO label_02DF8
    ax = 72
    CALL RT_2732_63DF(DS, 72, 1)
    CALL RT_2732_6130(1, addr(local_5E))
    IF [si] == 1 THEN GOTO label_02C2C
    GOTO label_02C62
    si = arg_C
    IF [si] > 0 THEN GOTO label_02C37
    GOTO label_02C5C
    si = arg_8
    bx = arg_16
    CALL array_element([si], 1)
    si = arg_C
    CALL RT_2732_6266(BX, [si], 1)
    di = ax
    si = addr(local_4A)
    CALL near_00E43()
    GOTO label_02DFC
    GOTO label_02DF8
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_5E))
    IF [si] <> 0 THEN GOTO label_02C7F
    GOTO label_02C91
    CALL RT_2732_6130(addr(local_5E), &HBDDA)
    IF [si] == 0 THEN GOTO label_02C91
    GOTO label_02CAD
    ax = 74
    ax = addr(local_4A)
    PUSH DS
    PUSH 74
    PUSH 1
    PUSH DS
    PUSH addr(local_4A)
    ' xor ax,ax
    CALL RT_2732_6404(addr(local_4A))
    GOTO label_02DFC
    GOTO label_02DF8
    CALL RT_2732_6130(addr(local_4A), &HBE38)
    IF [si] <> 0 THEN GOTO label_02CBF
    GOTO label_02D27
    si = arg_C
    IF [si] == 0 THEN GOTO label_02CCA
    GOTO label_02D21
    di = "Unknown key was hit"
    si = addr(local_62)
    CALL near_00E43()
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    di = ax
    si = addr(local_66)
    CALL near_00E43()
    CALL proc_2311E(addr(local_62), addr(local_66))
    ax = addr(local_66)
    PUSH DS
    PUSH addr(local_66)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_66), DS, 79, 1)
    CALL free_string(addr(local_62))
    CALL free_string(addr(local_66))
    GOTO label_02D24
    GOTO label_02DFC
    GOTO label_02DF8
    ax = 0
    IF var_008E >= 0 THEN GOTO label_02D32
    ax = ax - 1
    si = arg_8
    cx = [si]
    di = arg_12
    dx = 0
    IF cx <= [di] THEN GOTO label_02D42
    dx = dx - 1
    ' and dx,ax
    ' and dx,dx
    IF cx <> [di] THEN GOTO label_02D4B
    GOTO label_02D58
    si = arg_12
    ax = [si]
    di = arg_8
    [di] = [di] - ax
    GOTO label_02D8B
    ax = 0
    IF var_008E <= 0 THEN GOTO label_02D63
    ax = ax - 1
    si = arg_14
    cx = [si]
    di = arg_12
    cx = cx - [di]
    si = arg_8
    dx = 0
    IF cx < [si] THEN GOTO label_02D78
    dx = dx - 1
    ' and dx,ax
    ' and dx,dx
    IF cx <> [si] THEN GOTO label_02D81
    GOTO label_02D8B
    si = arg_12
    ax = [si]
    di = arg_8
    [di] = [di] + ax
    ax = 0
    IF var_008C >= 0 THEN GOTO label_02D96
    ax = ax - 1
    ' float_D9
    ' float_D9
    bx = ax
    CALL RT_2F00_05B3()
    ax = 0
    IF var_008C <= 0 THEN GOTO label_02DAE
    ax = ax - 1
    ' and ax,bx
    ' and ax,ax
    IF var_008C <> 0 THEN GOTO label_02DB7
    GOTO label_02DBF
    si = arg_8
    [si] = [si] - 1
    GOTO label_02DF8
    ax = 0
    IF var_008C <= 0 THEN GOTO label_02DCA
    ax = ax - 1
    ' float_D9
    si = arg_12
    cx = [si]
    cx = cx - 1
    bx = ax
    ax = cx
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ax = 0
    IF var_008C <= 0 THEN GOTO label_02DEA
    ax = ax - 1
    ' and ax,bx
    ' and ax,ax
    IF var_008C <> 0 THEN GOTO label_02DF3
    GOTO label_02DF8
    si = arg_8
    [si] = [si] + 1
    GOTO label_0274A
    var_0052 = 0
    CALL RT_2732_7A66(130, var_BBB2, var_BBB0)
    di = addr(local_4A)
    si = addr(local_6A)
    CALL near_00E43()
    GOTO label_0300F
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jc 0x2e34
    GOTO label_02E3F
    ' float_D9
    ' float_D9
    ' float_D9
    si = arg_14
    ax = [si]
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ' jc 0x2e59
    GOTO label_02E69
    si = arg_14
    ax = [si]
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_D8
    ' float_D9
    ' float_D9
    si = arg_14
    ax = [si]
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ' jc 0x2e96
    GOTO label_02EA6
    si = arg_14
    ax = [si]
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    si = arg_14
    ax = [si]
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF var_008C > 0 THEN GOTO label_02EC0
    GOTO label_02F22
    si = arg_10
    ax = 80
    ax = ax - [si]
    CALL RT_2F00_0558()
    ' float_D9
    si = arg_E
    ax = [si]
    GOTO label_02F19
    ' float_D9
    CALL RT_2F00_056C()
    CALL RT_2732_62BC([si])
    di = ax
    si = addr(local_72)
    CALL near_00E43()
    local_74 = 0
    CALL locate_print_21DEA(addr(local_76), arg_10, addr(local_72), addr(local_74))
    CALL free_string(addr(local_72))
    ax = local_76
    ax = ax + 1
    local_76 = ax
    IF local_76 <= 23 THEN GOTO label_02EDC
    ' float_D9
    CALL RT_2F00_056C()
    local_78 = ax
    ' float_D9
    CALL RT_2F00_056C()
    GOTO label_02FFC
    si = arg_E
    ax = [si]
    CALL RT_2F00_0558()
    ax = local_76
    CALL RT_2F00_0558()
    ' float_D8
    si = arg_12
    ax = [si]
    CALL RT_2F00_0558()
    ' float_DE
    CALL RT_2F00_05DF()
    ' float_DE
    CALL RT_2F00_056C()
    local_32 = ax
    si = arg_10
    ax = [si]
    CALL RT_2F00_0558()
    si = arg_12
    ax = local_76
    PUSH long([si])
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_057D()
    CALL RT_2732_740E(DX, local_76)
    CALL RT_2F00_0559()
    ' float_D9
    ' float_DE
    ' float_DE
    CALL RT_2F00_056C()
    local_34 = ax
    bx = arg_16
    CALL array_element(local_76, 1)
    di = bx
    si = addr(local_7C)
    CALL near_00E43()
    local_7E = 0
    CALL locate_print_21DEA(addr(local_32), addr(local_34), addr(local_7C), addr(local_7E))
    bx = arg_16
    CALL array_element(local_76, 1)
    si = bx
    di = addr(local_7C)
    CALL near_00E43()
    ax = local_76
    ax = ax + 1
    local_76 = ax
    ax = local_78
    IF ax < local_76 THEN GOTO label_0300A
    GOTO label_02F3A
    CALL RT_2732_7473()
    CALL free_string(addr(local_7C))
    CALL free_string(addr(local_5E))
    CALL free_string(addr(local_58))
    CALL free_string(addr(local_46))
    CALL free_string(addr(local_3C))
    CALL free_string(addr(local_4A))
    CALL RT_2732_64F5(addr(local_6A))
    PROC_EXIT
    RETURN
    GOTO label_0311B
END SUB

SUB proc_23059  ' image &H23059, locals 20
    cx = 20
    CALL frame_enter()
    di = arg_6
    si = addr(local_E)
    CALL near_00E43()
    ' float_D9
    ' float_D9
    CALL RT_2732_6199(addr(local_E))
    local_14 = ax
    ax = 1
    GOTO label_030ED
    ax = 128
    ' cwd
    ' idiv word [bp-0x16]
    dx = dx + 128
    ax = dx
    CALL RT_2F00_0558()
    ' float_D9
    CALL RT_2732_6266(addr(local_E), local_16, 1)
    CALL RT_2732_61A9(1)
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D9
    ax = addr(local_E)
    PUSH DS
    PUSH addr(local_E)
    ' xor ax,ax
    ' float_D9
    PUSH addr(local_E)
    CALL RT_2F00_056C()
    CALL RT_2732_616F(addr(local_E))
    CALL RT_2732_650E(addr(local_E), 1, local_16)
    ax = local_16
    ax = ax + 1
    local_16 = ax
    ax = local_14
    IF ax >= local_16 THEN GOTO label_03088
    di = addr(local_E)
    si = addr(local_1E)
    CALL near_00E43()
    CALL free_string(addr(local_E))
    CALL RT_2732_64F5(addr(local_1E))
    PROC_EXIT
    RETURN
    GOTO label_031C5
END SUB

SUB proc_2311E  ' image &H2311E, locals 18
    cx = 18
    CALL frame_enter()
    ' float_D9
    CALL RT_2732_6199(arg_8)
    CALL RT_2F00_0558()
    ' float_D8
    ' float_DE
    CALL RT_2F00_056C()
    local_C = ax
    IF local_C < 1 THEN GOTO label_03151
    GOTO label_03156
    local_C = 1
    local_E = 15
    local_10 = 4
    CALL color_25283(addr(local_E), addr(local_10))
    di = arg_6
    si = arg_8
    CALL near_00E51()
    di = ax
    si = addr(local_14)
    CALL near_00E43()
    local_16 = 25
    local_18 = 0
    CALL locate_print_21DEA(addr(local_16), addr(local_C), addr(local_14), addr(local_18))
    local_1A = 7
    local_1C = 0
    CALL color_25283(addr(local_1A), addr(local_1C))
    CALL free_string(addr(local_14))
    PROC_EXIT
    RETURN
    GOTO label_031FD
END SUB

SUB proc_231C8  ' image &H231C8, locals 4
    cx = 4
    CALL frame_enter()
    CALL RT_2732_74E2()
    di = ax
    si = addr(local_E)
    CALL near_00E43()
    CALL RT_2732_6130(addr(local_E), &HBE38)
    IF ? <> ? THEN GOTO label_031D0
    CALL free_string(addr(local_E))
    PROC_EXIT
    RETURN
    GOTO label_03A03
END SUB

SUB invalid_key_was_hit_23200  ' image &H23200, locals 88
  ' strings: Invalid key was hit
    cx = 88
    CALL frame_enter()
    CALL proc_2600C()
    ' float_D9
    ' float_D9
    CALL RT_2732_6374(arg_C)
    di = ax
    si = arg_C
    CALL near_00E43()
    si = arg_10
    CALL RT_2732_62EF([si], 254)
    di = ax
    si = addr(local_12)
    CALL near_00E43()
    PUSH addr(local_12)
    CALL RT_2732_6199(arg_C)
    ax = ax + 1
    si = arg_10
    CALL RT_2732_6266(ax, [si])
    di = ax
    si = addr(local_12)
    CALL near_00E43()
    ' float_D9
    si = arg_10
    ax = [si]
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ' jc 0x3278
    GOTO label_0328B
    si = arg_10
    ax = [si]
    CALL RT_2F00_0558()
    ' float_D9
    GOTO label_032AB
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jc 0x32a0
    GOTO label_032AB
    ' float_D9
    ' float_D9
    local_14 = 15
    local_16 = 0
    CALL color_25283(addr(local_14), addr(local_16))
    di = &HBE42
    si = arg_E
    CALL near_00E51()
    di = ax
    si = addr(local_1A)
    CALL near_00E43()
    local_1C = 0
    CALL locate_print_21DEA(arg_14, arg_12, addr(local_1A), addr(local_1C))
    CALL free_string(addr(local_1A))
    local_1E = 14
    local_20 = 0
    CALL color_25283(addr(local_1E), addr(local_20))
    si = arg_8
    IF [si] == 1 THEN GOTO label_03316
    GOTO label_0334E
    CALL RT_2732_6199(arg_C)
    CALL RT_2732_62F7(addr(local_20), &HBEF6)
    di = ax
    si = addr(local_24)
    CALL near_00E43()
    local_26 = 0
    CALL print_more_21DB9(addr(local_24), addr(local_26))
    CALL free_string(addr(local_24))
    GOTO label_0335F
    local_28 = 0
    CALL print_more_21DB9(arg_C, addr(local_28))
    local_2A = 7
    local_2C = 0
    CALL color_25283(addr(local_2A), addr(local_2C))
    local_2E = 0
    CALL print_more_21DB9(addr(local_12), addr(local_2E))
    si = arg_12
    ax = [si]
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2732_6199(arg_E)
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D8
    CALL RT_2F00_056C()
    local_30 = ax
    CALL proc_253B3(arg_14, addr(local_30))
    CALL proc_243D9()
    di = ax
    si = addr(local_34)
    CALL near_00E43()
    di = addr(local_34)
    si = addr(local_38)
    CALL near_00E43()
    di = addr(local_38)
    si = addr(local_3C)
    CALL near_00E43()
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_3C))
    IF [si] == 1 THEN GOTO label_033FB
    GOTO label_03415
    si = arg_6
    IF [si] == 0 THEN GOTO label_03406
    GOTO label_0340F
    di = &HBE38
    si = arg_C
    CALL near_00E43()
    GOTO label_039C0
    GOTO label_039BD
    ax = 60
    CALL RT_2732_63DF(DS, 60, 2)
    CALL RT_2732_6130(2, addr(local_3C))
    IF [si] == 0 THEN GOTO label_03432
    GOTO label_03440
    ' float_D9
    ' float_D9
    GOTO label_039BD
    ax = 62
    CALL RT_2732_63DF(DS, 62, 2)
    CALL RT_2732_6130(2, addr(local_3C))
    IF [si] == 0 THEN GOTO label_0345D
    GOTO label_03473
    CALL RT_2732_6199(arg_C)
    CALL RT_2F00_0558()
    ' float_D9
    GOTO label_039BD
    ax = 54
    CALL RT_2732_63DF(DS, 54, 2)
    CALL RT_2732_6130(2, addr(local_3C))
    IF [si] == 0 THEN GOTO label_03490
    GOTO label_034EA
    ' float_D9
    si = arg_10
    ax = [si]
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF [si] > 0 THEN GOTO label_034AA
    GOTO label_034E7
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    CALL RT_2732_6199(arg_C)
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    ' jc 0x34d6
    GOTO label_034E7
    di = &HBE42
    si = arg_C
    CALL near_00E51()
    di = ax
    si = arg_C
    CALL near_00E43()
    GOTO label_039BD
    ax = 52
    CALL RT_2732_63DF(DS, 52, 2)
    CALL RT_2732_6130(2, addr(local_3C))
    IF [si] == 0 THEN GOTO label_03507
    GOTO label_0352E
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [si] > 0 THEN GOTO label_0351C
    GOTO label_0352B
    ' float_D9
    ' float_D8
    ' float_D9
    GOTO label_039BD
    ax = 68
    CALL RT_2732_63DF(DS, 68, 2)
    CALL RT_2732_6130(2, addr(local_3C))
    IF [si] <> 0 THEN GOTO label_0354B
    GOTO label_03568
    ax = 73
    CALL RT_2732_63DF(DS, 73, 1)
    CALL RT_2732_6130(1, addr(local_3C))
    IF [si] == 0 THEN GOTO label_03568
    GOTO label_036BB
    ax = 73
    CALL RT_2732_63DF(DS, 73, 1)
    CALL RT_2732_6130(1, addr(local_38))
    IF [si] == 0 THEN GOTO label_03585
    GOTO label_03594
    ' float_D9
    ' float_D8
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ' jnc 0x35a9
    GOTO label_036B8
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [si] == 0 THEN GOTO label_035C8
    GOTO label_035F2
    CALL RT_2732_6199(arg_C)
    ' or ax,ax
    IF [si] > 0 THEN GOTO label_035D7
    GOTO label_035EF
    CALL RT_2732_6266(arg_C, 2, &H7FFF)
    di = ax
    si = arg_C
    CALL near_00E43()
    GOTO label_036B8
    ' float_D9
    CALL RT_2732_6199(arg_C)
    ax = ax - 1
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF [si] == 0 THEN GOTO label_03610
    GOTO label_03631
    PUSH arg_C
    PUSH 1
    CALL RT_2732_6199(arg_C)
    ax = ax - 1
    CALL RT_2732_6266(ax)
    di = ax
    si = arg_C
    CALL near_00E43()
    GOTO label_036B8
    ' float_D9
    CALL RT_2732_6199(arg_C)
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF [si] > 0 THEN GOTO label_0364E
    GOTO label_036B8
    CALL RT_2732_6199(arg_C)
    IF ax == 1 THEN GOTO label_0365E
    GOTO label_0366A
    di = &HBE38
    si = arg_C
    CALL near_00E43()
    GOTO label_036B5
    ' float_D9
    PUSH arg_C
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_6266(1)
    ' float_D9
    ' float_D8
    bx = ax
    PUSH arg_C
    CALL RT_2F00_056C()
    local_42 = bx
    PUSH 1
    CALL RT_2732_6199(arg_C)
    CALL RT_2732_6266(1)
    di = ax
    si = local_42
    CALL near_00E51()
    di = ax
    si = arg_C
    CALL near_00E43()
    GOTO label_036B8
    GOTO label_039BD
    ax = 66
    CALL RT_2732_63DF(DS, 66, 2)
    CALL RT_2732_6130(2, addr(local_3C))
    IF ax == 1 THEN GOTO label_036D8
    GOTO label_0377D
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ax == 1 THEN GOTO label_036ED
    GOTO label_03715
    PUSH arg_C
    PUSH 1
    CALL RT_2732_6199(arg_C)
    CALL RT_2732_6266(1)
    di = ax
    si = &HBE42
    CALL near_00E51()
    di = ax
    si = arg_C
    CALL near_00E43()
    GOTO label_0377A
    CALL RT_2732_6199(arg_C)
    si = arg_10
    IF ax < [si] THEN GOTO label_03727
    GOTO label_0377A
    ' float_D9
    PUSH arg_C
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_6266(1)
    si = ax
    di = &HBE42
    CALL near_00E51()
    ' float_D9
    ' float_D8
    bx = ax
    PUSH arg_C
    CALL RT_2F00_056C()
    local_44 = bx
    PUSH 1
    CALL RT_2732_6199(arg_C)
    CALL RT_2732_6266(1)
    di = ax
    si = local_44
    CALL near_00E51()
    di = ax
    si = arg_C
    CALL near_00E43()
    GOTO label_039BD
    ax = 72
    CALL RT_2732_63DF(DS, 72, 1)
    CALL RT_2732_6130(1, addr(local_3C))
    IF ax == [si] THEN GOTO label_0379A
    GOTO label_037A0
    GOTO label_039C0
    GOTO label_039BD
    CALL RT_2732_6130(addr(local_38), &HBEFC)
    ax = 0
    ' jc 0x37b3
    ax = ax - 1
    bx = ax
    local_46 = bx
    CALL RT_2732_6130(addr(local_38), &HBEBE)
    ax = 0
    IF ax > [si] THEN GOTO label_037CB
    ax = ax - 1
    ' and ax,[bp-0x46]
    bx = ax
    local_48 = bx
    CALL RT_2732_6130(addr(local_38), &HBF02)
    ax = 0
    IF ax <> [si] THEN GOTO label_037E6
    ax = ax - 1
    ' or ax,[bp-0x48]
    si = arg_A
    cx = 0
    IF [si] <> 0 THEN GOTO label_037F5
    cx = cx - 1
    bx = ax
    local_4A = cx
    local_4C = bx
    CALL RT_2732_6130(addr(local_38), &HBE42)
    ax = 0
    ' jc 0x3810
    ax = ax - 1
    ' and ax,[bp-0x4a]
    bx = ax
    local_4E = bx
    CALL RT_2732_6130(addr(local_38), &HBF08)
    ax = 0
    IF [si] > 0 THEN GOTO label_0382B
    ax = ax - 1
    ' and ax,[bp-0x4e]
    ' or ax,[bp-0x4c]
    ' and ax,ax
    IF [si] <> 0 THEN GOTO label_03838
    GOTO label_038B8
    ' float_D9
    si = arg_10
    ax = [si]
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF [si] > 0 THEN GOTO label_03852
    GOTO label_038B5
    ' float_D9
    CALL RT_2732_6199(arg_C)
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF [si] > 0 THEN GOTO label_0386F
    GOTO label_03895
    PUSH DS
    PUSH arg_C
    ' xor ax,ax
    ' float_D9
    ' float_D8
    PUSH [si]
    PUSH addr(local_38)
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_650E(1)
    GOTO label_038A6
    di = addr(local_38)
    si = arg_C
    CALL near_00E51()
    di = ax
    si = arg_C
    CALL near_00E43()
    ' float_D9
    ' float_D8
    ' float_D9
    GOTO label_039BD
    si = arg_6
    ax = 0
    IF [si] <> 1 THEN GOTO label_038C4
    ax = ax - 1
    bx = ax
    ax = 48
    local_50 = bx
    CALL RT_2732_63DF(DS, 48, 2)
    CALL RT_2732_6130(2, addr(local_38))
    ax = 0
    IF [si] <> 1 THEN GOTO label_038E7
    ax = ax - 1
    bx = ax
    ax = 50
    local_52 = bx
    CALL RT_2732_63DF(DS, 50, 2)
    CALL RT_2732_6130(2, addr(local_38))
    ax = 0
    IF [si] <> 1 THEN GOTO label_0390A
    ax = ax - 1
    ' or ax,[bp-0x52]
    bx = ax
    ax = 75
    local_54 = bx
    CALL RT_2732_63DF(DS, 75, 1)
    CALL RT_2732_6130(1, addr(local_38))
    ax = 0
    IF [si] <> 1 THEN GOTO label_03930
    ax = ax - 1
    ' or ax,[bp-0x54]
    bx = ax
    ax = 70
    local_56 = bx
    CALL RT_2732_63DF(DS, 70, 2)
    CALL RT_2732_6130(2, addr(local_38))
    ax = 0
    IF [si] <> 1 THEN GOTO label_03956
    ax = ax - 1
    ' or ax,[bp-0x56]
    ' and ax,[bp-0x50]
    ' and ax,ax
    IF [si] <> 1 THEN GOTO label_03963
    GOTO label_03969
    GOTO label_039C0
    GOTO label_039BD
    di = "Invalid key was hit"
    si = addr(local_5A)
    CALL near_00E43()
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    di = ax
    si = addr(local_5E)
    CALL near_00E43()
    CALL proc_2311E(addr(local_5A), addr(local_5E))
    ax = addr(local_5E)
    PUSH DS
    PUSH addr(local_5E)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_5E), DS, 79, 1)
    CALL free_string(addr(local_5A))
    CALL free_string(addr(local_5E))
    GOTO label_03228
    CALL proc_25FE5()
    di = addr(local_38)
    si = addr(local_62)
    CALL near_00E43()
    CALL free_string(addr(local_3C))
    CALL free_string(addr(local_34))
    CALL free_string(addr(local_38))
    CALL free_string(addr(local_12))
    CALL RT_2732_64F5(addr(local_62))
    PROC_EXIT
    RETURN
    GOTO label_04256
END SUB

SUB number_must_be_between_23A06  ' image &H23A06, locals 136
  ' strings: NUMBER MUST BE BETWEEN  |  AND 
    cx = 136
    CALL frame_enter()
    si = arg_A
    ax = [si]
    local_C = ax
    ax = 1
    GOTO label_03BB1
    bx = arg_C
    CALL array_element(local_E, 1)
    bx = bx + 27
    CALL RT_2732_63DF(ES, BX, 70)
    CALL RT_2732_6374(70)
    di = ax
    si = addr(local_12)
    CALL near_00E43()
    bx = arg_C
    CALL array_element(local_E, 1)
    bx = bx + 97
    ax = [es:bx]
    dx = ax
    local_14 = dx
    CALL RT_2732_6199(addr(local_12))
    ax = ax - local_14
    ax = -ax
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? > ? THEN GOTO label_03A8F
    GOTO label_03AB1
    ' float_D9
    CALL RT_2F00_056C()
    CALL RT_2732_62BC(ax)
    di = ax
    si = addr(local_12)
    CALL near_00E51()
    di = ax
    si = addr(local_1C)
    CALL near_00E43()
    GOTO label_03ABA
    di = addr(local_12)
    si = addr(local_1C)
    CALL near_00E43()
    local_1E = 9
    local_20 = 0
    CALL color_25283(addr(local_1E), addr(local_20))
    bx = arg_C
    CALL array_element(local_E, 1)
    bx = bx + 23
    ax = [es:bx]
    local_22 = ax
    bx = arg_C
    CALL array_element(local_E, 1)
    bx = bx + 25
    ax = [es:bx]
    local_24 = ax
    bx = arg_C
    CALL array_element(local_E, 1)
    CALL RT_2732_63DF(ES, BX, 23)
    CALL RT_2732_6374(23)
    si = ax
    di = &HBE42
    CALL near_00E51()
    di = ax
    si = addr(local_28)
    CALL near_00E43()
    local_2A = 0
    CALL locate_print_21DEA(addr(local_22), addr(local_24), addr(local_28), addr(local_2A))
    bx = arg_C
    CALL array_element(local_E, 1)
    bx = bx + 25
    ax = local_24
    [es:bx] = ax
    bx = arg_C
    CALL array_element(local_E, 1)
    bx = bx + 23
    ax = local_22
    [es:bx] = ax
    CALL free_string(addr(local_28))
    local_2C = 12
    local_2E = 0
    CALL color_25283(addr(local_2C), addr(local_2E))
    local_30 = 0
    CALL print_more_21DB9(addr(local_1C), addr(local_30))
    ax = local_E
    ax = ax + 1
    local_E = ax
    ax = local_C
    IF ax < local_E THEN GOTO label_03BBF
    GOTO label_03A1C
    si = arg_6
    IF [si] == 1 THEN GOTO label_03BCA
    GOTO label_03BCD
    GOTO label_04206
    si = arg_8
    ax = 0
    IF [si] >= 1 THEN GOTO label_03BD9
    ax = ax - 1
    di = arg_A
    cx = [di]
    dx = 0
    IF cx >= [si] THEN GOTO label_03BE6
    dx = dx - 1
    ' or dx,ax
    ' and dx,dx
    IF cx <> [si] THEN GOTO label_03BEF
    GOTO label_03BF6
    si = arg_8
    [si] = 1
    si = arg_8
    ax = 0
    IF [si] <= 0 THEN GOTO label_03C02
    ax = ax - 1
    di = arg_A
    cx = [di]
    dx = 0
    IF cx < [si] THEN GOTO label_03C0F
    dx = dx - 1
    ' and dx,ax
    ' and dx,dx
    IF cx <> [si] THEN GOTO label_03C18
    GOTO label_04206
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 113
    CALL RT_2732_63DF(ES, BX, 80)
    CALL RT_2732_6374(80)
    di = ax
    si = addr(local_34)
    CALL near_00E43()
    CALL proc_24259(addr(local_34))
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 23
    ax = [es:bx]
    local_36 = ax
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 25
    ax = [es:bx]
    local_38 = ax
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 97
    ax = [es:bx]
    local_3A = ax
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    CALL RT_2732_63DF(ES, BX, 23)
    CALL RT_2732_6374(23)
    di = ax
    si = addr(local_3E)
    CALL near_00E43()
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 27
    CALL RT_2732_63DF(ES, BX, 70)
    CALL RT_2732_6374(70)
    di = ax
    si = addr(local_42)
    CALL near_00E43()
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 97
    ax = [es:bx]
    dx = ax
    local_44 = dx
    CALL RT_2732_6199(addr(local_42))
    ax = ax - local_44
    ax = -ax
    CALL RT_2F00_0558()
    ' float_D9
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 99
    ax = [es:bx]
    local_46 = ax
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF cx > [si] THEN GOTO label_03D57
    GOTO label_03D79
    ' float_D9
    CALL RT_2F00_056C()
    CALL RT_2732_62BC([es:bx])
    di = ax
    si = addr(local_42)
    CALL near_00E51()
    di = ax
    si = addr(local_1C)
    CALL near_00E43()
    GOTO label_03D82
    di = addr(local_42)
    si = addr(local_1C)
    CALL near_00E43()
    local_48 = 0
    local_4A = 1
    CALL invalid_key_was_hit_23200(addr(local_36), addr(local_38), addr(local_3A), addr(local_3E), addr(local_42), addr(local_46), addr(local_48), addr(local_4A))
    di = ax
    si = addr(local_4E)
    CALL near_00E43()
    di = addr(local_4E)
    si = addr(local_52)
    CALL near_00E43()
    ax = addr(local_42)
    PUSH DS
    PUSH addr(local_42)
    ' xor ax,ax
    si = arg_8
    bx = arg_C
    CALL array_element(addr(local_42), [si], 1)
    bx = bx + 27
    CALL RT_2732_6404(ES, BX, 70)
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 97
    ax = [es:bx]
    dx = ax
    local_54 = dx
    CALL RT_2732_6199(addr(local_42))
    ax = ax - local_54
    ax = -ax
    CALL RT_2F00_0558()
    ' float_D9
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_52))
    IF cx <> [si] THEN GOTO label_03E3B
    GOTO label_03E7B
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF cx > [si] THEN GOTO label_03E50
    GOTO label_03E72
    ' float_D9
    CALL RT_2F00_056C()
    CALL RT_2732_62BC(addr(local_52))
    di = ax
    si = addr(local_42)
    CALL near_00E51()
    di = ax
    si = addr(local_1C)
    CALL near_00E43()
    GOTO label_03E7B
    di = addr(local_42)
    si = addr(local_1C)
    CALL near_00E43()
    local_56 = 9
    local_58 = 0
    CALL color_25283(addr(local_56), addr(local_58))
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 23
    ax = [es:bx]
    local_5A = ax
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 25
    ax = [es:bx]
    local_5C = ax
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    CALL RT_2732_63DF(ES, BX, 23)
    CALL RT_2732_6374(23)
    si = ax
    di = &HBE42
    CALL near_00E51()
    di = ax
    si = addr(local_60)
    CALL near_00E43()
    local_62 = 0
    CALL locate_print_21DEA(addr(local_5A), addr(local_5C), addr(local_60), addr(local_62))
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 25
    ax = local_5C
    [es:bx] = ax
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 23
    ax = local_5A
    [es:bx] = ax
    CALL free_string(addr(local_60))
    local_64 = 12
    local_66 = 0
    CALL color_25283(addr(local_64), addr(local_66))
    local_68 = 0
    CALL print_more_21DB9(addr(local_1C), addr(local_68))
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_52))
    IF cx == [si] THEN GOTO label_03F95
    GOTO label_03FD9
    local_6A = 24
    local_6C = 1
    CALL RT_2732_62BC(80)
    di = ax
    si = addr(local_70)
    CALL near_00E43()
    local_72 = 0
    CALL locate_print_21DEA(addr(local_6A), addr(local_6C), addr(local_70), addr(local_72))
    CALL free_string(addr(local_70))
    GOTO label_04206
    GOTO label_041BC
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 99
    si = bx
    IF ax == [es:bx] THEN GOTO label_03FF7
    GOTO label_04162
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 27
    CALL RT_2732_63DF(ES, BX, 70)
    CALL RT_2732_76EA(70)
    si = ax
    ' float_DD
    ' float_D9
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 101
    ax = [es:bx]
    dx = [es:bx+0x2]
    CALL RT_2F00_0559()
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    ' jnc 0x4058
    ax = ax - 1
    bx = ax
    dx = bx
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 105
    local_78 = dx
    ax = [es:bx]
    dx = [es:bx+0x2]
    CALL RT_2F00_0559()
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF ax <= [es:bx] THEN GOTO label_0408D
    ax = ax - 1
    ' or ax,[bp-0x78]
    ' and ax,ax
    IF ax <> [es:bx] THEN GOTO label_04097
    GOTO label_0412E
    si = arg_8
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 101
    CALL RT_2732_63C3([es:bx+0x2], [es:bx])
    di = ax
    si = "NUMBER MUST BE BETWEEN "
    CALL near_00E51()
    si = ax
    di = " AND "
    CALL near_00E51()
    si = arg_8
    bx = ax
    dx = bx
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 105
    local_7A = dx
    CALL RT_2732_63C3([es:bx+0x2], [es:bx])
    di = ax
    si = local_7A
    CALL near_00E51()
    di = ax
    si = addr(local_7E)
    CALL near_00E43()
    CALL RT_2732_616F(7)
    di = ax
    si = addr(local_82)
    CALL near_00E43()
    CALL proc_2311E(addr(local_7E), addr(local_82))
    CALL free_string(addr(local_82))
    GOTO label_041BC
    GOTO label_04162
    ' float_D9
    CALL RT_2F00_057D()
    si = arg_8
    local_84 = dx
    local_86 = ax
    bx = arg_C
    CALL array_element([si], 1)
    bx = bx + 109
    ax = local_86
    dx = local_84
    [es:bx] = ax
    [es:bx+0x2] = dx
    ax = 48
    CALL RT_2732_63DF(DS, 48, 2)
    CALL RT_2732_6130(2, addr(local_52))
    ax = 0
    IF ax <> [es:bx] THEN GOTO label_04180
    ax = ax - 1
    bx = ax
    ax = 70
    local_88 = bx
    CALL RT_2732_63DF(DS, 70, 2)
    CALL RT_2732_6130(2, addr(local_52))
    ax = 0
    IF ax <> [es:bx] THEN GOTO label_041A4
    ax = ax - 1
    ' or ax,[bp-0x88]
    ' and ax,ax
    IF ax <> [es:bx] THEN GOTO label_041AF
    GOTO label_041B7
    si = arg_8
    [si] = [si] - 1
    GOTO label_041BC
    si = arg_8
    [si] = [si] + 1
    local_8A = 24
    local_8C = 1
    CALL RT_2732_62BC(80)
    di = ax
    si = addr(local_90)
    CALL near_00E43()
    local_92 = 0
    CALL locate_print_21DEA(addr(local_8A), addr(local_8C), addr(local_90), addr(local_92))
    CALL free_string(addr(local_90))
    GOTO label_03BF6
    CALL free_string(addr(local_4E))
    CALL free_string(addr(local_52))
    CALL free_string(addr(local_1C))
    CALL free_string(addr(local_42))
    CALL free_string(addr(local_34))
    CALL free_string(addr(local_12))
    CALL free_string(addr(local_7E))
    CALL free_string(addr(local_3E))
    PROC_EXIT
    RETURN
    GOTO label_04347
END SUB

SUB proc_24259  ' image &H24259, locals 32
    cx = 32
    CALL frame_enter()
    ' float_D9
    CALL RT_2732_6199(arg_6)
    CALL RT_2F00_0558()
    ' float_D8
    ' float_DE
    CALL RT_2F00_056C()
    local_C = ax
    IF local_C < 1 THEN GOTO label_0428C
    GOTO label_04291
    local_C = 1
    local_E = 15
    local_10 = 5
    CALL color_25283(addr(local_E), addr(local_10))
    di = addr(local_14)
    si = arg_6
    CALL near_00E51()
    di = ax
    si = addr(local_18)
    CALL near_00E43()
    local_1A = 24
    local_1C = 1
    CALL RT_2732_62BC(80)
    di = ax
    si = addr(local_20)
    CALL near_00E43()
    local_22 = 0
    CALL locate_print_21DEA(addr(local_1A), addr(local_1C), addr(local_20), addr(local_22))
    CALL free_string(addr(local_20))
    local_24 = 24
    local_26 = 0
    CALL locate_print_21DEA(addr(local_24), addr(local_C), addr(local_18), addr(local_26))
    local_28 = 7
    local_2A = 0
    CALL color_25283(addr(local_28), addr(local_2A))
    CALL free_string(addr(local_18))
    CALL free_string(addr(local_14))
    PROC_EXIT
    RETURN
    GOTO label_043D6
END SUB

SUB hit_any_key_to_continue_2434A  ' image &H2434A, locals 16
  ' strings: Hit any key to continue
    cx = 16
    CALL frame_enter()
    CALL proc_231C8()
    CALL proc_231C8()
    CALL proc_231C8()
    CALL proc_231C8()
    di = "Hit any key to continue"
    si = addr(local_E)
    CALL near_00E43()
    di = &HBE38
    si = addr(local_12)
    CALL near_00E43()
    CALL proc_2311E(addr(local_E), addr(local_12))
    CALL free_string(addr(local_E))
    CALL free_string(addr(local_12))
    CALL proc_243D9()
    di = ax
    si = addr(local_16)
    CALL near_00E43()
    di = addr(local_16)
    si = addr(local_1A)
    CALL near_00E43()
    CALL RT_2732_6130(addr(local_1A), &HBE38)
    IF ? == ? THEN GOTO label_04366
    CALL free_string(addr(local_16))
    CALL free_string(addr(local_1A))
    PROC_EXIT
    RETURN
    GOTO label_045DA
END SUB

SUB proc_243D9  ' image &H243D9, locals 20
  ' strings:   
    cx = 20
    CALL frame_enter()
    IF var_0060 > 0 THEN GOTO label_043EB
    GOTO label_043F0
    CALL proc_25CF7()
    IF var_0066 == 1 THEN GOTO label_043FA
    GOTO label_04410
    var_006A = 2
    var_0068 = 2
    CALL proc_24C43()
    CALL proc_249CF()
    var_008C = 0
    var_008E = 0
    var_006E = 0
    var_006C = 0
    ax = 0
    IF var_0052 <> 1 THEN GOTO label_04433
    ax = ax - 1
    bx = ax
    ' xor ax,ax
    local_C = bx
    CALL RT_2732_2B38(ax)
    cx = 0
    IF ax > 6 THEN GOTO label_04449
    cx = cx - 1
    ' and cx,[bp-0xc]
    ' and cx,cx
    IF ax <> 6 THEN GOTO label_04453
    GOTO label_04458
    CALL mnt120_24D5C()
    IF var_0066 == 1 THEN GOTO label_04462
    GOTO label_04467
    CALL proc_249CF()
    CALL RT_2732_74E2()
    CALL RT_2732_6333(ax)
    di = ax
    si = addr(local_10)
    CALL near_00E43()
    CALL RT_2732_6130(addr(local_10), &HBE38)
    ax = 0
    IF var_0066 <> 1 THEN GOTO label_0448D
    ax = ax - 1
    cx = 0
    IF var_008C <> 0 THEN GOTO label_04498
    cx = cx - 1
    ' and cx,ax
    ax = 0
    IF var_008E <> 0 THEN GOTO label_044A5
    ax = ax - 1
    ' and ax,cx
    cx = 0
    IF var_006E <> 0 THEN GOTO label_044B2
    cx = cx - 1
    ' and cx,ax
    ax = 0
    IF var_006C <> 0 THEN GOTO label_044BF
    ax = ax - 1
    ' and ax,cx
    ' and ax,ax
    IF var_006C == 0 THEN GOTO label_044C8
    GOTO label_04428
    CALL RT_2732_6130(addr(local_10), &HBE38)
    IF var_006C == 0 THEN GOTO label_044DA
    GOTO label_04579
    ax = 112
    CALL RT_2732_63DF(DS, 112, 2)
    CALL RT_2732_6130(2, "  ")
    ax = 0
    IF var_006C == 0 THEN GOTO label_044F8
    ax = ax - 1
    cx = 0
    IF var_006C <> 1 THEN GOTO label_04503
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_006C <> 1 THEN GOTO label_0450C
    GOTO label_0452B
    ax = 112
    CALL RT_2732_63DF(DS, 112, 2)
    CALL RT_2732_6374(2)
    di = ax
    si = addr(local_10)
    CALL near_00E43()
    GOTO label_04579
    ax = 114
    CALL RT_2732_63DF(DS, 114, 2)
    CALL RT_2732_6130(2, "  ")
    ax = 0
    IF var_006C == 1 THEN GOTO label_04549
    ax = ax - 1
    cx = 0
    IF var_006E <> 1 THEN GOTO label_04554
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF var_006E <> 1 THEN GOTO label_0455D
    GOTO label_04579
    ax = 114
    CALL RT_2732_63DF(DS, 114, 2)
    CALL RT_2732_6374(2)
    di = ax
    si = addr(local_10)
    CALL near_00E43()
    local_12 = 25
    local_14 = 1
    CALL RT_2732_62BC(79)
    di = ax
    si = addr(local_18)
    CALL near_00E43()
    local_1A = 0
    CALL locate_print_21DEA(addr(local_12), addr(local_14), addr(local_18), addr(local_1A))
    CALL free_string(addr(local_18))
    di = addr(local_10)
    si = addr(local_1E)
    CALL near_00E43()
    CALL free_string(addr(local_10))
    CALL RT_2732_64F5(addr(local_1E))
    PROC_EXIT
    RETURN
    GOTO label_0482B
END SUB

SUB proc_245DD  ' image &H245DD, locals 44
    cx = 44
    CALL frame_enter()
    CALL RT_2732_6199(arg_8)
    local_C = ax
    ax = 1
    GOTO label_04672
    CALL RT_2732_6266(arg_8, local_E, 1)
    di = ax
    si = addr(local_12)
    CALL near_00E43()
    CALL RT_2732_6130(addr(local_12), &HBE42)
    ax = 0
    IF ? == ? THEN GOTO label_04620
    ax = ax - 1
    bx = ax
    local_14 = bx
    CALL RT_2732_6130(addr(local_12), &HBEF6)
    ax = 0
    IF ? == ? THEN GOTO label_04638
    ax = ax - 1
    ' and ax,[bp-0x14]
    bx = ax
    local_16 = bx
    CALL RT_2732_6130(addr(local_12), &HBF68)
    ax = 0
    IF ? == ? THEN GOTO label_04653
    ax = ax - 1
    ' and ax,[bp-0x16]
    ' and ax,ax
    IF ? <> ? THEN GOTO label_0465D
    GOTO label_0466E
    di = addr(local_12)
    si = addr(local_1A)
    CALL near_00E51()
    di = ax
    si = addr(local_1A)
    CALL near_00E43()
    ax = local_E
    ax = ax + 1
    local_E = ax
    ax = local_C
    IF ax < local_E THEN GOTO label_04680
    GOTO label_045F6
    di = addr(local_1A)
    si = addr(local_1E)
    CALL near_00E43()
    CALL RT_2732_6130(arg_6, &HBE38)
    IF ax <> local_E THEN GOTO label_0469A
    GOTO label_047E4
    CALL RT_2732_6199(arg_6)
    IF ax > 3 THEN GOTO label_046AA
    GOTO label_046C2
    CALL RT_2732_6266(arg_6, 1, 3)
    di = ax
    si = arg_6
    CALL near_00E43()
    CALL RT_2732_02F6()
    CALL RT_2F00_0558()
    ' float_D9
    di = &HBEF6
    si = addr(local_1E)
    CALL near_00E51()
    si = ax
    di = arg_6
    CALL near_00E51()
    di = ax
    si = addr(local_26)
    CALL near_00E43()
    var_0058 = 0
    ax = 79
    CALL RT_2732_655C(CS, 79)
    ' float_D9
    PUSH addr(local_26)
    CALL RT_2F00_056C()
    CALL open_random(addr(local_26), &HFFFF, &H1001)
    ax = &HFFFF
    CALL RT_2732_655C(CS, &HFFFF)
    IF var_0058 <> 0 THEN GOTO label_0472A
    GOTO label_0472D
    GOTO label_047E4
    ' float_D9
    CALL RT_2F00_056C()
    CLOSE #&HFFFF
    ' float_D9
    ' float_D8
    ' float_D9
    CALL RT_2732_69C8(local_28, local_2A)
    CALL RT_2732_6371(1)
    CALL RT_2732_6374(1)
    di = ax
    si = addr(local_2E)
    CALL near_00E43()
    CALL RT_2732_6199(addr(local_2E))
    ax = ax - 8
    ax = -ax
    CALL RT_2F00_0558()
    ' float_D9
    ' float_D9
    CALL RT_2732_6199(addr(local_1A))
    CALL RT_2F00_0558()
    CALL RT_2F00_05B3()
    IF var_0058 <= 0 THEN GOTO label_047A5
    GOTO label_047B9
    di = addr(local_2E)
    si = addr(local_1A)
    CALL near_00E51()
    di = ax
    si = addr(local_1E)
    CALL near_00E43()
    GOTO label_047E0
    ' float_D9
    PUSH addr(local_1A)
    PUSH 1
    CALL RT_2F00_056C()
    CALL RT_2732_6266(1)
    si = ax
    di = addr(local_2E)
    CALL near_00E51()
    di = ax
    si = addr(local_1E)
    CALL near_00E43()
    GOTO label_046D2
    di = addr(local_1E)
    si = addr(local_36)
    CALL near_00E43()
    CALL free_string(addr(local_26))
    CALL free_string(addr(local_1A))
    CALL free_string(addr(local_12))
    CALL free_string(addr(local_2E))
    CALL free_string(addr(local_1E))
    CALL RT_2732_64F5(addr(local_36))
    PROC_EXIT
    RETURN
    GOTO label_04894
END SUB

SUB proc_2482E  ' image &H2482E, locals 42
    cx = 42
    CALL frame_enter()
    si = arg_C
    ax = [si]
    local_1E = ax
    si = arg_A
    ax = [si]
    local_1C = ax
    si = arg_8
    ax = [si]
    local_1A = ax
    si = arg_6
    ax = [si]
    local_18 = ax
    local_34 = 51
    CALL RT_324D_000D(addr(local_34), addr(local_1E), addr(local_32))
    si = arg_C
    ax = local_32
    [si] = ax
    si = arg_A
    ax = local_30
    [si] = ax
    si = arg_8
    ax = local_2E
    [si] = ax
    si = arg_6
    ax = local_2C
    [si] = ax
    PROC_EXIT
    RETURN
    GOTO label_049CC
END SUB

SUB left_mouse_button_is_24897  ' image &H24897, locals 14
  ' strings: LEFT MOUSE BUTTON IS  | RIGHT MOUSE BUTTON IS  | ; 
    cx = 14
    CALL frame_enter()
    IF var_008A == 1 THEN GOTO label_048A9
    GOTO label_049A9
    ax = 116
    CALL RT_2732_63DF(DS, 116, 10)
    PUSH 10
    CALL RT_2732_62BC(10)
    CALL RT_2732_6130(10)
    IF var_008A <> 1 THEN GOTO label_048CC
    GOTO label_048F0
    ax = 116
    CALL RT_2732_63DF(DS, 116, 10)
    CALL RT_2732_6374(10)
    di = ax
    si = "LEFT MOUSE BUTTON IS "
    CALL near_00E51()
    di = ax
    si = addr(local_E)
    CALL near_00E43()
    ax = 126
    CALL RT_2732_63DF(DS, 126, 10)
    PUSH 10
    CALL RT_2732_62BC(10)
    CALL RT_2732_6130(10)
    IF var_008A <> 1 THEN GOTO label_04913
    GOTO label_0495A
    ax = 126
    CALL RT_2732_63DF(DS, 126, 10)
    CALL RT_2732_6374(10)
    di = ax
    si = "RIGHT MOUSE BUTTON IS "
    CALL near_00E51()
    di = ax
    si = addr(local_12)
    CALL near_00E43()
    CALL RT_2732_6130(addr(local_E), &HBE38)
    IF var_008A <> 1 THEN GOTO label_04949
    GOTO label_0495A
    di = addr(local_12)
    si = "; "
    CALL near_00E51()
    di = ax
    si = addr(local_12)
    CALL near_00E43()
    CALL RT_2732_6130(addr(local_E), &HBE38)
    ax = 0
    IF var_008A == 1 THEN GOTO label_0496D
    ax = ax - 1
    bx = ax
    local_14 = bx
    CALL RT_2732_6130(addr(local_12), &HBE38)
    ax = 0
    IF var_008A == 1 THEN GOTO label_04985
    ax = ax - 1
    ' and ax,[bp-0x14]
    ' and ax,ax
    IF var_008A <> 1 THEN GOTO label_0498F
    GOTO label_049A9
    di = addr(local_12)
    si = addr(local_E)
    CALL near_00E51()
    di = ax
    si = addr(local_18)
    CALL near_00E43()
    CALL proc_24259(addr(local_18))
    CALL free_string(addr(local_18))
    CALL free_string(addr(local_E))
    CALL free_string(addr(local_12))
    PROC_EXIT
    RETURN
    GOTO label_04B02
END SUB

SUB proc_249CF  ' image &H249CF, locals 8
    cx = 8
    CALL frame_enter()
    local_C = 5
    local_E = 0
    var_006A = 0
    var_0068 = 0
    CALL proc_2482E(addr(local_C), addr(local_E), 104, 106)
    IF local_E > 0 THEN GOTO label_04A0B
    GOTO label_04A14
    var_006C = 1
    GOTO label_04A4D
    ax = 0
    IF var_0088 <> 1 THEN GOTO label_04A1F
    ax = ax - 1
    cx = 0
    IF local_C <> 1 THEN GOTO label_04A29
    cx = cx - 1
    dx = 0
    IF local_C <> 3 THEN GOTO label_04A33
    dx = dx - 1
    ' or dx,cx
    ' and dx,ax
    ' and dx,dx
    IF local_C <> 3 THEN GOTO label_04A3E
    GOTO label_04A47
    var_006C = 1
    GOTO label_04A4D
    var_006C = 0
    local_C = 5
    local_E = 1
    local_10 = 0
    local_12 = 0
    CALL proc_2482E(addr(local_C), addr(local_E), addr(local_10), addr(local_12))
    IF local_E > 0 THEN GOTO label_04A7F
    GOTO label_04A88
    var_006E = 1
    GOTO label_04AC1
    ax = 0
    IF var_0088 <> 1 THEN GOTO label_04A93
    ax = ax - 1
    cx = 0
    IF local_C <> 2 THEN GOTO label_04A9D
    cx = cx - 1
    dx = 0
    IF local_C <> 3 THEN GOTO label_04AA7
    dx = dx - 1
    ' or dx,cx
    ' and dx,ax
    ' and dx,dx
    IF local_C <> 3 THEN GOTO label_04AB2
    GOTO label_04ABB
    var_006E = 1
    GOTO label_04AC1
    var_006E = 0
    IF var_0090 == 0 THEN GOTO label_04ACB
    GOTO label_04AF5
    ax = var_0068
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    var_0068 = ax
    ax = var_006A
    CALL RT_2F00_0558()
    ' float_D8
    CALL RT_2F00_056C()
    var_006A = ax
    CALL RT_20E1_3D49()
    PROC_EXIT
    RETURN
    GOTO label_04B56
END SUB

SUB proc_24B05  ' image &H24B05, locals 8
    cx = 8
    CALL frame_enter()
    local_C = 0
    local_E = 0
    local_10 = 0
    local_12 = 0
    CALL proc_2482E(addr(local_C), addr(local_E), addr(local_10), addr(local_12))
    IF local_C <> 0 THEN GOTO label_04B3F
    GOTO label_04B48
    var_0064 = 1
    GOTO label_04B4E
    var_0064 = 0
    PROC_EXIT
    RETURN
    GOTO label_04C40
    cx = 0
    CALL RT_2732_3F23()
    var_1694 = 0
    var_1696 = 0
    var_1698 = 11
    var_169A = 0
    CALL proc_2482E(&H1698, &H169A, &H1696, &H1694)
    ax = var_1694
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D9
    ax = var_1696
    CALL RT_2F00_0558()
    ' float_D8
    ' float_D9
    IF var_0090 == 0 THEN GOTO label_04BC0
    GOTO label_04BF5
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    var_008E = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    CALL RT_2F00_056C()
    var_008C = ax
    GOTO label_04C01
    ax = var_1694
    var_008E = ax
    ax = var_1696
    var_008C = ax
    ax = 0
    IF var_008E == 0 THEN GOTO label_04C0C
    ax = ax - 1
    cx = 0
    IF var_008C == 0 THEN GOTO label_04C17
    cx = cx - 1
    ' or cx,ax
    ' and cx,cx
    IF var_008C <> 0 THEN GOTO label_04C20
    GOTO label_04C38
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    PROC_EXIT
    RETURN
    GOTO label_04CA3
END SUB

SUB proc_24C43  ' image &H24C43, locals 8
    cx = 8
    CALL frame_enter()
    IF var_0090 == 0 THEN GOTO label_04C55
    GOTO label_04C70
    ax = var_006A
    ax = ax * 2
    ax = ax * 2
    ax = ax * 2
    local_C = ax
    ax = var_0068
    ax = ax * 2
    ax = ax * 2
    ax = ax * 2
    local_E = ax
    GOTO label_04C7C
    ax = var_006A
    local_C = ax
    ax = var_0068
    local_E = ax
    local_10 = 4
    local_12 = 0
    CALL proc_2482E(addr(local_10), addr(local_12), addr(local_E), addr(local_C))
    PROC_EXIT
    RETURN
    GOTO label_04D59
END SUB

SUB proc_24CA6  ' image &H24CA6, locals 16
    cx = 16
    CALL frame_enter()
    IF var_0090 == 0 THEN GOTO label_04CB8
    GOTO label_04CF3
    si = arg_C
    ax = [si]
    ax = ax * 2
    ax = ax * 2
    ax = ax * 2
    local_C = ax
    si = arg_A
    ax = [si]
    ax = ax * 2
    ax = ax * 2
    ax = ax * 2
    local_E = ax
    si = arg_C
    ax = [si]
    ax = ax * 2
    ax = ax * 2
    ax = ax * 2
    local_10 = ax
    si = arg_A
    ax = [si]
    ax = ax * 2
    ax = ax * 2
    ax = ax * 2
    local_12 = ax
    GOTO label_04D13
    si = arg_C
    ax = [si]
    local_C = ax
    si = arg_A
    ax = [si]
    local_E = ax
    si = arg_C
    ax = [si]
    local_10 = ax
    si = arg_A
    ax = [si]
    local_12 = ax
    local_14 = 7
    local_16 = 0
    CALL proc_2482E(addr(local_14), addr(local_16), addr(local_10), addr(local_12))
    local_18 = 8
    local_1A = 0
    CALL proc_2482E(addr(local_18), addr(local_1A), addr(local_C), addr(local_E))
    PROC_EXIT
    RETURN
    GOTO label_0515C
END SUB

SUB mnt120_24D5C  ' image &H24D5C, locals 18
  ' strings: MNT120 | MBL16O1G#O2C#EG#C#EG#AEG#AO3EO2G#O3C#E | MBL16O3G#C#EF#O4C#O3EG#O4C#EO3G#O4C#EL8G#G# | MBL16O1G#CO2D#G#O1CO2D#G#CD#G#CO3D#O2G#CO3D# | MBL16O3G#CD#G#O4CO3D#G#O4CD#O3G#O4CD#L8F#F# | MBL16O2C#F#G#O3C#O2F#G#O3C#F#O2G#O3C#F#G#C#F#G#
    cx = 18
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 39, 4, &H8001, addr(local_1C))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "MNT120"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "MBL16O1G#O2C#EG#C#EG#AEG#AO3EO2G#O3C#E"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(3, 1)
    si = bx
    di = "MBL16O3G#C#EF#O4C#O3EG#O4C#EO3G#O4C#EL8G#G#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(4, 1)
    si = bx
    di = "MBL16O1G#CO2D#G#O1CO2D#G#CD#G#CO3D#O2G#CO3D#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(5, 1)
    si = bx
    di = "MBL16O3G#CD#G#O4CO3D#G#O4CD#O3G#O4CD#L8F#F#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(6, 1)
    si = bx
    di = "MBL16O2C#F#G#O3C#O2F#G#O3C#F#O2G#O3C#F#G#C#F#G#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(7, 1)
    si = bx
    di = "MBL16O4C#O3F#G#O4C#F#O3G#O4C#F#G#C#F#G#L8O5C#C#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(8, 1)
    si = bx
    di = "MBL16O2C#F#AO3C#C#F#A#O4C#C#F#A#O5L8C#C#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(9, 1)
    si = bx
    di = "MBL16O2C#EFO3C#C#EFO4C#C#EFL8O5C#C#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(10, 1)
    si = bx
    di = "MBL16O3G#O4G#O3G#O4G#O3A#O4G#O4CG#C#G#D#G#CG#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(11, 1)
    si = bx
    di = "MBL16O4F#G#EG#EG#D#G#D#G#C#G#C#G#L4C"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(12, 1)
    si = bx
    di = "MBL16O3G#O4G#O3G#O4G#O3A#O4G#O4CG#C#G#D#G#CG#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(13, 1)
    si = bx
    di = "MBL16O4F#G#EG#EG#D#G#D#G#C#G#C#G#CG#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(14, 1)
    si = bx
    di = "MBL16O3G#O4G#O3AO4FO3G#O4G#O3AO4FO3G#O4G#O3AO4FO3G#O4G#O3AO4F"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(15, 1)
    si = bx
    di = "MBL8O4G#O2L2G#."
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(16, 1)
    si = bx
    di = "MBL16O1G#O2C#EG#C#EG#O3C#O2EG#O3C#EO2G#O3C#E"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(17, 1)
    si = bx
    di = "MBL16O3G#C#EG#O4C#O3EG#O4C#EEG#O5C#L8EE"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(18, 1)
    si = bx
    di = "MBL16O2EFO3C#EO2FO3C#EFC#EFO4C#O3EFO4C#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(19, 1)
    si = bx
    di = "MBL16O4EO3FO4C#EFC#EFO5C#O4EFO5C#L8EE"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(20, 1)
    si = bx
    di = "MBL16O2D#A#O3C#D#O2A#O3C#D#A#C#D#A#O4C#O3D#A#O4C#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(21, 1)
    si = bx
    di = "MBL16O4D#O2A#O3C#D#A#O4C#D#A#O4C#D#A#O5C#L8D#D#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(22, 1)
    si = bx
    di = "MBL16O4D#O3A#O4C#D#A#C#D#A#O5C#O4A#D#C#A#D#C#O3A#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(23, 1)
    si = bx
    di = "MBL16O4C#EF#G#ABO5C#O4BAEF#G#ABO5C#O4A"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(24, 1)
    si = bx
    di = "MBL16O4GEF#G#ABO5C#O4BAEF#G#ABO5C#DE"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(25, 1)
    si = bx
    di = "MBL16O5F#D#ED#EC#O4BAG#AG#F#G#F#G#O3E"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(26, 1)
    si = bx
    di = "MBL16O3F#EF#C#EC#EC#EF#G#ABO4C#O3B"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(27, 1)
    si = bx
    di = "MBL16O3AEF#G#ABO4C#O3BAEF#G#ABO4C#O3B"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(28, 1)
    si = bx
    di = "MBL16O3AEF#G#ABO4C#DEF#G#ABO5C#DD#L4E"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(29, 1)
    si = bx
    di = "MBL08O4AF#C#O3AF#C#AF#C#O2AF#C#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(30, 1)
    si = bx
    di = "MBL16O2AF#C#AC#F#AO3C#F#AO4C#F#AF#C#O3A"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(31, 1)
    si = bx
    di = "MBL16O2AF#DO1AO2DF#AO3DF#AO4DF#AF#DO3A"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(32, 1)
    si = bx
    di = "MBL08O5C#O4A#F#EC#O3A#O4EC#O3A#F#EC#O2A#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(33, 1)
    si = bx
    di = "MBL16O3EC#O2A#F#EC#EF#A#C#ED#A#C#ED#A#O5C#O4A#E"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(34, 1)
    si = bx
    di = "MBL08O5EC#O4G#EC#O3G#O4EC#O3G#L16EO4C#O3G#E"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(35, 1)
    si = bx
    di = "MBL16O3C#G#EC#O2G#O3EC#O2G#EO3C#O2G#EC#G#EC#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(36, 1)
    si = bx
    di = "MBL16O1GAA#BO2CC#C#D#EFF#F#G#AA#B"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(37, 1)
    si = bx
    di = "MBL16O3CC#C#D#EFF#F#G#AA#BO4CC#DD#EFF#F#G#"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(38, 1)
    si = bx
    di = "MBL32O4G#F#ED#F#C#CO4D#O3AG#F#AED#EC#CD#O2AG#F#AED#F#C#CD#O1AG#L1C#"
    CALL near_00E43()
    ax = 0
    IF var_0054 <= 37 THEN GOTO label_05114
    ax = ax - 1
    cx = 0
    IF var_0054 >= 1 THEN GOTO label_0511F
    cx = cx - 1
    ' or cx,ax
    ' and cx,cx
    IF var_0054 <> 1 THEN GOTO label_05128
    GOTO label_05131
    var_0054 = 1
    GOTO label_05135
    var_0054 = var_0054 + 1
    bx = addr(local_1C)
    CALL array_element(var_0054, 1)
    CALL RT_2732_2B42(BX)
    CALL erase_array(addr(local_1C))
    PROC_EXIT
    RETURN
    GOTO label_051B6
END SUB

SUB proc_2515F  ' image &H2515F, locals 4
    cx = 4
    CALL frame_enter()
    CALL RT_2732_6199(arg_8)
    si = arg_6
    IF ax < [si] THEN GOTO label_05179
    GOTO label_051AE
    si = arg_6
    ax = [si]
    local_C = ax
    CALL RT_2732_6199(arg_8)
    ax = ax + 1
    GOTO label_051A3
    di = &HBE42
    si = arg_8
    CALL near_00E51()
    di = ax
    si = arg_8
    CALL near_00E43()
    ax = local_E
    ax = ax + 1
    local_E = ax
    ax = local_C
    IF ax >= local_E THEN GOTO label_0518E
    PROC_EXIT
    RETURN
    GOTO label_05280
END SUB

SUB proc_251B9  ' image &H251B9, locals 30
    cx = 30
    CALL frame_enter()
    local_C = 10
    local_E = 0
    local_10 = 1
    local_12 = 0
    CALL invalid_key_was_hit_23200(arg_A, arg_8, addr(local_C), arg_6, addr(local_1A), addr(local_E), addr(local_10), addr(local_12))
    di = ax
    si = addr(local_16)
    CALL near_00E43()
    di = addr(local_16)
    si = addr(local_1E)
    CALL near_00E43()
    CALL RT_2732_6199(addr(local_1A))
    ax = ax + 1
    GOTO label_0522B
    di = &HBE42
    si = addr(local_1A)
    CALL near_00E51()
    di = ax
    si = addr(local_1A)
    CALL near_00E43()
    ax = local_20
    ax = ax + 1
    local_20 = ax
    IF local_20 <= 10 THEN GOTO label_05216
    local_22 = 11
    local_24 = 0
    CALL color_25283(addr(local_22), addr(local_24))
    di = addr(local_1A)
    si = addr(local_28)
    CALL near_00E43()
    CALL free_string(addr(local_16))
    CALL free_string(addr(local_1E))
    CALL free_string(addr(local_1A))
    CALL RT_2732_64F5(addr(local_28))
    PROC_EXIT
    RETURN
    GOTO label_053B0
END SUB

SUB color_25283  ' image &H25283, locals 0
    cx = 0
    CALL frame_enter()
    IF var_0056 == 1 THEN GOTO label_05295
    GOTO label_052B0
    si = arg_8
    si = arg_6
    PUSH 1
    PUSH [si]
    PUSH 1
    PUSH [si]
    PUSH 4
    CALL RT_2732_67E2()
    GOTO label_053A8
    si = arg_8
    ax = 0
    IF [si] <> 7 THEN GOTO label_052BC
    ax = ax - 1
    cx = 0
    IF [si] <> 15 THEN GOTO label_052C5
    cx = cx - 1
    ' or cx,ax
    si = arg_6
    ax = 0
    IF [si] <> 12 THEN GOTO label_052D3
    ax = ax - 1
    dx = 0
    IF [si] <> 4 THEN GOTO label_052DC
    dx = dx - 1
    ' or dx,ax
    ' and dx,cx
    ' and dx,dx
    IF [si] <> 4 THEN GOTO label_052E7
    GOTO label_05302
    PUSH 1
    ' xor ax,ax
    PUSH 1
    PUSH 1
    PUSH 7
    PUSH 4
    CALL RT_2732_67E2()
    GOTO label_053A8
    si = arg_8
    ax = 0
    IF [si] <> 7 THEN GOTO label_0530E
    ax = ax - 1
    cx = 0
    IF [si] <> 15 THEN GOTO label_05317
    cx = cx - 1
    ' or cx,ax
    si = arg_6
    ax = 0
    IF [si] <> 0 THEN GOTO label_05325
    ax = ax - 1
    ' or ax,cx
    ' and ax,ax
    IF [si] <> 0 THEN GOTO label_0532E
    GOTO label_05349
    PUSH 1
    PUSH 7
    PUSH 1
    ' xor ax,ax
    PUSH 1
    PUSH 4
    CALL RT_2732_67E2()
    GOTO label_053A8
    si = arg_6
    ax = 0
    IF [si] <> 7 THEN GOTO label_05355
    ax = ax - 1
    cx = 0
    IF [si] <> 15 THEN GOTO label_0535E
    cx = cx - 1
    ' or cx,ax
    si = arg_8
    ax = 0
    IF [si] <> 0 THEN GOTO label_0536C
    ax = ax - 1
    ' or ax,cx
    ' and ax,ax
    IF [si] <> 0 THEN GOTO label_05375
    GOTO label_05390
    PUSH 1
    ' xor ax,ax
    PUSH 1
    PUSH 1
    PUSH 7
    PUSH 4
    CALL RT_2732_67E2()
    GOTO label_053A8
    PUSH 1
    PUSH 7
    PUSH 1
    ' xor ax,ax
    PUSH 1
    PUSH 4
    CALL RT_2732_67E2()
    PROC_EXIT
    RETURN
    GOTO label_0541E
END SUB

SUB proc_253B3  ' image &H253B3, locals 0
    cx = 0
    CALL frame_enter()
    si = arg_8
    IF [si] == 0 THEN GOTO label_053C6
    GOTO label_053DE
    ' xor ax,ax
    si = arg_6
    PUSH ax
    PUSH 1
    PUSH [si]
    PUSH 3
    CALL RT_2732_680E()
    GOTO label_05416
    si = arg_6
    IF [si] == 0 THEN GOTO label_053E9
    GOTO label_053FE
    si = arg_8
    PUSH 1
    PUSH [si]
    PUSH 2
    CALL RT_2732_680E()
    GOTO label_05416
    si = arg_8
    si = arg_6
    PUSH 1
    PUSH [si]
    PUSH 1
    PUSH [si]
    PUSH 4
    CALL RT_2732_680E()
    PROC_EXIT
    RETURN
    GOTO label_05C7C
END SUB

SUB doshareware_25421  ' image &H25421, locals 108
  ' strings: DOSHAREWARE | end  |  for  |  or |  to: | (Send an additional $4.00 if you are ordering C.O.D. for S+H)
    cx = 108
    CALL frame_enter()
    CALL RT_2732_6130(arg_C, &HBE38)
    IF ? == ? THEN GOTO label_0543A
    GOTO label_0576E
    di = "DOSHAREWARE"
    si = addr(local_E)
    CALL near_00E43()
    CALL sb_dat_21E13(addr(local_E))
    CALL free_string(addr(local_E))
    CALL hit_any_key_to_continue_2434A()
    local_10 = 3
    local_12 = 25
    CALL proc_21194(addr(local_10), addr(local_12))
    local_14 = 11
    local_16 = 0
    CALL color_25283(addr(local_14), addr(local_16))
    si = arg_6
    ax = [si]
    local_18 = ax
    ax = 1
    GOTO label_055AD
    local_1A = 0
    bx = arg_8
    CALL array_element(local_24, 1)
    ' float_hw
    ' float_D9
    CALL 00_25D94(addr(local_1A), addr(local_1E))
    di = ax
    si = addr(local_22)
    CALL near_00E43()
    ' float_D9
    bx = arg_8
    CALL array_element(local_24, 1)
    ' float_hw
    di = addr(local_22)
    si = "end "
    CALL near_00E51()
    si = ax
    di = " for "
    CALL near_00E51()
    bx = ax
    dx = bx
    bx = arg_A
    CALL array_element(local_24, 1)
    di = bx
    si = dx
    CALL near_00E51()
    di = ax
    si = addr(local_28)
    CALL near_00E43()
    IF local_24 == 1 THEN GOTO label_0551E
    GOTO label_0553A
    di = addr(local_28)
    si = &HBDFC
    CALL near_00E51()
    si = ax
    di = " or"
    CALL near_00E51()
    di = ax
    si = addr(local_28)
    CALL near_00E43()
    GOTO label_05597
    si = arg_6
    ax = [si]
    IF ax == local_24 THEN GOTO label_05547
    GOTO label_0557E
    di = addr(local_28)
    si = &HC682
    CALL near_00E51()
    si = ax
    di = " to:"
    CALL near_00E51()
    bx = ax
    ax = 76
    local_2A = bx
    CALL RT_2732_63DF(DS, 76, 1)
    di = ax
    si = local_2A
    CALL near_00E51()
    di = ax
    si = addr(local_28)
    CALL near_00E43()
    GOTO label_05597
    di = addr(local_28)
    si = &HC682
    CALL near_00E51()
    si = ax
    di = " or"
    CALL near_00E51()
    di = ax
    si = addr(local_28)
    CALL near_00E43()
    local_2C = 1
    CALL print_more_21DB9(addr(local_28), addr(local_2C))
    ax = local_24
    ax = ax + 1
    local_24 = ax
    ax = local_18
    IF ax < local_24 THEN GOTO label_055BB
    GOTO label_05496
    local_2E = 15
    local_30 = 0
    CALL color_25283(addr(local_2E), addr(local_30))
    local_32 = 1
    CALL print_more_21DB9(arg_14, addr(local_32))
    local_34 = 1
    CALL print_more_21DB9(arg_12, addr(local_34))
    local_36 = 1
    CALL print_more_21DB9(arg_10, addr(local_36))
    CALL RT_2732_6130(arg_E, &HBE38)
    IF ax <> local_24 THEN GOTO label_05616
    GOTO label_0576B
    local_38 = 11
    local_3A = 0
    CALL color_25283(addr(local_38), addr(local_3A))
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    si = ax
    di = "(Send an additional $4.00 if you are ordering C.O.D. for S+H)"
    CALL near_00E51()
    di = ax
    si = addr(local_3E)
    CALL near_00E43()
    local_40 = 1
    CALL print_more_21DB9(addr(local_3E), addr(local_40))
    CALL free_string(addr(local_3E))
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    si = ax
    di = "If you have any questions, bugs, or comments, call at:"
    CALL near_00E51()
    bx = ax
    ax = 76
    local_48 = bx
    CALL RT_2732_63DF(DS, 76, 1)
    di = ax
    si = local_48
    CALL near_00E51()
    di = ax
    si = addr(local_44)
    CALL near_00E43()
    local_46 = 1
    CALL print_more_21DB9(addr(local_44), addr(local_46))
    CALL free_string(addr(local_44))
    local_4A = 15
    local_4C = 0
    CALL color_25283(addr(local_4A), addr(local_4C))
    local_4E = 1
    CALL print_more_21DB9(arg_E, addr(local_4E))
    local_50 = 11
    local_52 = 0
    CALL color_25283(addr(local_50), addr(local_52))
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    si = ax
    di = "You can also use the phone to order C.O.D. for an additional $4.00 S&H."
    CALL near_00E51()
    di = ax
    si = addr(local_56)
    CALL near_00E43()
    local_58 = 1
    CALL print_more_21DB9(addr(local_56), addr(local_58))
    CALL free_string(addr(local_56))
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    di = ax
    si = "(Phone message space is limited, so please be discretionary about calling.)"
    CALL near_00E51()
    di = ax
    si = addr(local_5C)
    CALL near_00E43()
    local_5E = 1
    CALL print_more_21DB9(addr(local_5C), addr(local_5E))
    CALL free_string(addr(local_5C))
    GOTO label_05C47
    CALL RT_2732_62F7(40, &HC7A8)
    di = ax
    si = addr(local_62)
    CALL near_00E43()
    CALL RT_2732_6F64()
    CALL RT_2732_73D0(35)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH "INVOICE"
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "Remit to:"
    CALL RT_2732_591B()
    CALL RT_2732_73D0(40)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH "From:"
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH arg_14
    CALL RT_2732_591B()
    CALL RT_2732_73D0(40)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH addr(local_62)
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH arg_12
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH arg_10
    CALL RT_2732_591B()
    CALL RT_2732_73D0(40)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH addr(local_62)
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH arg_E
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    CALL RT_2732_73D0(40)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH addr(local_62)
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    CALL RT_2732_73D0(40)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH addr(local_62)
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    CALL RT_2732_73D0(40)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH "Attention to (contact name):"
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    CALL RT_2732_73D0(40)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH addr(local_62)
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    CALL RT_2732_73D0(40)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH addr(local_62)
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "QTY"
    CALL RT_2732_591B()
    CALL RT_2732_73D0(55)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH "UNIT PRICE"
    CALL RT_2732_591B()
    CALL RT_2732_73D0(69)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH "TOTAL"
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_5920()
    si = arg_6
    ax = [si]
    local_64 = ax
    ax = 1
    GOTO label_05AFD
    bx = arg_A
    CALL array_element(local_24, 1)
    di = bx
    si = "___ "
    CALL near_00E51()
    di = ax
    si = addr(local_28)
    CALL near_00E43()
    CALL RT_2732_6F64()
    PUSH addr(local_28)
    CALL RT_2732_591B()
    CALL RT_2732_5A54()
    CALL RT_2732_6F64()
    CALL RT_2732_73D0(55)
    PUSH &HBE38
    CALL RT_2732_591B()
    local_66 = 0
    bx = arg_8
    CALL array_element(local_24, 1)
    ' float_hw
    ' float_D9
    CALL 00_25D94(addr(local_66), addr(local_6A))
    di = ax
    si = addr(local_6E)
    CALL near_00E43()
    ' float_D9
    bx = arg_8
    CALL array_element(local_24, 1)
    ' float_hw
    PUSH addr(local_6E)
    CALL RT_2732_591B()
    CALL RT_2732_73D0(69)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH "__________"
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_5920()
    ax = local_24
    ax = ax + 1
    local_24 = ax
    ax = local_64
    IF ax < local_24 THEN GOTO label_05B0B
    GOTO label_05A2C
    CALL RT_2732_6F64()
    PUSH "    C.O.D. shipping and handling (C.O.D. ORDERS ONLY!)"
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "    put $4.00 here for entire order"
    CALL RT_2732_591B()
    CALL RT_2732_5A54()
    CALL RT_2732_6F64()
    CALL RT_2732_73D0(55)
    PUSH &HBE38
    CALL RT_2732_591B()
    local_70 = 0
    local_72 = 4
    CALL proc_25D42(addr(local_70), addr(local_72))
    di = ax
    si = addr(local_76)
    CALL near_00E43()
    PUSH addr(local_76)
    CALL RT_2732_591B()
    CALL RT_2732_73D0(69)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH "__________"
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_591B()
    CALL RT_2732_73D0(55)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH "TOTAL"
    CALL RT_2732_591B()
    CALL RT_2732_73D0(69)
    PUSH &HBE38
    CALL RT_2732_591B()
    PUSH "__________"
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_5920()
    CALL RT_2732_6F64()
    PUSH "I use 5 1/4 __________     3 1/2 __________  disks"
    CALL RT_2732_591B()
    ax = 76
    CALL RT_2732_63DF(DS, 76, 1)
    PUSH 1
    CALL RT_2732_5920()
    CALL free_string(addr(local_76))
    CALL free_string(addr(local_6E))
    CALL free_string(addr(local_22))
    CALL free_string(addr(local_28))
    CALL free_string(addr(local_62))
    PROC_EXIT
    RETURN
    GOTO label_05CF4
END SUB

SUB proc_25C7F  ' image &H25C7F, locals 10
    cx = 10
    CALL frame_enter()
    CALL RT_2732_79CA()
    si = ax
    ' float_D9
    ' float_D9
    si = arg_A
    ax = [si]
    bx = ax
    CALL RT_2F00_0558()
    si = arg_8
    bx = bx + [si]
    ax = bx
    CALL RT_2F00_0558()
    ' float_DE
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? > ? THEN GOTO label_05CCC
    GOTO label_05CD4
    local_14 = 0
    GOTO label_05CD9
    local_14 = 1
    ax = local_14
    CALL RT_2F00_0558()
    si = arg_6
    ' float_D9
    ax = arg_6
    PROC_EXIT
    RETURN
    GOTO label_05D3F
END SUB

SUB proc_25CF7  ' image &H25CF7, locals 2
    cx = 2
    CALL frame_enter()
    CALL RT_2732_7AEA()
    si = ax
    ' float_D9
    ' float_D8
    CALL RT_2F00_056C()
    local_C = ax
    IF var_0060 > &H5A0 THEN GOTO label_05D21
    GOTO label_05D26
    local_C = local_C + &H5A0
    ax = var_0060
    IF ax < local_C THEN GOTO label_05D31
    GOTO label_05D37
    var_0062 = 1
    PROC_EXIT
    RETURN
    GOTO label_05D91
END SUB

SUB proc_25D42  ' image &H25D42, locals 12
    cx = 12
    CALL frame_enter()
    si = arg_6
    ax = [si]
    CALL RT_2F00_0558()
    ' float_D9
    CALL 00_25D94(arg_8, addr(local_E))
    di = ax
    si = addr(local_12)
    CALL near_00E43()
    di = addr(local_12)
    si = addr(local_16)
    CALL near_00E43()
    CALL free_string(addr(local_12))
    CALL RT_2732_64F5(addr(local_16))
    PROC_EXIT
    RETURN
    GOTO label_05F8D
END SUB

SUB 00_25D94  ' image &H25D94, locals 30
  ' strings: ,00 | ,0
    cx = 30
    CALL frame_enter()
    si = arg_6
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? == ? THEN GOTO label_05DC0
    GOTO label_05DCC
    di = &HBEFC
    si = addr(local_12)
    CALL near_00E43()
    GOTO label_05DD5
    di = &HBE38
    si = addr(local_12)
    CALL near_00E43()
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF ? > ? THEN GOTO label_05DEB
    GOTO label_05EF8
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D8
    ' float_DE
    ' float_D9
    ' float_D9
    ' float_D8
    CALL RT_2F00_05DF()
    ' float_D9
    CALL RT_2732_69C8(local_18, local_1A)
    CALL RT_2732_6371(ax)
    CALL RT_2732_6374(ax)
    di = ax
    si = addr(local_1E)
    CALL near_00E43()
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    ax = 0
    IF ? <= ? THEN GOTO label_05E62
    ax = ax - 1
    si = arg_8
    cx = 0
    IF [si] == &HFFFF THEN GOTO label_05E6E
    cx = cx - 1
    ' and cx,ax
    ' and cx,cx
    IF [si] <> &HFFFF THEN GOTO label_05E77
    GOTO label_05EE4
    ' float_D9
    ' float_D9
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [si] > &HFFFF THEN GOTO label_05E96
    GOTO label_05EAA
    di = addr(local_1E)
    si = ",00"
    CALL near_00E51()
    di = ax
    si = addr(local_1E)
    CALL near_00E43()
    GOTO label_05EE4
    ' float_D9
    ' float_D9
    CALL RT_2F00_05B3()
    IF [si] > &HFFFF THEN GOTO label_05EBF
    GOTO label_05ED3
    di = addr(local_1E)
    si = ",0"
    CALL near_00E51()
    di = ax
    si = addr(local_1E)
    CALL near_00E43()
    GOTO label_05EE4
    di = addr(local_1E)
    si = &HBF68
    CALL near_00E51()
    di = ax
    si = addr(local_1E)
    CALL near_00E43()
    di = addr(local_12)
    si = addr(local_1E)
    CALL near_00E51()
    di = ax
    si = addr(local_12)
    CALL near_00E43()
    GOTO label_05DD6
    ' float_D9
    si = arg_6
    ' float_D9
    CALL RT_2F00_05B3()
    ' jc 0x5f0f
    GOTO label_05F20
    di = addr(local_12)
    si = &HBF02
    CALL near_00E51()
    di = ax
    si = addr(local_12)
    CALL near_00E43()
    CALL RT_2732_6199(addr(local_12))
    si = arg_8
    IF ax < [si] THEN GOTO label_05F33
    GOTO label_05F61
    si = arg_8
    ax = [si]
    bx = ax
    local_24 = bx
    CALL RT_2732_6199(addr(local_12))
    cx = local_24
    cx = cx - ax
    CALL RT_2732_62BC(CX)
    si = ax
    di = addr(local_12)
    CALL near_00E51()
    di = ax
    si = addr(local_12)
    CALL near_00E43()
    di = addr(local_12)
    si = addr(local_28)
    CALL near_00E43()
    CALL free_string(addr(local_12))
    CALL free_string(addr(local_1E))
    CALL RT_2732_64F5(addr(local_28))
    PROC_EXIT
    RETURN
    GOTO label_05FE2
END SUB

SUB proc_25F90  ' image &H25F90, locals 12
    cx = 12
    CALL frame_enter()
    si = arg_6
    ax = [si]
    dx = var_0002[si]
    CALL RT_2F00_0559()
    ' float_D9
    CALL 00_25D94(arg_8, addr(local_E))
    di = ax
    si = addr(local_12)
    CALL near_00E43()
    di = addr(local_12)
    si = addr(local_16)
    CALL near_00E43()
    CALL free_string(addr(local_12))
    CALL RT_2732_64F5(addr(local_16))
    PROC_EXIT
    RETURN
    GOTO label_06009
END SUB

SUB proc_25FE5  ' image &H25FE5, locals 0
    cx = 0
    CALL frame_enter()
    ' xor ax,ax
    PUSH ax
    PUSH ax
    PUSH 1
    ' xor ax,ax
    PUSH 1
    PUSH 4
    CALL RT_2732_680E()
    PROC_EXIT
    RETURN
    GOTO label_0602E
END SUB

SUB proc_2600C  ' image &H2600C, locals 0
    cx = 0
    CALL frame_enter()
    ' xor ax,ax
    PUSH ax
    PUSH ax
    PUSH 1
    PUSH 1
    PUSH 4
    CALL RT_2732_680E()
    PROC_EXIT
    RETURN
    GOTO label_061F3
END SUB

SUB y_yes_26031  ' image &H26031, locals 54
  ' strings: (Y) YES | (N) NO | Y or N only, please
    cx = 54
    CALL frame_enter()
    ' xor ax,ax
    CALL RT_2732_24B9(ax, 2, 4, &H8001, addr(local_1C))
    bx = addr(local_1C)
    CALL array_element(1, 1)
    si = bx
    di = "(Y) YES"
    CALL near_00E43()
    bx = addr(local_1C)
    CALL array_element(2, 1)
    si = bx
    di = "(N) NO"
    CALL near_00E43()
    si = arg_6
    IF [si] == 1 THEN GOTO label_06089
    GOTO label_06091
    local_1E = 1
    GOTO label_06096
    local_1E = 2
    local_20 = 2
    local_22 = 2
    local_24 = 2
    local_26 = 0
    local_28 = 0
    CALL menu_choice_225B8(addr(local_1C), addr(local_20), addr(local_22), arg_8, arg_A, addr(local_24), addr(local_26), addr(local_1E), addr(local_28))
    di = ax
    si = addr(local_2C)
    CALL near_00E43()
    di = addr(local_2C)
    si = addr(local_30)
    CALL near_00E43()
    ax = 74
    CALL RT_2732_63DF(DS, 74, 1)
    CALL RT_2732_6130(1, addr(local_30))
    ax = 0
    IF [si] <> 1 THEN GOTO label_06105
    ax = ax - 1
    bx = ax
    local_32 = bx
    CALL RT_2732_6130(addr(local_30), &HBDDA)
    ax = 0
    IF [si] <> 1 THEN GOTO label_0611D
    ax = ax - 1
    ' or ax,[bp-0x32]
    bx = ax
    local_34 = bx
    CALL RT_2732_6130(addr(local_30), &HC90C)
    ax = 0
    IF [si] <> 1 THEN GOTO label_06138
    ax = ax - 1
    ' or ax,[bp-0x34]
    ' and ax,ax
    IF [si] <> 1 THEN GOTO label_06142
    GOTO label_06151
    di = &HC90C
    si = addr(local_30)
    CALL near_00E43()
    GOTO label_061BE
    GOTO label_06166
    CALL RT_2732_6130(addr(local_30), &HBE48)
    IF [si] == 1 THEN GOTO label_06163
    GOTO label_06166
    GOTO label_061BE
    di = "Y or N only, please"
    si = addr(local_38)
    CALL near_00E43()
    ax = 79
    CALL RT_2732_63DF(DS, 79, 1)
    di = ax
    si = addr(local_3C)
    CALL near_00E43()
    CALL proc_2311E(addr(local_38), addr(local_3C))
    ax = addr(local_3C)
    PUSH DS
    PUSH addr(local_3C)
    ' xor ax,ax
    ax = 79
    CALL RT_2732_6404(addr(local_3C), DS, 79, 1)
    CALL free_string(addr(local_38))
    CALL free_string(addr(local_3C))
    GOTO label_06096
    di = addr(local_30)
    si = addr(local_40)
    CALL near_00E43()
    CALL free_string(addr(local_2C))
    CALL free_string(addr(local_30))
    CALL erase_array(addr(local_1C))
    CALL RT_2732_64F5(addr(local_40))
    PROC_EXIT
    RETURN
    CALL RT_2732_4E0A()
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bx+0x0] = [bx+0x0] + cl
    [bx+si] = [bx+si] + al
    di = di - 1
    [bx+si] = [bx+si] + al
    [bp+di+0x0] = [bp+di+0x0] + dl
    [bx+si] = [bx+si] + al
    [bx+si] = [bx+si] + al
    [bp+di+0x0] = [bp+di+0x0] + ah
    [bx+si] = [bx+si] + al
    ' xchg ax,sp
    [bx+si] = [bx+si] + al
    ch = ch + al
    [bx+si] = [bx+si] + al
    dh = dh + dh
    [bx+si] = [bx+si] + al
    [bx] = [bx] + ah
    [bx+si] = [bx+si] + ax
    [bx+si+0x1] = [bx+si+0x1] + bl
    [bx+si] = [bx+si] + al
    [bx+di] = ax
    [bx+si] = [bx+si] + al
    dx = 1
    bl = bl + ch
    [bx+si] = [bx+si] + ax
    [si] = [si] + bl
    al = al + [bx+si]
    [di+0x2] = [di+0x2] + cl
    [bx+si] = [bx+si] + al
    IF [si] <= 1 THEN GOTO label_062F4
    [bx+si] = [bx+si] + al
    ' scasw
    al = al + [bx+si]
    bl = bl + cl
    al = al + [bx+si]
    bh = bh + ah
    al = al + [bx+si]
    [bp+di] = [bp+di] + al
    ax = ax + [bx+si]
    [bx] = [bx] + bl
    ax = ax + [bx+si]
    [bp+di] = [bp+di] + bh
    ax = ax + [bx+si]
    [bx+0x3] = [bx+0x3] + dl
    [bx+si] = [bx+si] + al
    ' jnc 0x6315
    [bx+si] = [bx+si] + al
    IF jns THEN GOTO label_06319
    [bx+si] = [bx+si] + al
    [bp+di] = [bp+di] + 0
    [bp+di] = es
    [bx+si] = [bx+si] + al
    ' pushf
    ax = ax + [bx+si]
    ch = ch + dl
    ax = ax + [bx+si]
    ah = ah + ah
    ax = ax + [bx+si]
    ch = ch + dh
    ax = ax + [bx+si]
    ch = ch + bh
    ax = ax + [bx+si]
    [bx+si] = [bx+si] + cl
    al = al + 0
    [bx+di] = [bx+di] + dl
    al = al + 0
    [si] = [si] + bl
    al = al + 0
    var_0004 = var_0004 + ch
    arg_4 = arg_4 + al
    [bx+si] = [bx+si] + al
    ' imul ax,[si],0x0
    [bx+si+0x4] = [bx+si+0x4] + al
    [bp+di+0x4] = [bp+di+0x4] + al
    [bp+di+0x4] = [bp+di+0x4] + al
    [bx+0x4] = [bx+0x4] + ah
    [bx+di+0x4] = [bx+di+0x4] + bh
    dl = dl + al
    al = al + 0
    ah = ah + bl
    al = al + 0
    bh = bh + ah
    al = al + 0
    bh = bh + bh
    al = al + 0
    [bx] = [bx] + dl
    ax = ax + 0
    ' cs add ax,0x0
    bx = bx + 1
    ax = ax + 0
    ax = ax + &HFF0
    IF jno THEN GOTO label_06387
    ' decode stopped: unknown 0F 0x94 at 0x26382 at 0x26382
END SUB

