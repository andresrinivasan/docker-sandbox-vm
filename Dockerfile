FROM ubuntu:focal

LABEL org.opencontainers.image.authors="andre.srinivasan@gmail.com"

RUN apt update
RUN apt install -y \
    less \
    vim 

ENTRYPOINT ["tail", "-f", "/dev/null"]
