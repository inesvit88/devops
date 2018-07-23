#!/bin/bash

USER=`whoami`
GROUP="docker"

echo -ne "[!] Proceed for user $USER ? [Enter to continue, Ctrl+C to abort] "
read
sudo apt install python3 -y
sudo apt install python3-pip -y
pip3 install selenium
pip install pytest-html
sudo apt install docker.io -y

groups $USER | grep $GROUP
if [ $? == 1 ]
  then
  echo "[+] $USER user is NOT part of $GROUP group, will add the user to the docker group now..."
  sudo usermod -a -G $GROUP $USER 
else
  echo "[.] $USER user is part of $GROUP group, do nothing..."
fi

echo "[*] cleaning up before running selenium hub docker..."
docker rm selenium-hub
docker network prune -f

docker network create grid
docker run -d -p 4444:4444 --net grid --name selenium-hub selenium/hub:3.13.0-argon
docker run -d --net grid -e HUB_HOST=selenium-hub -v /dev/shm:/dev/shm selenium/node-chrome:3.13.0-argon
sleep 5 
echo "[*] waiting for selenium hub to come up..."

python3 google_conn.py
