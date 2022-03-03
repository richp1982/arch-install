#!/bin/bash



#Script to install arch linux

#Sort mirrors
pacman -S reflector --noconfirm --needed

reflector --country 'United Kingdom',France,Germany --protocol https --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

#essential packages
pacman -Syyu networkmanager sudo wget curl grub efibootmgr dosfstools mtools pciutils usbutils linux-headers rsync unzip openssh --noconfirm --needed

#install microcode uncomment to select
#sudo pacman -S intel-ucode --noconfirm --needed
#sudo pacman -S amd-ucode xf86-video-amdgpu --noconfirm --needed

#Enable network manager
systemctl enable NetworkManager.service

#create files CHOOSE HOST NAME
echo LANG=en_GB.UTF-8 >> /etc/locale.conf
echo KEYMAP=uk >> /etc/vconsole.conf
echo (hostname) >> /etc/hostname

#install grub un-comment and add boot device

#grub-install --target=i386-pc /dev/??

#grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=?????


#make grub config
grub-mkconfig -o /boot/grub/grub.cfg


#Add primary user
useradd -m -G sys,adm,lp,wheel,audio,video,optical,storage,floppy,scanner rich

#Make passwords
passwd
passwd rich

#add directories vm only
# mkdir mkdir -p /data/{users/{rich,edyta,kiwi},shared/{Downloads,Pictures,Videos,DVDs,Audio,Music,Public,Scan,Sunday-School}}

#cd /data/users

#mkdir -p rich/{Desktop,Documents,Templates} edyta/{Desktop,Documents,Templates} kiwi/{Desktop,Documents,Templates}

#install breeze grb theme
cd /a/arch-install
sudo chmod +x grub-theme.sh
sudo ./grub-theme.sh

#install oh my bash


echo 'edit the sudo file'
