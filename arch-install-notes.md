# Installed Base Using Instructions
- https://wiki.archlinux.org/index.php/installation_guide
- https://dev.to/siatwe/install-a-minimal-arch-linux-in-half-an-hour--1l6p

# Personal Preference in UI
- i3gaps
- i3lock

# Connect to Work VPN
- remmina
- freerdp
- openconnect

# Dev Tools
- base-devel
- git
- emacs
- vs code (its AUR so makepkg -si)

# Webcam Tools
- qt5-base
- usbutils

# Command Notes
- pacstrap -i /mnt base
- sudo pacman -S base-devel linux linux-headers linux-firmware grub sudo dialog netctl wpa_supplicant dhcpcd
- sudo pacman -S nano pulseaudio pulseaudio-alsa alsa-utils xorg xorg-xinit i3-gaps dmenu i3status i3lock chromium xfce4-terminal openconnect remmina freerdp git emacs qt5-base usbutils
- sudo makepkg -si in git cloned vscode
