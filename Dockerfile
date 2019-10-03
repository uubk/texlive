FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
  apt upgrade -y && \
  apt install -y locales && \
  sed --in-place '/en_US.UTF-8/s/^# //' /etc/locale.gen && \
  dpkg-reconfigure locales && \
  ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime && \
  dpkg-reconfigure tzdata && \
  apt install -y texlive texlive-latex-extra git make

RUN apt install -y texlive-full && \
  rm -Rf /var/lib/apt/lists/*

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US
