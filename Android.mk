LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
include $(LOCAL_PATH)/lib/Makefile.inc

LOCAL_SRC_FILES := $(addprefix lib/,$(CSOURCES))
LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/include/ \
	external/openssl/include \
	external/zlib

LOCAL_MODULE:= libcurl
LOCAL_MODULE_TAGS := optional
LOCAL_WHOLE_STATIC_LIBRARIES := libcrypto_static
LOCAL_CFLAGS += -DHAVE_CONFIG_H
include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)
include $(LOCAL_PATH)/src/Makefile.inc
LOCAL_SRC_FILES := $(addprefix src/,$(CURL_CFILES))

LOCAL_MODULE := curl
LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_LIBRARIES := libcurl
LOCAL_SHARED_LIBRARIES := libssl libz

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/lib \
	external/zlib

LOCAL_CFLAGS += -DHAVE_CONFIG_H

include $(BUILD_EXECUTABLE)

