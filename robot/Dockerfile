FROM waipotn/ros-novnc

USER root

# see issues for solving:
# https://github.com/turtlebot/turtlebot/issues/272

# required for turtlebot
RUN apt-get update && apt-get install -y \
    #ros-$ROS_DISTRO-turtlebot-msgs \
    #ros-$ROS_DISTRO-turtlebot-create \
    ros-$ROS_DISTRO-joy \
    #ros-$ROS_DISTRO-laptop-battery-monitor \
    ros-$ROS_DISTRO-kobuki-* \
    ros-$ROS_DISTRO-yocs-cmd-vel-mux \
    ros-$ROS_DISTRO-yocs-controllers \
    ros-$ROS_DISTRO-yocs-velocity-smoother \
    ros-$ROS_DISTRO-ar-track-alvar-msgs \
    ros-$ROS_DISTRO-navigation \
    ros-$ROS_DISTRO-rgbd-launch \
	ros-$ROS_DISTRO-openni-launch \
    ros-$ROS_DISTRO-robot-pose-ekf \
    ros-$ROS_DISTRO-ecl-streams \
    ros-$ROS_DISTRO-bfl \
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

RUN mkdir -p $HOME/.scripts
COPY ./setup/scripts $HOME/.scripts
COPY ./setup/udev-rules/ /etc/udev/rules.d/

RUN find $HOME/.scripts -name '*.sh' -exec chmod a+x {} +

RUN usermod -a -G video $USER
RUN usermod -a -G dialout $USER

# create workspace
USER $USER
ENV ws=$HOME/catkin_ws
ENV src=$ws/src
#RUN mkdir -p $src
#RUN /bin/bash --login -c 'cd $ws  && catkin_make'
RUN echo "\nsource $ws/devel/setup.bash\n" >> $HOME/.bashrc

# download compiled catkin_ws
WORKDIR $HOME/.scripts

RUN ./dl_pkg.sh

# env vars.
RUN sh -c 'echo "\n# TurtleBot settings" >> $HOME/.bashrc' && \

	sh -c 'echo "#export TURTLEBOT_MAP_FILE=~/my_map.yaml\n" >> $HOME/.bashrc' && \

	sh -c 'echo "#export TURTLEBOT_BASE=create" >> $HOME/.bashrc' && \
	sh -c 'echo "#export TURTLEBOT_STACKS=circles" >> $HOME/.bashrc' && \
	sh -c 'echo "#export TURTLEBOT_3D_SENSOR=kinect" >> $HOME/.bashrc' && \
	sh -c 'echo "#export TURTLEBOT_SERIAL_PORT=/dev/create1\n" >> $HOME/.bashrc' && \

	sh -c 'echo "#export ROS_MASTER_URI=http://localhost:11311" >> $HOME/.bashrc' && \
	sh -c 'echo "#export ROS_HOSTNAME=turtlebot1.local\n" >> $HOME/.bashrc'

# ROS master port
EXPOSE 11311
	
WORKDIR $HOME

#RUN cd $ws && catkin_make

ENTRYPOINT ["/opt/docker_startup/startup.sh"]
CMD ["--wait", "--debug"]
