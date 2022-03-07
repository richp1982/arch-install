#!/bin/sh

cd /a/arch-install
cp -r breeze /usr/share/grub/themes/
sed -i 's|#GRUB_THEME=.*|GRUB_THEME="/usr/share/grub/themes/breeze/theme.txt"|' /etc/default/grub
sed -i 's|.*GRUB_GFXMODE=.*|GRUB_GFXMODE=1366x768|' /etc/default/grub
sed -i 's|#GRUB_DISABLE_OS_PROBER=false|GRUB_DISABLE_OS_PROBER=false|'  /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
