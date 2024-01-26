FROM debian

## Borrowed liberally from https://github.com/gezp/docker-ubuntu-desktop

LABEL org.opencontainers.image.authors="andre.srinivasan@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update 
RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Core tools
RUN apt-get update 
RUN apt-get install -y vim wget git lsb-release net-tools iputils-ping less unzip dnsutils \
    iproute2 openssh-server software-properties-common bash-completion curl httpie jq

# X11 and OpenGL
RUN apt-get install -y xorg x11-apps mesa-utils libgtk-3-0

## From https://docs.docker.com/engine/install/debian/
## Begin Docker Install

RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh ./get-docker.sh && rm get-docker.sh

## End Docker Install

ENTRYPOINT ["tail", "-f", "/dev/null"]
