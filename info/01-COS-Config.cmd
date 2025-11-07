@echo off
c:
cd \opt
cd \opt\cos\bin
call make-temp
call show-sn
call show-model
call show-tag
setx PATH %PATH%;c:\opt\cos\bin /M
cd \opt\info
echo Move shortcuts in c:\opt\cos\info to C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup
