1st step: increase/resize disque from GUI console 

2nd step : Extend physical drive partition 

check free space
$sudo fdisk -l 

Extend physical drive partition
$growpart /dev/sda 3 

Check physical drive
$pvdisplay

Instruct LVM that disk size has changed
$sudo pvresize /dev/sda3

check physical drive if has changed
$pvdisplay

3rd step: Extend Logical volume 

View starting LV
$lvdisplay

Resize LV
$sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv 

View changed LV
$lvdisplay

4th step : Resize Filesystem 

$resize2fs /dev/ubuntu-vg/ubuntu-lv 

Confirm results
$fdisk -l