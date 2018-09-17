###
### fs-zero-out.sh
###

set -x

### Full with zeros
/bin/dd if=/dev/zero of=/ZERO bs=1M || echo 'Done.'
/bin/rm -f /ZERO

# vim:ft=sh:

