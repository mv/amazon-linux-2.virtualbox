###
### fs-zero-out.sh
###

### Full with zeros
/bin/dd if=/dev/zero of=/ZERO bs=1M
/bin/rm -f /ZERO

# vim:ft=sh:

