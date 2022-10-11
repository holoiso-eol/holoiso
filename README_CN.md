[![Build ISO](https://github.com/theVakhovskeIsTaken/holoiso/actions/workflows/build.yml/badge.svg)](https://github.com/theVakhovskeIsTaken/holoiso/actions/workflows/build.yml)

![image](https://user-images.githubusercontent.com/97450182/167457908-07be1a60-7e86-4bef-b7f0-6bd19efd8b24.png)

# ENGLISH Version
Click [here](https://github.com/theVakhovskeIsTaken/holoiso) to access the English version.

# HoloISO 

SteamOS 3 (Holo) 基于 ArchLinux 构建.

***是的,V社宣称甚至在面包机上也能够运行SteamOS.***

HoloISO 项目,试图将 Steam Desk 的 SteamOS Holo 改为通用、可安装的格式,并提供接近官方的 SteamOS 体验.本项目的重点在于实现 Steam 客户端、重装系统本身、 Gamescope组件,以及用户为Deck 应用创建的应用程序所依赖的运行库.(就像运行在Steam Desk上).

点击 [这里](https://t.me/HoloISO) 来加入 **HoloISO** 的官方 **Telegram** 更新频道 ;

点击 [这里](https://steamdeck.community/forums/holoiso.29/) 来访问 **Steam Deck** 官方社区论坛上对 **HoloISO** 的讨论.

**常见问题:**

- 本项目是V社官方的 SteamOS 吗?
> 不是,但它 99% 的部分已经和官方是一样的.它的原代码和软件包没有经过任何的编辑,都直接来自Valve,并且是从官方 Steam Deck 获取的ISO恢复映像,在 QEMU 中运行的中提取的.
- 我下载的 ISO 文件无法启动或者说无法引导,怎么办?
> 目前,只有在通过这些软件制作才能正确引导：
> 块大小为 4MB 的 DD 模式： [alenaEtcher](https://www.balena.io/etcher/)、[RosaImageWriter](http://wiki.rosalab.ru/en/index.php/ROSA_ImageWriter)、[Fedora Media Writer](https://getfedora.org/en/workstation/download/),或 DD 模式的：[Rufus](https://rufus.ie)


**项目计划**
- 成功启动
- SteamOS OOBE（Steam Deck UI 首次启动时的欢迎界面）
- Deck UI (-桌面模式)
- Deck UI (-游戏模式)
- ~~TDP 控制/FPS 限制~~ (*0)
- 全局 FSR
- 材质预缓存
- 切换桌面模式到Plasma/到Plasma的过程无须用户干预.
- Valve's 独家的 *Vapor* 外观,基于 KDE Plasma
- Steam Deck pacman 源镜像
- 看起来很酷的neofetch?
- 系统自动更新

(*0) 由于 Steam Deck 默认的 TDP 功耗和 GPU 频率都很低,特别是 dGPUs ,无法匹配大部分通用配置,所以该功能禁用. 

**已知问题:**

- NVIDIA 显卡使用须知：

> 仅完美支持10系以上显卡（*1）. 虽然9系列显卡存在驱动,但 gamescope 未提供支持. 安装 HoloISO 时需要选择你的显卡类型. 如果遇到任何问题,请重新启动到恢复模式,并键入 `recoveryinit` ,使用 `nmtui` 连接到网络并安装所需的软件包. 

(*1) 对 NVIDIA 显卡的支持仍然很不稳定. GamepadUI 会滞后,但是游戏会正常运行,启动不一定成功,通常在 5~10 次尝试中启动成功. 

> 在 NVIDIA GPUs 支持KMS、Xwayland和Vulkan DMA-BUF扩展之前,它们根本无法与HoloISO正常工作. 

- Intel GPUs/iGPUs 需要Gamescope降级才能引导进入SteamOS. 

> 需要在安装 HoloISO 选择你的 GPU 类型. 如果遇到任何问题,请重新启动到恢复模式,键入recoveryinit,使用nmtui连接到网络并安装所需的软件包.

安装过程:
-
**最低需求:**
- 4GB 安装U盘
- AMD RX Vega+/APU 集成显卡; 4xx/5xx, 5xxx/6xxx 独立显卡
  或者 英特尔 UHD 630+ 集成显卡 
  或者 英伟达 GTX 9xx+ 集成显卡/独立显卡(最好不要使用optimus技术[PRIME](*3))
- 支持 UEFI 启动
- 禁用安全启动

(*3)optimus是 NVIDIA的 双显卡的智能切换技术,这个技术的出现解决了以前的双显卡笔记本需要重启或者需要关闭所有占用GPU的程序才能切换的问题. optimus是针对windows系统设计的,没有考虑在Linux下的兼容性,因此optimus设备想要在Linux下使用独显极其麻烦,这个在linux下有兼容性问题,所以最好不要是这种设备.

**安装类型:**
- 最低安装
> 只有桌面模式, 类似于普通的Arch Linux安装.
- 仅游戏模式*
> 仅Steam Deck UI(仅支持AMD GPU;没有桌面模式) 如上所述,没有安装任何DE,只有游戏模式的Steam Deck UI
> ****这个安装类型还在修改中,目前并没有提供.***
- 完整安装
> 完整的SteamOS 3体验,包括会话切换,桌面模式+应用程序,和预安装的程序. 

**安装指南:**
- 下载ISO并且用这些软件制作 [BalenaEtcher](https://www.balena.io/etcher/), [RosaImageWriter](http://wiki.rosalab.ru/en/index.php/ROSA_ImageWriter), [Fedora Media Writer](https://getfedora.org/en/workstation/download/), [Rufus](https://rufus.ie) 块大小为4MB的DD模式的磁盘,如果你是linux `sudo dd if=SteamOS.iso of=/dev/sd(your flash drive) bs=4M status=progress oflag=sync` 
- 从 ISO 引导进入
- 运行 `holoinstall`
- 当出现选项时,选择安装的磁盘, 列如, `sda` 或者 `nvme0n1` 进行安装
- 拿上你爱喝的饮料,等待安装完毕 :3

在启动时,你会看到Steam Deck的欢迎界面,从那里你将连接到你的网络,并登录到你的Steam帐户,然后你可以退出到KDE Plasma在电源菜单选择*切换到桌面*,[像这样](https://www.youtube.com/watch?v=smfwna2iHho). 

截图:
-
![Screenshot_20220508_133916](https://user-images.githubusercontent.com/97450182/167292656-1679e007-4701-4a3c-89ee-2104b5eb12cd.png)
![Screenshot_20220508_133737](https://user-images.githubusercontent.com/97450182/167292672-8bc9032d-4a21-4528-ab7e-b9dbc25a0664.png)
![Screenshot_20220508_133746](https://user-images.githubusercontent.com/97450182/167292722-a68806c1-5768-4790-a8e7-108d7c72bb08.png)
![Screenshot_20220508_133822](https://user-images.githubusercontent.com/97450182/167292731-86fed590-0260-4c5e-ac13-05d284b5fd24.png)
![Screenshot_20220508_134038](https://user-images.githubusercontent.com/97450182/167292734-90036b5f-2571-438e-8951-8d731cd4ae93.png)
![Screenshot_20220508_134051](https://user-images.githubusercontent.com/97450182/167292738-a70d266f-814d-4352-8d38-b920ae3f3381.png)


备注:
-

该项目配置包括Valve的pacman.conf存储库 'holoinstall' 脚本和 'holoinstall' 安装后二进制文件

该项目配置构建基于*releng-based ISO*,这是Arch Linux的默认重分发版本. 

创建一个最新的ISO:
-
通过执行以下命令进行构建:
```
pacman -Sy archiso
git clone https://github.com/bhaiest/holoiso/
sudo mkarchiso -v holoiso
```
下载结束后,你的ISO文件将在 'out' 文件夹中可用. 

