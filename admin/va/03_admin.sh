#!/bin/bash

# all packages are installed as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# remove possibly exising old files
rm -f install.sh
rm -f uninstall.sh
rm -f reinstall.sh
rm -f cloud-proxy-admin-*.deb

# download cloud proxy admin ui
MAJOR="4.0.0"
MINOR="8BE5"

# download
wget https://packages.diladele.com/cloud-proxy-admin/$MAJOR.$MINOR/amd64/release/ubuntu20/cloud-proxy-admin-$MAJOR.${MINOR}_amd64.deb
wget https://packages.diladele.com/cloud-proxy-admin/$MAJOR.$MINOR/amd64/release/ubuntu20/install.sh
wget https://packages.diladele.com/cloud-proxy-admin/$MAJOR.$MINOR/amd64/release/ubuntu20/uninstall.sh
wget https://packages.diladele.com/cloud-proxy-admin/$MAJOR.$MINOR/amd64/release/ubuntu20/reinstall.sh

# and install it
bash reinstall.sh

