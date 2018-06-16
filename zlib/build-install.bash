#!/usr/bin/env bash

if [[ "${_stage}" == build-install ]]; then
  cd "${_source_root}/zlib/zlib" &&
  ./configure --prefix="${_prefix}" --static &&
  make -j"${_nproc}" ${_make_trace_opt} |& tee make.log &&
  make install ${_make_trace_opt} |& tee make.install.log &&
  make install DESTDIR="${_export_install_root}" &&
  cp -a . "${_export_build_root}"
fi
