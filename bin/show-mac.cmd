@echo off
set TEMPFILE="C:\Temp\MACADDR.txt"
getmac | findstr "\-" | findstr /r "\Device" > %TEMPFILE%
set /p MACADDR=<%TEMPFILE%
REM del %TEMPFILE%
REM set TEMPFILE
for /f %%G in ("%MACADDR%") do (
set "MAC=%%G"
)
echo %MACADDR%
echo %MAC%
