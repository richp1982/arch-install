#!/bin/sh

cd /a
git clone https://github.com/gustawho/grub2-theme-breeze.git
cd grub2-theme-breeze
cp -r breeze /usr/share/grub/themes/
sed -i 's|#GRUB_THEME=.*|GRUB_THEME="/usr/share/grub/themes/breeze/theme.txt"|' /etc/default/grub
sed -i 's|.*GRUB_GFXMODE=.*|GRUB_GFXMODE=1366x768|' /etc/default/grub
echo GRUB_DISABLE_OS_PROBER=false >> /etc/defalt/grub
grub-mkconfig -o /boot/grub/grub.cfg
