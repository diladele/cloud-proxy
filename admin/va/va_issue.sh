#!/bin/bash

CPUNUM=`cat /proc/cpuinfo | grep processor | wc -l`
RAMNFO=`free -mh | grep Mem: | awk {'print $2, "total,", $4, "free" '}`
DISKSZ=`df -h | grep "/$" | awk {'print $2, "total,", $4, "free" '}`
#VA_VER=`/opt/websafety/bin/ldap --version`
VA_VER="4.0"

# some string manupulation magic
OSINFO_TMP1=`cat /etc/os-release | grep ^VERSION=`
OSINFO_NAME=${OSINFO_TMP1#VERSION=}
OSINFO_NAME=${OSINFO_NAME#\"}
OSINFO_NAME=${OSINFO_NAME%\"}

OSINFO_TMP2=`cat /etc/os-release | grep ^NAME=`
OSINFO_DIST=${OSINFO_TMP2#NAME=}
OSINFO_DIST=${OSINFO_DIST#\"}
OSINFO_DIST=${OSINFO_DIST%\"}

echo "Welcome to Cloud Proxy Admin UI virtual appliance!"
echo 
echo "Operating System    $OSINFO_DIST, $OSINFO_NAME"
echo "System Kernel       \\r"
echo "System Arch         \\m"
echo "RAM Available       $RAMNFO"
echo "CPU Count           $CPUNUM"
echo "Hard Disk Size      $DISKSZ"
echo
echo "Appliance Version   $VA_VER"
echo "System Username     root (can only login in console, ssh network login is disabled)"
echo "System Password     Passw0rd (or whatever you set it to when creating this appliance)"
echo "Installation Dir    /opt/cloud-proxy-admin"
echo 
if [ -f /etc/centos-release ] || [ -f /etc/redhat-release ]
then
    echo "To use this Virtual Appliance - adjust your browser proxy settings to point"
    echo "to the IP address or domain name of this box (port 3128) and browse the web."
    echo 
    echo "Admin UI is available at http://\\4:80"
else
    echo "To use Cloud Proxy Admin UI, navigate to http://\\4:80"
    echo "Default credentials for Admin UI are admin@example.com and Password."
    echo 
    echo "Deploy as many Cloud Proxy Nodes as needed and integrate them with"
    echo "this Admin UI as explained on https://cloudproxy.diladele.com"
fi
echo 
echo    