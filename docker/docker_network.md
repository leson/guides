# Docker Network
- [official document](https://docs.docker.com/network/)
- [bridge network](https://docs.docker.com/network/bridge/)

## List Docker network
```bash
docker network ls
```


## create docker self-definition network
```bash
docker network create my-net
```

## using user definition network while creating container
```bash
docker create --name my-nginx \
  --network my-net \
  --publish 8080:80 \
  nginx:latest 
```

## connect a container
1. connect a running container to an existing user-defined bridge
    ```bash
    docker network connect my-net my-nginx
    ```
2. Disconnect a container from a user-defined bridge
    ```bash
    docker network disconnect my-net my-nginx
    ```

