#!/bin/bash
#
# Generate Seed.iso for cloud-init
#   https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/amazon-linux-2-virtual-machine.html
#

[ -z "$1" ] && {
    echo
    echo "Usage: $0 <seed_iso_file> <config_dir>"
    echo
    exit 2
}

seed_file="${1}"
seed_file="${seed_file:?'Cannot be null'}"

config_dir="${2}"
config_dir="${config_dir:?'Cannot be null'}"

hdiutil makehybrid \
  -hfs -joliet -iso -default-volume-name cidata \
  -o "${seed_file}" "${config_dir}/"


