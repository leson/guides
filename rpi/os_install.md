# Operate System Installation

## format SD card
1. list sd partitions

   ```shell
   cat /proc/partitions
   # or
   df -h
   # or 
   lsblk --fs
   # or
   sudo fdisk -l
   ```

2. umount device

   ```shell
   umount /dev/sdc1
   umount /dev/sdc2
   ```

   > `sdc1` and `sdc2` was the partitions that show in step 1.

3. format sd

- enter the disk format model

    ```shell
    sudo fdisk /dev/sdc
    ```

- delete existing partitions `d`

    > if have multiple partitions ,delete the partition one by one 

- create new partition `n`, as primary partition `p`

- change partition type from `linux` to `FAT32` with `t`

  > don't know why need use `FAT32` 

- change the partition as bootable with `a`

- Important steps: write the new partition table to SD card with `w`

- format the partition with `mkfs.vfat`

  ```shell
  sudo mkfs.vfat /dev/sdc1
  ```

## write img file to sd card

```bash
# for example to install raspbian buster lite as below

sudo dd bs=4M if=/home/${USER}/Downloads/2020-02-13-raspbian-buster-lite.img of=/dev/sdc && sync

```

> Note: img file and `/dev/sdc` depends on yours
>
> **write to disk (`/dev/sdc`) instead of partition (`/dev/{sdc1,sdc2}`)**

[tools on linux to write img to sd card](https://github.com/resin-io/etcher/)

# OS Configuration
## WiFi Info 
- append WiFi ssid and password to `/etc/wpa_supplicant/wpa_supplicant.conf`

  ```shell
  ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
  update_config=1
  network={
      ssid="wifi-name"
      psk="wifi password"
  }
  ```

## Communication with SSH
> SSH disabled by default; can be enabled by creating a file with name "ssh" in boot partition
- create `ssh` file under partition `/boot`

  ```shell
  sudo mkdir -p /media/rpi-boot
  sudo mount /dev/sdc1 /media/rpi-boot
  touch /media/rpi-boot/ssh
  ```

# reference 

[linux install rpi os](http://qdosmsq.dunbar-it.co.uk/blog/2013/06/noobs-for-raspberry-pi/)