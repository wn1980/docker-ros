FROM waipotn/ros-base

ARG p1080=1920x1080
ARG p720=1280x720
ARG p169=1600x900

### VNC Installation

## Connection ports for controlling the UI:
# VNC port:5901
# noVNC webport, connect via http://IP:6901/?password=vncpassword
ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901
EXPOSE $VNC_PORT $NO_VNC_PORT

### Envrionment config
ENV VNCPASSWD=vnc123
ENV HOME=/home/$USER \
    TERM=xterm \
    STARTUPDIR=/opt/docker_startup \
    INST_SCRIPTS=/home/$USER/install \
    NO_VNC_HOME=/opt/noVNC \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=16 \
    VNC_RESOLUTION=$p720 \
    VNC_PW=$VNCPASSWD \
    VNC_VIEW_ONLY=false
WORKDIR $HOME

### Add all install scripts for further steps
#ADD ./src/common/install/ $INST_SCRIPTS/
#ADD ./src/ubuntu/install/ $INST_SCRIPTS/
COPY ./setup/install/ $INST_SCRIPTS/
RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +

### Install some common tools
RUN $INST_SCRIPTS/tools.sh
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

### Install chrome browser
#RUN $INST_SCRIPTS/firefox.sh
RUN $INST_SCRIPTS/chrome.sh

### Install VNC server
#RUN $INST_SCRIPTS/tigervnc.sh
#RUN apt-get install -y tightvncserver
RUN apt-get install -y tigervnc-standalone-server

### Install noVNC - HTML5 based VNC viewer (noVNC v1.1.0 & websockify v0.8.0)
#RUN $INST_SCRIPTS/no_vnc.sh
#COPY ./noVNC $NO_VNC_HOME
RUN mkdir -p $NO_VNC_HOME/utils/websockify
RUN wget -qO- https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME
# use older version of websockify to prevent hanging connections on offline containers, see https://github.com/ConSol/docker-headless-vnc-container/issues/50
RUN wget -qO- https://github.com/novnc/websockify/archive/v0.8.0.tar.gz | tar xz --strip 1 -C $NO_VNC_HOME/utils/websockify
RUN chmod +x -v $NO_VNC_HOME/utils/*.sh && \
	ln -s $NO_VNC_HOME/vnc.html $NO_VNC_HOME/index.html

### Install UIs
#RUN $INST_SCRIPTS/icewm_ui.sh
RUN apt-get install -y supervisor xterm xfonts-base xauth xinit xfe nano \
	icewm \
	jwm \
	tinywm

RUN apt-get purge -y pm-utils xscreensaver*

### Install custom tools
#RUN $INST_SCRIPTS/install_custom_fonts.sh
RUN apt-get install -y \
	xfonts-thai \
	geany \
	pluma \
	menu-l10n 
	
## configure startup
RUN $INST_SCRIPTS/libnss_wrapper.sh

#COPY ./setup/ui/wm_startup.sh $STARTUPDIR/wm_startup.sh
COPY ./setup/ui/wallpapers $STARTUPDIR/wallpapers
#icewm ui
COPY ./setup/ui/icewm $HOME/.icewm
#jwm ui
COPY ./setup/ui/jwm/ $HOME/.jwm
RUN ln -s $HOME/.jwm/main.jwmrc $HOME/.jwmrc
#COPY ./setup/ui/jwm/jwm-session /usr/bin/
#RUN chmod a+x /usr/bin/jwm-session
#tinywm ui
COPY ./setup/ui/tinywm/tinywm-session /usr/bin/
RUN chmod a+x /usr/bin/tinywm-session

#ADD ./src/common/scripts $STARTUPDIR
COPY ./setup/startup $STARTUPDIR
RUN $INST_SCRIPTS/set_user_permission.sh $STARTUPDIR $HOME

## fix copy (ctrl+insert) & paste (shift+insert)
RUN echo 'XTerm*selectToClipboard: true' >> $HOME/.Xresources
#RUN xrdb -merge .Xresources

## clean
RUN apt-get autoremove -y && \
	apt-get clean -y && \
	rm -rf $INST_SCRIPTS

# Expose Jupyter 
#EXPOSE 8888

### Switch to root user to install additional software
#USER $USER

#ENTRYPOINT ["/opt/docker_startup/startup.sh"]
#CMD ["--wait", "--debug"]
