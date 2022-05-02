# HoloISO
SteamOS 3 (Holo) archiso configuration.

***Yes, Gabe. SteamOS functions well on a toaster.***

This project attempts to bring Steam Deck's Holo OS into a generic, installable format and replicate close-to-official SteamOS experience.

Upon booting, you'll be greeted with Steam Deck's OOBE screen, from where you'll connect to your network and login to Steam account, from there, you can exit to SDDM login screen by choosing `Switch to desktop` in power menu.

Q1:
- ***Is this official?***
- The code, and packages are straight from Valve with zero possible edits. And ISO is being built on official Steam Deck recovery image running inside QEMU instance.
 
Q2:
- ***The ISO didn't boot for me, any solution?***
- Currently, ISO only boots, only if flashing using BalenaEtcher, RosaImageWriter, Fedora Media Writer and DD with 4MB block size
  
Installation process:
-
Prerequistes:
- 4GB flash drive
- AMD GPU with Vulkan and VDPAU support
- UEFI-enabled device
- Disabled secure boot

Installation:
- Flash the ISO from `releases` tab using balenaEtcher or by typing `sudo dd if=SteamOS.iso of=/dev/sd(your flash drive) bs=4M status=progress oflag=sync`
- Boot into ISO
- Run `holoinstall`
- Enter drive node, starting from `for ex. sda or nvme0n1` when asked
- Take your favourite hot beverage, and wait till it installs :)

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

This configuration builds `releng`-based ISO, which is default Arch Linux redistribution flavor.

Building the  ISO:
-
Make sure you are running this on Steam Deck/winesapOS/pacstrapped SteamOS3. If not, copy `airootfs/etc/pacman.d/mirrorlist` to your Arch's installation

Make sure you have `python` and `archiso` installed

Trigger build by:
```
git clone https://github.com/bhaiest/holoiso/
sudo mkarchiso -v holoiso
```
Once it ends, your ISO will be available in `out` folder

