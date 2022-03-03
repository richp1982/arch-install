#!/bin/sh

cd /a
git clone https://github.com/gustawho/grub2-theme-breeze.git
cd grub2-theme-breeze
sudo cp -r breeze /usr/share/grub/themes/
sudo sed -i 's|#GRUB_THEME=.*|GRUB_THEME="/usr/share/grub/themes/breeze/theme.txt"|' /etc/default/grub
sudo sed -i 's|.*GRUB_GFXMODE=.*|GRUB_GFXMODE=1366x768|' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
