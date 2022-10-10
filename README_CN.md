[![Build ISO](https://github.com/theVakhovskeIsTaken/holoiso/actions/workflows/build.yml/badge.svg)](https://github.com/theVakhovskeIsTaken/holoiso/actions/workflows/build.yml)

![image](https://user-images.githubusercontent.com/97450182/167457908-07be1a60-7e86-4bef-b7f0-6bd19efd8b24.png)

# ENGLISH Version
Click [here](https://github.com/theVakhovskeIsTaken/holoiso) to access the English version.


# HoloISO 
SteamOS 3 (Holo) 是一个使用了ArchLinux 构建的linux系统.

***是的, V社宣称,甚至在面包机上SteamOS也能够运行.***


HoloISO项目，试图将Steam Desk的SteamOS Holo改为通用的、可安装的格式。重点在于重新修改Steam客户端、OS本身、Gamescope和用户创建的Deck应用所依赖的专有组件，提供提供接近官方的SteamOS体验(就像运行在Steam Desk上).


点击 [这里](https://t.me/HoloISO) 加入**HoloISO**官方 Telegram更新频道;

点击 [这里](https://steamdeck.community/forums/holoiso.29/) 访问Steam Deck官方社区论坛上的**HoloISO**讨论

**常见问题:**

- 这是V社官方的SteamOS吗?
> 不是, 但是已经和官方99%部分是一样的. 原代码和包直接来自Valve，没有经过任何的编辑，ISO是在官方Steam Deck恢复映像上获取的的，从QEMU实例中运行。
- 我下载的ISO无法启动或者说无法引导?
> 目前，只有在使用这些软件制作 [BalenaEtcher](https://www.balena.io/etcher/), [RosaImageWriter](http://wiki.rosalab.ru/en/index.php/ROSA_ImageWriter), [Fedora Media Writer](https://getfedora.org/en/workstation/download/), [Rufus](https://rufus.ie) 块大小为4MB的DD模式的磁盘才能正确引导.


**工作目标:**
- 启动
- SteamOS OOBE (Steam Deck UI 首次启动引导的欢迎界面)
- Deck UI (-桌面模式)
- Deck UI (-游戏模式)
- ~~TDP 控制/FPS 限制~~ (*0)
- 全局 FSR
- 材质预缓存
- 切换桌面模式到Plasma/到Plasma的过程无须用户干预.
- Valve's 独家的 *Vapor* 外观，基于 KDE Plasma
- Steam Deck pacman 源镜像
- 看起来很酷的neofetch?
- 系统自动更新

(*0) 由于Steam Deck默认的TDP功耗和GPU频率很低，特别是dGPUs，无法匹配大部分通用配置，所以被禁用

**已知问题:**
- NVIDIA GPUs 支持须知:

> 只有 10xx+ GPUs 才能完全支持(*1). 尽管驱动程序中存在 9xx 的支持, 但gamescope并未在此基础上发布. 需要在安装 HoloISO 选择你的 GPU 类型. 如果遇到任何问题，请重新启动到恢复模式，键入recoveryinit，使用nmtui连接到网络并安装所需的软件包.

(*1) 对NVIDIA的支持仍然很不稳定。GamepadUI会滞后，但是游戏会正常运行，启动也非常随机，通常在5~10次尝试中启动.

> 在 NVIDIA GPUs 支持KMS、Xwayland和Vulkan DMA-BUF扩展之前，它们根本无法与HoloISO正常工作。

- Intel GPUs/iGPUs 需要Gamescope降级才能引导进入SteamOS. 

> 需要在安装 HoloISO 选择你的 GPU 类型. 如果遇到任何问题，请重新启动到恢复模式，键入recoveryinit，使用nmtui连接到网络并安装所需的软件包.

安装过程:
-
**最低需求:**
- 4GB 安装U盘
- AMD RX Vega+/APU 集成显卡; 4xx/5xx, 5xxx/6xxx 独立显卡
  或者 英特尔 UHD 630+ 集成显卡 
  或者 英伟达 GTX 9xx+ 集成显卡/独立显卡(最好不要使用optimus技术[PRIME](*3))
- 支持 UEFI 启动
- 禁用安全启动

(*3)optimus是 NVIDIA的 双显卡的智能切换技术，这个技术的出现解决了以前的双显卡笔记本需要重启或者需要关闭所有占用GPU的程序才能切换的问题。optimus是针对windows系统设计的，没有考虑在Linux下的兼容性，因此optimus设备想要在Linux下使用独显极其麻烦，这个在linux下有兼容性问题，所以最好不要是这种设备.

**安装类型:**
- 最低安装
> 只有桌面模式, 类似于普通的Arch Linux安装.
- 仅游戏模式*
> 仅Steam Deck UI(仅支持AMD GPU;没有桌面模式) 如上所述，没有安装任何DE，只有游戏模式的Steam Deck UI
> ****这个安装类型还在修改中，目前并没有提供.***
- 完整安装
> 完整的SteamOS 3体验，包括会话切换，桌面模式+应用程序，和预安装的程序。

**安装指南:**
- 下载ISO并且用这些软件制作 [BalenaEtcher](https://www.balena.io/etcher/), [RosaImageWriter](http://wiki.rosalab.ru/en/index.php/ROSA_ImageWriter), [Fedora Media Writer](https://getfedora.org/en/workstation/download/), [Rufus](https://rufus.ie) 块大小为4MB的DD模式的磁盘，如果你是linux `sudo dd if=SteamOS.iso of=/dev/sd(your flash drive) bs=4M status=progress oflag=sync` 
- 从 ISO 引导进入
- 运行 `holoinstall`
- 当出现选项时，选择安装的磁盘, 列如, `sda` 或者 `nvme0n1` 进行安装
- 拿上你爱喝的饮料，等待安装完毕 :3

在启动时，你会看到Steam Deck的欢迎界面，从那里你将连接到你的网络，并登录到你的Steam帐户，然后你可以退出到KDE Plasma在电源菜单选择*切换到桌面*，[像这样](https://www.youtube.com/watch?v=smfwna2iHho)。

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

该项目配置构建基于*releng-based ISO*，这是Arch Linux的默认重分发版本。

创建一个最新的ISO:
-
通过执行以下命令进行构建:
```
pacman -Sy archiso
git clone https://github.com/bhaiest/holoiso/
sudo mkarchiso -v holoiso
```
下载结束后,你的ISO文件将在 'out' 文件夹中可用。

