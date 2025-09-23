#
# Copyright (C) 2025 Lilium Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common PixelOS stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Lineage Health
PRODUCT_PACKAGES += \
    vendor.lineage.health-service.default

$(call soong_config_set,lineage_health,charging_control_supports_bypass,false)
$(call soong_config_set,lineage_health,charging_control_charging_disabled,1)
$(call soong_config_set,lineage_health,charging_control_charging_enabled,0)
$(call soong_config_set,lineage_health,charging_control_charging_path,/sys/class/power_supply/battery/input_suspend)

# Inherit more stuff
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_LIVE_WALLPAPERS := false
#TARGET_SUPPORTS_QUICK_TAP := true

# Speed Profiles
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := \
    frameworks/base/boot/boot-image-profile.txt \
    frameworks/base/boot/boot-image-profile-extra.txt
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Enable whole-program R8 Java optimizations for SystemUI and system_server,
FULL_SYSTEM_OPTIMIZE_JAVA := true
SYSTEM_OPTIMIZE_JAVA := true
SYSTEMUI_OPTIMIZE_JAVA := true

# Reduce system server verbosity
PRODUCT_SYSTEM_SERVER_DEBUG_INFO := false
PRODUCT_OTHER_JAVA_DEBUG_INFO := false
PRODUCT_NOT_DEBUGGABLE_IN_USERDEBUG := true

# Do not build non-GSI partition images.
PRODUCT_BUILD_DEBUG_BOOT_IMAGE := false
PRODUCT_BUILD_DEBUG_VENDOR_BOOT_IMAGE := false
TARGET_HAS_GEMENI_BOOTANIMATION := true
GMS_VOICE_MODEL_INCLUDED := true

# Dexpreopt
WITH_DEXPREOPT_DEBUG_INFO := false

# Disable debugging in userdebug builds
PRODUCT_NOT_DEBUGGABLE_IN_USERDEBUG := true
