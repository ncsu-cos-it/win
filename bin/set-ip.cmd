@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
powershell -noprofile -executionpolicy bypass -command %BINDIR%\ip-query.ps1 > %CONFDIR%\IP.txt

set BINDIR=
set CONFDIR=
:END
