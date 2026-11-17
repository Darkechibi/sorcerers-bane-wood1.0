@echo off
setlocal
cd /d "%~dp0.."
set "ISCC=%LocalAppData%\Programs\Inno Setup 6\ISCC.exe"
if not exist "%ISCC%" set "ISCC=%ProgramFiles(x86)%\Inno Setup 6\ISCC.exe"
if not exist "%ISCC%" set "ISCC=%ProgramFiles%\Inno Setup 6\ISCC.exe"
if not exist "%ISCC%" (
  echo Inno Setup 6 not found. Install with:
  echo   winget install JRSoftware.InnoSetup
  exit /b 1
)
where gcc >nul 2>&1
if errorlevel 1 set "PATH=C:\mingw64\bin;%PATH%"
gcc -O2 -Wall -Wextra -o play\sbplay.exe play\sbplay.c || exit /b 1
"%ISCC%" installer\SorcerersBane-wood1.0.iss || exit /b 1
echo.
echo Built: dist\SorcerersBane-wood1.0-Setup.exe
endlocal
