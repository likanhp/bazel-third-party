#!/usr/bin/env bash

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

if [[ "${_variant}" != osx ]]; then
  args+=("--enable-widec")
fi

if [[ "${_stage}" == build-install ]]; then
  if [[ "${_variant}" == x86 ]]; then
    sed -i 's/^PRG=.*$/PRG=gcc/' "${_source_root}/ncurses/ncurses/ncurses/base/MKlib_gen.sh"
  fi &&
  mkdir -p "${_export_build_root}" &&
  cd "${_export_build_root}" &&
  "${_source_root}/ncurses/ncurses/configure" \
    --prefix="${_prefix}" \
    "${args[@]}" &&
  make -j$(nproc) ${_make_trace_opt} |& tee make.log &&
  make install ${_make_trace_opt} |& tee make.install.log &&
  make install DESTDIR="${_export_install_root}" &&
  cd "${_source_root}/ncurses/ncurses" &&
  git checkout . &&
  git clean -f -f -d .
fi
