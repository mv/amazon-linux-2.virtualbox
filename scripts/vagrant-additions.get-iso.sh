# vim:ft=sh:
###
### MacOS: get VirtualBox Additions ISO
###

usage() {
  echo
  echo "  Usage: $0  -y"
  echo
  exit 1
}

[ "$1" == "" ] && usage

### Get from host
iso="/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso"
key=".vagrant/machines/default/virtualbox/private_key"
port="2200"

rsync -avhiP -e "ssh -p ${port} -i ${key}" \
      "${iso}" vagrant@127.0.0.1:~/

