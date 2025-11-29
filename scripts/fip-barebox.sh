#!/bin/bash



# TODO
# Cleanup "../../output" and save this location to vars


pushd ./external/tfa/
  make CROSS_COMPILE=arm-none-eabi- PLAT=stm32mp1 ARCH=aarch32 ARM_ARCH_MAJOR=7 \
      STM32MP_EMMC=1 STM32MP_EMMC_BOOT=1 STM32MP_SDMMC=1 STM32MP_SPI_NOR=1 \
      AARCH32_SP=sp_min \
      DTB_FILE_NAME=stm32mp157a-dhcor-avenger96.dtb \
      BL33=/src/barebox/build/images/barebox-stm32mp-generic-bl33.img \
      BL33_CFG=/src/barebox/build/arch/arm/dts/stm32mp157a-dhcor-stm32mp1.dtb \
      fip
  cp ./build/stm32mp1/release/fip.bin ../../output/
popd
