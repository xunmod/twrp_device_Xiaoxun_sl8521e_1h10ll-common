LOCAL_PATH := $(call my-dir)

INSHEAD := $(LOCAL_PATH)/insertheader/prebuilt/bin/imgheaderinsert
SIGNEDBIMG ?= $(PRODUCT_OUT)/boot-sign.img
SIGNEDRIMG ?= $(PRODUCT_OUT)/recovery-sign.img
SPRDSIGN := $(LOCAL_PATH)/signimage/prebuilt/bin/sprd_sign
SPRDSIGNCFG := $(LOCAL_PATH)/signimage/config

# Overload bootimg generation:
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(INSTALLED_DTIMAGE_TARGET)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	$(hide) $(INSHEAD) $(INSTALLED_BOOTIMAGE_TARGET) 0
	$(hide) mv $(SIGNEDBIMG) $(INSTALLED_BOOTIMAGE_TARGET)
	$(hide) $(SPRDSIGN) $(INSTALLED_BOOTIMAGE_TARGET) $(SPRDSIGNCFG)
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

## Overload recoveryimg generation:
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(INSTALLED_DTIMAGE_TARGET) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	$(hide) $(INSHEAD) $(INSTALLED_RECOVERYIMAGE_TARGET) 0
	$(hide) mv $(SIGNEDRIMG) $(INSTALLED_RECOVERYIMAGE_TARGET)
	$(hide) $(SPRDSIGN) $(INSTALLED_RECOVERYIMAGE_TARGET) $(SPRDSIGNCFG)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
