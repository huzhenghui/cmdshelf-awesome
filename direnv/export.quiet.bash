#!/usr/bin/env bash
direnv_dir="$(dirname "${BASH_SOURCE[0]}")"
pushd "${direnv_dir}" 1>/dev/null
eval "$(direnv export bash 2>/dev/null)"
popd 1>/dev/null
echo FOO="${FOO}"