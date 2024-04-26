@echo off
FOR /F "tokens=2 delims='='" %%A in ('wmic ComputerSystem Get Model /value') do SET model=%%A
REM echo %model%
set model=%model: =_%
echo %model%
timeout /t 20
