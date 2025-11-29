#!/bin/bash

pushd ./external/optee/
  make CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm PLATFORM=stm32mp1 \
    CFG_EMBED_DTB_SOURCE_FILE=stm32mp157c-ev1.dts

  cp ./out/arm-plat-stm32mp1/core/tee-header_v2.bin ../../output/
  cp ./out/arm-plat-stm32mp1/core/tee-pager_v2.bin ../../output/
  cp ./out/arm-plat-stm32mp1/core/tee-pageable_v2.bin ../../output/
  cp ./out/arm-plat-stm32mp1/core/arch/arm/dts/stm32mp157c-ev1.dtb ../../output/

popd
