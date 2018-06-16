#!/usr/bin/env bash

if [[ "${_stage}" == deps ]]; then
  __buildenv_require ncurses
else
  export CPPFLAGS="-I${_prefix}/include"
  export LDFLAGS="-L${_prefix}/lib"
  cd "${_source_root}/readline/readline" &&
  ./configure \
    --prefix="${_prefix}" \
    --enable-static \
    --disable-shared \
    --enable-multibyte \
    --with-curses &&
  make -j"${_nproc}" ${_make_trace_opt} |& tee make.log &&
  make install ${_make_trace_opt} |& tee make.install.log &&
  make install DESTDIR="${_export_install_root}" &&
  cp -a . "${_export_build_root}"
fi
