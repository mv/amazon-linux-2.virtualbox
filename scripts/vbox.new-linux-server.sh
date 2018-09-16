#!/bin/bash
#
# vbox-linux-server.sh
#     VirtualBox: new linux server
#
# 2018/09
# Marcus Vinicius Ferreira               ferreira.mv[ at ]gmail.com
#

[ -z "$1" ] && {
    echo
    echo "Usage: $0 <machine_name> <iso>"
    echo
    exit 2
}

machine_name="$1"
machine_name="${machine_name:?'Cannot be null'}"

iso="${2}"
iso="${iso:?'Cannot be null'}"

set -x

#
# New Machine
#
VBoxManage createvm \
    --name $machine_name    \
    --ostype Linux26_64     \
    --register

#
# Server settings
#
VBoxManage modifyvm          \
    $machine_name            \
    --memory  1024           \
    --cpus       2           \
    --vram       9           \
    --acpi       off         \
    --ioapic     on          \
    --pae        off         \
    --nestedpaging on        \
    --largepages   off       \
    --vtxvpid      on        \
    --rtcuseutc    on        \
    --monitorcount       1   \
    --accelerate3d       off \
    --accelerate2dvideo  off \
    --firmware bios          \
    --chipset  piix3         \
    --boot1    disk          \
    --boot2    dvd           \
    --boot3    none          \
    --boot4    none          \
    --mouse    ps2           \
    --keyboard ps2           \
    --uart1    off           \
    --uart2    off           \
    --audio    none          \
    --usb      off           \
    --usbehci  off           \
    --vrde     off           \
    --teleporter off         \
    # --nictype1         Am79C970A \
    # --nic2             hostonly  \
    # --hostonlyadapter2 vboxnet0  \
    # --nictype2         82540EM   \
    # --cableconnected2  on        \


#
# DVD image to boot
#    IDE interface:
#        0,0 Primary Master
#        0,1 Primary Slave
#        1,0 Secondary Master
#        1,1 Secondary Slave
#
VBoxManage storagectl       \
    $machine_name           \
    --name "IDE Controller" \
    --add ide               \
    --bootable on

VBoxManage storageattach            \
    $machine_name                   \
    --storagectl "IDE Controller"   \
    --device 0 --port 0             \
    --type dvddrive --medium "${iso}"

# vim:ft=sh:

