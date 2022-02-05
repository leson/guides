## Postgres SQL
- [docker hub postgres](https://hub.docker.com/_/postgres)
- [github postgres doc](https://github.com/docker-library/docs/blob/master/postgres/README.md)
```bash
docker pull postgres
mkdir -p /home/ubuntu/data/postgres
docker run -d \
    --name oci-postgres \
    -e POSTGRES_USER=kong \
    -e POSTGRES_PASSWORD=kong \
    -e POSTGRES_DB=kong \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /home/ubuntu/data/postgres:/var/lib/postgresql/data \
    postgres 
```