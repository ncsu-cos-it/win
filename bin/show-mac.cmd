@echo off
set TEMPFILE=C:\Temp\MACADDR.txt
getmac | findstr "\-" | findstr /r "\Device" > %TEMPFILE%
set /p MACADDR =< %TEMPFILE%
del %TEMPFILE%
set TEMPFILE
REM for /f %%G in ("%MACADDR") do (
REM 	set "MAC=%%G"
REM )
echo %MACADDR%
