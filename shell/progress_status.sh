#!/bin/bash
while true; do echo -n .; sleep 1; done &

trap 'kill $!' SIGTERM SIGKILL

echo "Running x command: "
sleep 10
echo done

kill $!
