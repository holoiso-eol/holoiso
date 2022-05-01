# HoloISO
SteamOS 3 (Holo) archiso configuration.

***Yes, Gabe. SteamOS functions well on a toaster.***

This project attempts to bring Steam Deck's Holo OS into a generic, installable format!

![image](https://user-images.githubusercontent.com/97450182/166166719-f5f6d692-7e15-4e77-8ad3-683b3a88d6c1.png)

This configuration includes Valve's pacman.conf repositories, `holoinstall` script and `holoinstall` post-installation binaries.
This configuration builds `releng`-based ISO, which is default Arch Linux redistribution flavor.

To install SteamOS, boot into ISO, run `holoinstall` and follow on-screen guide

To build:

Make sure you are running this on Steam Deck/winesapOS/pacstrapped SteamOS3. If not, copy `airootfs/etc/pacman.d/mirrorlist` to your Arch's installation

Make sure you have `python` and `archiso` installed

Trigger build by:
```
git clone https://github.com/bhaiest/holoiso/
sudo mkarchiso -v holoiso
```
Once it ends, your ISO will be available in `out` folder
