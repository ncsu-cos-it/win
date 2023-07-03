@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
set /p SN=<%CONFDIR%\SN.txt
powershell -command %BINDIR%\dell-warranty-info.ps1 -ServiceTag %SN%

:END
timeout /t 20
