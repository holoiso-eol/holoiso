[![Build ISO](https://github.com/theVakhovskeIsTaken/holoiso/actions/workflows/build.yml/badge.svg)](https://github.com/theVakhovskeIsTaken/holoiso/actions/workflows/build.yml)

![image](https://user-images.githubusercontent.com/97450182/167457908-07be1a60-7e86-4bef-b7f0-6bd19efd8b24.png)
# HoloISO
SteamOS 3 (Holo) archiso configuration.

***Yes, Gabe. SteamOS functions well on a toaster.***

This project attempts to bring the Steam Deck's SteamOS Holo into a generic, installable format, and provide a close-to-official SteamOS experience.
Main point of this project focuses in re-implementing proprietary (as in runs-only-on-deck) components that Steam client, OS itself, gamescope and user-created applications for Deck rely on.

Click [here](https://t.me/HoloISO) to join **HoloISO** Telegram update channel;

Click [here](https://steamdeck.community/forums/holoiso.29/) to visit **HoloISO** discussion on Steam Deck Community forums

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
- TDP/FPS limiting*
- Global FSR
- Shader Pre-Caching
- Switch to Desktop from plasma/to plasma without user interference.
- Valve's exclusive *Vapor* appearance for KDE Plasma
- Steam Deck pacman mirrors
- Cool-looking neofetch?
- System updates

*TDP and GPU clock limiting doesn't function on APU devices, and is partly broken on dGPUs due to Deck-specific powerlimit node `/sys/class/hwmon/hwmon*/power*_cap`.

**Known issues:**
- NVIDIA GPUs are supported after following this procedure:

> Only 10xx+ GPUs are FULLY supported. Although 9xx support exists in drivers, gamescope doesn't launch on it. Choose your GPU type while installing HoloISO. If you encounter any issues, reboot to recovery mode, type `recoveryinit`, connect to network using `nmtui` and install required packages.

> Older GPUs won't be supported until drivers are opensourced OR Until they support atomic KMS, accelerated Xwayland, and Vulkan DMA-BUF extensions, they simply cannot function properly with HoloISO.

- Intel GPUs/iGPUs require a Gamescope downgrade in order to boot into Steam Deck session. 

> Choose your GPU type while installing HoloISO. If you encounter any issues, reboot to recovery mode, type `recoveryinit`, connect to network using `nmtui` and install required packages.

Installation process:
-
**Prerequistes:**
- 4GB flash drive
- AMD RX Vega+/APU iGPU; 4xx/5xx, 5xxx/6xxx GPU
or Intel UHD 630+ iGPU or NVIDIA GTX 9xx+ iGPU/GPUs (preferably without Optimus [PRIME])
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
- Flash the ISO from [releases](https://github.com/bhaiest/holoiso/releases/latest) or [actions](https://nightly.link/theVakhovskeIsTaken/holoiso/workflows/build/3.0/holoiso) for NVIDIA GPUs using [BalenaEtcher](https://www.balena.io/etcher/), [Rufus](https://rufus.ie) with DD mode, or by typing `sudo dd if=SteamOS.iso of=/dev/sd(your flash drive) bs=4M status=progress oflag=sync`
- Boot into ISO
- Run `holoinstall`
- Enter drive node, starting from, for example, `sda` or `nvme0n1` when asked
- Take your favourite hot beverage, and wait 'till it installs :3

Upon booting, you'll be greeted with Steam Deck's OOBE screen, from where you'll connect to your network, and login to your Steam account, from there, you can exit to KDE Plasma seamlessly by choosing *Switch to desktop* in the power menu, [like so](https://www.youtube.com/watch?v=smfwna2iHho).

Screenshots:
-
![Screenshot_20220508_133916](https://user-images.githubusercontent.com/97450182/167292656-1679e007-4701-4a3c-89ee-2104b5eb12cd.png)
![Screenshot_20220508_133737](https://user-images.githubusercontent.com/97450182/167292672-8bc9032d-4a21-4528-ab7e-b9dbc25a0664.png)
![Screenshot_20220508_133746](https://user-images.githubusercontent.com/97450182/167292722-a68806c1-5768-4790-a8e7-108d7c72bb08.png)
![Screenshot_20220508_133822](https://user-images.githubusercontent.com/97450182/167292731-86fed590-0260-4c5e-ac13-05d284b5fd24.png)
![Screenshot_20220508_134038](https://user-images.githubusercontent.com/97450182/167292734-90036b5f-2571-438e-8951-8d731cd4ae93.png)
![Screenshot_20220508_134051](https://user-images.githubusercontent.com/97450182/167292738-a70d266f-814d-4352-8d38-b920ae3f3381.png)


Notes:
-

This configuration includes Valve's pacman.conf repositories, `holoinstall` script and `holoinstall` post-installation binaries.

This configuration builds a *releng-based ISO*, which is the default Arch Linux redistribution flavor.

Building the ISO:
-
Trigger the build by executing:
```
pacman -Sy archiso
git clone https://github.com/bhaiest/holoiso/
sudo mkarchiso -v holoiso
```
Once it ends, your ISO will be available in the `out` folder.

Building the ISO using Docker:
```
# /path/to/some/dir can be any directory
docker run -it -v /path/to/some/dir:/holo --cap-add ALL --privileged archlinux
pacman -Sy archiso git
git clone https://github.com/bhaiest/holoiso/
mkarchiso -o /holo -v holoiso
```
After the build completes your ISO will be available in the `/path/to/some/dir` 