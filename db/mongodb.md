# mongo db

## Installation
1. Mongo
```bash
mkdir -p /data/docker_data/mongodb/db
docker run -itd -v /data/docker_data/mongodb/db:/data/db --name=db-mongo -p 39017:27017 mongo
```
2. Mongo-express
```bash
docker run -itd -p 39081:8081 --name=mongo-express --link mongo:mongo mongo-express
```

URL: http://IP:39002

### docker-compose approach
```bash
# Use root/example as user/password credentials
version: '3.1'

services:

  mongo:
    image: mongo:latest
    restart: always
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: root
    ports:
      - 39017:27017

  mongo-express:
    image: mongo-express
    restart: always
    ports:
      - 39081:8081
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: root
      ME_CONFIG_MONGODB_ADMINPASSWORD: root

```