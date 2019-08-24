local ubuntu16.04 VM for MS SF
=======================================================

1. clone this proj

2. at head of Vagrantfile, change settings for CPU, RAM and Disk
   
3. vagrant/virtual-box default VM disk size is 10G, SF needs more than that
   install disksize plugin, resize disk to bigger size (15G):
   
   vagrant plugin install vagrant-disksize
   
4. run "vagrant up":
   sfsdk, moby deb packages will be downloaded, installed and cached in "cache" directory. 
   docker-daemon configured with local registry. 
   devcluster will have DNS enabled.
   devcluster will be started up inside VM with ip: 192.168.66.21
   point browser at SF management port (may take a while):
       http://192.168.66.21:19080
   
5. later reinstall or install for different projects will install from local cache


