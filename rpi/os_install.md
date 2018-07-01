# Operate System Installation

## write img file to sd card
```bash
# for example to install OpenELEC as below

sudo dd bs=4M if=/home/${USER}/Downloads/OpenELEC-RPi2.arm-8.0.4.img of=/dev/mmcblk0 && sync

# you'd better to write to disk instead of partition
```

> Note: img file and mmcblk0 depends on yourself device

the method to view as below:

```bash
df -h

lsblk --fs 
```
