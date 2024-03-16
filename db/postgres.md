## Postgres SQL
- [docker hub postgres](https://hub.docker.com/_/postgres)
- [github postgres doc](https://github.com/docker-library/docs/blob/master/postgres/README.md)

### start up instance of postgres
```bash
docker pull postgres
mkdir -p /data/docker_data/postgres
docker run -d \
    --name db-postgres \
    -e POSTGRES_USER=pm \
    -e POSTGRES_PASSWORD=pm \
    -e POSTGRES_DB=pm \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /data/docker_data/postgres:/var/lib/postgresql/data \
    postgres 
```

```bash
docker pull postgres:alpine
mkdir -p /home/leson/data
docker run -d \
    --name db-postgres \
    -e POSTGRES_USER=river \
    -e POSTGRES_PASSWORD=river \
    -e POSTGRES_DB=river \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /home/leson/data:/var/lib/postgresql/data \
    postgres:alpine 

# river migrate-up --database-url "postgres://172.17.0.2:5432/river"
```

### customize configuration (Optional) 
```bash
# get the default config
docker run -i --rm postgres cat /usr/share/postgresql/postgresql.conf.sample > my-postgres.conf

# run postgres with custom config
docker run -d --name db-postgres -v "/data/docker_data/postgres/my-postgres.conf":/etc/postgresql/postgresql.conf -e POSTGRES_PASSWORD=mysecretpassword postgres -c 'config_file=/etc/postgresql/postgresql.conf'
```

### access testing
```bash
# login container of postgres
docker exec -it db-postgres bash

# switch to user : postgres
su postgres

# login db instance
psql -U pm -W 

```

### connectivity testing
```bash
# pdadmin4 installation
docker run --name my-pgadmin -p 5050:80 -e "PGADMIN_DEFAULT_EMAIL=freeleson@gmail.com" -e "PGADMIN_DEFAULT_PASSWORD=pm" -d  dpage/pgadmin4

# access via browser
curl -kv IP:5050

## adminer container which using for manage DB in browser
docker run --name adminer -p 8080:8080 -e ADMINER_DEFAULT_SERVER=db-postgres adminer

## browser access via url `localhost:8080`; and server please input: `172.17.0.2` which using docker container ip address
```
