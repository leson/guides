## 学习网站：
[docker.org.cn](http://www.docker.org.cn/)

[docker.com](http://www.docker.com/)

[docker doc](https://docs.docker.com/)

## 核心概念
1. 镜像（Image）
2. 容器（Container）
3. 仓库（Repository）
    

## 安装Docker 
   
[官方安装手册](https://docs.docker.com/engine/installation/)

[菜鸟安装教程](http://www.runoob.com/docker/ubuntu-docker-install.html)

```bash
sudo gpasswd -a ${USER} docker #将当前用户加入docker组

sudo service docker restart #重启docker daemon
```

##### docker 命令帮助查看方式
     
```bash
man docker              #docker manual
man docker run 
docker  |less
docker help exec  | less
docker run --help | less
```

## docker version 1.12 commands as below shown:

### 镜像
#### 1. 获取镜像
   
> 获取ubuntu镜像（**latest version**）

```bash
sudo docker pull ubuntu
```

> 获取ubuntu镜像（**Specified version**）
```
sudo docker pull ubuntu:14.04
```
> 以上命令等同于：


```bash
sudo docker pull registry.hub.docker.com/ubuntu:latest

sudo docker pull registry.hub.docker.com/ubuntu:14.04
```
==由于墙的问题，最好换国内的源去pull.==

#### 2. 查看镜像

```bash
sudo docker images
```
#### 3. 搜索镜像

```bash
sudo docker search centos
```

#### 4. 删除镜像

```bash
sudo docker rmi mysql:latest
```

==注意：删除镜像之前要先删除该镜像创建的容器！==

```bash
sudo docker ps -a   #查看运行过的容器
```

#### 5. 创建镜像
> 基于已有镜像的容器创建 （docker commit）

```bash
sudo docker run -ti ubuntu:14.04  /bin/bash
```

```bash
root@a92540b3f0:/# touch test
root@a92540b3f0:/# exit
```

```bash
sudo docker commit -m "add a new file" -a "Docker newbee" a92540b3f0  test
```

> 基于本地模板导入（[OPENVZ模板](http://openvz.org/Download/templates/precreated)）

```bash
sudo cat ubuntu-14.04-x86_64-minimal.tar.gz |docker import - ubuntu:14.04
```

> 基于 Dockerfile 创建

[create image by dockerfile](http://note.youdao.com/noteshare?id=4d3f2b044b9554fa375177f7417cd16b)

#### 6. 存出和载入
> 存出/保存镜像到本地 

```bash
sudo docker save -o ubuntu_14.04.tar  ubuntu:14.04
```
> 载入镜像

```bash
sudo docker load < ubuntu_14.04.tar
```

#### 7. 上传镜像

```bash
sudo docker tag test:latest  user/test:latest
sudo docker push user/test:latest
```
==注意：默认上传到DockerHub 官方仓库。==


### 容器 
> 容器是镜像的一个运行实例，所以它带有可写文件层。

#### 1. 新建并启动容器

```bash
sudo docker run -ti ubuntu:14.04 /bin/bash
```
```bash
root@af983df88d:/#
```

#### 2. 查看容器

```bash
sudo docker ps -a   #查看所有启动过的容器

```
```bash
sudo docker ps   #查看当前运行中的容器
sudo docker ps -a |grep Up
```
```bash
sudo docker ps -l #查看最近一次运行中的容器
```

#### 3. 删除容器

```bash
sudo docker rm  <container id>
```

#### 4. 守护态运行容器

```bash
sudo docker run -d ubuntu  /bin/sh -c "while true;do echo hello world;sleep 1;done"
```

```bash
sudo docker logs <container id>  #查看容器的输出信息
```
#### 5. 终止容器

```bash
sudo docker stop <container id>
sudo docker start <container id>
sudo docker restart <container id>
```

#### 6. 进入容器

```bash
#通过镜像启动一个容器实例。
sudo docker run -d ubuntu

#直接进入启动后的容器<Recommand>
sudo docker exec -ti <container id>  /bin/bash       
```
#### 7. 导入和导出容器

```bash
sudo docker export <container id>  > test_for_run.tar
```

```bash
cat test_for_run.tar  | sudo docker import - test/ubuntu:v1.0
```

### 仓库
> 是集中存放镜像的地方

[官方仓库](http://hub.docker.com)

[国内仓库](http://dockerpool.com)

[阿里云仓库](https://dev.aliyun.com)


## [常见问题](http://note.youdao.com/noteshare?id=29d61d599e7f056ca5ec6b4f0738fda3)
