#!/bin/sh
SCRIPTPATH="$(realpath "${BASH_SOURCE[0]}")"
if [[ "${#}" == 1 ]]; then
    if [[ -s "${1}" ]]; then
        TARGETFILE="${1}"
    else
        TARGETFILE="${SCRIPTPATH}"
    fi
else
    TARGETFILE="${SCRIPTPATH}"
fi
highlight --style="$( \
        fd --base-directory=/usr/local/opt/highlight/share/highlight/themes --exec echo "{.}" | \
        sort --random-sort | \
        head -n 1 \
    )" --out-format=html --inline-css --line-number --replace-tabs=2 "${TARGETFILE}" | \
    browser
