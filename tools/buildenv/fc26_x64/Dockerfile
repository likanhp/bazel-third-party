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

ARG user=likan

RUN useradd -m -s /bin/bash ${user}
RUN mkdir -p /etc/sudoers.d && echo "${user} ALL=NOPASSWD: ALL" > /etc/sudoers.d/${user}

USER ${user}:${user}
WORKDIR /home/${user}

ARG checkout=1

RUN if [ ${checkout} -gt 0 ]; then git clone --recursive https://github.com/likanhp/bazel-third-party.git; fi
