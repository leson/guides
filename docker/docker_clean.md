# docker clean 

## delete "none" images
```bash
docker images -a | grep -E "<none>" |awk '{print $3}' |xargs -i docker rmi {} 
```

## delete status was "Exited" container
```bash
docker ps -a |grep "Exited" |awk '{print $1}' |xargs -i docker rm {}
```

## delete volume
```bash
docker volume list  # list the all volumes
docker volume prune
``` 

# docker uninstall
```bash
whereis docker

apt-get remove docker.io
```

[uninstall docker-ce](https://docs.docker.com/engine/installation/linux/docker-ce/debian/#uninstall-docker-ce)