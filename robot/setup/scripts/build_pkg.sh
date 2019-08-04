#!/usr/bin/env bash

rm -rf $ws
mkdir -p $src
cd $src

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

# linorobot
git clone https://github.com/linorobot/linorobot && \
git clone https://github.com/linorobot/imu_calib && \
git clone https://github.com/linorobot/lino_pid && \
git clone https://github.com/linorobot/lino_udev && \
git clone https://github.com/linorobot/lino_msgs && \
git clone https://github.com/linorobot/lino_visualize && \
git clone https://github.com/linorobot/lino_setup && \
git clone https://github.com/EAIBOT/ydlidar -b 1.3.1

cd $ws && catkin_make
cd $HOME && tar -czfv $HOME/catkin_ws_$(uname -m).tar.gz

