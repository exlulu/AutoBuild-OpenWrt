#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' openwrt/package/base-files/files/bin/config_generate
#2. Modify show mtk mhz info
# sed -i '25s/cpu_freq=""/cpu_freq="$\(mhz | awk -F '\'cpu_MHz=\'' '\'\{printf\(\"%.fMHz\",\$2\)\}\''\)"/g' openwrt/package/emortal/autocore/files/generic/cpuinfo
# sed -i '53,54d' openwrt/package/emortal/autocore/files/generic/cpuinfo
# sed -i '62s/ipq/ipq|mediatek/g' openwrt/package/emortal/autocore/files/generic/cpuinfo
# 增加iptables-mod-socket模块
sed -i '382a\define Package/iptables-mod-socket' openwrt/package/network/utils/iptables/Makefile
sed -i '383a\$(call Package/iptables/Module, +kmod-ipt-socket)' openwrt/package/network/utils/iptables/Makefile
sed -i '384a\  TITLE:=Socket match iptables extensions' openwrt/package/network/utils/iptables/Makefile
sed -i '385a\endef' openwrt/package/network/utils/iptables/Makefile
sed -i '386G' openwrt/package/network/utils/iptables/Makefile
sed -i '387a\define Package/iptables-mod-socket/description' openwrt/package/network/utils/iptables/Makefile
sed -i '388a\Socket match iptables extensions.' openwrt/package/network/utils/iptables/Makefile
sed -i '389G' openwrt/package/network/utils/iptables/Makefile
sed -i '390a\Matches:' openwrt/package/network/utils/iptables/Makefile
sed -i '391a\  - socket' openwrt/package/network/utils/iptables/Makefile
sed -i '392G' openwrt/package/network/utils/iptables/Makefile
sed -i '393a\endef' openwrt/package/network/utils/iptables/Makefile
sed -i '394G' openwrt/package/network/utils/iptables/Makefile
sed -i '679a\$(eval $(call BuildPlugin,iptables-mod-socket,$(IPT_SOCKET-m)))' openwrt/package/network/utils/iptables/Makefile
# 增加ipt-socket模块
sed -i '629a\define KernelPackage/ipt-socket' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '630a\  TITLE:=Iptables socket matching support' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '631a\  DEPENDS+=+kmod-nf-socket +kmod-nf-conntrack' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '632a\  KCONFIG:=$(KCONFIG_IPT_SOCKET)' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '633a\  FILES:=$(foreach mod,$(IPT_SOCKET-m),$(LINUX_DIR)/net/$(mod).ko)' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '634a\  AUTOLOAD:=$(call AutoProbe,$(notdir $(IPT_SOCKET-m)))' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '635a\  $(call AddDepends/ipt)' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '636a\endef' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '637G' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '638a\define KernelPackage/ipt-socket/description' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '639a\  Kernel modules for socket matching' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '640a\endef' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '641G' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '642a\$(eval $(call KernelPackage,ipt-socket))' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '643G' openwrt/package/kernel/linux/modules/netfilter.mk
# ipt-socket依赖kmod-nf-socket
sed -i '164a\define KernelPackage/nf-socket' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '165a\  SUBMENU:=$(NF_MENU)' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '166a\  TITLE:=Netfilter socket lookup support' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '167a\  KCONFIG:= $(KCONFIG_NF_SOCKET)' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '168a\  FILES:=$(foreach mod,$(NF_SOCKET-m),$(LINUX_DIR)/net/$(mod).ko)' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '169a\  AUTOLOAD:=$(call AutoProbe,$(notdir $(NF_SOCKET-m)))' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '170a\endef' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '171G' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '172a\$(eval $(call KernelPackage,nf-socket))' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '173G' openwrt/package/kernel/linux/modules/netfilter.mk
sed -i '174G' openwrt/package/kernel/linux/modules/netfilter.mk
