@echo off
c:
if not exist %appdata%\jupyter md %appdata%\jupyter

:PERMS
if exist "%userprofile%\.cos-jhub" GOTO :END
Icacls %appdata%\jupyter /grant:r "Everyone":(OI)(CI)F /T /C /L /Q

set datestr=%date%
set result=%datestr:/=-%
@echo %result% > %userprofile%\.cos-jhub

:END
set datestr=
set result=

