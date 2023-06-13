@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
if EXIST "%CONFDIR%\Tag.txt" GOTO :LOCALFILE
call %BINDIR%\set-tag.cmd

:LOCALFILE
type %CONFDIR%\Tag.txt

:END
timeout /t 20
