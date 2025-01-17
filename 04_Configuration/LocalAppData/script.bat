@echo off

pushd %~dp0

:: Check if the script is running with administrative privileges
net session >NUL 2>&1
if %ErrorLevel% NEQ 0 (
    echo Permission denied. This script must be run as an Administrator.
    pause
    exit /b 1
)

echo Copying LocalAppData folders
robocopy . "%LocalAppData%" /E /B /IS /IT /copyall /XF "script.bat" >NUL 2>&1

echo DONE.
pause

