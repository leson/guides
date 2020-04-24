# repository collection
1. [arm32v7](https://hub.docker.com/u/arm32v7)
2. [armhf](https://hub.docker.com/u/armhf)

# docker on raspberry pi

0. official shell script installation approach~~ `raspbian` **don't support this approach**

   ```shell
   curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
   ```

1. apt-get approach

   ```shell
   # step 1: install some tools
   sudo apt-get update
   sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common
        
   # step 2: install GPG certification
   curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/raspbian/gpg | sudo apt-key add -
   
   # step 3: amend software source to /etc/apt/sources.list.d/docker.list
   echo "deb [arch=armhf] https://mirrors.aliyun.com/docker-ce/linux/raspbian/ $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
   
   # step 4: install
   sudo apt-get update && sudo apt-get -y install docker-ce
   ```

2. official approach

   ```shell
   
   ```

# Reference 

[installation approach](https://yeasy.gitbooks.io/docker_practice/content/install/raspberry-pi.html)