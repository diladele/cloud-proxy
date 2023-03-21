#!/bin/bash

#
# this script is used to prepare virtual appliances of Cloud Proxy for 
# VMware ESXi/vSphere and Microsoft Hyper-V - it should NOT be run when
# preparing images for Microsoft Azure and Amazon AWS
#

# all packages are installed as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# copy the /etc/issue creation script to installation folder
cp va_issue.sh /opt/websafety/bin/

# make script executable
chmod +x /opt/websafety/bin/va_issue.sh

# create systemd service that runs everytime network is restarted to 
# update the /etc/issue login banner
cp wsissue.service /etc/systemd/system/wsissue.service

# enable it
systemctl enable wsissue.service

#
# adjust vmware tools
#
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
echo "SUCCESS --- Cloud Proxy Admin Appliance is ready ---"
echo "SUCCESS"
echo "SUCCESS"
