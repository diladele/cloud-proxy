#!/bin/bash

# all web packages are installed as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# install pip3
apt -y install python3-pip python3-virtualenv

# install apache and mod_wsgi and some other useful programs
apt -y install apache2 libapache2-mod-wsgi-py3 htop mc
