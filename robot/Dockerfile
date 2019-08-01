# arm64
FROM waipotn/ros-novnc
# amd64
#FROM wn1980/ros-novnc:cpu-rc
# GPU
#FROM wn1980/ros-novnc:gpu-rc
# raspbian armhf
#FROM wn1980/ros-novnc:rpi

USER root

# required for turtlebot
RUN apt-get update && apt-get install -y \
    #ros-$ROS_DISTRO-turtlebot-msgs \
    #ros-$ROS_DISTRO-turtlebot-create \
    ros-$ROS_DISTRO-joy \
    #ros-$ROS_DISTRO-laptop-battery-monitor \
    #ros-$ROS_DISTRO-kobuki \
    ros-$ROS_DISTRO-kobuki-msgs \
    ros-$ROS_DISTRO-kobuki-ftdi \
    ros-$ROS_DISTRO-ar-track-alvar-msgs \
    ros-$ROS_DISTRO-navigation \
    ros-$ROS_DISTRO-rgbd-launch \
    ros-$ROS_DISTRO-robot-pose-ekf \
    libfreenect-dev \
	libsensors4-dev
	
# fix missing path for libfreenect
RUN ln -s /usr/include /usr/include/libfreenect
    
# required for linorobot
RUN apt-get update && apt-get install -y \
	ros-$ROS_DISTRO-roslint \
	ros-$ROS_DISTRO-rosserial \
	ros-$ROS_DISTRO-rosserial-arduino \
	ros-$ROS_DISTRO-imu-filter-madgwick \
	ros-$ROS_DISTRO-gmapping \
	ros-$ROS_DISTRO-map-server \
	ros-$ROS_DISTRO-robot-localization \
	ros-$ROS_DISTRO-tf2 \
	ros-$ROS_DISTRO-tf2-ros \
    ros-$ROS_DISTRO-xv-11-laser-driver \
    ros-$ROS_DISTRO-rplidar-ros \
    ros-$ROS_DISTRO-urg-node \
    ros-$ROS_DISTRO-lms1xx \
    #ros-$ROS_DISTRO-freenect-launch \
    ros-$ROS_DISTRO-depthimage-to-laserscan \
    ros-$ROS_DISTRO-teb-local-planner

# ROS master port
EXPOSE 11311

# create workspace
USER $USER

ENV ws=$HOME/catkin_ws
ENV src=$ws/src
RUN mkdir -p $src
#RUN cd $ws  && catkin_make
RUN echo "source $ws/devel/setup.bash" >> ~/.bashrc

# see issues for solving:
# https://github.com/turtlebot/turtlebot/issues/272
RUN mkdir -p $HOME/.scripts
COPY ./setup/scripts $HOME/.scripts
COPY ./setup/udev-rules/ /etc/udev/rules.d/

# build somes src 
WORKDIR $src

#turtlebot1
#RUN git clone https://github.com/turtlebot/turtlebot_create && \
#	git clone https://github.com/turtlebot/turtlebot_create_desktop && \
#	git clone https://github.com/turtlebot/turtlebot_web
    
#turtlebot2
#RUN git clone https://github.com/turtlebot/turtlebot && \
#	git clone https://github.com/turtlebot/turtlebot_apps && \
#	git clone https://github.com/turtlebot/turtlebot_interactions && \
#	git clone https://github.com/turtlebot/turtlebot_simulator 

#linorobot
#RUN git clone https://github.com/linorobot/linorobot && \
#	git clone https://github.com/linorobot/imu_calib && \
#	git clone https://github.com/linorobot/lino_pid && \
#	git clone https://github.com/linorobot/lino_udev && \
#	git clone https://github.com/linorobot/lino_msgs && \
#	git clone https://github.com/linorobot/lino_visualize && \
#	git clone https://github.com/linorobot/lino_setup && \
#	git clone https://github.com/EAIBOT/ydlidar -b 1.3.1
	
WORKDIR $HOME

CMD cd $ws && catkin_make

ENTRYPOINT ["/opt/docker_startup/startup.sh"]
CMD ["--wait", "--debug"]
