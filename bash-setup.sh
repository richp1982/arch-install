#!/bin/sh

cd /a
git clone https://github.com/ohmybash/oh-my-bash.git /home/rich/.oh-my-bash
git clone https://github.com/richp1982/dot-files-arch.git
cp /a/dot-files-arch/bashrc /home/rich/.bashrc
chown rich:rich /home/rich/.bashrc
chown -R rich:rich /home/rich/.oh-my-bash
