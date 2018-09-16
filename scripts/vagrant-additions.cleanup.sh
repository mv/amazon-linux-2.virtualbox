###
### vagrant-cleanup.sh
###

set -x

### Uninstall
/bin/umount -f /mnt
/bin/rm     -f /home/*/Vboxguestadditions*iso


### cleanup rpms
/usr/bin/yum -y remove    \
    gcc gcc-c++ kernel-devel-`uname -r` cloog-ppl cpp mpfr  \
    zlib-devel openssl-devel readline-devel sqlite-devel    \
    libgomp libselinux-devel libsepol-devel                 \
    libstdc++-devel glibc-devel glibc-headers ncurses-devel \
    kernel-headers keyutils-libs-devel krb5-devel           \
    libcom_err-devel ppl perl

# vim:ft=sh:

