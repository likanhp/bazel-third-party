#!/usr/bin/env bash

if [[ "${_stage}" == build-install ]]; then
  case "${_variant}" in
    osx) _cur_make_trace_opt=VERBOSE=1;;
    *) _cur_make_trace_opt="${_make_trace_opt}";;
  esac &&
  mkdir -p "${_export_build_root}" &&
  cd "${_export_build_root}" &&
  "${_source_root}/icu/icu/icu4c/source/runConfigureICU" \
    Linux/gcc \
    --prefix="${_prefix}" \
    --enable-static \
    --disable-shared \
    --with-data-packaging=static &&
  make -j"${_nproc}" ${_cur_make_trace_opt} |& tee make.log &&
  make install ${_cur_make_trace_opt} |& tee make.install.log &&
  make install DESTDIR="${_export_install_root}"
fi
