#!/bin/sh

FILES=`ls -1 br-*_config.ini`  
if [ -f br-config.ini ] ; then
   /bin/rm br-config.ini
fi
head -5 br-2216_config.ini > br-config.ini
for a in $FILES; do
    cat $a | grep -v General | grep -v broadcast | grep -v \# >> br-config.ini
done
