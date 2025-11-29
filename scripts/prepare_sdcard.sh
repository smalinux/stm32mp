#!/bin/bash

set -e -x

SD_CARD_DEVICE="${1}"                       # SD card device (e.g., /dev/sdb)
CROSS_COMPILE="arm-linux-gnueabihf-"              # Cross-compiler prefix

# === Check for SD card device ===
if [ -z ${SD_CARD_DEVICE} ]; then
   echo -e "\e[31mVar \${1} is empty... Replace with your SD card device (e.g., /dev/sdb)\e[0m"
   exit 1
fi


dd if=output/tf-a-stm32mp157a-dhcor-avenger96.stm32 of=${1}1 bs=1M conv=fdatasync
dd if=output/tf-a-stm32mp157a-dhcor-avenger96.stm32 of=${1}2 bs=1M conv=fdatasync
dd if=output/fip.bin of=${1}3 bs=1M conv=fdatasync
