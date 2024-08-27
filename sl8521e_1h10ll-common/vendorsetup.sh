#!/bin/sh
cd bootable/recovery && git am ../../device/Xiaoxun/sl8521e_1h10ll-common/0001-Add-adf_test.patch || (git am --abort && cd ../.. && exit 1)
cd ../..
