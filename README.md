Create all mysql-server docker container.
====

## Usage

### 1. Install docker toolbox

All docker software is installed when I install docker toolbox for windows or Mac OSX.

https://www.docker.com/products/docker-toolbox

docker-toolbox install virtualbox, docker-engine, docker-compose, etc.

### 2. Install mysql-client for local-machine

Install mysql client only for Mac OSX.
```bash
$ brew upgrade
$ brew install mysql --client-only
```

It is not necessary to install mysql-server.

### 2. Create docker-machine host for mysql

Create mysql docker host.

```bash
$ docker-machine create -d virtualbox mysql
```

Set environment.

```bash
$ eval $(docker-machine env mysql)
```

### 3. docker-compose

Run docker containers daemon.

```bash
$ docker-compose up -d
```

### 4. Connect any mysql-server on docker container

```bash
# Connect mysql5.5
$ mysql -h$(docker-machine ip mysql) -P3355 -uworker -pworker work

# Connect mysql5.6
$ mysql -h$(docker-machine ip mysql) -P3356 -uworker -pworker work

# Connect mysql5.7
$ mysql -h$(docker-machine ip mysql) -P3357 -uworker -pworker work
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
# Destroy all mysql containers.
$ docker-compose rm -f
Going to remove mysql5.6, mysql5.7, mysql5.5
Removing mysql5.6 ... done
Removing mysql5.7 ... done
Removing mysql5.5 ... done

# Create and start mysql containers.
$ docker-compose up -d
```
