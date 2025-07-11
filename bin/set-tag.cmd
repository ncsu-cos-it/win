@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
if EXIST "%CONFDIR%\Tag.txt" GOTO :END
powershell -noprofile -executionpolicy bypass -command %BINDIR%\sn-set.ps1 > %CONFDIR%\SN.txt
:SNFOUND
set /p SN=<%CONFDIR%\SN.txt
set SNIPEINFO=%TEMP%\%SN%.txt"
powershell -noprofile -executionpolicy bypass -command %BINDIR%\sn-query.ps1 %SN% > %SNIPEINFO%

REM If %SNIPEINFO%  Size = 0 GOTO :VPNERROR

powershell -noprofile -executionpolicy bypass -command %BINDIR%\sn-asset.ps1 %SN% 
REM del /q %SNIPEINFO%
  
GOTO :END

:VPNERROR
echo "Missing VPN Connection"

:END
set SNIPEINFO=
set SN=