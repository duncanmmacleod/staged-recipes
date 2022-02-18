#!/bin/bash

set -ex

mkdir -p _build
pushd _build

# configure
${SRC_DIR}/configure \
	--enable-online \
	--includedir=${PREFIX}/include/gds \
	--prefix="${PREFIX}" \
	--with-jsoncpp="${PREFIX}" \
;


# build
make -j ${CPU_COUNT} V=1 VERBOSE=1

# check (only when not cross compiling)
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
	make -j ${CPU_COUNT} V=1 VERBOSE=1 check
fi
