#!/bin/bash

install_dirs=(
IO/framexmit
IO/lsmp
Services/Dpush
)

pushd _build
set -ex
for dir_ in ${install_dirs[@]}; do
    make -j ${CPU_COUNT} V=1 VERBOSE=1 install -C ${dir_}
done
