#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# Modify default Hostname
sed -i 's/ImmortalWrt/K2P/g' package/base-files/files/bin/config_generate

#Downgrade Xray to 1.5.5
sed -i 's/1.5.9/1.5.5/g' feeds/packages/net/xray-core/Makefile
sed -i 's/ef61f80a32229f583c375ec8da79a1533ba5efae0fcb011e68a0ad0c913f6a87/3f8d04fef82a922c83bab43cac6c86a76386cf195eb510ccf1cc175982693893/g' feeds/packages/net/xray-core/Makefile

#Enable 802.11k/v/r
sed -i 's/RRMEnable=0/RRMEnable=1/g' package/kernel/mt-drivers/mt_wifi/files/mt7615.1.2G.dat
sed -i 's/RRMEnable=0/RRMEnable=1/g' package/kernel/mt-drivers/mt_wifi/files/mt7615.1.5G.dat
sed -i 's/FtSupport=0/FtSupport=1/g' package/kernel/mt-drivers/mt_wifi/files/mt7615.1.2G.dat
sed -i 's/FtSupport=0/FtSupport=1/g' package/kernel/mt-drivers/mt_wifi/files/mt7615.1.5G.dat
echo 'WNMEnable=1' >> package/kernel/mt-drivers/mt_wifi/files/mt7615.1.2G.dat
echo 'WNMEnable=1' >> package/kernel/mt-drivers/mt_wifi/files/mt7615.1.5G.dat
