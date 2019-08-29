#!/bin/sh

TOOLCHAIN="GCC_ARM"
TARGET="NU_PFM_M2351_P_S"
APP_CONFIG="mbed_app_psa_tfm.json"
PROFILE="develop"
TOOLCHAIN_PROFILE=$TOOLCHAIN-`echo $PROFILE | tr '[a-z]' '[A-Z]'`

# spm_smoke.bin/hex
BUILD_NAME="spm_smoke"
# Remove BUILD directory for clean build
rm -rdf BUILD
# Build
mbed test --compile -m $TARGET -t $TOOLCHAIN \
--app-config $APP_CONFIG \
--profile $PROFILE \
-n mbed-os-tests-psa-$BUILD_NAME \
-DUSE_PSA_TEST_PARTITIONS -DUSE_SMOKE_TESTS_PART1
# Save built code
BUILD_DIR=BUILD/tests/$TARGET/$TOOLCHAIN_PROFILE/mbed-os/TESTS/psa/$BUILD_NAME
SAVE_DIR=TARGET_IGNORE/$TARGET/$TOOLCHAIN_PROFILE/$BUILD_NAME
mkdir -p $SAVE_DIR
cp $BUILD_DIR/$BUILD_NAME.hex $SAVE_DIR
cp $BUILD_DIR/cmse_lib.o $SAVE_DIR

# spm_client.bin/hex
BUILD_NAME="spm_client"
# Remove BUILD directory for clean build
rm -rdf BUILD
mbed test --compile -m $TARGET -t $TOOLCHAIN \
--app-config $APP_CONFIG \
--profile $PROFILE \
-n mbed-os-tests-psa-$BUILD_NAME \
-DUSE_PSA_TEST_PARTITIONS -DUSE_CLIENT_TESTS_PART1
# Save built code
BUILD_DIR=BUILD/tests/$TARGET/$TOOLCHAIN_PROFILE/mbed-os/TESTS/psa/$BUILD_NAME
SAVE_DIR=TARGET_IGNORE/$TARGET/$TOOLCHAIN_PROFILE/$BUILD_NAME
mkdir -p $SAVE_DIR
cp $BUILD_DIR/$BUILD_NAME.hex $SAVE_DIR
cp $BUILD_DIR/cmse_lib.o $SAVE_DIR

# spm_server.bin/hex
BUILD_NAME="spm_server"
# Remove BUILD directory for clean build
rm -rdf BUILD
mbed test --compile -m $TARGET -t $TOOLCHAIN \
--app-config $APP_CONFIG \
--profile $PROFILE \
-n mbed-os-tests-psa-$BUILD_NAME \
-DUSE_PSA_TEST_PARTITIONS -DUSE_SERVER_TESTS_PART1 -DUSE_SERVER_TESTS_PART2
# Save built code
BUILD_DIR=BUILD/tests/$TARGET/$TOOLCHAIN_PROFILE/mbed-os/TESTS/psa/$BUILD_NAME
SAVE_DIR=TARGET_IGNORE/$TARGET/$TOOLCHAIN_PROFILE/$BUILD_NAME
mkdir -p $SAVE_DIR
cp $BUILD_DIR/$BUILD_NAME.hex $SAVE_DIR
cp $BUILD_DIR/cmse_lib.o $SAVE_DIR

# crypto_access_control.bin/hex
BUILD_NAME="crypto_access_control"
# Remove BUILD directory for clean build
rm -rdf BUILD
mbed test --compile -m $TARGET -t $TOOLCHAIN \
--app-config $APP_CONFIG \
--profile $PROFILE \
-n mbed-os-tests-psa-$BUILD_NAME \
-DUSE_PSA_TEST_PARTITIONS -DUSE_CRYPTO_ACL_TEST
# Save built code
BUILD_DIR=BUILD/tests/$TARGET/$TOOLCHAIN_PROFILE/mbed-os/TESTS/psa/$BUILD_NAME
SAVE_DIR=TARGET_IGNORE/$TARGET/$TOOLCHAIN_PROFILE/$BUILD_NAME
mkdir -p $SAVE_DIR
cp $BUILD_DIR/$BUILD_NAME.hex $SAVE_DIR
cp $BUILD_DIR/cmse_lib.o $SAVE_DIR
