#!/usr/bin/env /bin/bash
direnv exec "$(dirname "${BASH_SOURCE[0]}")" printenv FOO
direnv exec "$(dirname "${BASH_SOURCE[0]}")" procs --tree $$