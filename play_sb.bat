@echo off
REM Launch DOSBox-X using tools/dosbox_launch.json (edit that file to add -c commands)
cd /d "%~dp0"
echo.
echo === Sorcerer Bane launcher ===
echo Edit commands: tools\dosbox_launch.json
echo Capture flow:  capture_begin.bat -^> play (here) -^> capture_end.bat
echo Logging: -log-int21 -log-fileio -console  (see tools/dosbox_launch.json)
echo Do NOT use Debug -^> Start DOSBox-X Debugger while playing.
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\play_sb_launch.ps1"
if errorlevel 1 (
  echo.
  echo Launch failed. Check tools\dosbox_launch.json paths.
  pause
)
