#!/bin/bash

ERROR=false

if [ $# -eq 0 ]; then
URL="http://api.icndb.com/jokes/random"
elif [ $# -gt 1 ] && [ $# -lt 3 ]; then
URL="http://api.icndb.com/jokes/random?firstName=${1}&lastName=${2}"
else
Error=true
fi

if [ $Error ]; then
JOKE="Error: ....only 1 argument found. You must past atleast 2 a first and last name or nothing at all."
else
JOKE=$(curl -s \
  -H'Content-Type: application/json' \
   $URL \
 | python -c "import sys, json; print json.load(sys.stdin)['value']['joke']")
fi
echo $JOKE
