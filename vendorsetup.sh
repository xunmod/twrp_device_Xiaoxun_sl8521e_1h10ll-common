#!/bin/sh
patch -f -p1 < $(dirname $0)/sys_usb_ffs_ready.patch || true
