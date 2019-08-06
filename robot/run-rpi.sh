#!/usr/bin/env bash

p1080=1920x1080
p720=1280x720
p169=1600x900

NAME=ros-robot-daemon

docker rm -f $NAME

docker run -d --name $NAME \
	--network host \
	--privileged \
	-e VNC_RESOLUTION=$p720 \
	-e VNC_COL_DEPTH=24 \
	--restart unless-stopped \
	-v /dev:/dev \
	-v /etc/localtime:/etc/localtime:ro \
	wn1980/ros-robot:rpi
