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

ARG user=likan

RUN useradd -m -s /bin/bash ${user}
RUN mkdir -p /etc/sudoers.d && echo "${user} ALL=NOPASSWD: ALL" > /etc/sudoers.d/${user}

USER ${user}:${user}
WORKDIR /home/${user}
ENTRYPOINT ["/usr/bin/linux32", "--"]

ARG checkout=1

RUN if [ ${checkout} -gt 0 ]; then git clone --recursive https://github.com/likanhp/bazel-third-party.git; fi
