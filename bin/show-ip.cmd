@echo off
# netsh interface ip show address "Ethernet" | findstr "IP Address"
ipconfig | findstr "IPv4"
timeout /t 20
