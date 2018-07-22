#!/bin/bash

set +x

: ${1? echo "Usage: $0 <file>" }

_f=$1

cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8192 | head -n 8192 > $_f

echo "Testing curl..."
time curl -X POST -F file=@$_f -s -o /dev/null localhost:8888

echo "Testing wget..."
time wget -q --post-file $_f http://localhost:8888 -O /dev/null 
