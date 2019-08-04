#!/usr/bin/env bash

p1080=1920x1080
p720=1280x720
p169=1600x900

NAME=ros-robot-daemon

docker rm -f $NAME

docker run -d --name $NAME \
	-p 5901:5901 \
	-p 6901:6901 \
	-p 11311:11311 \
	--network host \
	--privileged \
	-e VNC_RESOLUTION=$p720 \
	--restart on-failure:5 \
	-v /dev:/dev \
	-v /etc/localtime:/etc/localtime:ro \
	aarch64.registry.marina.io/waipotn/ros-robot
