@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
if EXIST "%CONFDIR%\Tag.txt" GOTO :LOCALFILE
call %BINDIR%\set-tag.cmd

:LOCALFILE
type %CONFDIR%\Tag.txt

:END
set BINDIR=
set CONFDIR=
timeout /t 20
