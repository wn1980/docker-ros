#!/usr/bin/env sh

cd $src

#turtlebot1
git clone https://github.com/turtlebot/turtlebot_create && \
git clone https://github.com/turtlebot/turtlebot_create_desktop && \
git clone https://github.com/turtlebot/turtlebot_web

cd $ws && catkin_make
