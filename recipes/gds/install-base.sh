#!/bin/bash

install_dirs=(
config
Base
Math
Containers
IO/parseline
IO/sockutil
IO/daqsocket
IO/frameutils
IO/html
IO/jsstack
IO/lmsg
IO/lxr
IO/web
IO/xsil
SignalProcessing
)

pushd _build
set -ex

# install PConfig.h
make -j ${CPU_COUNT} V=1 VERBOSE=1 install-nodist_includeHEADERS

# install each directory
for dir_ in ${install_dirs[@]}; do
    make -j ${CPU_COUNT} V=1 VERBOSE=1 install -C ${dir_}
done

# install framefast on its own
make -j ${CPU_COUNT} V=1 VERBOSE=1 install -C IO/framefast bin_PROGRAMS=""
