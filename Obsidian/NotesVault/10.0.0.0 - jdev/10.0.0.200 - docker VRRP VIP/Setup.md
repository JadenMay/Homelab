https://www.server-world.info/en/note?os=Ubuntu_22.04&p=keepalived&f=1

FIND INTERFACE
ip a

nano /etc/keepalived/keepalived.conf


```
vrrp_instance vrrp1 {   
    interface ens18   
    state MASTER   
    virtual_router_id 69   
    priority 101   
    advert_int 2     unicast_src_ip 10.0.0.201
    unicast_peer{   
        10.0.0.202 #IP of peer device   
    }
    unicast_peer{   
        10.0.0.203 #IP of peer device   
    }
    virtual_ipaddress {   
        10.0.0.200 dev ens18 label ens18:vrrpip   
    }  
}
```

```
vrrp_instance vrrp1 {   
    interface ens18   
    state BACKUP   
    virtual_router_id 69   
    priority 100  
    advert_int 2     unicast_src_ip 10.0.0.202
    unicast_peer{   
        10.0.0.201 #IP of peer device   
    }
    unicast_peer{   
        10.0.0.203 #IP of peer device   
    }
    virtual_ipaddress {   
        10.0.0.200 dev ens18 label ens18:vrrpip   
    }  
}
```


```
vrrp_instance vrrp1 {   
    interface ens18   
    state BACKUP   
    virtual_router_id 69   
    priority 99  
    advert_int 2     unicast_src_ip 10.0.0.203
    unicast_peer{   
        10.0.0.201 #IP of peer device   
    }
    unicast_peer{   
        10.0.0.202 #IP of peer device   
    }
    virtual_ipaddress {   
        10.0.0.200 dev ens18 label ens18:vrrpip   
    }  
}
```


systemctl status keepalived.service
systemctl restart keepalived.service