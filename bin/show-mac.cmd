@echo off
set TEMPFILE="C:\Temp\MACADDR.txt"
getmac | findstr "\-" | findstr /r "\Device" > %TEMPFILE%
set /p MACADDR=<%TEMPFILE%
del %TEMPFILE%
for /f %%G in ("%MACADDR%") do (
set "MAC=%%G"
)
set NMAC=%MAC:-=:%
echo %NMAC%
