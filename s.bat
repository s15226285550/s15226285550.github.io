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

REM Retrieve AnyDesk password from a text file
curl -o p.txt https://raw.githubusercontent.com/s15226285550/s15226285550.github.io/gh-page/p.txt

for /f "usebackq delims=" %%j in (p.txt) do (
    set P=%%j
)

echo %P% | anydesk --set-password
echo ..........................................................
echo ..........................................................
echo anydesk id : %ID%
echo anydesk pw : %P%
echo Done

REM Delete the temporary password file
del p.txt
