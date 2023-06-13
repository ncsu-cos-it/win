@echo off
netsh interface ip show address "Ethernet" | findstr "IP Address"
timeout /t 20