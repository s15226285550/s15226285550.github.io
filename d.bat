@echo off
powershell -Command "choco install anydesk -y"
powershell -Command Invoke-WebRequest -Uri "https://raw.githubusercontent.com/s15226285550/s15226285550.github.io/gh-page/s.bat" -OutFile "s.bat"

curl -s -L -o C:\Users\Public\Desktop\Chrome_Profile_Generator.exe https://github.com/s15226285550/s15226285550.github.io/raw/gh-page/CrPG.exe
curl -s -L -o C:\Users\Public\Desktop\WinRAR.exe https://github.com/s15226285550/s15226285550.github.io/raw/gh-page/WR.exe
powershell -Command "Invoke-WebRequest 'https://github.com/chieunhatnang/VM-QuickConfig/releases/download/1.6.1/VMQuickConfig.exe' -OutFile 'C:\Users\Public\Desktop\VMQuickConfig.exe'"
C:\Users\Public\Desktop\Winrar.exe /S
del C:\Users\Public\Desktop\Winrar.exe
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > errormsg.txt 2>&1
del /f "C:\Users\Public\Desktop\Unity Hub.lnk" > errormsg.txt 2>&1
