Gentoo

```
(/) Wiki
```
# Quick Installation Checklist

From Gentoo Wiki
This article has been created for experienced users who desire a quick, less detailed installation
guide. It doubles as a checklist so essential installation steps are not forgotten.

```
 Warning
This document is intended for experienced users only. It is not a replacement for the
Gentoo Handbook (/wiki/Handbook:Main_Page) and will not help you install Gentoo
any faster.
Do not expect to receive any kind of support when following this checklist. Installing
according to the Handbook (/wiki/Handbook:Main_Page) is fully supported however.
```
## Contents

```
1 Format drive
1.1BIOS/MBR
1.2BIOS/GPT
1.3UEFI/GPT
2 Mount partitions
2.1BIOS/MBR
2.2BIOS/GPT
2.3UEFI/GPT
3 Stage
4 Chroot
5 Portage
6 User accounts
7 Configure system
7.1Install vi (optional)
7.2/etc/fstab
7.3/etc/portage/make.conf
7.4Locale
7.5Hostname
7.6Keymap
7.7Clock
7.8Timezone
8 Kernel
8.1Emerge
8.2Configure
8.2.1Manual
8.2.2Automatic
```

```
8.3Install
9 Bootloader
10 Network tools
11 Clean up
12 See also
```
## Format drive

### BIOS/MBR

Create three partitions. 128MB for /boot, 1024MB for swap, and the rest for /

**root #** cfdisk /dev/sda
Format the partitions:

```
root # mkfs.ext4 /dev/sda
root # mkfs.ext4 /dev/sda
root # mkswap /dev/sda2 && swapon /dev/sda
```
### BIOS/GPT

Create four partitions. 128MB for /boot, 2MB for BIOS Boot, 1024MB swap and the rest goes
to /

```
root # gdisk /dev/sda
```

```
Create GPT partition table:
Command: o ↵
This option deletes all partitions and creates a new protective MBR.
Proceed? (Y/N): y ↵
```
```
Create Partition 1 (/boot):
Command: n ↵
Partition Number: 1 ↵
First sector: ↵
Last sector: +128M ↵
Hex Code: ↵
```
```
Create Partition 2 (BIOS boot):
Command: n ↵
Partition Number: 2 ↵
First sector: ↵
Last sector: +2M ↵
Hex Code: EF02 ↵
```
```
Create Partition 3 (swap):
Command: n ↵
Partition Number: 3 ↵
First sector: ↵
Last sector: +1024MB ↵
Hex Code: 8200 ↵
```
```
Create Partition 4 (/):
Command: n ↵
Partition Number: 4 ↵
First sector: ↵
Last sector: ↵ (for rest of disk)
Hex Code: ↵
```
```
Write Partition Table To Disk:
Command: w ↵
Do you want to proceed? (Y/N): Y ↵
```
Format the partitions:

```
root # mkfs.ext4 /dev/sda
root # mkfs.ext4 /dev/sda
root # mkswap /dev/sda3 && swapon /dev/sda
```
### UEFI/GPT

Create four partitions. 128MB for /boot, 32MB for UEFI ESP, 1024MB swap and the rest goes
to /

```
root # gdisk /dev/sda
```

```
Create GPT partition table:
Command: o ↵
This option deletes all partitions and creates a new protective MBR.
Proceed? (Y/N): y ↵
```
```
Create Partition 1 (/boot):
Command: n ↵
Partition Number: 1 ↵
First sector: ↵
Last sector: +128M ↵
Hex Code: ↵
```
```
Create Partition 2 (UEFI ESP):
Command: n ↵
Partition Number: 2 ↵
First sector: ↵
Last sector: +32M ↵
Hex Code: EF00 ↵
```
```
Create Partition 3 (swap):
Command: n ↵
Partition Number: 3 ↵
First sector: ↵
Last sector: +1024MB ↵
Hex Code: 8200 ↵
```
```
Create Partition 4 (/):
Command: n ↵
Partition Number: 4 ↵
First sector: ↵
Last sector: ↵ (for rest of disk)
Hex Code: ↵
```
```
Write Partition Table To Disk:
Command: w ↵
Do you want to proceed? (Y/N): Y ↵
```
Format the partitions:

```
root # mkfs.ext4 /dev/sda
root # mkfs.ext4 /dev/sda
root # mkswap /dev/sda3 && swapon /dev/sda
root # mkfs.vfat -F 32 /dev/sda
```
## Mount partitions

