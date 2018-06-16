#!/usr/bin/env docker build . -t likan/buildenv:fc28_x64 -f

FROM registry.fedoraproject.org/fedora:28

RUN dnf update -y

RUN dnf install -y autoconf \
                   dnf-plugins-core \
                   gcc \
                   gcc-c++ \
                   gettext-devel \
                   git \
                   libtool \
                   make \
                   pkg-config \
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
