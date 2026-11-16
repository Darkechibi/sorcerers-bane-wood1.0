@echo off
REM Finish capture: copies to after\, runs diff, writes diff_report.md
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\capture_game_state.ps1" -Action End
echo.
pause
