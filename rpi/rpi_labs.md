# Experimental equipment
0. GPIO

![physical pin](http://www.ruanyifeng.com/blogimg/asset/2017/bg2017061518.png)

![rpi 2](http://shumeipai.nxez.com/wp-content/uploads/2015/03/rpi-pins-40-0.png)

   > - Board 编码
   > - BCM 编码
   > - wiringPi 编码
1. 面包板

![mian bao ban](https://imgsa.baidu.com/exp/w=480/sign=9ee85cdc11d8bc3ec60807c2b28aa6c8/d31b0ef41bd5ad6e2fad8d0c89cb39dbb7fd3c84.jpg)
2. 三极管
- s8550
    ![s8550 to-92](https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike272%2C5%2C5%2C272%2C90/sign=f0c10d01c711728b24208470a995a8ab/aa18972bd40735fac70ccc2994510fb30e2408a5.jpg)
- s8050
    ![s8050 npn](https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike72%2C5%2C5%2C72%2C24/sign=8c703d45773e6709aa0d4dad5aaef458/0bd162d9f2d3572c3a295dbe8213632763d0c38d.jpg)
    ![s8050 elc](https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=d126502fb999a9012f3853647cfc611e/4ec2d5628535e5dd290729e477c6a7efce1b62e6.jpg)
3. 继电器


# Software prepare
1. `vmstat`

2. CPU Temperature
    - ubuntu File : 
    ```
    cat /sys/class/thermal/thermal_zone0/temp
    ```
    - Raspberry PI File : same as ubuntu

3. [wiringPi](http://wiringpi.com/)
    - [installation link](http://wiringpi.com/download-and-install/)


# Fan control
### S8550 Connection
- (Emitter) 发射级接风扇黑线 
- (Base) 基级接 gpio 14 {对应 wiringPi 编码是 15}
- (Collector) 集电极接 GND 
- 风扇红线接+5v


# Reference Link list

[getting started](http://www.ruanyifeng.com/blog/2017/06/raspberry-pi-tutorial.html?20181004203341)

[GPIO introduce](https://blog.csdn.net/xukai871105/article/details/12684617)
