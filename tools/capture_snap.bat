@echo off
REM Mid-session snapshot (e.g. right after DOSBox save state) without ending session
REM Usage: capture_snap.bat optional_note
cd /d "%~dp0"
set "MSG=%~1"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\capture_game_state.ps1" -Action Snap -Phase snap -Message "%MSG%"
echo.
pause
