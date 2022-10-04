#!/bin/bash

set -e

export TARGET=aarch64-rg351-linux-gnu
export CROSS_COMPILE="${TARGET}-"
export CARCH=aarch64
export CHOST="$TARGET"
export CPP="${TARGET}-cpp"
export CC="${TARGET}-gcc"
export CXX="${TARGET}-g++"
export LD="${TARGET}-ld"
export AS="${TARGET}-as"
export AR="${TARGET}-gcc-ar"
export RANLIB="${TARGET}-gcc-ranlib"
export NM="${TARGET}-gcc-nm"
export OBJCOPY="${TARGET}-objcopy"
export OBJDUMP="${TARGET}-objdump"
export STRIP="${TARGET}-strip"
#export CFLAGS=""
#export CXXFLAGS="$CFLAGS"
#export LDFLAGS="-Wl,-O1,--sort-common,--as-needed"
#export MAKEFLAGS="-j1"

CURRENT_DIR=$(pwd)
CORE_DIR="${CURRENT_DIR}/cores"
BUILD_DIR="${CURRENT_DIR}/build"
BUILD_PLATFORM="rk3326"

# Helper functions
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
        # Clean and update git repo
        pushd "$1"
        git reset --hard && git clean -xfd
        git pull
        popd
    fi
}

apply_patches() {
    if [[ -d ../"patches" ]]; then
        if [ -n "$(ls -A ../"patches")" ]; then
            git apply ../"patches/"*.patch
        else
            echo "error: unable to locate any patches"
            exit 1
        fi
    else
        echo "error: patches directory does not exist"
        exit 1
    fi
}

copy_lib() {
    rsync -vac "$1" "${BUILD_DIR}/"
}

create_archive() {
    check_folder "$BUILD_DIR"

    archive_name="cores"
    if [[ -f "${archive_name}.zip" ]]; then
        rm -v "${archive_name}.zip"
    fi
    7za a -mm=Deflate -mfb=258 -mpass=15 -r "${archive_name}.zip" "$BUILD_DIR"
    7za rn "${archive_name}.zip" "build/" "cores/"
}

# Core build functions
gambatte() {
    core_name="gambatte"
    git_name="gambatte-libretro"
    git_repo="https://github.com/libretro/${git_name}.git"
    core_lib="gambatte_libretro.so"

    check_folder "$core_name"
    pushd "$core_name"
    prepare_repo "$git_name" "$git_repo"
    pushd "$git_name"
    apply_patches

    make -f Makefile.libretro platform="$BUILD_PLATFORM" clean
    make -f Makefile.libretro platform="$BUILD_PLATFORM"
    "$STRIP" --strip-unneeded "$core_lib"

    copy_lib "$core_lib"
    make -f Makefile.libretro platform="$BUILD_PLATFORM" clean
    popd
    popd
}

supafaust() {
    core_name="supafaust"
    git_name="$core_name"
    git_repo="https://github.com/libretro/${git_name}.git"
    core_lib="mednafen_supafaust_libretro.so"

    check_folder "$core_name"
    pushd "$core_name"
    prepare_repo "$git_name" "$git_repo"
    pushd "$git_name"
    apply_patches

    make platform="$BUILD_PLATFORM" clean
    make platform="$BUILD_PLATFORM"
    "$STRIP" --strip-unneeded "$core_lib"

    copy_lib "$core_lib"
    make platform="$BUILD_PLATFORM" clean
    popd
    popd
}

if [[ -d "$CORE_DIR" ]]; then
    # Clean previously built libraries
    if [[ -d "$BUILD_DIR" ]]; then
        rm -v "${BUILD_DIR}/"*.so
    fi
else
    echo "error: $CORE_DIR does not exist"
    exit 1
fi

pushd "$CORE_DIR"
# Enabled cores
gambatte
supafaust
popd
create_archive
