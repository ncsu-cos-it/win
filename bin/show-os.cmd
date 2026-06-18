@echo off
systeminfo | findstr /b /c:"OS Name" > %TEMP%\OSNAME.txt
set /p OSNAME=<%TEMP%\OSNAME.txt
set OS=%OSNAME:~31%
echo %OS%
timeout /t 20
