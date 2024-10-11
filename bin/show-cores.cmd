@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
powershell -noprofile -executionpolicy bypass -command %BINDIR%\cores-set.ps1 
timeout /t 20
