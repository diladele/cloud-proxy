#!/bin/bash

# all packages are installed as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# install pip and some modules
apt install -y python3-pip net-tools

# install python requirements
pip3 install environs psutil

# remove old log
rm -f /var/log/cloud-proxy-sync.log

# install cloud proxy sync
MAJOR="4.0.0"
MINOR="0A21"

# download
wget https://packages.diladele.com/cloud-proxy-sync/$MAJOR.$MINOR/amd64/release/ubuntu20/cloud-proxy-sync-$MAJOR.${MINOR}_amd64.deb
wget https://packages.diladele.com/cloud-proxy-sync/$MAJOR.$MINOR/amd64/release/ubuntu20/install.sh
wget https://packages.diladele.com/cloud-proxy-sync/$MAJOR.$MINOR/amd64/release/ubuntu20/uninstall.sh
wget https://packages.diladele.com/cloud-proxy-sync/$MAJOR.$MINOR/amd64/release/ubuntu20/reinstall.sh

# install
dpkg --install cloud-proxy-sync-$MAJOR.${MINOR}_amd64.deb

# cloud proxy sync runs using the same user as squid (i.e. proxy)
chown -R proxy:proxy /opt/cloud-proxy-sync

# to let the proxy user to read logs add him to the groups too
usermod -a -G adm proxy 
usermod -a -G clamav proxy
