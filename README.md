# My-Arch-Install

```shell
loadkeys jp106

# Change to Arch Linux mirrors and update pacman if needed
curl -o /etc/pacman.d/mirrorlist https://archlinux.org/mirrorlist/all/
curl -o /etc/pacman.d/mirrorlist https://archlinux.org/mirrorlist/?country=JP&protocol=https&ip_version=4
pacman -Syy
pacman -Sy arch-install-scripts

# Check what disk to install to and make partitions
lsblk
cfdisk /dev/<target_disk>
#p1: +512M mkfs.fat -F32
#p2: mkfs.ext4

# Mount partitions
mount /dev/p2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/p1 /mnt/boot/efi

# Install minimal packages
pacstrap /mnt base base-devel linux linux-lts linux-firmware networkmanager grub efibootmgr sudo vim iw iwd dialog wpa_supplicant wireless_tools netctl
genfstab -U /mnt >> /mnt/etc/fstab

# chroot into arch
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
hwclock --systohc
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "archlinuxbtw" > /etc/hostname
passwd

locale-gen

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ARCH
grub-mkconfig -o /boot/grub/grub.cfg

exit
umount -R /mnt
reboot
```
