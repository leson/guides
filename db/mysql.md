## Mysql 
[docker official image]()
### Installation
```bash
docker pull mysql
mkdir -p /data/docker_data/mysql
docker run -d \
    --name db-mysql \
    -p 0.0.0.0:3306:3306 \
    -e MYSQL_ROOT_PASSWORD=root\
    -e MYSQL_USER=pm \
    -e MYSQL_PASSWORD=pm \
    -e MYSQL_DATABASE=pm \
    -v /data/docker_data/mysql:/var/lib/mysql \
    mysql:latest 
```

### Connectivity Checking with command cli
```bash
# login container of mysql
docker exec -it db-mysql bash

# local (not work)
docker run -it -network some-network --rm mysql mysql -hdb-mysql -upm -p

# connect with remote host (172.17.0.4)
docker run -it --rm mysql mysql -h172.17.0.2 -uroot -p
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

## Q&A
1. 1045 (28000): Access denied for user 'root'@'172.17.0.1' (using password: NO)
  ```bash
  ### append password on connector string
  mysql+mysqlconnector://admin:admin@172.17.0.1/my_database_name?charset=utf8

  ### login with root account
  docker exec -it db-mysql bash
  mysql -uroot -p
  CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
  GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
  flush privileges;
  exit;
  ```

2. 2003: Can't connect to MySQL server on '172.17.0.1:3306' (111 Connection refused)
> Expose 0.0.0.0:3306 for your container


3. (mysql.connector.errors.NotSupportedError) Authentication plugin 'caching_sha2_password' is not supported
```bash
## alter user 
ALTER USER 'admin'@'%' IDENTIFIED WITH mysql_native_password BY 'admin';
flush privileges;
exit;
## install myssql connertor with python 
pipenv install mysql-connector-python
## splice below sequence for connection string
mysql+mysqlconnector://admin:admin@172.17.0.1/my_database_name?charset=utf8&auth_plugin=mysql_native_password
```

## How to
1. how to extract default configuration?
```bash
docker run --name some-mysql -v /data/docker_data/mysql:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=root -d mysql
```

2. how to dump mysql databases
```bash
docker exec db-mysql sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/on/your/host/all-databases.sql

```



