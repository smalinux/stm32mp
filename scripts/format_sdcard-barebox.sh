#!/bin/bash

SD_CARD_DEVICE="${1}"                       # SD card device (e.g., /dev/sdb)
CROSS_COMPILE="arm-linux-gnueabihf-"              # Cross-compiler prefix

# === Check for SD card device ===
if [ -z ${SD_CARD_DEVICE} ]; then
   echo -e "\e[31mVar \${1} is empty... Replace with your SD card device (e.g., /dev/sdb)\e[0m"
   exit 1
fi

# remove previous formatting
sgdisk -o ${1}

# create minimal image for FIP
# With gpt table with 128 entries an the partition 4 marked bootable (bit 2).
#
# Number  Start (sector)    End (sector)  Size       Code  Name
#    1              34             545   256.0 KiB   8300  fsbl1
#    2             546            1057   256.0 KiB   8300  fsbl2
#    3            1058            9249   4.0 MiB     8300  fip
#    4            9250           11297   1024.0 KiB  8300  env
#    5           11298       122138590   58.2 GiB    8300  rootfs
#
#
sgdisk --resize-table=128 -a 1 \
  -n 1:34:545         -c 1:fsbl1 \
  -n 2:546:1057       -c 2:fsbl2 \
  -n 3:1058:9249      -c 3:fip \
  -n 4:9250:11297     -c 4:env -t 4:6c3737f2-07f8-45d1-ad45-15d260aab24d \
  -n 5:11298:         -c 5:rootfs -A 5:set:2 \
  -p ${1}

dd if=output/tf-a-stm32mp157a-dhcor-avenger96.stm32 of=${1}1 bs=1M conv=fdatasync
dd if=output/tf-a-stm32mp157a-dhcor-avenger96.stm32 of=${1}2 bs=1M conv=fdatasync
dd if=output/fip.bin of=${1}3 bs=1M conv=fdatasync
