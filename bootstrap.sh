#!/bin/bash

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
apt-get update
apt-get install -y lxc-docker
# Specific version
# apt-get install -y lxc-docker-1.7.0

# enable non-root use by vagrant user
groupadd docker
gpasswd -a vagrant docker
