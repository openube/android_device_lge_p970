# Copyright (C) 2012 The Black Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/lge/p970/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := omap3
TARGET_BOOTLOADER_BOARD_NAME := p970

# Board configuration
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
OMAP_ENHANCEMENT := true

# Omap compat
ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP3 -DOMAP_ENHANCEMENT_CPCAM -DOMAP_ENHANCEMENT_VTC
endif

# kernel
TARGET_KERNEL_CONFIG := cyanogenmod_p970_defconfig
TARGET_PREBUILT_KERNEL := device/lge/p970/kernel
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x80000000
BOARD_PAGE_SIZE := 0x00000800
BOARD_NEEDS_CUTILS_LOG := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_FM_RADIO := true

# OMX
HARDWARE_OMX := true
ifdef HARDWARE_OMX
OMX_JPEG := true
OMX_VENDOR := ti
OMX_VENDOR_INCLUDES := \
   hardware/ti/omx/system/src/openmax_il/omx_core/inc \
   hardware/ti/omx/image/src/openmax_il/jpeg_enc/inc
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
endif

# Mobile data iface
BOARD_MOBILEDATA_INTERFACE_NAME := "vsnet0"

# WLAN
BOARD_WLAN_DEVICE := bcm4329
WIFI_DRIVER_FW_PATH_STA         := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP          := "/system/etc/firmware/fw_bcm4329_ap.bin"
WIFI_DRIVER_MODULE_NAME         := "wireless"
WIFI_DRIVER_MODULE_PATH         := "/system/lib/modules/wireless.ko"
WIFI_DRIVER_MODULE_ARG          := "firmware_path=/system/etc/firmware/fw_bcm4329.bin nvram_path=/system/etc/wifi/nvram.txt config_path=/data/misc/wifi/config"
WPA_SUPPLICANT_VERSION          := VER_0_6_X
WIFI_DRIVER_HAS_LGE_SOFTAP      := true
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WEXT_NO_COMBO_SCAN       := true

# EGL
BOARD_EGL_CFG := device/lge/p970/configs/egl.cfg
USE_OPENGL_RENDERER := true

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 665681920
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1170259968
BOARD_FLASH_BLOCK_SIZE := 131072

# Headers
TARGET_SPECIFIC_HEADER_PATH := device/lge/p970/include

# Recovery
BOARD_CUSTOM_GRAPHICS := ../../../device/lge/p970/recovery/graphics.c

# Vibration inplementation
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/lge/p970/vibrator.c

# Compat mode
COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB -DICS_CAMERA_BLOB -DOMAP_ICS_CAMERA -DUSE_FENCE_SYNC

# ALS
BOARD_SYSFS_LIGHT_SENSOR := "/sys/devices/platform/omap/omap_i2c.2/i2c-2/2-0060/leds/lcd-backlight/als"

# Charger
COMMON_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"rs"' -DBOARD_CHARGING_CMDLINE_VALUE='"c"'
