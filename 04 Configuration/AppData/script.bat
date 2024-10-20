@echo off

:: Check if the script is running with administrative privileges
net session >NUL 2>&1
if %ErrorLevel% NEQ 0 (
    echo Permission denied. This script must be run as an Administrator.
    pause
    exit /b 1
)

echo Killing running services:
setlocal enabledelayedexpansion

set services=Code Everything Logi Flow flux qBittorrent vlc Spotify GoogleDriveFS crashpad_handler chrome Foxit Office

for %%a in (%services%) do (
    echo    %%a
    taskkill /IM "%%a*" /f >NUL 2>&1
)

endlocal

echo.
echo Copying AppData and LocalAppData folders
robocopy . "%AppData%" /E /B /IS /copyall /XF script.bar >NUL 2>&1

echo Restarting Everything
"%ProgramFiles%\Everything\Everything.exe" -install-service >NUL 2>&1

echo.
echo.
echo DONE.
pause

