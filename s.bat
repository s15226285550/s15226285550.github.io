@echo off

:START_ANYDESK
anydesk --start
ping 127.0.0.1 -n 4 > nul

for /f "delims=" %%i in ('"C:\ProgramData\chocolatey\lib\anydesk.portable\tools\AnyDesk.exe" --get-id') do (
    set ID=%%i
)

if "%ID%"=="" (
    taskkill /f /im anydesk.exe > nul
    goto START_ANYDESK
)

if "%ID%"=="0" (
    taskkill /f /im anydesk.exe > nul
    goto START_ANYDESK
)

set "ENCRYPTED=amFoaWRoYXNhbg=="

echo %ENCRYPTED% | base64 --decode > p.txt

echo %ENCRYPTED% | anydesk --set-password
echo ..........................................................
echo ..........................................................
echo anydesk id : %ID%
echo anydesk pw : %ENCRYPTED%
echo Done

REM Delete the temporary password file
del p.txt
