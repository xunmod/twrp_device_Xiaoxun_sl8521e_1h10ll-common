#!/bin/sh
grep adf_test bootable/recovery/Android.mk &>/dev/null && patch -d bootable/recovery -f -p1 < device/Xiaoxun/sl8521e_1h10ll-common/adf_test.patch
