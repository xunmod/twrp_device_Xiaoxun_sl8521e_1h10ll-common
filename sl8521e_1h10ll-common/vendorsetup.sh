#!/bin/sh
grep libtwrpmtp-legacy bootable/recovery/Android.mk &>/dev/null && patch -f -p1 < device/Xiaoxun/sl8521e_1h10ll-common/force_mtp_ffs.patch
