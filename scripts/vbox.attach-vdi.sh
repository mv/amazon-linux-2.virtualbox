#!/bin/bash
#
# 2018/09
# Marcus Vinicius Ferreira               ferreira.mv[ at ]gmail.com
#

[ -z "$1" ] && {
    echo
    echo "Usage: $0 <machine_name> <vdi>"
    echo
    exit 2
}

machine_name="$1"
machine_name="${machine_name:?'Cannot be null'}"

vdi="$2"
vdi="${vdi:?'Cannot be null'}"

set -x

#
# VDI: attach to SATA
#
VBoxManage storagectl   \
    $machine_name       \
    --name "SATA Controller" \
    --add sata               \
    --controller IntelAHCI   \
    --portcount 1        \
    --bootable on

VBoxManage storageattach            \
    $machine_name                   \
    --storagectl "SATA Controller"  \
    --port 0             \
    --type hdd --medium "${vdi}"


# vim:ft=sh:

