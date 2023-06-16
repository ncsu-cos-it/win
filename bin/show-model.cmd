@echo off
wmic computersystem get model | findstr /v "Model"
timeout /t 20
