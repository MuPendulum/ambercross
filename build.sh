#!/bin/bash
set -e

source scripts/variables.sh
source scripts/helpers.sh
source scripts/cores.sh

if [[ -d "$CORE_DIR" ]]; then
    # Clean previously built libraries
    if [[ -d "$OUT_DIR" ]]; then
        rm -vf "${OUT_DIR}/"*.so
    fi
else
    echo "error: $CORE_DIR does not exist"
    exit 1
fi

pushd "$CORE_DIR"
# Enabled cores
gambatte
mgba
nestopia
supafaust
snes9x
genesisplusgx
picodrive
beetlepcefast
popd
create_archive
