#!/bin/sh

[ -f ./00boot ] && ./00boot
./configure \
    PYTHON_CONFIG=${PREFIX}/bin/python${PY_VER}-config \
    --prefix=$PREFIX \
    --enable-swig-python \
    --disable-swig-octave \
    --disable-doxygen \
    --disable-gcc-flags \
    --enable-silent-rules
make -j ${CPU_COUNT}
make -j ${CPU_COUNT} check
make -j ${CPU_COUNT} install
