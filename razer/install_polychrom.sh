#!/bin/bash

echo "deb http://ppa.launchpad.net/polychromatic/stable/ubuntu xenial main" | sudo tee -a /etc/apt/sources.list.d/polychromatic.list
apt-key adv --recv-key --keyserver keyserver.ubuntu.com 96B9CD7C22E2C8C5
apt update
apt install polychromatic
