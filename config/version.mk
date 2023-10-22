# Copyright (C) 2023 ProjectMilk
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

ANDROID_VERSION := 14
MILKVERSION := v1.0

MILK_BUILD_TYPE ?= UNOFFICIAL
MILK_MAINTAINER ?= UNKNOWN
MILK_DATE_YEAR := $(shell date -u +%Y)
MILK_DATE_MONTH := $(shell date -u +%m)
MILK_DATE_DAY := $(shell date -u +%d)
MILK_DATE_HOUR := $(shell date -u +%H)
MILK_DATE_MINUTE := $(shell date -u +%M)
MILK_BUILD_DATE := $(MILK_DATE_YEAR)$(MILK_DATE_MONTH)$(MILK_DATE_DAY)-$(MILK_DATE_HOUR)$(MILK_DATE_MINUTE)
TARGET_PRODUCT_SHORT := $(subst MILK_,,$(MILK_BUILD))

# OFFICIAL_DEVICES
ifeq ($(MILK_BUILD_TYPE), OFFICIAL)
  LIST = $(shell cat vendor/MILK/MILK.devices)
    ifeq ($(filter $(MILK_BUILD), $(LIST)), $(MILK_BUILD))
      IS_OFFICIAL=true
      MILK_BUILD_TYPE := OFFICIAL
    endif
    ifneq ($(IS_OFFICIAL), true)
      MILK_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(MILK_BUILD)")
    endif
endif

MILK_VERSION := $(MILKVERSION)-$(MILK_BUILD)-$(MILK_BUILD_DATE)-VANILLA-$(MILK_BUILD_TYPE)
ifeq ($(WITH_GAPPS), true)
MILK_VERSION := $(MILKVERSION)-$(MILK_BUILD)-$(MILK_BUILD_DATE)-GAPPS-$(MILK_BUILD_TYPE)
endif
MILK_MOD_VERSION :=$(ANDROID_VERSION)-$(MILKVERSION)
MILK_DISPLAY_VERSION := ProjectMILK-$(MILKVERSION)-$(MILK_BUILD_TYPE)
MILK_DISPLAY_BUILDTYPE := $(MILK_BUILD_TYPE)
MILK_FINGERPRINT := ProjectMILK/$(MILK_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(MILK_BUILD_DATE)

# MILK System Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.milk.version=$(MILK_DISPLAY_VERSION) \
  ro.milk.build.status=$(MILK_BUILD_TYPE) \
  ro.modversion=$(MILK_MOD_VERSION) \
  ro.milk.build.date=$(MILK_BUILD_DATE) \
  ro.milk.buildtype=$(MILK_BUILD_TYPE) \
  ro.milk.fingerprint=$(MILK_FINGERPRINT) \
  ro.milk.device=$(MILK_BUILD) \
  org.milk.version=$(MILKVERSION) \
  ro.milk.maintainer=$(MILK_MAINTAINER)