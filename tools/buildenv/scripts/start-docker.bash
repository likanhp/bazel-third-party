#!/usr/bin/env bash

set -e

_variant=$1

case "${_variant}" in
  x86)
    _image=likan/buildenv:ubuntu18.04_x86
    _docker_entry_point='/usr/bin/linux32 bash'
    ;;
  x64)
    _image=likan/buildenv:fc28_x64
    _docker_entry_point='bash'
    ;;
  *) echo "Variant ${_variant} is not recognized" >&2; exit 1;;
esac

_host_source_root=$(cd "$(dirname "$0")/../../.." && pwd)
_overlay_root=/overlay
_container_source_root="${_overlay_root}/bazel-third-party"
_container_id=$(docker run --privileged -v "${_host_source_root}:/bazel-third-party:ro" -d "${_image}" \
                ${_docker_entry_point} -c 'while true; do sleep 10000; done')
_container_prefix=/opt

docker exec "${_container_id}" ${_docker_entry_point} -c \
  'sudo mkdir -p '"'${_container_prefix}'"' &&
   sudo chmod 777 '"'${_container_prefix}'"' &&
   sudo mkdir -p '"'${_overlay_root}'"' &&
   sudo mount -t tmpfs none '"'${_overlay_root}'"' &&
   sudo mkdir -p '"'${_overlay_root}/upper' '${_overlay_root}/work' '${_container_source_root}'"' &&
   sudo mount -t overlay overlay -o '"'lowerdir=/bazel-third-party,upperdir=${_overlay_root}/upper,\
workdir=${_overlay_root}/work' '${_container_source_root}'" >&2

cat <<EOF
export _container_id='${_container_id}';
export _docker_entry_point='${_docker_entry_point}';
export _host_source_root='${_host_source_root}';
export _variant='${_variant}';
export _container_source_root='${_container_source_root}';
export _prefix=/opt;
export _make_trace_opt=--trace;
export _nproc='$(docker exec "${_container_id}" ${_docker_entry_point} -c nproc)';
EOF
cat <<"EOF"
function __buildenv_require() {
  while (( $# > 0 )); do
    local _lib=$1;
    shift;
    local _export_build_root="/tmp/${_lib}_build_tree.${_variant}";
    local _export_install_root="/tmp/${_lib}_install_tree.${_variant}";
    local _guardian_file="${_export_build_root}/__built";
    if ! docker exec "${_container_id}" ${_docker_entry_point} -c "[[ -f '${_guardian_file}' ]]"; then
      docker exec "${_container_id}" ${_docker_entry_point} -c \
        "rm -rf '${_export_build_root}' '${_export_install_root}'" ||
        { echo "${_lib} failed to clean up output directories" >&2; return 1; };
      docker exec "${_container_id}" ${_docker_entry_point} -c \
        "sudo chown -R likan:likan '${_container_source_root}/${_lib}'" ||
        { echo "${_lib} failed to chown directory" >&2; return 1; };
      _stage=deps
      _export_build_root="${_export_build_root}"
      _export_install_root="${_export_install_root}"
      bash "${_host_source_root}/${_lib}/build-install.bash" ||
        { echo "${_lib} failed in deps stage" >&2; return 1; };
      docker exec "${_container_id}" ${_docker_entry_point} -c \
        "_stage=build-install _prefix='${_prefix}' _make_trace_opt='${_make_trace_opt}'
         _source_root='${_container_source_root}' _export_build_root='${_export_build_root}'
         _export_install_root='${_export_install_root}' _variant='${_variant}'
         _nproc='${_nproc}'
         bash '${_container_source_root}/${_lib}/build-install.bash'" ||
        { echo "${_lib} failed to run build script in docker" >&2; return 1; };
      docker exec "${_container_id}" ${_docker_entry_point} -c "touch '${_guardian_file}'" ||
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
    local _output_root="${_host_source_root}/.builds/";
    mkdir -p "${_output_root}" ||
      { echo "${_lib} failed to create output directory ${_output_root}" >&2; return 1; };
    rm -rf "${_output_root}/${_lib}_build_tree.${_variant}"
      "${_output_root}/${_lib}_install_tree.${_variant}" ||
      { echo "${_lib} failed to clean up output directories" >&2; return 1; };
    docker cp "${_container_id}:/tmp/${_lib}_build_tree.${_variant}" "${_output_root}" ||
      { rm -rf "${_output_root}/${_lib}_build_tree.${_variant}" &&
        docker exec "${_container_id}" ${_docker_entry_point} -c \
          "tar -cf - -C /tmp ${_lib}_build_tree.${_variant}" |
        tar -xpf - -C "${_output_root}"; } ||
      { echo "${_lib} failed to export build tree" >&2; return 1; };
    docker cp "${_container_id}:/tmp/${_lib}_install_tree.${_variant}" "${_output_root}" ||
      { rm -rf "${_output_root}/${_lib}_install_tree.${_variant}" &&
        docker exec "${_container_id}" ${_docker_entry_point} -c \
          "tar -cf - -C /tmp ${_lib}_install_tree.${_variant}" >
        "${_output_root}/${_lib}_install_tree.${_variant}.tar"; } ||
      { echo "${_lib} failed to export install tree" >&2; return 1; };
  done;
};
export -f __buildenv_export;
EOF
