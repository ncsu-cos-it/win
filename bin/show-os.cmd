@echo off
systeminfo | findstr /b /c:"OS Name"
timeout /t 20
