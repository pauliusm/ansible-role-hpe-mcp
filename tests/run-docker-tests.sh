#!/usr/bin/env bash

DOCKER_CONTAINER_NAME="ansible-role-hpe-mcp"
DOCKER_CONTAINER_TAG="hpe-mcp"
RESULT=0

docker build -t $DOCKER_CONTAINER_TAG .
docker run -ti --privileged --name $DOCKER_CONTAINER_NAME -d -p 2922:22 $DOCKER_CONTAINER_TAG
ansible-playbook -i docker-inventory test.yml -vvvv --skip-tags=start,enable
if [ $? -ne 0 ];
then
  RESULT=1
  docker exec -it $DOCKER_CONTAINER_NAME /bin/sh
fi
docker stop $DOCKER_CONTAINER_NAME
docker rm $DOCKER_CONTAINER_NAME
exit $RESULT
