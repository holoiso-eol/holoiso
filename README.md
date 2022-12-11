[![Build ISO](https://github.com/theVakhovskeIsTaken/holoiso/actions/workflows/build.yml/badge.svg)](https://github.com/theVakhovskeIsTaken/holoiso/actions/workflows/build.yml)

![image](https://user-images.githubusercontent.com/97450182/167457908-07be1a60-7e86-4bef-b7f0-6bd19efd8b24.png)
# HoloISO
SteamOS 3 (Holo) archiso configuration.

***Yes, Gabe. SteamOS functions well on a toaster.***

This project attempts to bring the Steam Deck's SteamOS Holo redistribution into a generic, installable format, and provide a close-to-official SteamOS experience.
Main point of this project focuses in re-implementing proprietary (as in runs-only-on-deck) components that Steam client, OS itself, gamescope and user-created applications for Deck rely on and making me learn Linux in a fun and unique way.

Click [here](https://t.me/HoloISO) to join **HoloISO** Telegram update channel;

Click [here](https://steamdeck.community/forums/holoiso.29/) to visit **HoloISO** discussion on Steam Deck Community forums

**Common Questions**

- Is this official?
> No, but it may as well be 99% of the way there. The code and packages, are straight from Valve, with zero possible edits, and the ISO is being built same rootfs bootstrap as all HoloISO installations run
- I have an NVIDIA G-
> No. Not even questionable. If you have an NVIDIA GPU, You're on your own. Latest Valve updates for Steam client including normal and Jupiter bootstraps have broken gamepadui on NVIDIA GPUs, and if so, no support will be provided for you.


**Working stuff:**
- Bootup
- SteamOS OOBE (Steam Deck UI First Boot Experience)
- Deck UI (separate session)
- Deck UI (-gamepadui)
- ~~TDP/FPS limiting~~ (*0)
- Global FSR
- Shader Pre-Caching
- Switch to Desktop from plasma/to plasma without user interference.
- Valve's exclusive *Vapor* appearance for KDE Plasma
- Steam Deck pacman mirrors
- Cool-looking neofetch?
- System updates

**Working stuff on Steam Deck compared to other distributions:**
- Dock Firmware updater (additionally installable in desktop by running sudo pacman -S jupiter-dock-updater-bin)
- Steam Deck BIOS, Controller firmware, OS firmware updater
- New fan curve control
- TDP/Clock control

(*0) Disabled for ALL systems except for Steam Deck (Valve Jupiter 1) due to VERY LOW hardcoded TDP/Clock values, especially for dGPUs.

Installation process:
-
**Prerequistes:**
- 4GB flash drive
- More than 8 GB RAM if you plan to use "Copy-To-RAM" option to install
- AMD GPU that supports RADV Drivers instead of Radeon (Southern Islands and Sea Islands require additional kernel cmdline property); Intel iGPU all the way up to 11th gen Iris Xe (Arc GPUs are not supported at this moment)
- UEFI-enabled device
- Disabled secure boot

**Installation:**
- Flash the ISO from [releases](https://github.com/bhaiest/holoiso/releases/latest) or [actions](https://nightly.link/theVakhovskeIsTaken/holoiso/workflows/build/stable/holoiso) for NVIDIA GPUs using [BalenaEtcher](https://www.balena.io/etcher/), [Rufus](https://rufus.ie) with DD mode, or by typing `sudo dd if=SteamOS.iso of=/dev/sd(your flash drive) bs=4M status=progress oflag=sync`, or by simply throwing ISO into Ventoy drive
- Boot into ISO
- Click on "Install SteamOS on this device"
- Follow on-screen instructions
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

Credits:
-
(Too much people xD, to be filled later!!!)

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
mv holoiso/mkarchiso-holoiso /usr/bin
chmod +x /usr/bin/mkarchiso-holoiso
sudo mkarchiso-holoiso -v holoiso
```
Once it ends, your ISO will be available in the `out` folder.

