#!/bin/bash

set -e

install_dirs=(
EasyCalibrate
gdsplot
generator
LscEmul
osc3
)

cd _build
for dir_ in ${install_dirs[@]}; do
	make -j ${CPU_COUNT} V=1 VERBOSE=1 install -C ${dir_}
done
