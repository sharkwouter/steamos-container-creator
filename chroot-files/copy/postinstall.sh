#!/bin/bash

# This may or may not help
export DEBIAN_FRONTEND=noninteractive

# Setup the repo
dpkg --add-architecture i386
sed -i 's/$/ contrib non-free/' /etc/apt/sources.list
apt-get update

# Locale:
apt-get install -y locales
sed -i 's/#\( en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

# Keyboard layout
echo "KEYMAP=us" > /etc/vconsole.conf
#apt-get install keyboard-configuration ?

# Install the base system
# Tasksel:
apt-get install -y task-desktop task-gnome-desktop
# Base include:
apt-get install -y actkbd broadcom-sta-dkms curl dkms firmware-adi firmware-atheros firmware-bnx2 firmware-bnx2x firmware-brcm80211 firmware-intelwimax firmware-iwlwifi firmware-libertas firmware-linux firmware-linux-free firmware-linux-nonfree firmware-ralink firmware-realtek i965-va-driver libtxc-dxtn-s2tc0 lightdm linux-headers-amd64 linux-image-amd64 network-manager plymouth plymouth-themes plymouth-themes-steamos steamos-base-files steamos-compositor steamos-modeswitch-inhibitor sudo unattended-upgrades valve-archive-keyring valve-wallpapers
# Additional package which are installed in SteamOS for some reason
apt-get install -y acpid bzip2 console-setup grub-pc installation-report libdiscover2 libclass-isa-perl

# Install additional packages from the default.preseed
apt-get install -y libc6:i386 libgl1-mesa-dri:i386 steamos-modeswitch-inhibitor:i386 steam:i386 nvidia-vdpau-driver:i386 libtxc-dxtn-s2tc0:i386 steamos-packages:i386 steamos-packages:amd64 libnvidia-encode1:amd64 steamos-modeswitch-inhibitor:amd64 steamos-autoupdate

# Remove packages which aren't found in SteamOS
apt-get purge -y cracklib-runtime fonts-dejavu fonts-dejavu-extra fonts-droid gnome-accessibility-themes gsfonts libcanberra-gtk3-module libfakeroot libcogl-common libclutter-1.0-common libcuda1-i386 libglew1.10 libgphoto2-l10n libiw30 libnvidia-ml1:i386 libpaper-utils libsasl2-modules libsysfs2 manpages-dev menu mesa-va-drivers notification-daemon ntfs-3g packagekit-tools python-gobject-2 pulseaudio-module-x11 tcpd unzip usbmuxd vdpau-va-driver xdg-utils xml-core
