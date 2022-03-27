# partition Device (disk)

## view device file system type and partitions
```bash
sudo fdisk -l
sudo lsblk -f
cat /proc/partitions
df -h
```

## create partitions
1. umount partition if has been mounted

    > check if the partition has been mounted via `df -h`

    ```shell
    umount /dev/sdX1
    umount /dev/sdXN
    ## X in {a,b,c,d,e,...}
    ## N in {1,2,3,...}
    ## view those info via above command,such as:
    sudo lsblk -f
    ```

2. create partitions
    - enter the disk 
        ```shell
        sudo fdisk /dev/sdX
        
        ```

    - delete existing partitions `d`
        > if have multiple partitions ,delete the partition one by one 

    - create new partition `n`, as primary partition `p`

    - (Optional) change partition type with `t`
        > choice that you'd like to using partition type

    - Important steps: write the new partition table to SD card with `w`

## format the partition with `mkfs.ext4`

    ```shell
    sudo mkfs.ext4 /dev/sdXN
    ```

    ```bash
    $> sudo mkfs.ext4 /dev/sdb1
    mke2fs 1.44.5 (15-Dec-2018)
    /dev/sdb1 contains a ext4 file system
            created on Sun Mar 27 18:00:28 2022
    Proceed anyway? (y,N) y
    Creating filesystem with 488378389 4k blocks and 122101760 inodes
    Filesystem UUID: ab673ed4-8ab9-42b9-a0bd-711c78190817
    Superblock backups stored on blocks: 
            32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
            4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968, 
            102400000, 214990848

    Allocating group tables: done                            
    Writing inode tables: done                            
    Creating journal (262144 blocks): done
    Writing superblocks and filesystem accounting information: done  
    ```

## mount partitions
```shell
sudo mkdir -p /mnt/hdd
sudo mount /dev/sdXN /mnt/hdd
df -h
```