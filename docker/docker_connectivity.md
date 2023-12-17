# docker network connevtivity

## redis 
```bash
docker run --name my-redis -p 6379:6379 -d redis 

docker inspect my-redis # fetch ip address

docker run -it --rm redis redis-cli -h 172.17.0.2 -p 6379
```
