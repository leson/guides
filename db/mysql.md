## Mysql 

### Installation
```bash
docker pull mysql
mkdir -p /data/docker_data/mysql
docker run -d \
    --name db-mysql \
    -e MYSQL_ROOT_PASSWORD=root\
    -e MYSQL_USER=pm \
    -e MYSQL_PASSWORD=pm \
    -e MYSQL_DATABASE=pm \
    -v /data/docker_data/mysql:/var/lib/mysql \
    mysql:latest 
```

### Connectivity Checking with command cli
```bash
# local (not work)
docker run -it -network some-network --rm mysql mysql -hdb-mysql -upm -p

# connect with remote host (172.17.0.4)
docker run -it --rm mysql mysql -h172.17.0.4 -upm -p
```

### Adminer Installation
```bash
docker run -d --name my-adminer --link db-mysql:db -p 8080:8080 adminer

# open in browser 
localhost:8080
```

### `stack.yml`
```yml
# Use root/example as user/password credentials
version: '3.1'

services:

  db:
    image: mysql
    command: --default-authentication-plugin=mysql_native_password
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root

  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080
```