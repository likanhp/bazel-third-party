#!/usr/bin/env docker build . -t likan/buildenv:fc26_x64 -f

FROM fedora:26

RUN dnf update -y

RUN dnf install -y autoconf \
                   dnf-plugins-core \
                   gcc \
                   gcc-c++ \
                   gettext-devel \
                   git \
                   libtool \
                   python2-pip \
                   sudo \
                   wget

RUN dnf copr enable -y vbatts/bazel
RUN dnf install -y bazel

RUN useradd -m -s /bin/bash likan
RUN mkdir -p /etc/sudoers.d && echo 'likan	ALL=NOPASSWD:	ALL' > /etc/sudoers.d/likan

USER likan:likan
WORKDIR /home/likan

RUN git clone --recursive https://github.com/likan999/bazel-third-party.git
