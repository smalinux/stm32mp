#!/bin/bash

set -e -x

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
# export CROSS_COMPILE=/path/to/toolchain/arm-linux-gnueabi-
# export KBUILD_OUTPUT=/path/to/output

# Compile BL2
source ./scripts/compile_tfa.sh

# Compile barebox
#source ./scripts/compile_barebox.sh

# fip
source ./scripts/fip-barebox.sh

# Format SD Card
source ./scripts/format_sdcard-barebox.sh
