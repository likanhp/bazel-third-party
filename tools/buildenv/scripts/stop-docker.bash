#!/usr/bin/env bash

set -e

docker rm -f "${_container_id}" >&2 || true

cat <<"EOF"
unset _container_id _docker_entry_point _host_source_root;
unset _variant _container_source_root _prefix _make_trace_opt _nproc;
unset -f __buildenv_require __buildenv_export;
EOF
