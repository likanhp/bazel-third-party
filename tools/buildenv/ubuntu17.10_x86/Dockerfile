#!/usr/bin/env docker build . -t likan/buildenv:ubuntu17.10_x86 -f

FROM i386/ubuntu:17.10

RUN apt update && apt update -y

RUN apt install -y autoconf \
                   autopoint \
                   g++ \
                   gcc \
                   git \
                   libtool \
                   openjdk-8-jdk \
                   python-pip \
                   sudo \
                   wget \
                   zip

RUN wget 'https://github.com/likan999/bazel-third-party/releases/download/\
bazel-0.6.1/bazel-0.6.1-without-jdk-installer-linux-x86.sh' \
        -O /tmp/install.sh --progress=dot:mega && \
    bash /tmp/install.sh && rm /tmp/install.sh

RUN useradd -m -s /bin/bash likan
RUN mkdir -p /etc/sudoers.d && echo 'likan	ALL=NOPASSWD:	ALL' > /etc/sudoers.d/likan

USER likan:likan
WORKDIR /home/likan
ENTRYPOINT ["/usr/bin/linux32", "--"]

RUN git config --global user.email 'likan999@users.noreply.github.com' && \
    git config --global user.name 'Kan Li'

RUN git clone --recursive https://github.com/likanhp/bazel-third-party.git
