@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
powershell -command %BINDIR%\ip-query.ps1 > %CONFDIR%\IP.txt

:END
