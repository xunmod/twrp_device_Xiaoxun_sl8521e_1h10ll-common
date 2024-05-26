# TWRP device common tree for Xiaoxun sl8521e\_1h10ll based watch

In `BoardConfig.mk`:
```
include device/Xiaoxun/sl8521e_1h10ll-common/BoardConfigCommon.mk
```

In `device.mk`:
```
$(call inherit-product, device/Xiaoxun/sl8521e_1h10ll-common/common.mk)
```
