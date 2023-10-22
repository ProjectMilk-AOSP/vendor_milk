# Inherit full common milk stuff
$(call inherit-product, vendor/milk/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include milk LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/milk/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/milk/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

$(call inherit-product, vendor/milk/config/telephony.mk)
