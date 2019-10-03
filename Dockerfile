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

RUN apt install -y texlive-fonts-extra

RUN apt install -y lcdf-typetools tex-gyre psutils texlive-formats-extra texlive-science texlive-xetex texlive-pstricks texlive-publishers vprerex texlive-lang-european texlive-latex-base-doc texlive-latex-extra-doc

RUN apt install -y texlive-latex-recommended-doc texlive-humanities-doc texlive-lang-japanese texlive-lang-chinese texlive-lang-cyrillic

RUN apt install -y texlive-lang-all imagemagick python3-pyqt5 python3.7 python3-numpy python3-sip zathura zathura-pdf-poppler latexdiff latexmk texinfo texlive-generic-recommended biber asymptote texlive-fonts-extra-doc texlive-fonts-recommended-doc texlive-games texlive-bibtex-extra texlive-metapost texlive-music

RUN apt install -y texlive-full && \
  rm -Rf /var/lib/apt/lists/*

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US
