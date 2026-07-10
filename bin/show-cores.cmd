@echo off
set BINDIR="C:\opt\cos\bin"
powershell -noprofile -executionpolicy bypass -command %BINDIR%\set-cores.ps1 
timeout /t 20
