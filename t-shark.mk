$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/t-shark/t-shark-vendor.mk)

DEVICE_PATH := device/samsung/t-shark

DEVICE_PACKAGE_OVERLAYS += device/samsung/t-shark/overlay

#Hardware Features#################################################
# HWC
PRODUCT_PACKAGES += \
	gralloc.sc8830 \
	hwcomposer.sc8830 \
	sprd_gsp.sc8830 \
        libion_sprd

# Lights
PRODUCT_PACKAGES += \
	lights.sc8830 


####################################################################
# Keylayouts
KEYLAYOUT := \
	$(DEVICE_PATH)/keylayout/sci-keypad.kl \
	$(DEVICE_PATH)/keylayout/samsung-keypad.kl \
	$(DEVICE_PATH)/keylayout/ist30xx_ts_input.kl

PRODUCT_COPY_FILES += \
$(foreach f,$(KEYLAYOUT),$(f):system/usr/keylayout/$(notdir $(f)))

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_t-shark
PRODUCT_DEVICE := t-shark
