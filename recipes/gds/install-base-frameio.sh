#!/bin/bash

install_dirs=(
FrameIO
)

pushd _build
set -ex
for dir_ in ${install_dirs[@]}; do
    make -j ${CPU_COUNT} V=1 VERBOSE=1 install -C ${dir_}
done

# install framefast binaries
make -j ${CPU_COUNT} V=1 VERBOSE=1 install-binPROGRAMS -C IO/framefast
