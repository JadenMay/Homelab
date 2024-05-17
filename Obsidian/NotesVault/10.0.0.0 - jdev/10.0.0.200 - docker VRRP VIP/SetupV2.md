# Docker Swarm

https://akshayuppal90.medium.com/setting-up-a-ha-cluster-using-docker-swarm-and-keepalived-f158aeba2fe9

A **Docker Swarm** is a group of either physical or virtual machines that are running the **Docker** application and that have been configured to join together in a cluster. For basics on Docker and containers, I would suggest to read the [official Docker documentation](https://docs.docker.com/get-started/overview/).

Using Docker Swarm provides many benefits, like: easy scaling, high availability and rolling updates.

We can have two types of nodes in a Docker Swarm: **manager nodes** and **worker nodes**. **Manager nodes** perform the orchestration and cluster management functions required to maintain the desired state of the swarm. Manager nodes elect a single leader to conduct orchestration tasks. **Worker nodes** receive and execute tasks dispatched from manager nodes. By default manager nodes also run services as worker nodes, but you can configure them to run manager tasks exclusively and be manager-only nodes. For my project, I had three nodes, all of which were managers as well as workers. There are several pros and cons of going with this approach, which are discussed nicely in this [Stack Overflow post](https://stackoverflow.com/questions/48853473/pros-and-cons-of-running-all-docker-swarm-nodes-as-managers). For the approach discussed in this article, I would suggest you also go with the all managers — all workers way.

Make sure you have the same version of Docker (Docker Engine 1.12 or newer) installed on all the hosts.

The following ports must be available.

- **TCP port 2377** for cluster management communications
- **TCP** and **UDP port 7946** for communication among nodes
- **UDP port 4789** for overlay network traffic

To initialise the swarm, go to any node and run this command:

`docker swarm init`

To add other nodes to the swarm (as both managers and workers); first, run this command on the manager node (we currently have a single manager node in the swarm):

`docker swarm join-token manager`

You would get an output like this:

To add a manager to this swarm, run the following command:  
  
    docker swarm join \  
    --token <token_id>\  
    <IP>:<PORT>

Now, run the command obtained from this output, on **each** node that you want to include in your Docker Swarm.

After that, to deploy a service to our Docker swarm we use the **docker service create** command on any **one** manager. Make sure that the docker image you specify in this command is present on all the hosts.

docker service create --replicas <replica_number> -p <host_port>:<container_port> --name <service_name> <docker_image_name>

Running this command will deploy **replica_number** of Docker containers, created from the **docker_image_name** image, across the hosts in your Docker Swarm. The **host_port** and the **container_port** can be provided to specify the port that is exposed on the host, as well as the port that is exposed inside the Docker container. You can verify that your service is running or not by using the command below:

`docker service ps <service_name>`

You should get an output like this:

NAME      IMAGE   NODE     DESIRED STATE  CURRENT STATE<name>    <image> <node>   Running        Running 2 minutes

#Keepalived 

Now that we have a Docker Swarm ready to serve web pages, we need a floating IP setup to ensure that we have high availability. The way it works is: suppose, the machine which currently has the floating IP goes down, the floating IP shifts (or floats) to another machine which is reachable. This way it is ensured that any request coming at the floating IP is directed to a Docker Swarm manager host at all times.

One question you might have on your mind: What if a request comes to the host / node which has no running container of the particular service present?The answer: Docker Swarm does internal routing using the [routing mesh](https://docs.docker.com/engine/swarm/ingress/).

We are going to use **Keepalived** for this floating IP setup.

Keepalived uses the **VRRP protocol** for failing-over an IP address from one machine to another. The hosts send advertisements to each other at some specified interval to check each other’s status.

First, you need to reserve an IP, that will act as the floating IP. Then, install Keepalived on all the hosts. Since I had **Centos** machines, I used the **yum** command (you can use a different installation command based on your OS):

apt install keepalived -y

The configuration file for Keepalived is located at `/etc/keepalived/keepalived.conf`

nano /etc/keepalived/keepalived.conf

ip a (find interface name)

docker1:

vrrp_instance VI_1 {
    state MASTER
    interface ens18
    virtual_router_id 69
    priority 100
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass passw123
    }
    virtual_ipaddress {
    10.0.0.200
    }
}

docker2:

vrrp_instance VI_1 {
    state BACKUP
    interface ens18
    virtual_router_id 69
    priority 75
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass passw123
    }
    virtual_ipaddress {
    10.0.0.200
    }
}

docker3:

vrrp_instance VI_1 {
    state BACKUP
    interface ens18
    virtual_router_id 69
    priority 50
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass passw123
    }
    virtual_ipaddress {
    10.0.0.200
    }
}

systemctl restart keepalived.service
systemctl stop keepalived.service
systemctl start keepalived.service

For the minimal setup, you need to make sure that you enter the reserved floating IP in the **virtual_ipaddress** part of the configuration file. Also, the **state** would be **MASTER** for the main host (the one which will have the floating IP in the beginning) and **BACKUP** for all the other hosts.

Once you have setup the configuration files on **all** the hosts, you need to start Keepalived on **all** the hosts using the command:

systemctl start keepalived

Now the floating IP can be given to the customers for accessing the website.

If everything progressed smoothly, you are done with your HA cluster setup!