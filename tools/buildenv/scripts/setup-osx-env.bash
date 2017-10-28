#!/usr/bin/env bash

set -e

scripts_dir=$(cd "$(dirname "$0")" && pwd)
workspace_root="${scripts_dir}/../../.."
output_root="${workspace_root}/.builds"
_prefix="${output_root}/osx.prefix"
mkdir -p "${_prefix}"

echo "export scripts_dir='${scripts_dir}';"
echo "export _variant=osx;"
echo "export _source_root='${workspace_root}';"
echo "export _prefix='${_prefix}';"
echo "export _make_trace_opt=V=1;"
echo '
function __buildenv_require() {
  while (( $# > 0 )); do
    local lib=$1;
    shift;
    local workspace_root='"'${workspace_root}'"';
    local output_root='"'${output_root}'"';
    local build_script="${workspace_root}/${lib}/build-install.bash";
    local _export_build_root="${output_root}/${lib}_build_tree.osx";
    local _export_install_root="${output_root}/${lib}_install_tree.osx";
    local guardian_file="${_export_build_root}/__built";
    if ! [[ -f "${guardian_file}" ]]; then
      rm -rf "${_export_build_root}" "${_export_install_root}" ||
        { echo "${lib} failed to clean up output directories" >&2; return 1; };
      _stage=deps
      _export_build_root="${_export_build_root}"
      _export_install_root="${_export_install_root}"
      bash "${build_script}" ||
        { echo "${lib} failed in deps stage" >&2; return 1; };
      _stage=build-install
      _export_build_root="${_export_build_root}"
      _export_install_root="${_export_install_root}"
      bash "${build_script}" ||
        { echo "${lib} failed to run build script" >&2; return 1; };
      touch "${guardian_file}" ||
        { echo "${lib} failed to create guardian file" >&2; return 1; };
    fi;
  done;
};
export -f __buildenv_require;

function __buildenv_export() {
  while (( $# > 0 )); do
    local lib=$1;
    shift;
    __buildenv_require "${lib}" || return 1;
  done;
};
export -f __buildenv_export;
'
