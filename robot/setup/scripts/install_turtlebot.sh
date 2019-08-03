#!/usr/bin/env bash

# Ref:
# 	https://github.com/gaunthan/Turtlebot2-On-Melodic

cd $src

# turtlebot 1
git clone https://github.com/turtlebot/turtlebot_create && \
git clone https://github.com/turtlebot/turtlebot_web && \
git clone https://github.com/wn1980/turtlebot_create_desktop 

# turtlebot 2

git clone https://github.com/turtlebot/turtlebot.git
git clone https://github.com/turtlebot/turtlebot_msgs.git
git clone https://github.com/turtlebot/turtlebot_apps.git
git clone https://github.com/turtlebot/turtlebot_simulator
git clone https://github.com/turtlebot/turtlebot_interactions.git

git clone https://github.com/ros-drivers/freenect_stack
git clone https://github.com/ros-drivers/linux_peripheral_interfaces

#git clone https://github.com/toeklk/orocos-bayesian-filtering.git
#cd orocos-bayesian-filtering/orocos_bfl/
#./configure
#make
#sudo make install
#cd ../
#make
#cd ../

#git clone https://github.com/udacity/robot_pose_ekf
#git clone https://github.com/ros-perception/depthimage_to_laserscan.git

git clone https://github.com/yujinrobot/kobuki_msgs.git

git clone https://github.com/yujinrobot/kobuki_desktop.git
cd kobuki_desktop/
rm -r kobuki_qtestsuite
cd -

git clone https://github.com/yujinrobot/kobuki.git
mv kobuki/kobuki_description kobuki/kobuki_bumper2pc \
  kobuki/kobuki_node kobuki/kobuki_keyop \
  kobuki/kobuki_safety_controller ./

#git clone https://github.com/yujinrobot/yujin_ocs.git
#mv yujin_ocs/yocs_cmd_vel_mux yujin_ocs/yocs_controllers yujin_ocs/yocs_velocity_smoother .
#rm -rf yujin_ocs

#sudo apt-get install ros-melodic-bfl -y
#sudo apt-get install ros-melodic-kobuki-* -y
#sudo apt-get install ros-melodic-ecl-streams -y

sh -c 'echo "\n# TurtleBot settings" >> $HOME/.bashrc'

sh -c 'echo "export TURTLEBOT_MAP_FILE=~/my_map.yaml\n" >> $HOME/.bashrc'

sh -c 'echo "#export TURTLEBOT_BASE=create" >> $HOME/.bashrc'
sh -c 'echo "#export TURTLEBOT_STACKS=circles" >> $HOME/.bashrc'
sh -c 'echo "#export TURTLEBOT_3D_SENSOR=kinect" >> $HOME/.bashrc'
sh -c 'echo "#export TURTLEBOT_SERIAL_PORT=/dev/create1\n" >> $HOME/.bashrc'

sh -c 'echo "#export ROS_MASTER_URI=http://localhost:11311" >> $HOME/.bashrc'
sh -c 'echo "#export ROS_HOSTNAME=turtlebot1.local\n" >> $HOME/.bashrc'
