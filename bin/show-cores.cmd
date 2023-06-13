@echo off
wmic cpu get DeviceID,NumberOfCores,NumberOfLogicalProcessors
echo CORES = %NUMBER_OF_PROCESSORS%
timeout /t 20