### dockerfile 简介

> dockerfile 用来创建自定义的image

### 构建 image 命令

```
docker  build -t leson/centos6-nginx
```


### dockerfile 语法


```
FROM        #基于哪个base 镜像


RUN         #用于安装软件 

MAINTAINER  #镜像创建维护者

CMD         
#一个dockerfile 只能执行一个CMD命令。
#Container 启动时执行的命令。
#一个dockerfile 只能执行一个CMD命令。
#CMD 命令主要用于启动指定的服务。

USER        #使用哪个用户跑container

EXPOSE      #暴露container内部服务使用的端口号

ENV         #设置环境变量

ADD         #将文件<src>拷贝到container的文件系统对应的路径<dest>

VOLUME      #可以将本地文件夹或者其他container的文件夹挂载到container中。

WORKDIR     #切换目录用，可以多次切换(相当于cd命令)，对RUN,CMD,ENTRYPOINT生效

ONBUILD     #ONBUILD 指定的命令在构建镜像时并不执行，而是在它的子镜像中执行


```

### 实例

```
$ cat Dockerfile
FROM docker/whalesay:latest

RUN apt-get -y update && apt-get install -y fortunes

CMD /usr/games/fortune -a | cowsay

```
> build image 

```
$ docker build -t docker-whale .
Sending build context to Docker daemon 2.048 kB
...snip...
Removing intermediate container a8e6faa88df3
Successfully built 7d9495d03763
```


---
[tuicool.com manual](http://www.tuicool.com/articles/fUjyaq)

[官网build image简介](https://docs.docker.com/engine/tutorials/dockerimages/)

[build image manual](https://docs.docker.com/engine/getstarted/step_four/)