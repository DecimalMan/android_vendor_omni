# Versioning of the ROM
PRODUCT_VERSION_MAJOR = 4
PRODUCT_VERSION_MINOR = 3
PRODUCT_VERSION_REVISION = 0

ifdef BUILDTYPE_NIGHTLY
	ROM_BUILDTYPE := NIGHTLY
endif
ifdef BUILDTYPE_AUTOTEST
	ROM_BUILDTYPE := AUTOTEST
endif
ifdef BUILDTYPE_EXPERIMENTAL
	ROM_BUILDTYPE := EXPERIMENTAL
endif
ifdef BUILDTYPE_RELEASE
	ROM_BUILDTYPE := RELEASE
endif

ifndef ROM_BUILDTYPE
	ROM_BUILDTYPE := HOMEMADE
endif

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst omni_,,$(TARGET_PRODUCT_SHORT))

# Build the final version string
ifdef BUILDTYPE_RELEASE
	ROM_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_REVISION)-$(TARGET_PRODUCT_SHORT)
else
	ROM_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_REVISION)-$(shell date -u +%Y%m%d)-$(TARGET_PRODUCT_SHORT)-$(ROM_BUILDTYPE)
endif

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=OmniROM-$(ROM_VERSION) \
	ro.omni.version=$(ROM_VERSION)

