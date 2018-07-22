#!/bin/bash

echo 'deb http://download.opensuse.org/repositories/hardware:/razer/Debian_9.0/ /' | sudo tee -a /etc/apt/sources.list.d/hardware:razer.list
wget -nv https://download.opensuse.org/repositories/hardware:razer/Debian_9.0/Release.key -O Release.key
apt add - < Release.key
apt update
apt install openrazer-meta

#echo "deb http://ppa.launchpad.net/polychromatic/stable/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list.d/polychromatic.list
#apt-key adv --recv-key --keyserver keyserver.ubuntu.com 96B9CD7C22E2C8C5
#apt update
#apt install polychromatic
