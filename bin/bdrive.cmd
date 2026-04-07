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
if exist B:\ (
    net use B: /delete   
)
REM net use B: \\%UNITYID%.file.ncsu.edu\ncsu\%UNITYID% /user:WOLFTECH\%UNITYID% /persistent:no
net use B: \\ncsudrive.ncsu.edu\home /user:WOLFTECH\%UNITYID% /persistent:no
c:\windows\explorer B:
set UNITYID=
set CD=
