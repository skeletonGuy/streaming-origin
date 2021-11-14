#!/bin/bash

CONTAINER_NAME=nginx_rtmp_origin
docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME