@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
if EXIST "%CONFDIR%\PROC.txt" GOTO :LOCALFILE
call %BINDIR%\set-proc.cmd

:LOCALFILE
type %CONFDIR%\PROC.txt

:END
set BINDIR=
set CONFDIR=
timeout /t 20
