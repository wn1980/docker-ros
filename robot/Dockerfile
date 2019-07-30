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
    ros-melodic-turtlebot-msgs \
    ros-melodic-turtlebot-create \
    ros-melodic-joy \
    ros-melodic-laptop-battery-monitor \
    ros-melodic-kobuki \
    ros-melodic-kobuki-ftdi \
    ros-melodic-ar-track-alvar-msgs \
    ros-melodic-navigation
    
# required for linorobot
RUN apt-get update && apt-get install -y \
	ros-melodic-roslint \
	ros-melodic-rosserial \
	ros-melodic-rosserial-arduino \
	ros-melodic-imu-filter-madgwick \
	ros-melodic-gmapping \
	ros-melodic-map-server \
	ros-melodic-robot-localization \
	ros-melodic-tf2 \
	ros-melodic-tf2-ros \
    ros-melodic-xv-11-laser-driver \
    ros-melodic-rplidar-ros \
    ros-melodic-urg-node \
    ros-melodic-lms1xx \
    ros-melodic-freenect-launch \
    ros-melodic-depthimage-to-laserscan \
    ros-melodic-teb-local-planner

# ROS master port
EXPOSE 11311

# create workspace
USER $USER

ENV ws=$HOME/catkin_ws
ENV src=$ws/src
RUN mkdir -p $src

#RUN cd $ws  && catkin_make
RUN echo "source $ws/devel/setup.bash" >> ~/.bashrc

# build somes src 
WORKDIR $src
    
#turtlebot
RUN git clone https://github.com/turtlebot/turtlebot && \
	git clone https://github.com/turtlebot/turtlebot_apps && \
	git clone https://github.com/turtlebot/turtlebot_interactions && \
	git clone https://github.com/turtlebot/turtlebot_simulator 

#linorobot
RUN git clone https://github.com/linorobot/linorobot && \
	git clone https://github.com/linorobot/imu_calib && \
	git clone https://github.com/linorobot/lino_pid && \
	git clone https://github.com/linorobot/lino_udev && \
	git clone https://github.com/linorobot/lino_msgs && \
	git clone https://github.com/linorobot/lino_visualize && \
	git clone https://github.com/linorobot/lino_setup && \
	git clone https://github.com/EAIBOT/ydlidar -b 1.3.1
	
WORKDIR $HOME

CMD cd $ws && catkin_make

ENTRYPOINT ["/opt/docker_startup/startup.sh"]
CMD ["--wait", "--debug"]
