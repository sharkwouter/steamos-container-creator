#!/bin/bash

# Setup the repo
dpkg --add-architecture i386
sed -i 's/$/ contrib non-free/' /etc/apt/sources.list
apt-get update

# Locale:
apt-get install locales -y
sed -i 's/#\( en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

# Keyboard layout
echo "KEYMAP=us" > /etc/vconsole.conf
#apt-get install keyboard-configuration ?

# Install the base system
tasksel install desktop gnome-desktop

# Install additional packages, like SteamOS does during installation as well
#apt-get install libc6:i386 libgl1-mesa-dri:i386 

# Need to add the steam repo and the non-free and contrib parts of the brewmaster repo entry
# Does steamos even use the steam repo? It is included

# This comes after?

#apt-get install libc6:i386 libgl1-mesa-dri:i386 steamos-modeswitch-inhibitor:i386 steam:i386 nvidia-vdpau-driver:i386 libtxc-dxtn-s2tc0:i386 steamos-packages:i386 steamos-packages:amd64 libnvidia-encode1:amd64 steamos-modeswitch-inhibitor:amd64 steamos-autoupdate

# TODO: Create accounts?
