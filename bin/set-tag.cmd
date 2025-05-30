@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
set /p SN=<%CONFDIR%\SN.txt
if EXIST "%CONFDIR%\Tag.txt" GOTO :END
if EXIST "%CONFDIR%\SN.txt" GOTO :SNFOUND
powershell -noprofile -executionpolicy bypass -command %BINDIR%\sn-set.ps1 > %CONFDIR%\SN.txt
set SNIPEINFO=%TEMP%\%SN%.txt"
powershell -noprofile -executionpolicy bypass -command %BINDIR%\sn-query.ps1 %SN% > %SNIPEINFO%

REM If %SNIPEINFO%  Size = 0 GOTO :VPNERROR
:SNFOUND
powershell -noprofile -executionpolicy bypass -command %BINDIR%\sn-asset.ps1 %SN% 
del /q %SNIPEINFO%
  
GOTO :END

:VPNERROR
echo "Missing VPN Connection"

:END
set SNIPEINFO=
set SN=
