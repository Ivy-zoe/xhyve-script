#!/bin/bash

######################################
######################################
########## Setup Vms #################
######################################
######################################

DIR=/Users/chaos/vms
# Kernel vmlinuz
KERNEL="$DIR/kernel/gentoo/gentoo"
# Initramfs
INITRD="$DIR/kernel/gentoo/gentoo.igz"
# CMDLINE 
CMDLINE="root=/dev/ram0 init=/linuxrc  dokeymap looptype=squashfs loop=/image.squashfs cdroot earlyprintk=serial console=ttyS0"

#CMDLINE="console=ttyS0"

# Memery
MEM="-m 1G"
# SMP core
#SMP="-c 2"
# Network drive
NET="-s 2:0,virtio-net"
# ISO
IMG_CD="-s 3,ahci-cd,$DIR/iso/gentoo.iso"
# Disk
IMG_HDD="-s 4,virtio-blk,$DIR/disk/gentoo.img"
# PCI
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
LPC_DEV="-l com1,stdio"
# ACPI
ACPI="-A"
## start vm
xhyve $ACPI $MEM $PCI_DEV $LPC_DEV $NET $IMG_CD $IMG_HDD -f kexec,$KERNEL,$INITRD,"$CMDLINE"
