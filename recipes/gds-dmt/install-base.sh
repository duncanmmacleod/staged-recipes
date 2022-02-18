#!/bin/bash

set -e

install_dirs=(
calc_engine
DatEnv
)

cd _build
for dir_ in ${install_dirs[@]}; do
	make -j ${CPU_COUNT} V=1 VERBOSE=1 install -C ${dir_}
done
