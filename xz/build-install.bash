#!/usr/bin/env bash

if [[ "${_stage}" == build-install ]]; then
  cd "${_source_root}/xz/xz" &&
  ./autogen.sh &&
  mkdir -p "${_export_build_root}" &&
  cd "${_export_build_root}" &&
  "${_source_root}/xz/xz/configure" --prefix="${_prefix}" --disable-shared --enable-static &&
  make -j"${_nproc}" ${_make_trace_opt} |& tee make.log &&
  make install ${_make_trace_opt} |& tee make.install.log &&
  make install DESTDIR="${_export_install_root}"
fi
