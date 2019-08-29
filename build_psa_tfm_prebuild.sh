#!/bin/sh

TOOLCHAIN="ARMC6"
TARGET="NU_PFM_M2351_P_S"
APP_CONFIG="mbed-os/tools/psa/tfm/mbed_app.json"
PROFILE="release"
TOOLCHAIN_PROFILE=$TOOLCHAIN-`echo $PROFILE | tr '[a-z]' '[A-Z]'`

# tfm.bin/hex
BUILD_NAME="tfm"
# Remove BUILD directory for clean build
rm -rdf BUILD
# Build
mbed compile -m $TARGET -t $TOOLCHAIN \
--app-config $APP_CONFIG \
--profile $PROFILE
# Save built code
BUILD_DIR=BUILD/$TARGET/$TOOLCHAIN_PROFILE
SAVE_DIR=TARGET_IGNORE/$TARGET/$TOOLCHAIN_PROFILE/$BUILD_NAME
mkdir -p $SAVE_DIR
cp $BUILD_DIR/$BUILD_NAME.hex $SAVE_DIR
cp $BUILD_DIR/cmse_lib.o $SAVE_DIR
