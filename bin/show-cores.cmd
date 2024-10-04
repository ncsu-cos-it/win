@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
powershell -command %BINDIR%\cores-set.ps1 
timeout /t 20
