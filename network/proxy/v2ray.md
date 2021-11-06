# v2ray

> 是一款代理软件，将其安装在墙外面的VPS里. 然后为我们墙内人提供网络服务．安装后会提供一个proxy ip　在墙内配置这个proxy ip进行科学上网

- [v2ray-core](https://github.com/v2fly/v2ray-core)


## Installation
- [一键安装Script](https://github.com/233boy/v2ray)

```bash
sudo -s -H  # deepin switch to root account
sudo su     # other OS switch to root
```
```bash
bash <(curl -s -L https://233now.com/v2ray.sh)
```


## [v2raya](https://v2raya.org/
```bash
# 不支持全局代理
docker run -d \
  -p 2017:2017 \
  -p 20170-20172:20170-20172 \
  --restart=always --privileged \
  --name v2raya \
  -v /etc/v2raya:/etc/v2raya \
  mzz2017/v2raya
```

```bash
# 支持全局代理 (work well)
docker run -d \
  --restart=always \
  --privileged \
  --network=host \
  --name v2raya \
  -e V2RAYA_ADDRESS=0.0.0.0:2017 \
  -v /lib/modules:/lib/modules \
  -v /etc/resolv.conf:/etc/resolv.conf \
  -v /etc/v2raya:/etc/v2raya \
  mzz2017/v2raya
  ```