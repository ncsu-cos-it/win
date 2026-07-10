@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
if EXIST "%CONFDIR%\Model.txt" GOTO :END
powershell -noprofile -executionpolicy bypass -command %BINDIR%\set-model.ps1 > %CONFDIR%\Model.txt
:END
