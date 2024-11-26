@echo off
powershell -noprofile -executionpolicy bypass -command c:\opt\cos\bin\wol.ps1 %~1 %~2 %~3 %~4
