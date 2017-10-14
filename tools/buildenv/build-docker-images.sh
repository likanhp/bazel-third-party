#!/usr/bin/env bash

pushd $(dirname "$0")/fc26_x64
docker build . -t likan/buildenv:fc26_x64
docker build . -t likan/buildenv:fc26_x64_travis --build-arg checkout=0
popd

pushd $(dirname "$0")/ubuntu17.10_x86
docker build . -t likan/buildenv:ubuntu17.10_x86 
docker build . -t likan/buildenv:ubuntu17.10_x86_travis --build-arg checkout=0
popd

docker push likan/buildenv
