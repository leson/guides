# mysql issues
- mysql 5.7.17 
- deepin(ubuntu latest)

> default config path:
`/etc/mysql/mysql.conf.d/mysqld.cnf`

`netstat -an |grep 3306`
if bind the 127.0.0.1 other host can't connect your local mysql server

please comments the `bind-address = 127.0.0.1`