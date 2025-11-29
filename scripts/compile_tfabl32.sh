#!/bin/bash

pushd ./external/tfa/
  make \
      CROSS_COMPILE=arm-none-eabi- \
      PLAT=stm32mp1 \
      ARCH=aarch32 \
      ARM_ARCH_MAJOR=7 \
      AARCH32_SP=sp_min \
      DTB_FILE_NAME=stm32mp157a-dhcor-avenger96.dtb \
      bl32 dtbs
  cp ./build/stm32mp1/release/bl32.bin ../../output/
popd
