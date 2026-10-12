################################################################################
#
# rtl8822cu
#
################################################################################

RTL8822CU_VERSION = aae7e0d75e40624aba7739d2036f0f45e83e3028
RTL8822CU_SITE = $(call github,morrownr,8822cu,$(RTL8822CU_VERSION))
RTL8822CU_LICENSE = GPL-2.0

RTL8822CU_USER_EXTRA_CFLAGS = \
	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
	-DCONFIG_IOCTL_CFG80211 \
	-DRTW_USE_CFG80211_STA_EVENT \
	-Wno-error

RTL8822CU_MODULE_MAKE_OPTS = \
	CONFIG_PLATFORM_AUTODETECT=n \
	CONFIG_RTL8822CU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	USER_EXTRA_CFLAGS="$(RTL8822CU_USER_EXTRA_CFLAGS)"

$(eval $(kernel-module))
$(eval $(generic-package))
