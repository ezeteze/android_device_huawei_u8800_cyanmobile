# Copyright (C) 2009 The Android Open Source Project
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

#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of 
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/huawei/u8800/overlay

PRODUCT_NAME := huawei_u8800
PRODUCT_DEVICE := u8800
PRODUCT_MODEL := huawei u8800
PRODUCT_MANUFACTURER := huawei

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

PRODUCT_COPY_FILES += \
    device/huawei/u8800/init.u8800.rc:root/init.u8800.rc \
    device/huawei/u8800/ueventd.u8800.rc:root/ueventd.u8800.rc

$(call inherit-product-if-exists, vendor/huawei/u8800/u8800-vendor.mk)

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    Gallery3d \
    SpareParts \
    Term \
    librs_jni \
    overlay.default \
    gps.u8800 \
    gralloc.u8800 \
    copybit.u8800 \
    lights.u8800 \
    sensors.blade \
    libOmxCore \
    libOmxVdec \

DISABLE_DEXPREOPT := false
PRODUCT_LOCALES += hdpi
PRODUCT_COPY_FILES += \
    device/huawei/u8800/qwerty.kl:system/usr/keylayout/qwerty.kl
    
# Firmware
PRODUCT_COPY_FILES += \
    device/huawei/u8800/firmware/vidc_720p_command_control.fw:/system/etc/firmware/vidc_720p_command_control.fw \
    device/huawei/u8800/firmware/vidc_720p_h263_dec_mc.fw:/system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/huawei/u8800/firmware/vidc_720p_h264_dec_mc.fw:/system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/huawei/u8800/firmware/vidc_720p_h264_enc_mc.fw:/system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/huawei/u8800/firmware/vidc_720p_mp4_dec_mc.fw:/system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/huawei/u8800/firmware/vidc_720p_mp4_enc_mc.fw:/system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/huawei/u8800/firmware/vidc_720p_vc1_dec_mc.fw:/system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/huawei/u8800/firmware/yamato_pfp.fw:/system/etc/firmware/yamato_pfp.fw \
    device/huawei/u8800/firmware/yamato_pm4.fw:/system/etc/firmware/yamato_pm4.fw \

# Firmware wlan
PRODUCT_COPY_FILES += \
    device/huawei/u8800/firmware/wlan/qcom_fw.bin:/system/etc/firmware/wlan/qcom_fw.bin \
    device/huawei/u8800/firmware/wlan/qcom_wapi_fw.bin:/system/etc/firmware/wlan/qcom_wapi_fw.bin \
    device/huawei/u8800/firmware/wlan/qcom_wlan_nv.bin:/system/etc/firmware/wlan/qcom_wlan_nv.bin \
    device/huawei/u8800/firmware/wlan/cfg.dat:/system/etc/firmware/wlan/cfg.dat \
    device/huawei/u8800/firmware/wlan/hostapd_default.conf:/system/etc/firmware/wlan/hostapd_default.conf \
    device/huawei/u8800/firmware/wlan/qcom_cfg.ini:/system/etc/firmware/wlan/qcom_cfg.ini \

# EGL
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/egl/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \
    device/huawei/u8800/proprietry/lib/egl/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \
    device/huawei/u8800/proprietry/lib/egl/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \
    device/huawei/u8800/proprietry/lib/egl/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \
    device/huawei/u8800/proprietry/lib/libgsl.so:/system/lib/libgsl.so \

# Gralloc (proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/hw/gralloc.msm7k.so:/system/lib/hw/gralloc.u8800.so \

# etc
PRODUCT_COPY_FILES += \
    device/huawei/u8800/init.qcom.bt.sh:/system/etc/init.qcom.bt.sh \
    device/huawei/u8800/init.qcom.sdio.sh:/system/etc/init.qcom.sdio.sh \
    device/huawei/u8800/init.qcom.wifi.sh:/system/etc/init.qcom.wifi.sh \
    device/huawei/u8800/init.qcom.coex.sh:/system/etc/init.qcom.coex.sh \
    device/huawei/u8800/media_profiles.xml:/system/etc/media_profiles.xml \
    device/huawei/u8800/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
    device/huawei/u8800/vold.fstab:/system/etc/vold.fstab \

