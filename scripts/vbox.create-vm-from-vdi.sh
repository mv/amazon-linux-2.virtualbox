#!/bin/bash
# vim:ft=sh:
#
# vbox-linux-server.sh
#     VirtualBox: new linux server
#
# 2018/09
# Marcus Vinicius Ferreira               ferreira.mv[ at ]gmail.com
#

[ -z "$1" ] && {
    echo
    echo "Usage: $0 <machine_name> <iso> <add> <vdi>"
    echo
    exit 2
}

machine_name="$1"
machine_name="${machine_name:?'Cannot be null'}"

iso="${2}"
iso="${iso:?'Cannot be null'}"

add="${3}"
add="${add:?'Cannot be null'}"

vdi="${4}"
vdi="${vdi:?'Cannot be null'}"

echo
echo "Params:"
echo "  machine_name: ${machine_name}"
echo "  iso: ${iso}"
echo "  add: ${add}"
echo "  vdi: ${vdi}"
echo

set -x
set -e

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
    --teleporter off


#
# ISO image: seed.iso
#    IDE interface:             Amazon Linux
#        0,0 Primary Master     /dev/sr0
#        0,1 Primary Slave      /dev/sr1
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

# Attach 2nd iso: Guest Additions
#
VBoxManage storageattach            \
    $machine_name                   \
    --storagectl "IDE Controller"   \
    --device 0 --port 1             \
    --type dvddrive --medium "${add}"


#
# VDI: attach to SATA
#
VBoxManage storagectl        \
    $machine_name            \
    --name "SATA Controller" \
    --add sata               \
    --controller IntelAHCI   \
    --portcount 1            \
    --bootable on

VBoxManage storageattach            \
    $machine_name                   \
    --storagectl "SATA Controller"  \
    --port 0                        \
    --type hdd --medium "${vdi}"


