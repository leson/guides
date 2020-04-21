# Operate System Installation

## write img file to sd card
```bash
# for example to install OpenELEC as below

sudo dd bs=4M if=/home/${USER}/Downloads/OpenELEC-RPi2.arm-8.0.4.img of=/dev/mmcblk0 && sync

# you'd better to write to disk instead of partition
```

> Note: img file and mmcblk0 depends on yourself device

the approach to view as below:

```bash
df -h

lsblk --fs 
```


[tools on linux to write img to sd card](https://github.com/resin-io/etcher/)

# OS Configuration
## WiFi Info 
- append WiFi ssid and password to `/etc/wpa_supplicant/wpa_supplicant.conf`
```bash
network={
        ssid="wifi-name"
        psk="wifi password"
}
```
## Communication with SSH
> SSH disabled by default; can be enabled by creating a file with name "ssh" in boot partition
- create `ssh` file under partition `/boot`
```shell
touch /boot/ssh 
```