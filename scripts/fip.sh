#!/bin/bash



# TODO
# Cleanup "../../output" and save this location to vars


pushd ./external/tfa/
  make \
      CROSS_COMPILE=arm-none-eabi- \
      PLAT=stm32mp1 \
      ARCH=aarch32 \
      ARM_ARCH_MAJOR=7 \
      AARCH32_SP=optee \
      DTB_FILE_NAME=stm32mp157a-dhcor-avenger96.dtb \
      BL33=../../output/u-boot-nodtb.bin \
      BL33_CFG=../../output/stm32mp157a-dhcor-avenger96.dtb \
      BL32=../../output/tee-header_v2.bin \
      BL32_EXTRA1=../../output/tee-pager_v2.bin \
      BL32_EXTRA2=../../output/tee-pageable_v2.bin \
      fip
  cp ./build/stm32mp1/release/fip.bin ../../output/
popd
