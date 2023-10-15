LOCAL_PATH := $(call my-dir)

KITTYMEMORY_PATH := ../KittyMemoryEx
KITTYMEMORY_SRC := $(wildcard $(KITTYMEMORY_PATH)/*.cpp)

## Keystone static lib link
include $(CLEAR_VARS)
LOCAL_MODULE := Keystone
LOCAL_SRC_FILES := $(KITTYMEMORY_PATH)/Deps/Keystone/libs-android/arm64-v8a/libkeystone.a
include $(PREBUILT_STATIC_LIBRARY)

## Example exec
include $(CLEAR_VARS)

LOCAL_MODULE := KittyMemoryExExample

# -D option for debug outputs
LOCAL_CPPFLAGS += -std=c++17 -DkITTYMEMORY_DEBUG

LOCAL_SRC_FILES := example.cpp $(KITTYMEMORY_SRC)

## add keystone
LOCAL_STATIC_LIBRARIES := Keystone

include $(BUILD_EXECUTABLE)