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

vdi="$1"
vdi="${add:?'Cannot be null'}"

#
# SATA disk: 20G
#
VBoxManage createhd         \
    --filename ${machine_dir}/${machine_name}/${machine_name}.vmdk  \
    --size   10240          \
    --format  VMDK          \
    --variant Standard

VBoxManage storagectl   \
    $machine_name       \
    --name "SATA Controller" \
    --add sata               \
    --controller IntelAhci   \
    --sataportcount 1        \
    --bootable on

VBoxManage storageattach            \
    $machine_name                   \
    --storagectl "SATA Controller"  \
    --port 0             \
    --type hdd --medium ${machine_dir}/${machine_name}/${machine_name}.vmdk
