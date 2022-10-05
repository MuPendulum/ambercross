#!/bin/sh

CURRENT_DIR=$(pwd)
CORE_DIR="${CURRENT_DIR}/cores"
OUT_DIR="${CURRENT_DIR}/release"
BUILD_PLATFORM="rk3326"

# $CC -v
export BUILD_TUPLE=x86_64-build_pc-linux-gnu
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
export CFLAGS="-mcpu=cortex-a35+crypto --param l1-cache-size=32 --param l1-cache-line-size=64 --param l2-cache-size=256 -O3 -g -fno-plt -fipa-pta -flto=auto -ffat-lto-objects -fdevirtualize-at-ltrans"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="-Wl,-O1,--sort-common,--as-needed -flto=auto"
#export MAKEFLAGS="-j1"
