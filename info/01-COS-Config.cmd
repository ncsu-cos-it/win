@echo off
c:
cd \opt
cd \opt\cos\bin
call make-temp
call show-sn
call show-model
call show-tag
cd \opt\info
echo Move shortcuts in c:\opt\cos\info to C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup
echo Double click c:\Opt\Scrnssavr\wscreen-3840x2160.reg
