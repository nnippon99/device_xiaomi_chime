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

# Inherit more stuff
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_LIVE_WALLPAPERS := false
TARGET_SUPPORTS_QUICK_TAP := true

# Speed Profiles
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/boot/boot-image-profile.txt
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Enable whole-program R8 Java optimizations for SystemUI and system_server,
FULL_SYSTEM_OPTIMIZE_JAVA := true
SYSTEM_OPTIMIZE_JAVA := true
SYSTEMUI_OPTIMIZE_JAVA := true

# Reduce system server verbosity
PRODUCT_SYSTEM_SERVER_DEBUG_INFO := false
PRODUCT_OTHER_JAVA_DEBUG_INFO := false
PRODUCT_NOT_DEBUGGABLE_IN_USERDEBUG := true

# Dexpreopt
WITH_DEXPREOPT_DEBUG_INFO := false

# Do not build non-GSI partition images.
PRODUCT_BUILD_DEBUG_BOOT_IMAGE := false
PRODUCT_BUILD_DEBUG_VENDOR_BOOT_IMAGE := false


# Make smaller .tar.gz files by excluding debug targets.
export ART_BUILD_TARGET_DEBUG=false
export ART_BUILD_HOST_DEBUG=false
export USE_DEX2OAT_DEBUG=false

# Hardcode High Memory Parallel Process
export NINJA_HIGHMEM_NUM_JOBS=1

# Iperf3
PRODUCT_PACKAGES += \
    iperf3
