#!/bin/bash

#Cleanup, version 2

LOG_DIR=/var/log
ROOT_UID=0
LINES=50
E_XCD=66
E_NOTROOT=67

if [ "$UID" -ne "$ROOT_UID" ]
then
    echo "Must be root to run this script."
    exit
fi

if [ -n "$1" ]
then
    lines=$1
else
    lines=$LINES
fi

cd $LOG_DIR

if [ `pwd` != "$LOG_DIR" ]
then
    echo "Can not change to $LOG_DIR"
    exit $E_XCD
fi

tail -n $lines messages > mesg.temp
mv mesg.temp messages

cat /dev/null >wtmp
echo "Logs cleaned up"

exit 0
