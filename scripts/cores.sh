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

nestopia() {
    core_name="nestopia"
    git_name="$core_name"
    git_repo="https://github.com/libretro/${git_name}.git"
    core_lib="libretro/nestopia_libretro.so"

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

genesisplusgx() {
    core_name="genesisplusgx"
    git_name="Genesis-Plus-GX"
    git_repo="https://github.com/libretro/${git_name}.git"
    core_lib="genesis_plus_gx_libretro.so"

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

picodrive() {
    core_name="picodrive"
    git_name="$core_name"
    git_repo="https://github.com/libretro/${git_name}.git"
    core_lib="picodrive_libretro.so"

    check_folder "$core_name"
    pushd "$core_name"
    prepare_repo "$git_name" "$git_repo"
    pushd "$git_name"
    git submodule update --init --recursive
    apply_patches

    make -f Makefile.libretro platform="$BUILD_PLATFORM" clean
    make -f Makefile.libretro platform="$BUILD_PLATFORM"
    strip_lib "$core_lib"

    copy_lib "$core_lib"
    make -f Makefile.libretro platform="$BUILD_PLATFORM" clean
    popd
    popd
}

beetlepcefast() {
    core_name="beetlepcefast"
    git_name="beetle-pce-fast-libretro"
    git_repo="https://github.com/libretro/${git_name}.git"
    core_lib="beetle_pce_fast_libretro.so"

    check_folder "$core_name"
    pushd "$core_name"
    prepare_repo "$git_name" "$git_repo"
    pushd "$git_name"
    apply_patches

    make platform="$BUILD_PLATFORM" clean
    make platform="$BUILD_PLATFORM"
    # Required by AmberELEC
    mv "mednafen_pce_fast_libretro.so" "$core_lib"
    strip_lib "$core_lib"

    copy_lib "$core_lib"
    make platform="$BUILD_PLATFORM" clean
    popd
    popd
}

beetlewswan() {
    core_name="beetlewswan"
    git_name="beetle-wswan-libretro"
    git_repo="https://github.com/libretro/${git_name}.git"
    core_lib="beetle_wswan_libretro.so"

    check_folder "$core_name"
    pushd "$core_name"
    prepare_repo "$git_name" "$git_repo"
    pushd "$git_name"
    apply_patches

    make platform="$BUILD_PLATFORM" clean
    make platform="$BUILD_PLATFORM"
    # Required by AmberELEC
    mv "mednafen_wswan_libretro.so" "$core_lib"
    strip_lib "$core_lib"

    copy_lib "$core_lib"
    make platform="$BUILD_PLATFORM" clean
    popd
    popd
}

beetlengp() {
    core_name="beetlengp"
    git_name="beetle-ngp-libretro"
    git_repo="https://github.com/libretro/${git_name}.git"
    core_lib="beetle_ngp_libretro.so"

    check_folder "$core_name"
    pushd "$core_name"
    prepare_repo "$git_name" "$git_repo"
    pushd "$git_name"
    apply_patches

    make platform="$BUILD_PLATFORM" clean
    make platform="$BUILD_PLATFORM"
    # Required by AmberELEC
    mv "mednafen_ngp_libretro.so" "$core_lib"
    strip_lib "$core_lib"

    copy_lib "$core_lib"
    make platform="$BUILD_PLATFORM" clean
    popd
    popd
}

pcsxrearmed() {
    core_name="pcsxrearmed"
    git_name="pcsx_rearmed"
    git_repo="https://github.com/libretro/${git_name}.git"
    core_lib="pcsx_rearmed_libretro.so"

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
