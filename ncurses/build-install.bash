#!/usr/bin/env bash

args=(
  --without-shared
  --without-debug 
  --without-profile
  --with-pkg-config-libdir="${_prefix}/lib/pkgconfig"
  --without-cxx-shared
  --without-ada
  --enable-pc-files
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

if [[ "${_stage}" == build-install ]]; then
  if [[ "${_variant}" == x86 ]]; then
    sed -i 's/^PRG=.*$/PRG=gcc/' "${_source_root}/ncurses/ncurses/ncurses/base/MKlib_gen.sh"
  fi &&
  mkdir -p "${_export_build_root}/narrowc" &&
  cd "${_export_build_root}/narrowc" &&
  "${_source_root}/ncurses/ncurses/configure" \
    --prefix="${_prefix}" \
    --without-progs \
    "${args[@]}" &&
  make -j"${_nproc}" ${_make_trace_opt} libs |& tee make.log &&
  make ${_make_trace_opt} install.libs |& tee make.install.log &&
  make install.libs DESTDIR="${_export_install_root}" &&
  mkdir -p "${_export_build_root}/widec" &&
  cd "${_export_build_root}/widec" &&
  "${_source_root}/ncurses/ncurses/configure" \
    --prefix="${_prefix}" \
    --enable-widec \
    "${args[@]}" &&
  make -j"${_nproc}" ${_make_trace_opt} libs |& tee make.log &&
  make -j"${_nproc}" ${_make_trace_opt} -C progs |& tee -a make.log &&
  make ${_make_trace_opt} install.{libs,progs,data,includes,man} |& \
    tee make.install.log &&
  make install.{libs,progs,data,includes,man} DESTDIR="${_export_install_root}" &&
  for root in "" "${_export_install_root}"; do
    for dir in ncurses ncursesw; do
      target="${root}${_prefix}/include/${dir}"
      mkdir -p "${target}" &&
      for header in "${_export_install_root}/${_prefix}/include"/*.h; do
        ln -sf "../$(basename "${header}")" "${target}"
      done
    done
  done
fi
