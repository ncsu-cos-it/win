@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
if EXIST "%CONFDIR%\Model.txt" GOTO :LOCALFILE
call %BINDIR%\set-model.cmd

:LOCALFILE
type %CONFDIR%\Model.txt

:END
set BINDIR=
set CONFDIR=
timeout /t 20

