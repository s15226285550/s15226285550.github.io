@echo off
powershell -Command "choco install anydesk -y"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/jahidrdpschool/pc-github-anydesk/main/ST.bat -OutFile ST.bat"

curl -s -L -o C:\Users\Public\Desktop\YTC.zip https://github.com/jahidrdpschool/pc-github-anydesk/raw/main/YTC.zip
curl -s -L -o C:\Users\Public\Desktop\Winrar.exe https://github.com/jahidrdpschool/pc-github-anydesk/raw/main/Winrar.exe
powershell -Command "Invoke-WebRequest 'https://github.com/chieunhatnang/VM-QuickConfig/releases/download/1.6.1/VMQuickConfig.exe' -OutFile 'C:\Users\Public\Desktop\VMQuickConfig.exe'"
C:\Users\Public\Desktop\Winrar.exe /S
del C:\Users\Public\Desktop\Winrar.exe
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > errormsg.txt 2>&1
del /f "C:\Users\Public\Desktop\Unity Hub.lnk" > errormsg.txt 2>&1
