# Cross Wall


## Docker Approach

### Prerequisites
1. Docker client installed
2. have a vps outside the wall use for install v2ray server side.

### Installation 
```bash
# 1:download image
docker pull v2fly/v2fly-core
# 2:write the v2ray.config
mkdir -p ~/.v2ray
vim ~/.v2ray/v2ray.config
```

```json
 {
  "log": {
    "access": "",
    "error": "",
    "loglevel": "warning"
  },
  "inbounds": [
    {
      "port": 1088,
      "listen": "0.0.0.0",
      "protocol": "socks",
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      },
      "settings": {
        "auth": "noauth",
        "udp": true,
        "ip": null,
        "clients": null
      },
      "streamSettings": null
    }
  ],
  "outbounds": [
    {
      "tag": "proxy",
      "protocol": "vmess",
      "settings": {
        "vnext": [
          {
            "address": "xxxxxx.com",
            "port": 443,
            "users": [
              {
                "id": "xxxxxxxx-yyyy-zzzz-wwww-tttttttttttt",
                "alterId": 233,
                "email": "t@t.tt",
                "security": "auto"
              }
            ]
          }
        ],
        "servers": null,
        "response": null
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "xxxxxx.com"
        },
        "tcpSettings": null,
        "kcpSettings": null,
        "wsSettings": {
          "connectionReuse": true,
          "path": "/xxxxxx",
          "headers": {
            "Host": "xxxxxx.com"
          }
        },
        "httpSettings": null,
        "quicSettings": null
      },
      "mux": {
        "enabled": true
      }
    },
    {
      "tag": "direct",
      "protocol": "freedom",
      "settings": {
        "vnext": null,
        "servers": null,
        "response": null
      },
      "streamSettings": null,
      "mux": null
    },
    {
      "tag": "block",
      "protocol": "blackhole",
      "settings": {
        "vnext": null,
        "servers": null,
        "response": {
          "type": "http"
        }
      },
      "streamSettings": null,
      "mux": null
    }
  ],
  "dns": null,
  "routing": {
    "domainStrategy": "IPIfNonMatch",
    "rules": []
  }
}
```
> NOTE: please replace Placeholder (such as xxx|yyy|zzz and so on) align with your v2ray server side config

```bash
# 3:run image as a container.
docker run -d --name v2ray -p 1088:1088 -v /home/leson/.v2ray:/etc/v2ray --restart=always v2fly/v2fly-core

# 4: view the status of container above 
docker ps -a |grep v2ray

```

### Usage
```bash
# 5:view the docker0 ip(the ip as the docker container and host connect gateway)
ip addr |grep -A2 docker0:  |awk -F" " 'NR>2{print $2}' |cut -d/ -f1
# > for example: 172.17.0.1
# 6:use the docker0 ip as proxy ip to set your proxy if anywhere required the proxy.
curl --socks5 172.17.0.1:1088 https://www.google.com

# 7:other machine use the host ip as a proxy
curl --socks5 192.168.1.10:1088 https://www.google.com
curl -x socks://192.168.1.10:10800 www.google.com
```


### End
> 1. inbound listen : 0.0.0.0 otherwise the proxy will can't read to container inside by docker0 gateway.

### Refference 
[v2ray official site](https://www.v2ray.com/)
[v2fly github site](https://github.com/v2fly)
