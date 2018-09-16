#!/bin/bash
#
# 2018/09
# Marcus Vinicius Ferreira               ferreira.mv[ at ]gmail.com
#

[ -z "$1" ] && {
    echo
    echo "Usage: $0 <machine_name> <add>"
    echo
    exit 2
}

machine_name="$1"
machine_name="${machine_name:?'Cannot be null'}"

add="$2"
add="${add:?'Cannot be null'}"

set -x

#
# Attach 2nd iso: Guest Additions
#    IDE interface:
#        0,0 Primary Master
#        0,1 Primary Slave
#        1,0 Secondary Master
#        1,1 Secondary Slave
#
VBoxManage storageattach            \
    $machine_name                   \
    --storagectl "IDE Controller"   \
    --device 0 --port 1             \
    --type dvddrive --medium "${add}"

# vim:ft=sh:

