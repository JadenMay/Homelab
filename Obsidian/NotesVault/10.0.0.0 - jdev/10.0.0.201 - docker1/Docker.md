https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

Manager

sudo docker swarm join --token SWMTKN-1-18jvx17bkkl9qxwc55zzrbl5n3fq0b09ot0ub6jclgrgeluvsz-es7xh5mq1fvr3swg7brrrawwe 10.0.0.201:2377

sudo apt-get install nfs-common -y
sudo mkdir /mnt/truenas
sudo mount -t nfs 10.0.0.150:/mnt/pool/docker /mnt/truenas