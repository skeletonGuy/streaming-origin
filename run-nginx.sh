#!/bin/bash
CONTAINER_NAME=nginx_rtmp_origin
IMAGE_NAME=nginx_rtmp
ARM=false

while getopts a flag

do
    case "${flag}" in
        a) ARM=true
    esac
done

# ARM option available for local dev on macs with m1 chip
if [ $ARM == "true" ] 
then
    echo "Building nginx-rtmp ARM image"
    docker build -t $IMAGE_NAME -f Dockerfile-ARM .
    echo "Starting nginx-rtmp ARM image"
    docker run -it --name $CONTAINER_NAME -p 8080:8080 -p 1935:1935 $IMAGE_NAME
else
    echo "Building nginx-rtmp x86 image"
    docker build -t $IMAGE_NAME .
    echo "Starting nginx-rtmp x86 image"
    docker run -it --name $CONTAINER_NAME -p 8080:8080 -p 1935:1935 $IMAGE_NAME
fi
