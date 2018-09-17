###
### swap-file.sh
###

[ -f /swapfile1 ] && exit

set -x

### swapfile: 1024*1024 = 1G
/bin/dd if=/dev/zero of=/swapfile1 bs=1024 count=1048576
/bin/chown root:root /swapfile1
/bin/chmod 0600 /swapfile1

/sbin/mkswap /swapfile1
/sbin/swapon /swapfile1

if grep swapfile1 /etc/fstab
then
  ## already exist
  :
else
  /bin/cat<<FSTAB >> /etc/fstab
/swapfile1  swap  swap  defaults  0 0
FSTAB

  # Align
  column -t /etc/fstab > /tmp/fstab && \
  /bin/mv   /tmp/fstab   /etc/

fi

# vim:ft=sh:

