#!/bin/bash
set -e

cd "$(dirname "$0")"
source ../../scripts/variables.sh

sysroot_path="${HOME}/x-tools/aarch64-rg351-linux-gnu/aarch64-rg351-linux-gnu/sysroot"
pkg_ver="1.2.13"
src_url="https://www.zlib.net/zlib-${pkg_ver}.tar.xz"

# Download
curl -SO "$src_url"
tar -xJf "zlib-${pkg_ver}.tar.xz"

cd zlib-"${pkg_ver}"

# Build
./configure --prefix=/usr
make

cd contrib/minizip
autoreconf --install
./configure \
    --prefix=/usr \
    --enable-static=no \
    --build="$BUILD_TUPLE" \
    --host="$TARGET"

# Package
cd ../../
make install DESTDIR="$sysroot_path"

cd contrib/minizip
make install DESTDIR="$sysroot_path"
cd ../../../

# Clean
rm -rf zlib-"${pkg_ver}"
rm -v "zlib-${pkg_ver}.tar.xz"
