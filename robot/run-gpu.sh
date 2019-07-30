#!/usr/bin/env bash

p1080=1920x1080
p720=1280x720
p169=1600x900

NAME=ros-robot

docker rm -f $NAME

docker run -d \
	-p 5901:5901 \
	-p 6901:6901 \
	--privileged \
	--runtime=nvidia \
	--ipc=host \
	--volume="$PWD:$HOME" \
	-e NVIDIA_VISIBLE_DEVICES=0 \
	-e VNC_RESOLUTION=$p1080 \
	--name $NAME \
	wn1980/ros-robot:gpu-rc
