#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

pushd ./external/barebox/
  # Clean
  git pull
  make clean
  make distclean
  make stm32mp_defconfig
  # Rebuild
  make
  # cp
  #cp ./dts/upstream/src/arm/st/stm32mp157a-dhcor-avenger96.dtb ../../output/
popd
