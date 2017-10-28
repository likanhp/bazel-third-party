#!/usr/bin/env bash

set -e

_variant=$1

case "${_variant}" in
  x86) image=likan/buildenv:ubuntu17.10_x86;;
  x64) image=likan/buildenv:fc26_x64;;
  *) echo "Variant ${_variant} is not recognized" >&2; exit 1;;
esac

container_id=$(docker run -d "${image}" bash -c 'while true; do sleep 10000; done')

docker exec "${container_id}" bash -c \
  'sudo mkdir -p /opt &&
   sudo chmod 777 /opt &&
   mkdir -p "${HOME}/.libs" && \
   cd "${HOME}/bazel-third-party" && \
   git fetch && \
   git reset --hard origin/master && \
   git submodule update --init --recursive' >&2

container_homd_dir=$(docker exec "${container_id}" bash -c 'echo "${HOME}"')

echo "export container_id='${container_id}';"
echo "export container_homd_dir='${container_homd_dir}';"
echo "export scripts_dir='$(cd "$(dirname "$0")" && pwd)';"
echo "export _variant='${_variant}';"
echo "export _source_root='${container_homd_dir}/bazel-third-party';"
echo "export _prefix=/opt;"
echo "export _make_trace_opt=--trace;"
echo '
function __buildenv_require() {
  while (( $# > 0 )); do
    local lib=$1;
    shift;
    local build_script="${scripts_dir}/../../../${lib}/build-install.bash";
    local _export_build_root="/tmp/${lib}_build_tree.${_variant}";
    local _export_install_root="/tmp/${lib}_install_tree.${_variant}";
    local guardian_file="${_export_build_root}/__built";
    if ! docker exec "${container_id}" bash -c "[[ -f '"'"'${guardian_file}'"'"' ]]"; then
      docker exec "${container_id}" bash -c
        "rm -rf '"'"'${_export_build_root}'"'"' '"'"'${_export_install_root}'"'"'" ||
        { echo "${lib} failed to clean up output directories" >&2; return 1; };
      _stage=deps
      _export_build_root="${_export_build_root}"
      _export_install_root="${_export_install_root}"
      bash "${build_script}" ||
        { echo "${lib} failed in deps stage" >&2; return 1; };
      docker cp "${build_script}" "${container_id}:/tmp/build_script.bash" ||
        { echo "${lib} failed to copy build script to docker" >&2; return 1; };
      docker exec "${container_id}" bash -c
        "_stage=build-install _prefix=/opt _make_trace_opt=--trace
         _source_root='"'"'${_source_root}'"'"'
         _export_build_root='"'"'${_export_build_root}'"'"'
         _export_install_root='"'"'${_export_install_root}'"'"'
         _variant='"'"'${_variant}'"'"'
         bash /tmp/build_script.bash" ||
        { echo "${lib} failed to run build script in docker" >&2; return 1; };
      docker exec "${container_id}" bash -c "touch '"'"'${guardian_file}'"'"'" ||
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
    local output_root="${scripts_dir}/../../../.builds/";
    mkdir -p "${output_root}" ||
      { echo "${lib} failed to create output directory ${output_root}" >&2; return 1; };
    rm -rf "${output_root}/${lib}_build_tree.${_variant}"
      "${output_root}/${lib}_install_tree.${_variant}" ||
      { echo "${lib} failed to clean up output directories" >&2; return 1; };
    docker cp "${container_id}:/tmp/${lib}_build_tree.${_variant}" "${output_root}" ||
      { echo "${lib} failed to export build tree" >&2; return 1; };
    docker cp "${container_id}:/tmp/${lib}_install_tree.${_variant}" "${output_root}" ||
      { echo "${lib} failed to export install tree" >&2; return 1; };
  done;
};
export -f __buildenv_export;
'
