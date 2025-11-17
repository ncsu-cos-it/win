@echo off
ipconfig | findstr "IPv4" > %TEMP%\IPADDR.txt
set /p IPADDR=<%TEMP%\IPADDR.TXT
set IP=%IPADDR:~39%
echo %IP%
timeout /t 20
