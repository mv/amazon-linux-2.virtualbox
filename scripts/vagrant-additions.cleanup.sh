# vim:ft=sh:
###
### vagrant-cleanup.sh
###

set -x

### Uninstall
/bin/umount -f /mnt


### cleanup rpms

# kernel packages different of `current`
/bin/rpm -qa | sort | grep kernel | grep -v `uname -r` | xargs yum remove -y

# dependencies installed by:
#   /usr/bin/yum -y install make gcc kernel-devel-`uname -r`
#
/usr/bin/yum -y remove    \
    kernel-devel          \
    kernel-headers        \
    gcc cpp               \
    elfutils-libelf-devel \
    glibc-devel           \
    glibc-headers         \
    libatomic             \
    libcilkrts            \
    libitm                \
    libmpc                \
    libmpx                \
    libquadmath           \
    libsanitizer          \
    mpfr                  \
    zlib-devel

