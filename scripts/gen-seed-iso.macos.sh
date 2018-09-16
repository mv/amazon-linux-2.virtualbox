#!/bin/bash
#
# Generate Seed.iso for cloud-init
#   https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/amazon-linux-2-virtual-machine.html
#

mkdir -p ./seedconfig
/bin/cp ./user-data.yml ./seedconfig/user-data
/bin/cp ./meta-data.yml ./seedconfig/meta-data

hdiutil makehybrid -o seed-data.iso -hfs -joliet -iso -default-volume-name cidata seedconfig/


