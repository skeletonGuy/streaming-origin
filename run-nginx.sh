#!/bin/bash
CONTAINER_NAME=nginx_rtmp_origin
IMAGE_NAME=nginx_rtmp

echo "Building nginx-rtmp image"
docker build -t $IMAGE_NAME .

docker run -it --name $CONTAINER_NAME -p 8080:8080 -p 1935:1935 $IMAGE_NAME