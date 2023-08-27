sudo apt-get install nfs-common -y

sudo mkdir -p /mnt/zfspool
sudo mount 192.168.1.212:/zfspool /mnt/zfspool

sudo nano /etc/fstab

192.168.1.212:/zfspool /mnt/zfspool nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0