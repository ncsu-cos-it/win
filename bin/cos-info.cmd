@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="c:\opt\cos\etc"
if EXIST "%CONFDIR%\Tag.txt" GOTO :LOCALFILE
call %BINDIR%\set-tag

:LOCALFILE
call %BINDIR%\set-ip
set /p SN=<%CONFDIR%\SN.txt
set /p TAG=<%CONFDIR%\Tag.txt
set /p IP=<%CONFDIR%\IP.txt
if EXIST %NCSU% set USERPROFILE=S:\
echo Email:    help@sciencesncsu.edu > %USERPROFILE%\Desktop\COS-INFO.txt
echo HostName: %COMPUTERNAME% >> %USERPROFILE%\Desktop\COS-INFO.txt
echo Tag:      %TAG%        >> %USERPROFILE%\Desktop\COS-INFO.txt
echo IP:       %IP%         >> %USERPROFILE%\Desktop\COS-INFO.txt
if EXIST "%USERPROFILE%\Desktop\COS-INFO.txt" type %USERPROFILE%\Desktop\COS-INFO.txt
set SN=
set TAG=
set IP=
set BINDIR=
set CONFDIR=
set USERPROFILE=%HOMEDRIVE%%HOMEPATH%
timeout /t 20
