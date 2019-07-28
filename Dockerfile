# This Dockerfile is used to build an ROS + VNC image based on Ubuntu 16.04
FROM ubuntu:16.04
#FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04 #GPU version
#FROM armhf/ubuntu:16.04 #Raspbian version

ENV DEBIAN_FRONTEND noninteractive

# Install sudo and other utilities
RUN apt-get update && \
    apt-get install -y \
    sudo \
    xterm \
    xfe \
    nano \
    usbutils \
    curl \
    vim \
    tmux \
    git

# Configure user
ARG user=rosuser
ARG passwd=rosuser
ARG uid=1000
ARG gid=1000
ENV USER=$user
ENV PASSWD=$passwd
ENV UID=$uid
ENV GID=$gid
RUN groupadd $USER && \
    useradd --create-home --no-log-init -g $USER $USER && \
    usermod -aG sudo $USER && \
    echo "$PASSWD:$PASSWD" | chpasswd && \
    chsh -s /bin/bash $USER && \
    # Replace 1000 with your user/group id
    usermod  --uid $UID $USER && \
    groupmod --gid $GID $USER

# Install ROS (not NEED for this image)
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu xenial main" > \
                /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt-get update && apt-get install -y ros-kinetic-desktop-full=1.3.2-0* && \
    apt-get install -y python-rosinstall
RUN rosdep init

# Setup ROS
USER $USER
RUN rosdep fix-permissions && rosdep update
RUN echo "\n\nROS Config.\n\n\n" >> ~/.bashrc
RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

### Install VScode
USER root

#RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
#    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && \
#    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

#RUN sudo apt-get install -y apt-transport-https && \
#    sudo apt-get update && \
#    sudo apt-get install -y code

## clean
RUN apt-get autoremove -y
