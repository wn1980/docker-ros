#!/usr/bin/env bash

cd ~/catkin_ws/src

git clone https://github.com/linorobot/linorobot && \
git clone https://github.com/linorobot/imu_calib && \
git clone https://github.com/linorobot/lino_pid && \
git clone https://github.com/linorobot/lino_udev && \
git clone https://github.com/linorobot/lino_msgs && \
git clone https://github.com/linorobot/lino_visualize && \
git clone https://github.com/linorobot/lino_setup && \
git clone https://github.com/EAIBOT/ydlidar -b 1.3.1

#cd $ws && catkin_make
