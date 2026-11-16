@echo off
REM Append a note to the active session's notes.txt
cd /d "%~dp0"
set "MSG=%*"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\capture_game_state.ps1" -Action Note -Message "%MSG%"
pause
