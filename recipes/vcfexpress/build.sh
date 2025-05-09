#!/bin/bash -euo

set -xe

export CFLAGS="${CFLAGS} -fcommon"
export CXXFLAGS="${CFLAGS} -fcommon"

export BINDGEN_EXTRA_CLANG_ARGS="${CFLAGS} ${CPPFLAGS} ${LDFLAGS}"

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

# build statically linked binary with Rust
export LD=$CC
C_INCLUDE_PATH=$PREFIX/include LIBRARY_PATH=$PREFIX/lib RUST_BACKTRACE=1 cargo install --verbose --root $PREFIX --path . --no-track
