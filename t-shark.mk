$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/t-shark/t-shark-vendor.mk)

DEVICE_PATH := device/samsung/t-shark

DEVICE_PACKAGE_OVERLAYS += device/samsung/t-shark/overlay

# Hardware Features#################################################

# Display Adapter Config
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Display Resolution
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Rootdir files
ROOTDIR := \
	$(DEVICE_PATH)/rootdir/init.rc \
	$(DEVICE_PATH)/rootdir/init.board.rc \
	$(DEVICE_PATH)/rootdir/fstab.sc8830 \
	$(DEVICE_PATH)/rootdir/init.sc8830.rc \
	$(DEVICE_PATH)/rootdir/init.sc8830.usb.rc \
	$(DEVICE_PATH)/rootdir/init.sc8830_ss.rc \
	$(DEVICE_PATH)/rootdir/ueventd.sc8830.rc \
	$(DEVICE_PATH)/rootdir/init.kanas3g.rc \
	$(DEVICE_PATH)/rootdir/init.kanas3g_base.rc \
	$(DEVICE_PATH)/rootdir/init.wifi.rc \
	$(DEVICE_PATH)/rootdir/init.swap.rc \

PRODUCT_COPY_FILES += \
	$(foreach f,$(ROOTDIR),$(f):root/$(notdir $(f)))


# HWC
PRODUCT_PACKAGES += \
	gralloc.sc8830 \
	hwcomposer.sc8830 \
	sprd_gsp.sc8830 \
        libion_sprd


#OMX Codecs
PRODUCT_PACKAGES += \
	libstagefright_sprd_aacdec \
	libstagefright_sprd_apedec \
	libstagefright_soft_imaadpcmdec \
	libstagefright_sprd_mp3dec \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_soft_h264dec \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_soft_mpeg4dec \
	libstagefright_soft_mjpgdec \
	libstagefright_sprd_vpxdec \
	lib/libomx_aacdec_sprd.so \
	lib/libomx_apedec_sprd.so \
	lib/libomx_avcdec_hw_sprd.so \
	lib/libomx_avcdec_sw_sprd.so \
	lib/libomx_avcenc_hw_sprd.so \
	lib/libomx_m4vh263dec_hw_sprd.so \
	lib/libomx_m4vh263dec_sw_sprd.so \
	lib/libomx_m4vh263enc_hw_sprd.so \
	lib/libomx_mp3dec_sprd.so \
	lib/libomx_vpxdec_hw_sprd.so \

# Audio
PRODUCT_PACKAGES += \
	audio.primary.sc8830 \
	audio_policy.sc8830 \
	audio.r_submix.default \
	audio.usb.default \
	libaudio-resampler \
	libatchannel_wrapper \
	libtinyalsa

AUDIO_CONFIGS := \
	$(DEVICE_PATH)/configs/audio/audio_policy.conf \

PRODUCT_COPY_FILES += \
	$(foreach f,$(AUDIO_CONFIGS),$(f):system/etc/$(notdir $(f))) \


# Media config
MEDIA_CONFIGS := \
	$(DEVICE_PATH)/media/media_codecs.xml \
	$(DEVICE_PATH)/media/media_profiles.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_CONFIGS),$(f):system/etc/$(notdir $(f)))


# Wifi
PRODUCT_PACKAGES += \
	libnetcmdiface \
	dhcpcd.conf \
	wpa_supplicant \
	hostapd

WIFI_CONFIGS := \
	$(DEVICE_PATH)/configs/wifi/wpa_supplicant.conf \
	$(DEVICE_PATH)/configs/wifi/nvram_net.txt

PRODUCT_COPY_FILES += \
	$(foreach f,$(WIFI_CONFIGS),$(f):system/etc/wifi/$(notdir $(f)))

# GPS
GPS_CONFIGS := \
	$(DEVICE_PATH)/configs/gps/gps.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(GPS_CONFIGS),$(f):system/etc/$(notdir $(f)))

# Lights
PRODUCT_PACKAGES += \
	lights.sc8830 


####################################################################

#Android Hardware Features #########################################

# Keylayout
KEYLAYOUT := \
	$(DEVICE_PATH)/keylayout/sci-keypad.kl \
	$(DEVICE_PATH)/keylayout/ist30xx_ts_input.kl

PRODUCT_COPY_FILES += \
	$(foreach f,$(KEYLAYOUT),$(f):system/usr/keylayout/$(notdir $(f)))

# Permissions
PERMISSION := \
	frameworks/native/data/etc/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.software.sip.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(PERMISSION),$(f):system/etc/permissions/$(notdir $(f)))


# Device props
PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sys.fw.dex2oat_thread_count=4 \
	dalvik.vm.dex2oat-flags=--no-watch-dog \
	dalvik.vm.dex2oat-filter=interpret-only \
	dalvik.vm.image-dex2oat-filter=speed

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images



# Common libs
PRODUCT_PACKAGES += \
	libstlport \
	libril_shim \
	libgps_shim


# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode

# Bluetooth
PRODUCT_PACKAGES += \
	bluetooth.default \
	audio.a2dp.default \
	libbluetooth_jni

####################################################################

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# WiFi BCMDHD
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

$(call inherit-product, build/target/product/full.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_t-shark
PRODUCT_DEVICE := t-shark
