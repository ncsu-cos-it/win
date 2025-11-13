@echo off

set BINDIR="C:\opt\cos\bin"
set CONFDIR="C:\opt\cos\etc"
echo Variable=%1
if "%1" == "" (
   set /p SN=<%CONFDIR%\SN.txt
) ELSE (
   set SN=%1
)
echo SN=%SN%
powershell -noprofile -executionpolicy bypass -command %BINDIR%\dell-warranty-info.ps1 -ServiceTag %SN%

:END
set BINDIR=
set CONFDIR=
timeout /t 20
