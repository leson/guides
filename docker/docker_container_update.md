# some issues that encountered

## re-run the Status was Exited containers
```bash
docker start <container ID | container Name>
docker attach <container ID | container Name>
```

## docker update,update the docker container configuration options
for example as below to update the `restart` option:
```
docker update --restart=always <container ID>
```
## view docker meta data
```bash
docker info
docker inspect <volume name|id , image name|id , container name|id>
```
