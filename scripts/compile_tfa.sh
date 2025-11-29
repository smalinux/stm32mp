#!/bin/bash

# NOTE:
# sudo apt install gcc-arm-none-eabi binutils-arm-none-eabi gdb-multiarch

pushd ./external/tfa/
  # Clean first
  #make clean
  #make distclean
  #rm -rf ../../output/tf-a-stm32mp157a-dhcor-avenger96.stm32

  ## DEBUG BL2
  #make CROSS_COMPILE=arm-none-eabi- PLAT=stm32mp1 ARCH=aarch32 ARM_ARCH_MAJOR=7  \
  #  DTB_FILE_NAME=stm32mp157a-dhcor-avenger96.dtb STM32MP_SDMMC=1 \
  #  DEBUG=1 \
  #  LOG_LEVEL=50 \
  #  PLAT_LOG_LEVEL_ASSERT=50
  #cp ./build/stm32mp1/debug/tf-a-stm32mp157a-dhcor-avenger96.stm32 ../../output/

  # Release BL2 
  make CROSS_COMPILE=arm-none-eabi- PLAT=stm32mp1 ARCH=aarch32 ARM_ARCH_MAJOR=7  \
    DTB_FILE_NAME=stm32mp157a-dhcor-avenger96.dtb STM32MP_EMMC=1 STM32MP_EMMC_BOOT=1 STM32MP_SDMMC=1 STM32MP_SPI_NOR=1
  cp ./build/stm32mp1/release/tf-a-stm32mp157a-dhcor-avenger96.stm32 ../../output/
popd
