# Release name
PRODUCT_RELEASE_NAME := t_shark

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/t_shark/t_shark.mk)

# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/telephony.mk)

# Custom unofficial build tag
TARGET_UNOFFICIAL_BUILD_ID := Judyann07@bertfish

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := t_shark
PRODUCT_NAME := cm_t_shark
PRODUCT_BRAND := samsung
PRODUCT_MODEL := t_shark
PRODUCT_MANUFACTURER := samsung
