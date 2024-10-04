@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
if EXIST "%CONFDIR%\Model.txt" GOTO :LOCALFILE
call %BINDIR%\set-model.cmd

:LOCALFILE
type %CONFDIR%\Model.txt

:END
timeout /t 20

