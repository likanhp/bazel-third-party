#!/usr/bin/env bash

if [[ "${_stage}" == deps ]]; then
  __buildenv_require zlib
else
  mkdir -p "${_export_build_root}" &&
  cd "${_export_build_root}" &&
  cd "${_source_root}/openssl/openssl" &&
  "${_source_root}/openssl/openssl/config" \
    --prefix="${_prefix}" \
    no-shared \
    zlib \
    --with-zlib-include="${_prefix}/include" \
    --with-zlib-lib="${_prefix}/lib" &&
  make -j"${_nproc}" ${_make_trace_opt} |& tee make.log &&
  make install ${_make_trace_opt} |& tee make.install.log &&
  make install DESTDIR="${_export_install_root}"
fi