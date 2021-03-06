# This Dockerfile is used to build an ROS image based on Ubuntu 18.04
FROM waipotn/ubuntu

ENV DEBIAN_FRONTEND noninteractive

# setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && apt-get install -q -y tzdata && rm -rf /var/lib/apt/lists/*

# install packages
RUN apt-get update && apt-get install -q -y \
    dirmngr \
    gnupg2 \
    lsb-release \
    sudo \
    htop \
    usbutils \
    curl \
    vim \
    tmux \
    inetutils-ping \
    netatalk \
    avahi-daemon \
    git \
    && rm -rf /var/lib/apt/lists/*

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

RUN usermod -a -G video $USER
RUN usermod -a -G dialout $USER

RUN update-rc.d avahi-daemon defaults

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    && rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# bootstrap rosdep
RUN rosdep init 

# install ros packages
ENV ROS_DISTRO melodic
RUN apt-get update && apt-get install -y \
#  ros-melodic-ros-core=1.4.1-0* \
#  ros-melodic-ros-base=1.4.1-0* \
   ros-melodic-desktop-full=1.4.1-0* \
   && rm -rf /var/lib/apt/lists/*

# Setup ROS
USER $USER
RUN rosdep fix-permissions && rosdep update
RUN echo "\n### ROS config." >> ~/.bashrc
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash\n" >> ~/.bashrc
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
RUN apt-get autoremove -y && \
	apt-get clean -y
