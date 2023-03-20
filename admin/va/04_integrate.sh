#!/bin/bash

# all packages are installed as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# make a new virtual environment
cd /opt/cloud-proxy-admin && sudo -u proxy virtualenv env

# install some required packages into the virtual environment
sudo -u proxy /opt/cloud-proxy-admin/env/bin/pip install \
   django==4.1.4           \
   environs                \
   dj-database-url         \
   django-allauth          \
   cryptography==39        \
   pandas==1.4.2

# enable apache module
a2enmod ssl

# disable default sites
a2dissite 000-default
a2dissite default-ssl

# enable ours 
a2ensite cloud-proxy-admin

# restart apache just in case
systemctl restart apache2

# and start the reatime traffic reporting
systemctl start cloud-proxy-traffic-realtime
