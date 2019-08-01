#!/usr/bin/env sh

cd $src

#turtlebot1
git clone https://github.com/turtlebot/turtlebot_create && \
#git clone https://github.com/turtlebot/turtlebot_create_desktop && \
git clone https://github.com/turtlebot/turtlebot_web

cd $ws && catkin_make

echo '# TurtleBot settings' >> ~/.bashrc

echo 'export TURTLEBOT_MAP_FILE=~/my_map.yaml' >> ~/.bashrc

echo 'export TURTLEBOT_BASE=create' >> ~/.bashrc
echo 'export TURTLEBOT_STACKS=circles' >> ~/.bashrc
echo 'export TURTLEBOT_3D_SENSOR=kinect' >> ~/.bashrc
echo 'export TURTLEBOT_SERIAL_PORT=/dev/create1' >> ~/.bashrc

echo '#export ROS_MASTER_URI=http://localhost:11311' >> ~/.bashrc
echo '#export ROS_HOSTNAME=turtlebot1.local' >> ~/.bashrc
