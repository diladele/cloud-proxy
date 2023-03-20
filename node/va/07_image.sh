#!/bin/bash

# all packages are installed as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# remove old packages
apt -y autoremove

# set new license
if [ -f license.pem ]; then
    sudo -u proxy cp license.pem /opt/websafety/etc/license.pem
fi

# install vm tools (only if vmware is detected)
dmidecode -s system-product-name | grep -i "vmware" > /dev/null
if [ $? -eq 0 ]; then
    echo "Detected VMware, installing open-vm-tools..."
    apt update > /dev/null
    apt install -y open-vm-tools

    # whould we also reset the machine-id to force different dhcp addreses?
    # see https://kb.vmware.com/s/article/82229
    echo -n > /etc/machine-id
    rm /var/lib/dbus/machine-id
    ln -s /etc/machine-id /var/lib/dbus/machine-id
fi

# reset system root password to match documented one
sudo echo root:Passw0rd | sudo chpasswd

# disable the user we used to build this virtual appliance
passwd builder -l

# tell 
echo "SUCCESS"
echo "SUCCESS"
echo "SUCCESS --- Cloud Proxy Node Appliance is ready ---"
cat /opt/websafety/etc/license.pem | grep "Not After"
echo "SUCCESS"
echo "SUCCESS"
