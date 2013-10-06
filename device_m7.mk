$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/m7/m7-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/m7/overlay

LOCAL_PATH := device/htc/m7
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \

# Recovery
PRODUCT_PACKAGES += \
    lpm.rc \
    charger \
    choice_fn \
    offmode_charging \
    init.recovery.qcom.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_m7
PRODUCT_DEVICE := m7
