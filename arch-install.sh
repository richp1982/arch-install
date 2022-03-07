#!/bin/bash



#Script to install arch linux

#Sort mirrors
pacman -S reflector --noconfirm --needed

reflector --country 'United Kingdom',France,Germany --protocol https --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

#essential packages
pacman -Syyu networkmanager sudo wget os-prober curl grub efibootmgr dosfstools mtools pciutils usbutils linux-headers rsync unzip openssh htop --noconfirm --needed

#install microcode uncomment to select
#sudo pacman -S intel-ucode --noconfirm --needed
#sudo pacman -S amd-ucode xf86-video-amdgpu --noconfirm --needed

#Enable network manager
systemctl enable NetworkManager.service

#set local time (edit for other local times)
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

#create locales
sed -i 's|#en_GB.UTF|en_GB.UTF|' /etc/locale.gen
locale-gen

#create files CHOOSE HOST NAME and keyboard layout
echo LANG=en_GB.UTF-8 >> /etc/locale.conf
echo KEYMAP=?? >> /etc/vconsole.conf
echo (hostname) >> /etc/hostname

#change swappiness
echo vm.swappiness=5 >> /etc/sysctl.d/99-swappiness.conf

#install grub un-comment and add boot device

#grub-install --target=i386-pc /dev/??

#grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Arch-KDE


#make grub config
grub-mkconfig -o /boot/grub/grub.cfg


#Add primary user
useradd -m -G sys,adm,lp,wheel,audio,video,optical,storage,floppy,scanner rich

#Make passwords
echo 'set password for rich'
passwd
passwd rich

#add directories vm only
# mkdir mkdir -p /data/{users/{rich,edyta,kiwi},shared/{Downloads,Pictures,Videos,DVDs,Audio,Music,Public,Scan,Sunday-School}}

#cd /data/users

#mkdir -p rich/{Desktop,Documents,Templates} edyta/{Desktop,Documents,Templates} kiwi/{Desktop,Documents,Templates}

#install breeze grb theme
cd /a/arch-install
chmod +x grub-theme.sh
./grub-theme.sh

#install oh my bash
cd /a/arch-install
chmod +x bash-setup.sh
./bash-setup.sh

#edit sudo file
EDITOR=nano visudo

#Install KDE
chown -R rich:rich /a
su rich
cd /a
git clone https://github.com/richp1982/kde-setup.gti
cd kde-setup
chown +x install-plasma.sh
echo 'check install script and comment out unecessary operations'
echo ./kde-setup.sh to run script (DO NOT RUN AS SUPERUSER)
