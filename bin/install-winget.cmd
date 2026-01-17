@echo off

set BINDIR="C:\opt\cos\bin"
powershell -noprofile -executionpolicy bypass -command %BINDIR%\install-winget.ps1 

:END
set BINDIR=
timeout /t 20
