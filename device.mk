LOCAL_PATH := device/Xiaoxun/sl8521e_1h10ll_sw761

PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/recovery/root/ueventd.sl8521e.rc:root/ueventd.sl8521e.rc \
		$(LOCAL_PATH)/recovery/root/init.recovery.sl8521e.rc:root/init.recovery.sl8521e.rc

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_NAME := sl8521e_1h10ll_sw761
