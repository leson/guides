# delete docker images that name was none

> delete "none" images
```bash
docker images -a | grep -E "<none>" |awk '{print $3}' |xargs -i docker rmi {} 
```

> delete "Exited" container
```bash
docker ps -a |grep "Exited" |awk '{print $1}' |xargs -i docker rm {}
```