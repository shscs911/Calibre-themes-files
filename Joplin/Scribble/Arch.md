Arch

> https://wiki.archlinux.org/index.php/Installation_guide
https://www.addictivetips.com/ubuntu-linux-tips/how-to-install-arch-linux/
https://docs.google.com/document/d/1kWQRBDL_N0CImPV5t0W2xj7bsAFcZOLmRsf-kX-eR9M/edit#

`mount -o remount,size=3G /run/archiso/cowspace`

`cfdisk`

`Disktype: DOS`

`/dev/sda1   bootable   32G Linux 83`

^ `/dev/sda2 1G Linux Swap`
 
`mkfs.ext4 /dev/sda1`

^ `mkswap /dev/sda2`

^ `swapon /dev/sda2`

`mount /dev/sda1 /mnt`

`nano /etc/pacman.conf`

```
Uncomment `Color` `TotalDownload` ` CheckSpace` `VerbosePkgLists` `multilib`
```

`sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup`

```
## India
Server = https://ind.mirror.pkgbuild.com/$repo/os/$arch
## Japan
Server = https://mirrors.cat.net/archlinux/$repo/os/$arch
## Germany
Server = http://mirror.23media.com/archlinux/$repo/os/$arch
```

`pacstrap -i /mnt base base-devel linux linux-firmware linux-headers dhcpcd wget man-db man-pages nano texinfo networkmanager`

`genfstab -U /mnt > /mnt/etc/fstab`

`arch-chroot /mnt`

``` 
nano /etc/locale.gen

Uncomment en_US.UTF-8 
```

`locale-gen`

`echo LANG=en_US.UTF-8 > /etc/locale.conf`

`export LANG=en_US.UTF-8 `

`pacman -S grub`

`grub-install -v /dev/sda`

`grub-mkconfig -o /boot/grub/grub.cfg`

`pacman -S sudo`

`EDITOR=nano visudo`

```
Uncomment `%wheel ALL=(ALL) ALL`
```

`useradd -m  shscs911`

`usermod -aG wheel shscs911`

`passwd shscs911`

`passwd`

`systemctl enable NetworkManager`

```
exit chroot and reboot
```

```
Login as shscs911
```
```
Uncomment `Color` `TotalDownload` ` CheckSpace` `VerbosePkgLists` `multilib` in /etc/pacman.conf
```

`sudo pacman -Sy`

`sudo pacman -S xorg-server xorg-xinit xf86-video-intel xf86-input-synaptics intel-ucode pulseaudio pulseaudio-alsa`

`sudo pacman -S plasma-desktop dolphin dolphin-plugins ffmpegthumbs kwrite ark konsole gwenview spectacle kscreen sddm sddm-kcm kde-gtk-config powerdevil user-manager network-manager-applet plasma-nm plasma-pa`

`sudo pacman -S pacman-contrib unarchiver git leafpad timeshift firefox-developer-edition ttf-dejavu ttf-liberation libappindicator-sharp libappindicator-gtk3`

`sudo systemctl enable sddm` 

```
Reboot
```
```
Create backup with timeshift
```

`sudo pacman -S xf86-video-nouveau nvidia-390xx nvidia-390xx-utils lib32-nvidia-390xx-utils`

* * *

- Window resolution autofit problems
```
"Autofit" means that when the VMWare window's size is adjusted in the host, ArchLinux in the guest should automatically follow and readjust its resolution to fit the new size of the host window. 
Potential solution 2

For some reason, autofit requires the packages gtkmm and gtk2, so ensure they are installed. If X windows is not installed or a non–GTK-based desktop environment (such as KDE) is being used, the might have to be installed independently.
Potential solution 3

The relevant modules may have to be added to mkinitcpio.conf:

/etc/mkinitcpio.conf

MODULES=(vsock vmw_vsock_vmci_transport vmw_balloon vmw_vmci vmwgfx)

mkinitcpio -p linux

Potential solution 4

Install all packages having `vmware` in their title

Enable vmtoolsd.service.

If this doesn't work, ensure the vmtoolsd.service is restarted. 

````

 