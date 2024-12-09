@echo off
powershell -noprofile -executionpolicy bypass -command %BINDIR%\cores-set.ps1 
timeout /t 20
