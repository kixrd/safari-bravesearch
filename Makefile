export THEOS_PACKAGE_SCHEME = rootless
export PREFIX = /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/
export SDKVERSION = 15.6
export ARCHS = arm64 arm64e
export TARGET = iphone:clang:latest:15.6

INSTALL_TARGET_PROCESSES = MobileSafari

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = bravesearch

bravesearch_FILES = Tweak.x
bravesearch_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
