#!/bin/bash

set -e

cd _build
make V=1 VERBOSE=1 -C macros install
