#!/bin/bash

#docker build -t testautomation-ms:1.2 .

#docker network create grid \
#  && docker run -d -p 4444:4444 --net grid --name selenium-hub selenium/hub:3.13.0-argon \
#  && docker run -d --net grid -e HUB_HOST=selenium-hub -v /dev/shm:/dev/shm selenium/node-chrome:3.13.0-argon

docker exec -it foo /usr/bin/python3 /opt/pytest/google_conn.py
