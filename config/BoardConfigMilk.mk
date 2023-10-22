include vendor/milk/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/milk/config/BoardConfigQcom.mk
endif

include vendor/milk/config/BoardConfigSoong.mk
