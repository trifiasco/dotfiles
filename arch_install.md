# Arch Install

## virtual box set up:
- create a new vbox, name it.
- allocate RAM size.
- create a virtual disk.
- VDI
- dynamically allocate.
- allocate disk size.
- Fix settings:
  - enable efi under system>motherboard.
  - increase number of processor.
  - increase video memory under display>screen.
  - point to the iso under storage.
- Click start.

## Arch installation
### Setting up the networking:
- run `ip addr show` to check if you have internet connection.
- run `ping -c 5 8.8.8.8` to check internet connection.

### Set up the disk: (UEFI without encryption):
- `fdisk -l` to see list of hard disk that are attached to the system.
- `/dev/sda` is the one you are looking for.
- run `fdisk /dev/sda`
  - p to print all partition.
  - g to create a gpt partition table.
  - n to indicate number of partition. allocate 500 for linux filesystem
      partition.
  - t to select partition. and then set the type.
  - do this again without specifying the size to take the remaining disk.
      now the type would be 30(indicating LVM)
  - w to finalize and save the changes
- format the disks:
  - `mkfs.fat -F32 /dev/sda1` - to format the EFI system disk
  - now let's create LVM:
      ```
      1. pvcreate --dataalignment 1m /dev/sda2 # create a physical vol
      2. vgcreate volgroup0 /dev/sda2 # create a volume group
      3. lvcreate -L 15GB volgroup0 -n lv_root # create lv_root for arch
      files
      4. lvcreate -l 100%FREE volgroup0 -n lv_home # create lv_home for
      normal files
      5. activate the volgroup 
        modprobe dm_mod
        vgscan
        vgchange -ay
      6. format the root filesystem
        mkfs.ext4 /dev/volgroup0/lv_root
      7. mount the lv_root
        mount /dev/volgroup0/lv_root /mnt
      8. do 6 and 7 for lv_home but mount that under /mnt/home
      9. mkdir /mnt/etc
      10. genfstab -U -p /mnt >> /mnt/etc/fstab
      11. check if everything is okay with - cat /mnt/etc/fstab
      ```
### Install arch:
```
1.install base packages.
pacstrap -i /mnt base
2. configure installation.
arch-chroot /mnt
3. add kernel
pacman -S linux linux-headers linux-lts linux-lts-headers
4. install vim/nano-
pacman -S nano
5. install base-devel and openssh
pacman -S base-devel openssh
6. enable sshd
systemctl enable sshd
7. install packages required for networking.
pacman -S netowrkmanager wpa_supplicant wireless_tools netctl
8. pacman -S dialog
9. enable NetworkManager
systemctl enable NetworkManager

10. Add lvm support
pacman -S lvm2
11. update config of boot processor
nano /etc/mkinitcpio.conf
-> find the line with hooks, and add lvm2 before filesystem
12. mkinitcpio -p linux/linux-lts


13. edit locale
nano /etc/locale.gen
-> uncomment en_US utf-8
locale-gen
14. set password for root user
passwd

15. Create a new user for yourself.
useradd -m -g users -G wheel <username>
passwd <username>
16. check if sudo package is present, pacman -S sudo or which sudo
17. add sudo priviliges to newly created user.
EDITOR=nano visudo
-> find line `%wheel ALL=(ALL) ALL` and uncomment it.
```

### Install GRUB:
```
1. install grub and packages.
pacman -S grub efibootmgr dosfstools os-prober mtools

2. create boot/EFI directory
mkdir /boot/EFI

3. mount EFI partition.
mount /dev/sda1 /boot/EFI

4. install grub on the master boot record.
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

5. create the locale directory if not exists.
ls -l /boot/grub

6. copy messages locale
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

7. make grub configuration file
grub-mkconfig -o /boot/grub/grub.cfg

8. exit
9. umount -a
10. reboot
```

### Post install tweaks:
```
1. activate swap
-> log in as root by `su`
cd /root
dd if=/dev/zero of=/swapfile bs=1M count=2048 status=progress
-> change the permission of swapfile.
chmod 600 /swapfile
mkswap /swapfile

2. create a backup copy of fstab file
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab

-> check cat /etc/fstab
mount -a
swapon -a

3. set time and timezone
timedatectl list-timezones
timedatectl set-timezone Asia/Dhaka

systemctl enable systemd-timesyncd

4. Setting the hostname of system.
hostnamectl set-hostname <name>
-> check with cat /etc/hostname

5. set up localhosts nano /etc/hosts >> 127.0.0.1 localhost && 127.0.0.1
   archbox
6. pacman -S  amd-ucode

7. For GUI
pacman -S xorg-server

8. display manager
pacman -S virtualbox-guest-utils xf86-video-vmware
-> if not vbox, then mesa or nvidia(nvidia-lts)
systemctl enable vboxservice

```

### GNOME

```
1. pacman -S gnome
2. pacman -S gnome-tweaks

3. systemctl enable gdm
```
