FROM ubuntu:20.04

MAINTAINER DELTAGAMING, <panel@deltagaming.cl>

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt upgrade -y && \
    apt install -y curl lib32gcc1 lib32stdc++6 libc6 libgl1-mesa-glx libxcursor1 libxrandr2 libc6-dev libgcc-4.8-dev && \
    useradd -d /home/container -m container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
