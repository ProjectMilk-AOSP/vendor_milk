# Inherit common mobile milk stuff
$(call inherit-product, vendor/milk/config/common.mk)

# Include AOSP audio files
include vendor/milk/config/aosp_audio.mk

# Themes
PRODUCT_PACKAGES += \
    ThemePicker \
    ThemesStub
