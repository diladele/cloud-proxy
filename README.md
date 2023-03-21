# Cloud Proxy Project

This repo contains all scripts we use to make two virtual appliances for the Cloud Proxy Project.

## Admin UI

To prepare the ``cloud-proxy-admin`` virtual appliance, deploy a new Ubuntu 20.04 virtual machine named ``cloud-proxy-admin`` into your virtual infrastructure (VMware ESXi or Microsoft Hyper-V), upload all files from ``admin/va`` folder to that machine and run them being ``root`` as shown below.

```bash
    bash 01_update.sh
    bash 02_apache.sh
    bash 03_admin.sh
    bash 04_integrate.sh
    base 05_image.sh
    halt -p
```
From now on it is **only** possible to login as ``root`` user with ``Passw0rd`` password from terminal console and ``admin@example.com`` user with ``Passw0rd`` password using your browser.
