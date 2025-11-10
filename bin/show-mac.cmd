@echo off
for /f "tokens=*" %%g IN ( getmac | findstr "\-" | findstr /r "\Device" ) do (SET MACADDR=%%g)
#for /f %%G in ("%MACADDR") do (
#	set "MAC=%%G"
#)
echo %MACADDR%
