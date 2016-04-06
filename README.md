Create all mysql-server docker container.
====

## Support MySQL version.

- MySQL v5.5
- MySQL v5.6
- MySQL v5.7
- mariadb v10.0
- mariadb v10.1

This docker-compose.yml support mysql and mariadb.

## Usage

### Install docker toolbox

All docker software is installed when I install docker toolbox for windows or Mac OSX.

https://www.docker.com/products/docker-toolbox

docker-toolbox install virtualbox, docker-engine, docker-compose, etc.

### Install mysql-client for local-machine

Install mysql client only for Mac OSX.
```bash
$ brew upgrade
$ brew install mysql --client-only
```

It is not necessary to install mysql-server.

### Create docker-machine host for mysql

Create mysql docker host.

```bash
$ docker-machine create -d virtualbox mysql
```

Set environment.

```bash
$ eval $(docker-machine env mysql)
```

### Clone this repository

```bash
git clone git@github.com:treetips/docker-compose-all-mysql.git
```

### Create and start mysql docker containers

```bash
$ docker-compose up -d
```

### Connect any mysql-server on docker container

Connect remote mysql servers.

```bash
# Connect mysql v5.5
$ mysql -h$(docker-machine ip mysql) -P3355 -uworker -pworker work

# Connect mysql v5.6
$ mysql -h$(docker-machine ip mysql) -P3356 -uworker -pworker work

# Connect mysql v5.7
$ mysql -h$(docker-machine ip mysql) -P3357 -uworker -pworker work

# Connect mariadb v10.0
$ mysql -h$(docker-machine ip mysql) -P3310 -uworker -pworker work

# Connect mariadb v10.1
$ mysql -h$(docker-machine ip mysql) -P3311 -uworker -pworker work
```

## Optional

### Edit my.cnf for MySQL v5.5

```bash
$ vi mysql5.5/conf.d/my.cnf
```

### Edit my.cnf for MySQL v5.6

```bash
$ vi mysql5.6/conf.d/my.cnf
```

### Edit my.cnf for MySQL v5.7

```bash
$ vi mysql5.7/conf.d/my.cnf
```

### Edit my.cnf for mariadb v10.0

```bash
$ vi mariadb10.0/conf.d/my.cnf
```

### Edit my.cnf for mariadb v10.1

```bash
$ vi mariadb10.1/conf.d/my.cnf
```

### Edit default schema, user, password

If you change database-schema or user or password or root-password, Edit docker-compose.yml.

```yml
- MYSQL_DATABASE=work
- MYSQL_USER=worker
- MYSQL_PASSWORD=worker
- MYSQL_ROOT_PASSWORD=root
```

### Re-create mysql containers

```bash
# Stop mysql containers.
$ docker-compose stop
Stopping mysql5.5 ... done
Stopping mysql5.6 ... done
Stopping mysql5.7 ... done
Stopping mariadb10.0 ... done
Stopping mariadb10.1 ... done

# Destroy all mysql containers.
$ docker-compose rm -f
Going to remove mysql5.6, mariadb10.0, mariadb10.1, mysql5.7, mysql5.5
Removing mysql5.5 ... done
Removing mysql5.6 ... done
Removing mysql5.7 ... done
Removing mariadb10.0 ... done
Removing mariadb10.1 ... done

# Create and start mysql containers.
$ docker-compose up -d
```
