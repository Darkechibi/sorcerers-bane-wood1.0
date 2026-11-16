@echo off
REM Start a capture session: copies game files to captures\<timestamp>_label\before\
REM Usage: double-click, or: capture_begin.bat fight_hobgoblin
cd /d "%~dp0"
set "LABEL=%~1"
if "%LABEL%"=="" set "LABEL=session"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\capture_game_state.ps1" -Action Begin -Label "%LABEL%"
echo.
pause
