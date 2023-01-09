[![Build ISO](https://github.com/theVakhovskeIsTaken/holoiso/actions/workflows/build.yml/badge.svg)](https://github.com/theVakhovskeIsTaken/holoiso/actions/workflows/build.yml)

![image](https://user-images.githubusercontent.com/97450182/167457908-07be1a60-7e86-4bef-b7f0-6bd19efd8b24.png)

# ENGLISH Version
Click [here](https://github.com/theVakhovskeIsTaken/holoiso) to access the English version.

# HoloISO 

ArchLinux 的 SteamOS 3 (Holo) 配置文件。

***是的，V社宣称你甚至可以在面包机上运行SteamOS。***
本项目试图将 Steam Desk 的 SteamOS Holo 重新更改为通用、可安装的发布版本，并提供类似于官方的 SteamOS 体验。本项目的重点在于实现 Steam 客户端、操作系统本身、 Gamescope 组件和用户为 Deck 创建的应用程序所依赖的专有运行库(例如 Steam Desk 专有运行库。)。

点击 [这里](https://t.me/HoloISO) 来加入 **HoloISO** 的官方 **Telegram** 更新频道 ;

点击 [这里](https://steamdeck.community/forums/holoiso.29/) 来访问 **Steam Deck** 官方社区论坛上对 **HoloISO** 的讨论。

**常见问题：**

- 本项目是V社官方的吗?
> 不是，但它 99% 的部分已经和官方是一样的。它的原代码和软件包没有经过任何修改，都源自 Valve ，并且所有被构建的 ISO 有 HoloISO 安装运行后相同的 rootfs 引导程序。
- 我有一个 NVIDIA G- 系列显卡
> 不，甚至不值得提问。如果您有 NVIDIA 显卡，您就靠自己了。Steam 客户端的最新 Valve 更新包括普通和 Jupiter 引导程序已经破坏了 NVIDIA 显卡的 gamepadui。因此，你将不会获得任何技术支持。


**项目计划：**
- 成功启动
- SteamOS OOBE（Steam Deck UI 首次启动时的欢迎界面）
- Deck UI (桌面模式)
- Deck UI (-游戏模式)
- ~~TDP 控制/FPS 限制~~ (*0)
- 全局 FSR
- 着色器预缓存
- 在没有用户干扰的情况下切换桌面模式从Plasma/到Plasma。
- Valve 为 KDE Plasma 桌面独家打造的 *Vapor* 主题
- Steam Deck pacman 镜像源
- 看起来很酷的 neofetch ?
- 系统更新


**Steam Deck 上的程序内容与发行版的比较：：**

- Dock 固件更新程序（可通过运行 sudo pacman -S jupiter-dock-updater-bin 在桌面上额外安装）
- Steam Deck BIOS、控制器固件、操作系统固件更新程序
- 新的风扇曲线控制
- TDP/时钟控制

(*0) 由于 Steam Deck 默认的 TDP 功耗和 GPU 频率都很低，特别是 dGPUs ，无法匹配大部分通用配置，所以该功能禁用。

# 安装说明：
**最低需求：**
- 4GB 存储介质
- 如果您需要使用“复制到内存”选项进行安装，则需要 8 GB 以上的内存
- 支持 RADV 驱动而非 Radeon 系列的 AMD GPU（Southern Islands 和 Sea Islands 需要额外的内核 cmdline 属性）； Intel iGPU 支持到 11 代 Iris Xe（暂不支持 Arc 显卡）
- 支持 UEFI 启动
- 禁用安全启动(secure boot)

**安装步骤：**
- 从 [release](https://github.com/bhaiest/holoiso/releases/latest) 或者兼容 NVIDIA 显卡的 [actions](https://nightly.link/theVakhovskeIsTaken/holoiso/workflows/build/stable/holoiso) 下载并使用 DD 模式的 [BalenaEtcher](https://www.balena.io/etcher/) 或 [Rufus](https://rufus.ie) ，或使用命令 `sudo dd if=SteamOS.iso of=/dev/sd(你的存储介质) bs=4M status=progress oflag=sync` 刷入ISO镜像，或者将 ISO 文件直接放入 Ventoy 设备。
- 引导到 ISO 镜像
- 选择 "Install SteamOS on this device"
- 按照屏幕上的提示进行操作
- 喝点饮料，等他安装完毕 :3

在启动时，你会看到 Steam Deck 的初始设置界面。设置你的网络，并登录你的 Steam 帐户，然后你在电源菜单选择`切换到桌面`来退出到 KDE Plasma 桌面。[像这样](https://www.youtube.com/watch?v=smfwna2iHho)。

# 截屏：
-
![Screenshot_20220508_133916](https://user-images.githubusercontent.com/97450182/167292656-1679e007-4701-4a3c-89ee-2104b5eb12cd.png)
![Screenshot_20220508_133737](https://user-images.githubusercontent.com/97450182/167292672-8bc9032d-4a21-4528-ab7e-b9dbc25a0664.png)
![Screenshot_20220508_133746](https://user-images.githubusercontent.com/97450182/167292722-a68806c1-5768-4790-a8e7-108d7c72bb08.png)
![Screenshot_20220508_133822](https://user-images.githubusercontent.com/97450182/167292731-86fed590-0260-4c5e-ac13-05d284b5fd24.png)
![Screenshot_20220508_134038](https://user-images.githubusercontent.com/97450182/167292734-90036b5f-2571-438e-8951-8d731cd4ae93.png)
![Screenshot_20220508_134051](https://user-images.githubusercontent.com/97450182/167292738-a70d266f-814d-4352-8d38-b920ae3f3381.png)

# 致谢:

（人太多 xD ，待会再补！！！）

# 备注：

本项目配置包含 Valve 的 pacman.conf 镜像库、 `holoinstall` 脚本和 `holoinstall` 编译后的二进制文件。

该项目生成了一个基于 releng-based 的 ISO ，使用了默认的 Arch Linux 再发行版。

# 如何生成 ISO：
通过执行以下命令进行构建：
```
pacman -Sy archiso
git clone https://github.com/bhaiest/holoiso/
mv holoiso/mkarchiso-holoiso /usr/bin
chmod +x /usr/bin/mkarchiso-holoiso
sudo mkarchiso-holoiso -v holoiso
```
编译结束后，你的生成的 ISO 文件生成再 `out` 文件夹中。
