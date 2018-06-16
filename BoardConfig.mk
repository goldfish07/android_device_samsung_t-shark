USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/t-shark/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := sc8830
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := t-shark

#Kernel 
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := tshark_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/t-shark


#Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1111490560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2457862144
BOARD_FLASH_BLOCK_SIZE := 131072



BOARD_HAS_NO_SELECT_BUTTON := true

#Hardware Features#######################################################################!
#HW-Audio
BOARD_USES_TINYALSA_AUDIO := true
BOARD_USES_SS_VOIP := true

#Dither
IMAGE_DITHER_ENABLE := true

#Gralloc
USE_SPRD_DITHER := true

#hwComposer
USE_SPRD_HWCOMPOSER := true
DEVICE_USE_FB_HW_VSYNC := true
DEVICE_WITH_GSP := true
DEVICE_OVERLAYPLANE_BORROW_PRIMARYPLANE_BUFFER := true
USE_OVERLAY_COMPOSER_GPU := true
#USE_SPRD_DITHER already in use 

#SPRD-bluetooth
BOARD_HAVE_BLUETOOTH_SPRD := true
TARGET_BOARD_SUPPORT_HW_ADC_ADAPT := FUCK_YEAH #don't change string

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.sc8830

###########################################################################################

# RIL
BOARD_RIL_CLASS += ../../../device/samsung/t-shark/ril
COMMON_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/t-shark/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/t-shark/bluetooth/libbt_vndcfg.txt

#Android Features##########################################################################
# Enable dex-preoptimization to speed up the first boot sequence
WITH_DEXPREOPT := true
WITH_DEXPREOPT_PIC := true
WITH_DEXPREOPT_COMP := false

# Init
TARGET_NR_SVC_SUPP_GIDS := 36
TARGET_PROVIDES_INIT_RC := true
TARGET_NEEDS_PROP_INIT_HACK := true

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/t-shark/sepolicy

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_NO_CHARGER_LED := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/batt_lp_charging
BACKLIGHT_PATH := /sys/class/backlight/panel/brightness


#Wifi Drivers
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WLAN_DEVICE_REV := bcm4330
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_NVRAM_PATH_PARAM := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH := "/system/etc/wifi/nvram_net.txt"
WIFI_BAND := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI := true
