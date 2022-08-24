# actions-immortalwrt-mtk-sdk-phicomm-k2p

## 中文说明
供斐讯 K2P 使用、基于 GitHub Actions CI 的自动化 ImmortalWrt 构建，使用 [padavanonly](https://github.com/padavanonly/immortalwrt)源码 、Linux 5.10 内核，以及开启了 [MTK SDK HWNAT](https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/) 支持。

### 如何使用
[Fork](https://github.com/KevinMX/actions-immortalwrt-mtk-sdk-phicomm-k2p/fork) 本仓库，修改 seed.conf 配置文件，开启 Actions CI 进行构建。

或者，如果您是斐讯 K2P 用户，可直接从 Actions 或 release 中下载已编译好的固件。

受 Flash 空间限制，passwall 和 ssr-plus 版本分开编译，xray-core 版本不同，根据需求二选一。

刷机步骤和其他固件大致相同，如您在 K2P 上使用 breed，刷写时选择**公版**布局即可。

### 固件内容
```
基于 ImmortalWrt 18.06-k5.4

LuCI:
luci-app-arpbind
luci-app-ddns
luci-app-ssr-plus / luci-app-passwall（二选一）
luci-app-turboacc
luci-app-udpxy
luci-app-upnp
luci-app-vlmcsd
luci-app-wireguard
luci-app-wol
luci-theme-atmaterial

非 LuCI 的其他系统组件：
xray-core (SSR Plus+ 为 1.5.9，passwall 为 1.5.5）
ipt2socks
cloudflare ddns
ipv6helper
zram-swap

passwall 专属：
ChinaDNS-NG
IPv6 NAT

TCP BBR
Fullcone NAT
MTK SDK HWNAT
802.11k/v/r
Linux 5.10
```

### 题外话
如您需要配置 udpxy / IPTV 转发，且光猫支持自行配置 VLAN，可参考 [图解ax6s利用openwrt进行iptv单线复用并转发至局域网](https://www.right.com.cn/forum/thread-8215671-1-1.html) 进行配置。

关于为什么我又开始折腾 ImmortalWrt 了，是看到了 MTK SDK HWNAT 支持，并且实测性能在斐讯 K2P 上表现已经足够好，WAN PPPoE to WiFi ~650Mbps（CPU 占用 < 70%, Lean lede 速度实测约 450Mbps），WAN PPPoE to LAN 跑满（CPU 占用 几乎为0）。加上 OpenWrt / ImmortalWrt 对插件和个性化支持远好于 Padavan，所以又折腾了起来。

非常感谢 MeIsReallyBa、padavanonly、天灵、Lean 等国内 OpenWrt 社区的大佬们，能给大家的 MT76 设备献上这份大礼，K2P 这个多年前的设备可以继续发挥余热了。

当然，也感谢 MTK ~~这个并不及时~~的开源。

## README
Automated build of [padavanonly/immortalwrt](https://github.com/padavanonly/immortalwrt) for Phicomm K2P, with Linux 5.10 and [MTK SDK HWNAT](https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/) enabled.

### How to use
[Fork](https://github.com/KevinMX/actions-immortalwrt-mtk-sdk-phicomm-k2p/fork) this repository, modify seed.conf file by your demand, and enable GitHub Actions to compile the firmware.

Or if you're using Phicomm K2P, you may download the firmware directly from Actions or releases.

Due to space restriction of the device, I made seperate builds of passwall and ssr-plus, xray-core versions are different. Choose either one on your demand.

The flashing procedure is pretty much the same as other firmware, if you're using breed bootloader, choose "generic" flash layout should be okay.

### Packages included
```
Based on ImmortalWrt 18.06-k5.4

LuCI:
luci-app-arpbind
luci-app-ddns
luci-app-ssr-plus or luci-app-passwall
luci-app-turboacc
luci-app-udpxy
luci-app-upnp
luci-app-vlmcsd
luci-app-wireguard
luci-app-wol
luci-theme-atmaterial

Other non-LuCI stuff:
xray-core (1.5.9 for SSR Plus+ build, 1.5.5 for passwall build)
ipt2socks
cloudflare ddns
ipv6helper
zram-swap

passwall only:
ChinaDNS-NG
IPv6 NAT

TCP BBR
Fullcone NAT
MTK SDK HWNAT
802.11k/v/r
Linux 5.10
```

## Performance results
WAN PPPoE to WiFI 5GHz: ~650Mbps with < 70% CPU utilization (about 450Mbps on Lean's lede)

WAN PPPoE to LAN: maxed out my bandwidth, with 0% (<1%) CPU utilization

___

<details>
  <summary>原 Actions 仓库说明 / Info for the original Actions repository</summary>
  
**English** | [中文](https://p3terx.com/archives/build-openwrt-with-github-actions.html)

# Actions-OpenWrt

[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/P3TERX/Actions-OpenWrt/blob/master/LICENSE)
![GitHub Stars](https://img.shields.io/github/stars/P3TERX/Actions-OpenWrt.svg?style=flat-square&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/P3TERX/Actions-OpenWrt.svg?style=flat-square&label=Forks&logo=github)

A template for building OpenWrt with GitHub Actions

## Usage

- Click the [Use this template](https://github.com/P3TERX/Actions-OpenWrt/generate) button to create a new repository.
- Generate `.config` files using [Lean's OpenWrt](https://github.com/coolsnowwolf/lede) source code. ( You can change it through environment variables in the workflow file. )
- Push `.config` file to the GitHub repository.
- Select `Build OpenWrt` on the Actions page.
- Click the `Run workflow` button.
- When the build is complete, click the `Artifacts` button in the upper right corner of the Actions page to download the binaries.

## Tips

- It may take a long time to create a `.config` file and build the OpenWrt firmware. Thus, before create repository to build your own firmware, you may check out if others have already built it which meet your needs by simply [search `Actions-Openwrt` in GitHub](https://github.com/search?q=Actions-openwrt).
- Add some meta info of your built firmware (such as firmware architecture and installed packages) to your repository introduction, this will save others' time.
</details>

## Credits

- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub Actions](https://github.com/features/actions)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [padavanonly/ImmortalWrt](https://github.com/padavanonly/immortalwrt)
- [Project ImmortalWrt](https://github.com/immortalwrt)
- [MeIsReallyBa](https://github.com/meisreallyba)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cowtransfer](https://cowtransfer.com)
- [WeTransfer](https://wetransfer.com/)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
- [ActionsRML/delete-workflow-runs](https://github.com/ActionsRML/delete-workflow-runs)
- [dev-drprasad/delete-older-releases](https://github.com/dev-drprasad/delete-older-releases)
- [peter-evans/repository-dispatch](https://github.com/peter-evans/repository-dispatch)
- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)

[MIT](https://github.com/KevinMX/actions-immortalwrt-mtk-sdk-phicomm-k2p) © [**Kevin.MX**](https://mary.kevinmx.top)
