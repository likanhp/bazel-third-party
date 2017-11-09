#!/usr/bin/env bash

set -e

docker rm -f "${container_id}" >&2 || true

echo "unset container_id scripts_dir container_homd_dir docker_entry_point;"
echo "unset _variant _source_root _prefix _make_trace_opt;"
echo "unset -f __buildenv_require __buildenv_export;"
