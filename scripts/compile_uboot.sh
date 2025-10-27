#!/bin/bash
set -e

#NOTE:
#$ grep -E "CONFIG_DEFAULT_DEVICE_TREE" external/uboot/.config
#     CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157a-dhcor-avenger96"
# OR
# grep -i device_tree configs/stm32mp15_dhcor_basic_defconfig
DEVICE_TREE=st/stm32mp157a-dhcor-avenger96

pushd ./external/uboot/
  # Clean
  make clean
  make distclean
  # Rebuild
  make stm32mp15_dhcor_basic_defconfig
  make DEVICE_TREE=${DEVICE_TREE}
  # cp
  cp ./u-boot-nodtb.bin ../../output/
  cp ./dts/upstream/src/arm/st/stm32mp157a-dhcor-avenger96.dtb ../../output/
popd
