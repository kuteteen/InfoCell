INSTALL_TARGET_PROCESSES = Preferences

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = InfoCell

InfoCell_FILES = Tweak.x InfoCellView.m
InfoCell_CFLAGS = -fobjc-arc
include $(THEOS_MAKE_PATH)/tweak.mk
