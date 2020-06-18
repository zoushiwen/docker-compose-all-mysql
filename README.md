Create all mysql-server docker container.
====

## Motivation

In order to make it easy to test whether applications can be started with different versions, such as upgrading mysql, we made it possible to start multiple mysql servers easily.

## Support MySQL version.

- MySQL v5.5
- MySQL v5.6
- MySQL v5.7
- MySQL v8.0
- mariadb v10.0
- mariadb v10.1
- mariadb v10.2
- mariadb v10.3

## Usage

### Install docker desktop

https://www.docker.com/products/docker-desktop

### Install mysql-client

`No need to install mysql client` .

When connect-xxx.sh execute, `the mysql client installed in the docker container is executed locally` .

### Clone this repository

```bash
git clone git@github.com:treetips/docker-compose-all-mysql.git
```

### Start mysql docker containers

```bash
$ docker-compose up -d


只启动 mysql 5.7
docker-compose -f docker-compose.5.7.yml up -d

```

### Connect any mysql-server on docker container

Connect remote mysql servers.

```bash
$ ./connect-mysql-5-5.sh
$ ./connect-mysql-5-6.sh
$ ./connect-mysql-5-6.sh
$ ./connect-mysql-8-0.sh
$ ./connect-mariadb-10-0.sh
$ ./connect-mariadb-10-1.sh
$ ./connect-mariadb-10-2.sh
$ ./connect-mariadb-10-3.sh
```

## Optional

### Customize mysql client settings

```bash
vi ./my.cnf
```

All the same connection setting except port.

### Customize mysql server settings

```bash
$ vi ./mysql5.5/conf.d/my.cnf
$ vi ./mysql5.6/conf.d/my.cnf
$ vi ./mysql5.7/conf.d/my.cnf
$ vi ./mysql8.0/conf.d/my.cnf
$ vi ./mariadb10.0/conf.d/my.cnf
$ vi ./mariadb10.1/conf.d/my.cnf
$ vi ./mariadb10.2/conf.d/my.cnf
$ vi ./mariadb10.3/conf.d/my.cnf
```

### Customize default schema, user, password

If you change database-schema or user or password or root-password, Edit `.env` .

```yaml
DB_DATABASE=work
DB_USER=worker
DB_PASSWORD=worker
DB_ROOT_PASSWORD=root
```

### Remove logs

If you want to delete `general.log` and `error.log` and `slow-query.log`, execute `clear_logs.sh` .

### Customize init scripts

https://hub.docker.com/_/mysql/#initializing-a-fresh-instance

#### Execution order at startup

1. `./common/initdb.d/common-init.(sh|sql)` (executed commonly for all containers)
1. `./(mysql|mariadb)X.X/initdb.d/xxx.(sh|sql)` (executed for each container)

Initial data can be input at startup by customizing these.
