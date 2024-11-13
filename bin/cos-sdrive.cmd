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
net use S: \\wolftech.ad.ncsu.edu\oit\shares\COSDEAN /user:WOLFTECH\%UNITYID% /persistent:no
c:\windows\explorer S: