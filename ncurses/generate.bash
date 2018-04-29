#!/bin/bash

args=(
	--without-shared
	--without-debug 
	--without-profile
	--without-cxx-shared
	--without-ada
	--disable-db-install
	--without-manpages
	--without-curses-h
	--enable-pc-files
	--with-termlib=tinfo
	--with-ticlib=tic
	--with-sysmouse
	--enable-overwrite
	--with-xterm-kbs=DEL
	--enable-sp-funcs
	--enable-const
	--enable-ext-colors
	--enable-ext-mouse
	--enable-ext-putwin
	--enable-no-padding
	--enable-signed-char
	--enable-sigwinch
	--enable-tcap-names
)

mkdir -p generated

tag=fc26_x64
cid=$(docker run -d likan/buildenv:${tag} bash -c \
	"cd ~/bazel-third-party &&
	 git fetch && git reset --hard origin/dev &&
	 cd ncurses/ncurses && mkdir build && cd build &&
	 ../configure ${args[*]} --enable-widec &&
	 make --trace >&make.log &&
   make --trace install DESTDIR=\$PWD/install_root >&make.install.log") &&
docker wait ${cid} &&
docker cp ${cid}:/home/likan/bazel-third-party/ncurses/ncurses/build generated/build.x64
docker rm ${cid}

tag=ubuntu17.10_x86
cid=$(docker run -d likan/buildenv:${tag} bash -c \
	"cd ~/bazel-third-party &&
	 git fetch && git reset --hard origin/dev &&
	 cd ncurses/ncurses &&
   sed --in-place 's/^PRG=.*$/PRG=gcc/g' ncurses/base/MKlib_gen.sh &&
   mkdir build && cd build &&
	 ../configure ${args[*]} --enable-widec &&
	 make --trace >&make.log &&
   make --trace install DESTDIR=\$PWD/install_root >&make.install.log") &&
docker wait ${cid} &&
docker cp ${cid}:/home/likan/bazel-third-party/ncurses/ncurses/build generated/build.x86
docker rm ${cid}

mkdir -p generated/build.osx &&
cd generated/build.osx &&
../../ncurses/configure ${args[@]} >&/dev/null &&
make V=1 >&make.log &&
make V=1 install DESTDIR=$PWD/install_root >&make.install.log
