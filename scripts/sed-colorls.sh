
set -x

# clear other 'alias ls'
[ -e /etc/profile.d/colorls.sh ] && /bin/sed -i -e 's/^\s*alias/# alias/' /etc/profile.d/colorls.sh

# vim:ft=sh:

