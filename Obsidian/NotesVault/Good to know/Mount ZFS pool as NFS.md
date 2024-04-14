sudo apt-get install nfs-common -y

TrueNAS NFS Mount (docker)
sudo mkdir -p /mnt/truenas
sudo mkdir -p /mnt/notpiracy
sudo mount 10.0.0.150:/mnt/pool/docker /mnt/truenas
sudo mount 10.0.0.150:/mnt/pool/notpiracy /mnt/notpiracy

sudo nano /etc/fstab

10.0.0.150:/mnt/pool/docker /mnt/truenas nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
10.0.0.150:/mnt/pool/notpiracy   /mnt/notpiracy   nfs4    netdev,auto  0  0


sudo mount -a