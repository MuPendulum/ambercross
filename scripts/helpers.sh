#!/bin/bash

check_folder() {
    if [[ ! -d "$1" ]]; then
        echo "error: $1 does not exist"
        exit 1
    fi
}

prepare_repo() {
    if [[ ! -d "$1" ]]; then
        git clone --depth=1 "$2"
    else
        # Sanitize and update repo
        pushd "$1"
        git reset --hard
        git clean -xfd
        git pull
        popd
    fi
}

apply_patches() {
    if [[ -d ../"patches" && -n "$(ls -A ../"patches")" ]]; then
            git apply ../"patches/"*.patch
    fi
}

strip_lib() {
    "$STRIP" --strip-unneeded "$1"
}

copy_lib() {
    rsync -vac "$1" "${OUT_DIR}/"
}

create_archive() {
    check_folder "$OUT_DIR"

    cur_date=$(date '+%Y%m%d')
    archive_name="cores-$cur_date"
    if [[ -f "${archive_name}.zip" ]]; then
        rm -v "${archive_name}.zip"
    fi
    7za a -mm=Deflate -mfb=258 -mpass=15 -r "${archive_name}.zip" "$OUT_DIR"
    7za rn "${archive_name}.zip" "$(basename "$OUT_DIR")/" "cores/"
}
