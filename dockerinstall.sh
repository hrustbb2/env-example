#!/usr/bin/env bash

sudo apt install curl

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo groupadd docker
sudo gpasswd -a $USER docker

sudo apt install python3
sudo apt install python3-pip
pip3 --no-cache-dir install pyyaml
pip3 --no-cache-dir install configparser