### BIOS/MBR

```
root # mkdir -p /mnt/gentoo
```

```
root # mount /dev/sda3 /mnt/gentoo
root # mkdir /mnt/gentoo/boot
root # mount /dev/sda1 /mnt/gentoo/boot
```
### BIOS/GPT

```
root # mkdir -p /mnt/gentoo
root # mount /dev/sda4 /mnt/gentoo
root # mkdir /mnt/gentoo/boot
root # mount /dev/sda1 /mnt/gentoo/boot
```
### UEFI/GPT

```
root # mkdir -p /mnt/gentoo
root # mount /dev/sda4 /mnt/gentoo
root # mkdir /mnt/gentoo/boot
root # mount /dev/sda1 /mnt/gentoo/boot
root # mkdir /mnt/gentoo/boot/efi
root # mount /dev/sda2 /mnt/gentoo/boot/efi
```
## Stage

Find nearest mirror from this list (https://www.gentoo.org/downloads/mirrors/).

Navigate to the /mnt/gentoo directory:

**root #** cd /mnt/gentoo
Download the stage3 tarball (/wiki/Stage_tarball). Be sure to replace the keyword ( **amd64** in the
example below) with the correct architecture:

**root #** wget 
http://ftp.jaist.ac.jp/pub/Linux/Gentoo/releases/amd64/autobuilds/current-stage3-amd64/stage3-amd64-20190818T214502Z.tar.xz

Unpack the stage3 file:

```
root # tar xjpf stage3*
```
## Chroot

Chroot into the extracted stage3:

```
root # cd /mnt/gentoo
root # mount -t proc none proc
root # mount --rbind /sys sys
root # mount --make-rslave sys
root # mount --rbind /dev dev
root # mount --make-rslave dev
root # cp /etc/resolv.conf etc
root # chroot. /bin/bash
root # source /etc/profile
```

## Portage

Sync the Gentoo repository:

```
root # emerge-webrsync
```
## User accounts

Change the root password:

**root #** passwd
Create user(s):

```
root # useradd -g users -G wheel,portage,audio,video,usb,cdrom -m username
root # passwd username
Note
Spaces are not allowed between groups.
```
## Configure system

### Install vi (optional)

```
Note
vi installation is optional, you can use nano as it is a default editor in stage3.
```
```
root # emerge -vq vim
```
### /etc/fstab

Configure /etc/fstab to match the actual partitioning performed in the step above:

```
FILE /etc/fstab
/dev/sda1 /boot vfat noauto,noatime 1 2
/dev/sda3 / ext4 noatime 0 1
/dev/sda2 none swap sw 0 0
/dev/cdrom /mnt/cdrom auto noauto,ro 0 0
```
### /etc/portage/make.conf

Set preferred Portage options:

FILE **/etc/portage/make.conf (/wiki//etc/portage/make.conf)** A x86_64 make.conf
example

##### 

##### 


```
CFLAGS="-march=native -O2 -pipe"
CXXFLAGS="${CFLAGS}"
# Do NOT change CHOST setting
CHOST="x86_64-pc-linux-gnu"
```
```
# Choose desired USE flags
USE="alsa usb"
```
```
PORTDIR="/var/db/repos/gentoo"
DISTDIR="/var/cache/distfiles"
PKGDIR="/var/cache/packages"
```
### Locale

Set system locale (/wiki/Localization/Guide#Setting_a_locale):

```
FILE /etc/env.d/02locale Example locale configuration
LANG="en_US.UTF-8"
LC_COLLATE="C"
```
### Hostname

Edit /etc/conf.d/hostname

```
FILE /etc/conf.d/net Example FQDN configuration
```
```
dns_domain_lo="mynetwork.net"
```
### Keymap

Edit /etc/conf.d/keymaps

### Clock

Edit /etc/conf.d/hwclock

### Timezone

Set the appropriate timezone:

```
root # ln -sf /usr/share/zoneinfo/Europe/Helsinki /etc/localtime
```
## Kernel

### Emerge

The sys-kernel/gentoo-sources (https://packages.gentoo.org/packages/sys-kernel/gentoo-sourc
es) package is the vanilla kernel with the Gentoo patchset applied. Choose between kernel
sources. The sys-kernel/linux-firmware (https://packages.gentoo.org/packages/sys-kernel/linux
-firmware) package contains binary blobs needed for some hardware (WLAN cards).


If sys-kernel/gentoo-sources (https://packages.gentoo.org/packages/sys-kernel/gentoo-source
s) has been selected:

```
root # emerge -av sys-kernel/gentoo-sources sys-kernel/linux-firmware
root # cd /usr/src/linux
```
### Configure

#### Manual

Install pciutils

**root #** emerge -av pciutils
Discover which modules are required for the system's hardware:

**root #** lspci -nnk
Shorter version:

**root #** lspci -nnk | grep "Kernel driver in use:"
Configure kernel by enabling each necessary module in the menuconfig interface. Search for
specific module names by pressing / in menuconfig. Navigate to the associated feature by
pressing the corresponding number listed on the left of the search results.

**root #** make menuconfig
Once finished build kernel and modules:

```
root # make -j
```
#### Automatic

If things are working nicely in the current install environment, it is possible to use
localyesconfig to select all modules currently loaded by the LiveCD:
**root #** make localyesconfig
Build the kernel and modules:

```
root # make -j
```
### Install

Install the kernel and modules:

```
root # make modules_install
root # make install
```
## Bootloader

Specify the correct setting for the system's firmware. BIOS/MBR is pc, 64-bit UEFI is efi-64,
32-bit UEFI is efi-32:

```
Note
32-bit UEFI is rare to find on PCs. Mostly older Apple hardware use this. It has nothing to
do with the Gentoo architecture chosen.
```
```
FILE /etc/portage/make.conf (/wiki//etc/portage/make.conf) PC BIOS settings for
```
##### 


##### GRUB

```
GRUB_PLATFORMS="pc"
```
FILE **/etc/portage/make.conf (/wiki//etc/portage/make.conf)** 64-bit UEFI settings for
GRUB

```
GRUB_PLATFORMS="efi-64"
```
Emerge GRUB2:

```
root # emerge --ask sys-boot/grub
Supposing the system has PC BIOS:
```
```
root # grub-install /dev/sda
Supposing the system has UEFI firmware and the EFI partition is mounted in the
/boot/efi directory:
```
```
root # grub-install --target=x86_64-efi --efi-directory=/boot/efi
Edit GRUB2's configuration file:
```
**root #** nano /boot/grub/grub.cfg
Below is a simple GRUB2 (/wiki/GRUB2) configuration file:

```
FILE /boot/grub/grub.cfg Example manual config
set default=
set timeout=
```
```
menuentry "Gentoo" {
linux (hd0,1)/vmlinuz-3.14.4-gentoo root=/dev/sda3 rootfstype=ext4 net.ifnames=0 quiet ro
}
```
Alternatively use the grub-mkconfig command to generate the configuration file::

```
root # grub-mkconfig -o /boot/grub/grub.cfg
Found vmlinuz-3.14.4-gentoo
```
## Network tools

Install tools needed for configuring the network interfaces:

**root #** emerge --ask sys-apps/iproute2 net-misc/dhcpcd net-wireless/wireless-
tools net-wireless/iw net-wireless/wpa_supplicant

## Clean up

Exit chroot, unmount partitions, and reboot:

```
root # exit
root # cd /mnt
root # umount -R gentoo
```

```
root # reboot
```
## See also

```
Gentoo Handbook (/wiki/Handbook:Main_Page)
```
Retrieved from "https://wiki.gentoo.org/index.php?title=Quick_Installation_Checklist&
oldid=806906 (https://wiki.gentoo.org/index.php?title=Quick_Installation_Checklist&
oldid=806906)"

```
This page was last edited on 5 June 2019, at 18:10.
Privacy policy (/wiki/Gentoo_Wiki:Privacy_policy)
About Gentoo Wiki (/wiki/Gentoo_Wiki:About)
Disclaimers (/wiki/Gentoo_Wiki:General_disclaimer)
```
```
© 2001–2019 Gentoo Foundation, Inc.
Gentoo is a trademark of the Gentoo Foundation, Inc. The contents of this document,
unless otherwise expressly stated, are licensed under the CC-BY-SA-3.
(https://creativecommons.org/licenses/by-sa/3.0/) license. The Gentoo Name and Logo
Usage Guidelines (https://www.gentoo.org/inside-gentoo/foundation/name-logo-
guidelines.html) apply.
```

