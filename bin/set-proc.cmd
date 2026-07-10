@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
if EXIST "%CONFDIR%\PROC.txt" GOTO :END
powershell -noprofile -executionpolicy bypass -command %BINDIR%\set-proc.ps1 > %CONFDIR%\PROC.txt
:END