# RIL (proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/libril-qc-1.so:/system/lib/libril-qc-1.so \
    device/huawei/u8800/proprietry/lib/libril-qcril-hook-oem.so:/system/lib/libril-qcril-hook-oem.so \
    device/huawei/u8800/proprietry/lib/libdiag.so:/system/lib/libdiag.so \
    device/huawei/u8800/proprietry/lib/liboncrpc.so:/system/lib/liboncrpc.so \
    device/huawei/u8800/proprietry/lib/libqmi.so:/system/lib/libqmi.so \
    device/huawei/u8800/proprietry/lib/libdsm.so:/system/lib/libdsm.so \
    device/huawei/u8800/proprietry/lib/libqueue.so:/system/lib/libqueue.so \
    device/huawei/u8800/proprietry/lib/libdll.so:/system/lib/libdll.so \
    device/huawei/u8800/proprietry/lib/libcm.so:/system/lib/libcm.so \
    device/huawei/u8800/proprietry/lib/libmmgsdilib.so:/system/lib/libmmgsdilib.so \
    device/huawei/u8800/proprietry/lib/libgsdi_exp.so:/system/lib/libgsdi_exp.so \
    device/huawei/u8800/proprietry/lib/libgstk_exp.so:/system/lib/libgstk_exp.so \
    device/huawei/u8800/proprietry/lib/libwms.so:/system/lib/libwms.so \
    device/huawei/u8800/proprietry/lib/libnv.so:/system/lib/libnv.so \
    device/huawei/u8800/proprietry/lib/libwmsts.so:/system/lib/libwmsts.so \
    device/huawei/u8800/proprietry/lib/libpbmlib.so:/system/lib/libpbmlib.so \
    device/huawei/u8800/proprietry/lib/libdss.so:/system/lib/libdss.so \
    device/huawei/u8800/proprietry/lib/libauth.so:/system/lib/libauth.so \
    device/huawei/u8800/proprietry/lib/libicudata.so:/system/lib/libicudata.so \

# Gemini (proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/libgemini.so:/system/lib/libgemini.so \

# other bin (proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/bin/rmt_oeminfo:/system/bin/rmt_oeminfo \
    device/huawei/u8800/proprietry/bin/rmt_storage:/system/bin/rmt_storage \
    device/huawei/u8800/proprietry/bin/hw_diag_app:/system/bin/hw_diag_app \
    device/huawei/u8800/proprietry/bin/oem_rpc_svc:/system/bin/oem_rpc_svc \
    device/huawei/u8800/proprietry/bin/load_oemlogo:/system/bin/load_oemlogo \
    device/huawei/u8800/proprietry/bin/qmuxd:/system/bin/qmuxd \
    device/huawei/u8800/proprietry/bin/hostapd:/system/bin/hostapd \
    device/huawei/u8800/proprietry/bin/hostapd_cli:/system/bin/hostapd_cli \
# Bluetooth bin
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/bin/btwlancoex:/system/bin/btwlancoex \
    device/huawei/u8800/proprietry/bin/bluetoothd:/system/bin/bluetoothd \
    device/huawei/u8800/proprietry/bin/hciattach:/system/bin/hciattach \
    device/huawei/u8800/proprietry/bin/port-bridge:/system/bin/port-bridge \
    device/huawei/u8800/proprietry/bin/hci_qcomm_init:/system/bin/hci_qcomm_init \
    
# Camera (Proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/liboemcamera.so:/system/lib/liboemcamera.so \
    device/huawei/u8800/proprietry/lib/libmmjpeg.so:/system/lib/libmmjpeg.so \
    device/huawei/u8800/proprietry/lib/libmmipl.so:/system/lib/libmmipl.so \

# Camera (Prebuilt)
#PRODUCT_COPY_FILES += \
#    device/huawei/u8800/prebuilt/lib/libcamera.so:/system/lib/libcamera.so \
#    device/huawei/u8800/prebuilt/lib/libcamera_client.so:/system/lib/libcamera_client.so \
#    device/huawei/u8800/prebuilt/lib/libcameraservice.so:/system/lib/libcameraservice.so \
    
    
# Sensors (Proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/hw/sensors.default.so:/system/lib/hw/sensors.u8800.so \
    device/huawei/u8800/proprietry/bin/compassd:/system/bin/compassd \
    
# Sensors (Prebuilt)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/prebuilt/lib/libsensorservice.so:/system/lib/libsensorservice.so \

# Wifi 
PRODUCT_COPY_FILES += \
    device/huawei/u8800/prebuilt/modules/libra.ko:/system/lib/modules/libra.ko \
    device/huawei/u8800/prebuilt/modules/librasdioif.ko:/system/lib/modules/librasdioif.ko \

# Huawei libs(proprietry)
PRODUCT_COPY_FILES += \
    device/huawei/u8800/proprietry/lib/libhwrpc.so:/system/lib/libhwrpc.so \
    device/huawei/u8800/proprietry/lib/libhwrpc.so:/obj/lib/libhwrpc.so \
    device/huawei/u8800/proprietry/lib/liboem_rapi.so:/system/lib/liboem_rapi.so \
    device/huawei/u8800/proprietry/lib/liboeminfo.so:/system/lib/liboeminfo.so \
  
# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
  
$(call inherit-product-if-exists, vendor/huawei/u8800/u8800-vendor.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)
