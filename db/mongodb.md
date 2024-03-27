# mongo db

## Installation
1. Mongo
```bash
mkdir -p /home/leson/data/mongodb
docker run -itd -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=admin -v /home/leson/data/mongodb:/data/db --name=db-mongo -p 39017:27017 mongo
```
2. Mongo-express
```bash
docker run -itd -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=admin -e ME_CONFIG_MONGODB_SERVER=db-mongo -e ME_CONFIG_BASICAUTH_USERNAME=admin -e ME_CONFIG_BASICAUTH_PASSWORD=admin  -p 8888:8081 --name=mongo-express mongo-express
```

### docker compose approach `mongo-express.yaml` (available)
```bash
# Use root/example as user/password credentials
version: '3.1'

services:

  mongo:
    image: mongo
    restart: always
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: root

  mongo-express:
    image: mongo-express
    restart: always
    ports:
      - 8081:8081
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: admin
      ME_CONFIG_MONGODB_ADMINPASSWORD: admin
      ME_CONFIG_MONGODB_URL: mongodb://root:root@mongo:27017/
```

[docker compose installation](https://docs.docker.com/compose/install/linux/) 
```bash
docker compose -f mongo-express.yaml up 

curl 0.0.0.0:8081
```
