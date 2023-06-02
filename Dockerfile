FROM ubuntu:focal

LABEL org.opencontainers.image.authors="andre.srinivasan@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt update

RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

##RUN apt-get update

RUN apt-get install -y \
    less \
    vim \
    wget \
    curl \
    unzip \
    software-properties-common \
    apt-utils 

## From https://docs.docker.com/engine/install/ubuntu/

## RUN apt-get update
RUN apt-get install -y ca-certificates curl gnupg

RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN chmod a+r /etc/apt/keyrings/docker.gpg

RUN echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update

RUN apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

ENTRYPOINT ["tail", "-f", "/dev/null"]
