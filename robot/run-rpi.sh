#!/usr/bin/env bash

p1080=1920x1080
p720=1280x720
p169=1600x900

NAME=ros-novnc

docker rm -f $NAME

docker run -d \
	-p 5901:5901 \
	-p 6901:6901 \
	-p 11311:11311 \
	--privileged \
	-e VNC_RESOLUTION=$p720 \
	--name $NAME \
	aarch64.registry.marina.io/waipotn/ros-novnc
	#wn1980/ros-vnc:rpi
