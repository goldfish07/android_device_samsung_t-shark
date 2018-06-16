LOCAL_PATH := $(call my-dir)

ifneq (,$(filter t_shark,$(TARGET_DEVICE)))
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
