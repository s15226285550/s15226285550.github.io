@echo off
setlocal enabledelayedexpansion

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

REM Fetch the encrypted password from a secure location
for /f "delims=" %%j in ('curl -s https://raw.githubusercontent.com/s15226285550/s15226285550.github.io/gh-page/p.txt') do (
    set encrypted_password=%%j
)

REM Decrypt the password using your decryption logic
set "decrypted_password="
powershell -command "& { $key = 'YourEncryptionKey'; $encrypted_password = '%encrypted_password%'; $decrypted_password = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($encrypted_password)); echo $decrypted_password }" > decrypted-pass.txt

REM Read the decrypted password from the file
set /p decrypted_password=<decrypted-pass.txt

REM Set the password in AnyDesk
echo !decrypted_password! | anydesk --set-password

REM Display the AnyDesk ID and password
echo ..........................................................
echo ..........................................................
echo AnyDesk ID: %ID%
echo AnyDesk Password: !decrypted_password!
echo Done

REM Clean up temporary files
del decrypted-pass.txt
