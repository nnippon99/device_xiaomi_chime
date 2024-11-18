#
# Copyright (C) 2024 Lilium Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common PixelOS stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Lineage Health
PRODUCT_PACKAGES += \
    vendor.lineage.health-service.default
