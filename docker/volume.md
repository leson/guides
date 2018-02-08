# Volume 
> data volume

```bash
docker volume -h  # manual
```
## create volume 

```bash
docker create --name data_vol -v /data mysql
```
> - `/data` : it is a folder in the container "data_vol"
> - and we can use `docker inspect data_vol` find out the host folder that relate to this /data folder in the container.
## mount volume
```bash
docker create --name web /var/html:/html:ro -v /var/log/nginx:/var/log/nginx nginx
```
## list volume
```bash
docker volume list

sudo ls -l /var/lib/docker/volumes
```

## delete volume
```bash
docker volume rm <VOLUME NAME>   # not recommand

docker volume rm -v <Container ID>  #use with caution

docker volume prune         # Recommand
```

# volume container

## create volume container
```bash
docker create --name data -v /html alpine
```

## view(inspect) the volume container detail infomation
```bash
docker inspect data
```

## connect volume container
```bash
docker run -d --name web --volume-from data nginx
```


