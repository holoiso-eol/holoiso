#!/bin/bash
PROFILEDIR=$1
count=1
for kernel in $(cat ${PROFILEDIR}/kernel_list.bootstrap)
do
    kernel=$(echo $kernel | sed 's/.*linux/linux/g' | sed 's/.*headers//g')
    if [ -z "$kernel" ]; then
        continue
    fi
    if [[ "$kernel" != "linux-neptune" ]]; then
    echo -e "title   HoloISO installer (${kernel}, NVIDIA/Zen 3+/RZ608 or Unverified devices, Copy to RAM)\nlinux   /%INSTALL_DIR%/boot/x86_64/vmlinuz-${kernel}\ninitrd  /%INSTALL_DIR%/boot/intel-ucode.img\ninitrd  /%INSTALL_DIR%/boot/amd-ucode.img\ninitrd  /%INSTALL_DIR%/boot/x86_64/initramfs-${kernel}.img\noptions splash plymouth.nolog archisobasedir=%INSTALL_DIR% archisolabel=%ARCHISO_LABEL% cow_spacesize=10G copytoram" > ${PROFILEDIR}/efiboot/loader/entries/$count-$kernel-copytoram.conf
    count=$((count+1))
    echo -e "title   HoloISO installer (${kernel}, NVIDIA/Zen 3+/RZ608 or Unverified devices)\nlinux   /%INSTALL_DIR%/boot/x86_64/vmlinuz-${kernel}\ninitrd  /%INSTALL_DIR%/boot/intel-ucode.img\ninitrd  /%INSTALL_DIR%/boot/amd-ucode.img\ninitrd  /%INSTALL_DIR%/boot/x86_64/initramfs-${kernel}.img\noptions splash plymouth.nolog archisobasedir=%INSTALL_DIR% archisolabel=%ARCHISO_LABEL%" > ${PROFILEDIR}/efiboot/loader/entries/$count-$kernel.conf
    count=$((count+1))
    else
    echo -e "title   HoloISO installer (${kernel}, Deck kernel, Copy to RAM)\nlinux   /%INSTALL_DIR%/boot/x86_64/vmlinuz-${kernel}\ninitrd  /%INSTALL_DIR%/boot/intel-ucode.img\ninitrd  /%INSTALL_DIR%/boot/amd-ucode.img\ninitrd  /%INSTALL_DIR%/boot/x86_64/initramfs-${kernel}.img\noptions splash plymouth.nolog archisobasedir=%INSTALL_DIR% archisolabel=%ARCHISO_LABEL% cow_spacesize=10G copytoram" > ${PROFILEDIR}/efiboot/loader/entries/$count-$kernel-copytoram.conf
    count=$((count+1))
    echo -e "title   HoloISO installer (${kernel}, Deck kernel)\nlinux   /%INSTALL_DIR%/boot/x86_64/vmlinuz-${kernel}\ninitrd  /%INSTALL_DIR%/boot/intel-ucode.img\ninitrd  /%INSTALL_DIR%/boot/amd-ucode.img\ninitrd  /%INSTALL_DIR%/boot/x86_64/initramfs-${kernel}.img\noptions splash plymouth.nolog archisobasedir=%INSTALL_DIR% archisolabel=%ARCHISO_LABEL%" > ${PROFILEDIR}/efiboot/loader/entries/$count-$kernel.conf
    count=$((count+1))
    fi
done