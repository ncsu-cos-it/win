@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
if EXIST "%CONFDIR%\SN.txt" GOTO :END
powershell -noprofile -executionpolicy bypass -command %BINDIR%\sn-set.ps1 > %CONFDIR%\SN.txt
:END
