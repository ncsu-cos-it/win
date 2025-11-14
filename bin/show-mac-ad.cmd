@echo off
set TEMPFILE="C:\Temp\MACADDR.txt"
getmac | findstr "\-" | findstr /r "\Device" > %TEMPFILE%
set /p MACADDR=<%TEMPFILE%
del %TEMPFILE%
for /f %%G in ("%MACADDR%") do (
set "MAC=%%G"
)
set NMAC=%MAC:-=%

REM Convert to LowerCase
setlocal enabledelayedexpansion

REM ***** Modify as necessary for the string source. *****
set "_STRING=%*"
if not defined _STRING set "_STRING=%NMAC%"
REM set _STRING
REM ***** Modify as necessary for the string source. *****

set "_UCASE=ABCDEFGHIJKLMNOPQRSTUVWXYZ"
set "_LCASE=abcdefghijklmnopqrstuvwxyz"

for /l %%a in (0,1,25) do (
   call set "_FROM=%%_UCASE:~%%a,1%%
   call set "_TO=%%_LCASE:~%%a,1%%
   call set "_STRING=%%_STRING:!_FROM!=!_TO!%%
)

echo %_STRING%
endlocal
REM echo %NMAC%
