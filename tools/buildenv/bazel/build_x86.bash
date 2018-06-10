#!/usr/bin/env bash

set -ex

function run_in_container() {
  docker exec -i "${_cid}" linux32 bash -c "$(echo "$@")"
}

_cid=$(docker run -d i386/ubuntu bash -c 'while true; do sleep 10000; done')
run_in_container apt update
run_in_container apt upgrade -y
run_in_container apt install -y curl patch pkg-config zip g++ zlib1g-dev unzip python openjdk-8-jdk
_version=$(run_in_container curl -Ls -o /dev/null -w %{url_effective} \
    https://github.com/bazelbuild/bazel/releases/latest '|' \
    sed "'s@^https://github.com/bazelbuild/bazel/releases/tag/@@'")
run_in_container curl -L -o \
    "/tmp/bazel.zip https://github.com/bazelbuild/bazel/releases/download/${_version}/bazel-${_version}-dist.zip"
run_in_container mkdir -p /bazel
run_in_container unzip /tmp/bazel.zip -d /bazel
run_in_container patch /bazel/src/BUILD < $(dirname "$0")/src-BUILD.patch
run_in_container patch /bazel/third_party/ijar/mapped_file_unix.cc < $(dirname "$0")/mapped_file_unix.cc.patch
run_in_container cd /bazel '&&' ./compile.sh
run_in_container cd /bazel '&&' output/bazel build -c opt scripts/packages:without-jdk/install.sh
_output="/tmp/bazel-${_version}-without-jdk-installer-linux-x86.sh"
docker cp "${_cid}":/bazel/bazel-bin/scripts/packages/without-jdk/install.sh "${_output}"
echo "${_output}"
docker rm -f "${_cid}"

