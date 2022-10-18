#!/bin/bash

set -ex

# configure EPICS_BASE to the one we actually have
cat <<EOF > configure/RELEASE.local
EPICS_BASE=${EPICS_BASE}
EOF

# build and install, all in one
make -j ${CPU_COUNT} INSTALL_LOCATION="${PREFIX}/pcas"

# create activate/deactivate scripts
mkdir -p ${PREFIX}/etc/conda/activate.d
cat <<EOF > ${PREFIX}/etc/conda/activate.d/epics-pcas_activate.sh
export EPICS_PCAS_ROOT="\${CONDA_PREFIX}/pcas"
export EPICS_PCAS_HOST_BIN="\${EPICS_PCAS_ROOT}/bin/${EPICS_HOST_ARCH}"
export PATH=\${EPICS_PCAS_HOST_BIN}:\$PATH
EOF

mkdir -p ${PREFIX}/etc/conda/deactivate.d
cat <<EOF > ${PREFIX}/etc/conda/deactivate.d/epics-pcas_deactivate.sh
export PATH=\$(echo \$PATH | sed "s?\${EPICS_PCAS_HOST_BIN}:??")
unset EPICS_PCAS_ROOT
unset EPICS_PCAS_HOST_BIN
EOF
