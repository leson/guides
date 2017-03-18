# start a container with mysql image
```bash
docker run --restart always -d --name mysql-server -p 3306:3306 -v /var/lib/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=ylx mysql:latest
```

# host machine connect mysql container
```bash
mysql -h 0.0.0.0 -uroot -p<mypassword> -P3306
```