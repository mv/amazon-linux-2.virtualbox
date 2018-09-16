#!/bin/bash
# vim:ft=sh:
#
# 2018/09
# Marcus Vinicius Ferreira               ferreira.mv[ at ]gmail.com
#

[ -z "$1" ] && {
    echo
    echo "Usage: $0 <machine_name>"
    echo
    exit 2
}

machine_name="$1"
machine_name="${machine_name:?'Cannot be null'}"

#
VBoxManage unregistervm $machine_name #--delete


