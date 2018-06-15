# Release name
PRODUCT_RELEASE_NAME := t-shark

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/t-shark/device_t-shark.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := t-shark
PRODUCT_NAME := cm_t-shark
PRODUCT_BRAND := samsung
PRODUCT_MODEL := t-shark
PRODUCT_MANUFACTURER := samsung
