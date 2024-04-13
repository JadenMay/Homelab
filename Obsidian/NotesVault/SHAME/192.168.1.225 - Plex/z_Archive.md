
On Motherbase for SMB share: plexmox-Pa$$w0rd  
[https://linuxhint.com/mount-smb-shares-on-ubuntu/](https://linuxhint.com/mount-smb-shares-on-ubuntu/)  
/plex/movies  
/plex/shows  
Firewall rule on Motherbase to open port 445 for Samba  
  
sudo mount -t cifs -o rw,vers=3.0,credentials=/root/.creds //192.168.1.201/plexmotherbase /plexmotherbase  
