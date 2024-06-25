#!/bin/sh
grep property_set bootable/recovery/minadbd21/usb_linux_client.c &>/dev/null || patch -f -p1 < device/Xiaoxun/sl8521e_1h10ll-common/sys_usb_ffs_ready.patch
