#!/usr/bin/env bash

set -e

_source_root=$(cd "$(dirname "$0")/../../.." && pwd)
_output_root="${_source_root}/.builds"
_prefix="${_output_root}/osx.prefix"
mkdir -p "${_prefix}"

cat <<EOF
export _variant=osx;
export _source_root='${_source_root}';
export _output_root='${_output_root}';
export _prefix='${_prefix}';
export _make_trace_opt=V=1;
export _nproc='$(sysctl -n hw.ncpu)';
EOF
cat <<"EOF"
function __buildenv_require() {
  while (( $# > 0 )); do
    local _lib=$1;
    shift;
    local _build_script="${_source_root}/${_lib}/build-install.bash";
    local _export_build_root="${_output_root}/${_lib}_build_tree.osx";
    local _export_install_root="${_output_root}/${_lib}_install_tree.osx";
    local _temp_source_root=${_output_root}/_tmp_source_root;
    local _guardian_file="${_export_build_root}/__built";
    if ! [[ -f "${_guardian_file}" ]]; then
      rm -rf "${_export_build_root}" "${_export_install_root}" "${_temp_source_root}" ||
        { echo "${_lib} failed to clean up output directories" >&2; return 1; };
      _stage=deps
      _export_build_root="${_export_build_root}"
      _export_install_root="${_export_install_root}"
      bash "${_build_script}" ||
        { echo "${_lib} failed in deps stage" >&2; return 1; };
      mkdir -p "${_temp_source_root}" && cp -a "${_source_root}/${_lib}" "${_temp_source_root}" ||
        { echo "${_lib} failed to copy source files" >&2; return 1; };
      _stage=build-install
      _source_root="${_temp_source_root}"
      _export_build_root="${_export_build_root}"
      _export_install_root="${_export_install_root}"
      bash "${_build_script}" ||
        { echo "${_lib} failed to run build script" >&2; return 1; };
      touch "${_guardian_file}" ||
        { echo "${_lib} failed to create guardian file" >&2; return 1; };
    fi;
  done;
};
export -f __buildenv_require;

function __buildenv_export() {
  while (( $# > 0 )); do
    local _lib=$1;
    shift;
    __buildenv_require "${_lib}" || return 1;
  done;
};
export -f __buildenv_export;
EOF
