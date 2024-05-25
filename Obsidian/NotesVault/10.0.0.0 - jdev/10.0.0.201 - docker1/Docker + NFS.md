https://docs.docker.com/engine/install/ubuntu/
https://docs.docker.com/engine/swarm/swarm-mode/ if more than 1 node

If you deploy a stack and it doesn't publish ports (Portainer) ensure your node isn't part of a swarm



sudo apt-get install nfs-common -y
sudo mkdir /mnt/truenas
sudo mkdir /mnt/notpiracy
sudo mkdir /mnt/tnssd

nano /etc/fstab

10.0.0.150:/mnt/pool/docker /mnt/truenas nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0

10.0.0.150:/mnt/pool/notpiracy /mnt/notpiracy nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0

10.0.0.150:/mnt/SSD/arrs /mnt/tnssd nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0

mount -a







docker compose -f example.yml up -d
