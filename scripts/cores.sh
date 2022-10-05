#!/bin/bash

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
    strip_lib "$core_lib"

    copy_lib "$core_lib"
    make -f Makefile.libretro platform="$BUILD_PLATFORM" clean
    popd
    popd
}

mgba() {
    core_name="mgba"
    git_name="$core_name"
    git_repo="https://github.com/libretro/${git_name}.git"
    core_lib="mgba_libretro.so"

    check_folder "$core_name"
    pushd "$core_name"
    prepare_repo "$git_name" "$git_repo"
    pushd "$git_name"
    apply_patches

    make -f Makefile.libretro platform="$BUILD_PLATFORM" clean
    make -f Makefile.libretro platform="$BUILD_PLATFORM"
    strip_lib "$core_lib"

    copy_lib "$core_lib"
    make -f Makefile.libretro platform="$BUILD_PLATFORM" clean
    popd
    popd
}

supafaust() {
    core_name="supafaust"
    git_name="$core_name"
    git_repo="https://github.com/libretro/${git_name}.git"
    core_lib="beetle_supafaust_libretro.so"

    check_folder "$core_name"
    pushd "$core_name"
    prepare_repo "$git_name" "$git_repo"
    pushd "$git_name"
    apply_patches

    make platform="$BUILD_PLATFORM" clean
    make platform="$BUILD_PLATFORM"
    # Required by AmberELEC
    mv "mednafen_supafaust_libretro.so" "$core_lib"
    strip_lib "$core_lib"

    copy_lib "$core_lib"
    make platform="$BUILD_PLATFORM" clean
    popd
    popd
}

snes9x() {
    core_name="snes9x"
    git_name="$core_name"
    git_repo="https://github.com/libretro/${git_name}.git"
    core_lib="libretro/snes9x_libretro.so"

    check_folder "$core_name"
    pushd "$core_name"
    prepare_repo "$git_name" "$git_repo"
    pushd "$git_name"
    apply_patches

    make -C libretro platform="$BUILD_PLATFORM" clean
    make -C libretro platform="$BUILD_PLATFORM"
    strip_lib "$core_lib"

    copy_lib "$core_lib"
    make -C libretro platform="$BUILD_PLATFORM" clean
    popd
    popd
}
