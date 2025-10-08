#!/usr/bin/env python3

#
import re
import glob
import os

# Get the first 5 lines of a ini file.)
f = open("br-2216_config.ini", "r")
o = open("br-config.ini", "w")
line=5
for x in range(line):
    a = f.readline()
    o.write(a)
    # print (a)


conf_files = glob.glob('br-*_config.ini')

for nextfile in conf_files:
   # print(nextfile)
   with open(nextfile) as ini_file:
     for line in ini_file:
       match1 = re.search(r'broadcast',line)
       match2 = re.search(r'General',line)
       match3 = re.search(r'\#',line)
       if not (match1 or match2 or match3):
          # print (line)
          o.write (line)

o.close()
