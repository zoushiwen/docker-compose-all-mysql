#!/bin/sh
eval $(docker-machine env mysql)
mysql -h$(docker-machine ip mysql) -P3310 -uworker -pworker -Dwork
