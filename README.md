 ![image](https://user-images.githubusercontent.com/97450182/166438178-abb068d0-ce36-4611-aefe-deb6fbc1ab51.png)

# HoloISO
SteamOS 3 (Holo) archiso configuration.

***Yes, Gabe. SteamOS functions well on a toaster.***

This project attempts to bring the Steam Deck's Holo OS into a generic, installable format, and provide a close-to-official SteamOS experience.


**Common Questions**

- Is this official?
> No, but it may as well be 99% of the way there. The code and packages, are straight from Valve, with zero possible edits, and the ISO is being built on the official Steam Deck recovery image, running inside a QEMU instance.
- The ISO didn't boot for me, any solution?
> Currently, the ISO only boots if flashed using [BalenaEtcher](https://www.balena.io/etcher/), [RosaImageWriter](http://wiki.rosalab.ru/en/index.php/ROSA_ImageWriter), [Fedora Media Writer](https://getfedora.org/en/workstation/download/), DD with 4MB block size, or [Rufus](https://rufus.ie) with DD mode.


**Working stuff:**
- Bootup
- SteamOS OOBE (Steam Deck UI First Boot Experience)
- Deck UI (separate session)
- Deck UI (-gamepadui)
- TDP/FPS limiting
- Global FSR
- Shader Pre-Caching
- Switch to Desktop from plasma/to plasma without user interference.
- Valve's exclusive *Vapor* appearance for KDE Plasma
- Steam Deck pacman mirrors
- Cool-looking neofetch?

**Known issues:**
- NVIDIA GPUs are ***NOT*** supported.

> Until they support atomic KMS, accelerated Xwayland, and Vulkan DMA-BUF extensions, they simply cannot function properly with HoloISO.

- Intel GPUs/iGPUs require a Gamescope and MESA downgrade in order to boot into Steam Deck session. 

> Refer to [this gist](https://gist.github.com/drraccoony/8a8d0a9e3dfde9fafd3e374e418d2935) for further guidance.

Installation process:
-
**Prerequistes:**
- 4GB flash drive
- AMD GPU with Vulkan and VDPAU support
- UEFI-enabled device
- Disabled secure boot

**Installation types:**
- barebones 
> An OS-only installation, resembles vanilla Arch Linux installation.
- gameonly*
> Steam Deck UI only (AMD GPU only; no desktop), as said, this doesn't ship any DE, and only has the Steam Deck UI installed. 
> ****This part is currently under a renovation.***
- deckperience
> Full SteamOS 3 experience, Includes proper session switching, KDE Plasma + media apps, and Chromium pre-installed.

**Installation:**
- Flash the ISO from [releases](https://github.com/bhaiest/holoiso/releases/latest) using [BalenaEtcher](https://www.balena.io/etcher/), [Rufus](https://rufus.ie) with DD mode, or by typing `sudo dd if=SteamOS.iso of=/dev/sd(your flash drive) bs=4M status=progress oflag=sync`
- Boot into ISO
- Run `holoinstall`
- Enter drive node, starting from, for example, `sda` or `nvme0n1` when asked
- Take your favourite hot beverage, and wait 'till it installs :3

Upon booting, you'll be greeted with Steam Deck's OOBE screen, from where you'll connect to your network, and login to your Steam account, from there, you can exit to KDE Plasma seamlessly by choosing *Switch to desktop* in the power menu, [like so](https://www.youtube.com/watch?v=smfwna2iHho).

Screenshots:
-
![image](https://user-images.githubusercontent.com/97450182/166166719-f5f6d692-7e15-4e77-8ad3-683b3a88d6c1.png)
![image](https://user-images.githubusercontent.com/97450182/166270906-3868bacb-5cd2-4779-aeb3-4414e92d5f9a.png)
![image](https://user-images.githubusercontent.com/97450182/166271041-05894cc6-e74b-4601-87fa-0d6e6276de86.png)
![image](https://user-images.githubusercontent.com/97450182/166271108-719da5c5-97a8-47e6-b18d-7f8fc29a89d5.png)
![image](https://user-images.githubusercontent.com/97450182/166271203-3d93714a-482e-48b6-91f5-3ca33112fc73.png)

Notes:
-

This configuration includes Valve's pacman.conf repositories, `holoinstall` script and `holoinstall` post-installation binaries.

This configuration builds a *releng-based ISO*, which is the default Arch Linux redistribution flavor.

Building the ISO:
-
Trigger the build by executing:
```
git clone https://github.com/bhaiest/holoiso/
sudo mkarchiso -v holoiso
```
Once it ends, your ISO will be available in the `out` folder.

