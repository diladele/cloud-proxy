# Cloud Proxy Admin Virtual Appliance

To prepare the cloud-proxy-admin virtual machine, deploy a new Ubuntu 20.04 virtual machine named ``cloud-proxy-admin`` into your virtual infrastructure (VMware ESXi or Microsoft Hyper-V), upload **all files** from folder this folder to that machine and run them being ``root`` as shown below.

```bash
    bash 01_update.sh
    bash 02_apache.sh
    bash 03_admin.sh
    bash 04_integrate.sh
    base 05_image.sh
```
From now on it is **only** possible to login as ``root`` user with ``Passw0rd`` password from console and ``admin@example.com`` user with ``Passw0rd`` password from HTTPS.
