#!/bin/bash

CONTAINER=$1

docker stop $CONTAINER && docker rm -fv $CONTAINER && docker rmi -f laravel
