#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' openwrt/package/base-files/files/bin/config_generate
#2. Modify disable ipv6 support
# sed -i '159s/default y/default n/g' openwrt/config/Config-build.in
#3. Modify show mtk mhz info
#sed -i '25s#cpu_freq=""#cpu_freq="$\(mhz | awk -F '\'cpu_MHz=\'' '\'\{printf\(\"%.fMHz\",\$2\)\}\''\)"#g' openwrt/package/emortal/autocore/files/generic/cpuinfo
#sed -i '53,54d' openwrt/package/emortal/autocore/files/generic/cpuinfo
#sed -i '62s/ipq/ipq|mediatek/g' openwrt/package/emortal/autocore/files/generic/cpuinfo
