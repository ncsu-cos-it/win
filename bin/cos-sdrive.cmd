@echo off
REM ***********************************************************************
REM *** B: = NCSU Windows Share                                         ***
REM *** --------------------------------------------------------------- ***
REM *** Modify UNITYID to be NCSU UNITYID if local user doesn't match   ***
REM *** Example: set UNITYID=tbyron                                     ***
REM ***********************************************************************
CLS
REM set UNITYID=tbyron
set UNITYID=%USERNAME%
set CD=C:\TEMP
if exist S:\ (
    net use S: /delete /global  
)
net use S: \\ncsudrive.ncsu.edu\cos\administrative\dean /user:WOLFTECH\%UNITYID% /persistent:no
set UNITYID=
set CD=
c:\windows\explorer S:
