# arm64
FROM waipotn/ros-novnc
# amd64
#FROM wn1980/ros-novnc:cpu-rc
# GPU
#FROM wn1980/ros-novnc:gpu-rc
# raspbian armhf
#FROM wn1980/ros-novnc:rpi

USER root

RUN apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential 

## clean
USER root
RUN apt-get autoremove -y && \
	apt-get clean -y 

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
USER root

# turtlebot
RUN apt-get update && apt-get install -y \
    ros-kinetic-turtlebot-msgs \
    ros-kinetic-turtlebot-create \
    ros-kinetic-joy \
    ros-kinetic-laptop-battery-monitor \
    ros-kinetic-kobuki \
    ros-kinetic-kobuki-ftdi \
    ros-kinetic-ar-track-alvar-msgs \
    ros-kinetic-navigation
    
RUN git clone https://github.com/turtlebot/turtlebot && \
	git clone https://github.com/turtlebot/turtlebot_apps && \
	git clone https://github.com/turtlebot/turtlebot_interactions && \
	git clone https://github.com/turtlebot/turtlebot_simulator 

# linorobot
RUN apt-get install -y \
	ros-kinetic-roslint \
	ros-kinetic-rosserial \
	ros-kinetic-rosserial-arduino \
	ros-kinetic-imu-filter-madgwick \
	ros-kinetic-gmapping \
	ros-kinetic-map-server \
	ros-kinetic-navigation \
	ros-kinetic-robot-localization \
	ros-kinetic-tf2 \
	ros-kinetic-tf2-ros 
	
RUN	apt-get install -y \
	ros-kinetic-xv-11-laser-driver \
    ros-kinetic-rplidar-ros \
    ros-kinetic-urg-node \
    ros-kinetic-lms1xx \
    ros-kinetic-freenect-launch \
    ros-kinetic-depthimage-to-laserscan \
    ros-kinetic-teb-local-planner 

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
