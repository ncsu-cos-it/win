@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
if EXIST "%CONFDIR%\SN.txt" GOTO :LOCALFILE
call %BINDIR%\set-sn.cmd

:LOCALFILE
type %CONFDIR%\SN.txt

:END
timeout /t 20
