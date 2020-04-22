# 前言：
> 新入手树莓派 2 ，无线网卡死活连接不上局域网。痛苦了三天。真的需要恶补一下网络知识了。

### 硬件
1. Raspberry pi 2 
2. edup （Realtek Semiconductor Corp. RTL8188CUS 802.11n WLAN Adapter）
### OS 
    Raspbian jessie 4.1

# 一、检测
1. 无线网卡驱动是否安装，系统是否能识别无线网卡
    ```bash
    $>lsusb
    ```
2. 模块是否加载
    ```bash
    $>lsmod
    ```
3. 是否分配IP
    ```bash
    ifconfig 
    iwconfig 
    iwlist
    ```
# 二、解决
1. 连接上有线 (or monitor)

    为了可以SSH操作pi

2. 更新系统
   
    ```bash
    sudo apt-get update     #更新软件信息数据库
    sudo apt-get upgrade    #系统升级
    ```


3. 配置网络（网卡驱动正常的情况下）

    1> 查看网络配置 `cat /etc/network/interfaces`
    ```bash
    # Include files from /etc/network/interfaces.d:
    source-directory /etc/network/interfaces.d
    auto lo
    iface lo inet loopback
    auto eth0
    iface eth0 inet dhcp
    
    auto wlan0
    allow-hotplug wlan0
    iface wlan0 inet static
    address 192.168.1.66
    netmask 255.255.255.0
    gateway 192.168.1.1
    network 192.168.1.1
    
    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
    ```

    change to `auto wlan0` if you wireless adptor named "wlan0"

    2>更改获取ip的方式（从manual 到dhcp）[Optional Step]
    ```bash
    sudo sed -i "s/manual/dhcp/g"  /etc/network/interfaces
    ```
    3>切换到root 账号
    ```bash
    sudo su
    ```
    4>在root 账号下添加wifi 热点到配置文件，方便使用。
    ```bash
    wpa_passphrase    [your-wifi-name]   [your-wifi-password]  >> /etc/wpa_supplicant/wpa_supplicant.conf 
    ```
    5>重启网络服务
    ```bash
    $>sudo service  networking   restart
    ```
    6>如果正常应该有ip分配到无线网卡上了。

    7>如果还是不行，请考虑　`raspi-config`  gui 方式配置network





[网上有人遇到同样的问题的解决方案](https://my.oschina.net/u/2306127/blog/392442)
[其他解决方案](http://www.jianshu.com/p/b42e8d3df449#)

# network relevant
### scan raspberry pi in the lan.
1. `nmap -sn 192.168.1.1/24` or `nmap -sP 192.168.1.1/24`
2. `arp -a`
3. via the router view.

### WiFi password change 

1. check the file `/etc/network/interfaces`
```
...

auto wlan0
iface wlan0 inet dhcp
    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf

...

```
2. amend file `/etc/wpa_supplicant/wpa_supplicant.conf`
```bash
network={
        ssid="wifi-name"
        psk="wifi password"
}
```

3. `reboot` or `sudo /etc/init.d/networking restart`