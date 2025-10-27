#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
# export CROSS_COMPILE=/path/to/toolchain/arm-linux-gnueabi-
# export KBUILD_OUTPUT=/path/to/output

# Format SD Card
source ./scripts/format_sdcard.sh

# Compile TF-A
source ./scripts/compile_tfa.sh

# Compile OP-TEE
source ./scripts/compile_optee.sh

# Compile uboot
source ./scripts/compile_uboot.sh

# fip
source ./scripts/fip.sh

# Copy to SD Card
source ./scripts/prepare_sdcard.sh
