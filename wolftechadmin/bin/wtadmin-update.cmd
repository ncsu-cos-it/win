@echo off
set LOCALPATH=C:\Opt\wolftechadmin
powershell -noprofile -executionpolicy bypass -command %LOCALPATH%\bin\wtadmin-update.ps1
