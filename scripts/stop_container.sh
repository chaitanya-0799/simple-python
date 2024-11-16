#!/bin/bash
set -x

docker ps 

echo "check whether any container is running"
Container-id=docker ps | awk -F " " '{Print $1}'

echo "remove the container"
docker rm  -f $Container-id

echo "check the left containers"
docker ps 
