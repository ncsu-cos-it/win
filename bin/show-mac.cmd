@echo off
getmac | findstr "\-" | findstr /r "\Device" > %MACADDR%
#for /f %%G in ("%MACADDR") do (
#	set "MAC=%%G"
#)
echo %MACADDR%
