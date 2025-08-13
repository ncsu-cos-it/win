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
set OHOMEDRIVE=%HOMEDRIVE%
set OHOMEPATH=%HOMEPATH%
REM STAT Stuff
if DEFINED NCSU set NCSUDRIVE=%NCSU:~0,2%
if NOT "%NCSUDRIVE%" == "%HOMEDRIVE%" (
   set HOMEPATH=\
   set HOMEDRIVE=%NCSUDRIVE%
)
echo Email:    help@sciencesncsu.edu > %HOMEDRIVE%%HOMEPATH%\Desktop\COS-INFO.txt
echo HostName: %COMPUTERNAME% >> %HOMEDRIVE%%HOMEPATH%\Desktop\COS-INFO.txt
echo Tag:      %TAG%        >> %HOMEDRIVE%%HOMEPATH%\Desktop\COS-INFO.txt
echo IP:       %IP%         >> %HOMEDRIVE%%HOMEPATH%\Desktop\COS-INFO.txt
if EXIST "%HOMEDRIVE%%HOMEPATH%\Desktop\COS-INFO.txt" type %HOMEDRIVE%%HOMEPATH%\Desktop\COS-INFO.txt
set SN=
set TAG=
set IP=
set BINDIR=
set CONFDIR=
REM set HOMEDRIVE=%OHOMEDRIVE%
REM set HOMEPATH=%OHOMEPATH%
REM set OHOMEDRIVE=
REM set OHOMEPATH=
timeout /t 20
