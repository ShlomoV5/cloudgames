#!/bin/bash -x
mydir=$(cd $(dirname $0);pwd)
echo "$(date) Starting listening process ....."
while : ; do
nc -l -p 80 
done | python3 $mydir/update.py
echo "$(date) Process ended."
