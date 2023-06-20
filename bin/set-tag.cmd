@echo off
set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
if EXIST "%CONFDIR%\Tag.txt" GOTO :END
powershell -command %BINDIR%\sn-set.ps1 > %CONFDIR%\SN.txt
:SNFOUND
set /p SN=<%CONFDIR%\SN.txt
set SNIPEINFO=%TEMP%\%SN%.txt"
echo SN=%SN%999
powershell -command %BINDIR%\sn-query.ps1 %SN% > %SNIPEINFO%
exit 0

REM If %SNIPEINFO%  Size = 0 GOTO :VPNERROR

powershell -command %BINDIR%\sn-asset.ps1 %SN% 
del /q %SNIPEINFO%
  
GOTO :END

:VPNERROR
echo "Missing VPN Connection"

:END
