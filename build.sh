#!/usr/bin/env bash

set -e

BUILD_DIR="$(pwd)/build"
TMP_DIR="$(mktemp -d)"

mkdir -p $BUILD_DIR

echo "Building in $TMP_DIR"
cp -R /etc/wasi-lab $TMP_DIR
cd $TMP_DIR/wasi-lab
#curl https://raw.githubusercontent.com/wasienv/wasienv/master/install.sh | sh
mkdir -p build
cd build
wasimake cmake ..
cd ..
make -C build
cp ./build/duk.wasm $BUILD_DIR
rm -Rf "$TMP_DIR"