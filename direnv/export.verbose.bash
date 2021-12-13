#!/usr/bin/env bash
direnv_dir="$(dirname "${BASH_SOURCE[0]}")"
pushd "${direnv_dir}"
eval "$(direnv export bash)"
popd
echo FOO="${FOO}"
procs --tree $$