@echo off
md \Temp
Icacls "\Temp" /grant "Authenticated Users":(OI)(CI)F /T /C /L /Q
