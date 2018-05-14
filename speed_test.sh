#!/bin/bash

set -x

: ${1? echo "Usage: $0 <file>" }

_f=$1

time cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8192 | head -n 8192 > $_f
time curl -X POST -F file=@$_f localhost:8000
