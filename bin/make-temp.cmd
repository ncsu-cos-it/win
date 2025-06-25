@echo off
md \Temp
Icacls "\Temp" /grant "Everyone":(OI)(CI)F /T /C /L /Q
