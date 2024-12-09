@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
set /p SN=<%CONFDIR%\SN.txt
powershell -noprofile -executionpolicy bypass -command %BINDIR%\dell-warranty-info.ps1 -ServiceTag %SN%

:END
set BINDIR=
set CONFDIR=
timeout /t 20
