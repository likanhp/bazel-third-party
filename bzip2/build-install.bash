#!/usr/bin/env bash

if [[ "${_stage}" == build-install ]]; then
  cd "${_source_root}/bzip2/bzip2" &&
  make -j$(nproc) ${_make_trace_opt} |& tee make.log &&
  make install ${_make_trace_opt} PREFIX="${_prefix}" |& tee make.install.log &&
  make install PREFIX="${_export_install_root}" &&
  cp -R . "${_export_build_root}" &&
  git clean -f -f -d .
fi
