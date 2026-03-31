#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' openwrt/package/base-files/files/bin/config_generate
#2. Modify hide mtk mhz info
sed -i '25s/cpu_freq="$\(mhz | awk -F '\'cpu_MHz=\'' '\'\{printf\(\"%.fMHz\",\$2\)\}\''\)"/cpu_freq=""/g' openwrt/package/emortal/autocore/files/generic/cpuinfo
sed -i '52a\"mediatek"/*)' openwrt/package/emortal/autocore/files/generic/cpuinfo
sed -i '53a\    cpu_temp="" ;;' openwrt/package/emortal/autocore/files/generic/cpuinfo
sed -i '64s/|mediatek//' openwrt/package/emortal/autocore/files/generic/cpuinfo
