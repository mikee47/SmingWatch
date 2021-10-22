## Local build configuration
## Parameters configured here will override default and ENV values.

export COMPONENT_SEARCH_DIRS := $(CURDIR)/libs

LOCAL_COMPONENTS := AXP202X BMA423 FocalTech PCF8563
COMPONENT_DEPENDS := Graphics $(LOCAL_COMPONENTS)
COMPONENT_SUBMODULES := $(addprefix libs/,$(LOCAL_COMPONENTS))


# Allowed Architectures
SMING_ARCH ?= Esp32

ifeq (,$(filter $(SMING_ARCH),Esp32 Host))
$(error "Unsupported platform. Only Esp32 and Host are supported")
endif


# Pins
CONFIG_VARS += I2C_SDA_PIN
I2C_SDA_PIN := 21

CONFIG_VARS += I2C_SCL_PIN
I2C_SCL_PIN := 22

CONFIG_VARS += POWER_SDA_PIN
POWER_SDA_PIN := $(I2C_SDA_PIN)

CONFIG_VARS += POWER_SCL_PIN
POWER_SCL_PIN := $(I2C_SCL_PIN)

CONFIG_VARS += RTC_INT_PIN
RTC_INT_PIN := 37

CONFIG_VARS += TOUCH_INT_PIN
TOUCH_INT_PIN := 38

CONFIG_VARS += TOUCH_SDA_PIN
TOUCH_SDA_PIN := 23

CONFIG_VARS += TOUCH_SCL_PIN
TOUCH_SCL_PIN := 32

CONFIG_VARS += BACKLIGHT_PIN 
BACKLIGHT_PIN := 12

CONFIG_VARS += AXIS_INT_PIN
AXIS_INT_PIN := 39

CONFIG_VARS += AXIS_SDA_PIN
AXIS_SDA_PIN := $(I2C_SDA_PIN)

CONFIG_VARS += AXIS_SCL_PIN
AXIS_SCL_PIN := $(I2C_SCL_PIN)

COMPONENT_CPPFLAGS := -DI2C_SDA_PIN=$(I2C_SDA_PIN) -DI2C_SCL_PIN=$(I2C_SCL_PIN) \
                      -DPOWER_SDA_PIN=$(POWER_SDA_PIN) -DPOWER_SCL_PIN=$(POWER_SCL_PIN) \
                      -DRTC_INT_PIN=$(RTC_INT_PIN) \
                      -DTOUCH_INT_PIN=$(TOUCH_INT_PIN) -DTOUCH_SDA_PIN=$(TOUCH_SDA_PIN) -DTOUCH_SCL_PIN=$(TOUCH_SCL_PIN) \
                      -DBACKLIGHT_PIN=$(BACKLIGHT_PIN) \
                      -DAXIS_INT_PIN=$(AXIS_INT_PIN) -DAXIS_SDA_PIN=$(AXIS_SDA_PIN) -DAXIS_SCL_PIN=$(AXIS_SCL_PIN)   		    

COMPONENT_SRCDIRS := app src src/Arch/$(SMING_ARCH)
COMPONENT_INCDIRS := $(COMPONENT_SRCDIRS)  

