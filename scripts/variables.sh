#!/bin/sh

CURRENT_DIR=$(pwd)
CORE_DIR="${CURRENT_DIR}/cores"
OUT_DIR="${CURRENT_DIR}/release"
BUILD_PLATFORM="rk3326"

DISABLE_HARDENING_CFLAGS="-fno-stack-protector -fno-stack-clash-protection -fcf-protection=none -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0"
DISABLE_HARDENING_LDFLAGS="-Wl,-z,norelro,-z,lazy"
ENABLE_GRAPHITE="-fgraphite-identity -floop-nest-optimize"

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
export CFLAGS="-mcpu=cortex-a35+crc+crypto --param l1-cache-size=32 --param l1-cache-line-size=64 --param l2-cache-size=256 -O3 -fomit-frame-pointer -fno-semantic-interposition -fipa-pta -fno-plt -flto=auto -ffat-lto-objects -fdevirtualize-at-ltrans $ENABLE_GRAPHITE $DISABLE_HARDENING_CFLAGS"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="-Wl,-O1,--sort-common,--as-needed,--hash-style=gnu $DISABLE_HARDENING_LDFLAGS -flto=auto"
#export MAKEFLAGS="-j1"
