#!/bin/sh

# Configure toolchain path
export MBED_ARMC6_PATH="C:/Keil_v5/ARM/ARMCLANG_V6.12/bin"
export MBED_GCC_ARM_PATH="C:/Program Files (x86)/GNU Tools Arm Embedded/8 2019-q3-update/bin"

# Specify toolchain
TOOLCHAIN="ARMC6"
# Specify target
TARGET="NU_M2354_S"

# Build in mbed-os directory
cd mbed-os
python ./tools/psa/release.py -m $TARGET -t $TOOLCHAIN
cd ..
