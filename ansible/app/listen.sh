#!/bin/bash
mydir=$(cd $(dirname $0);pwd)
logfile=/var/log/nginx/access.log
echo "Starting listening process ... (reading from $logfile)"
tail -n 1 -f $logfile | python3 $mydir/listen.py
echo "Finished listening process"