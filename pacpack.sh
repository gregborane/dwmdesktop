#!/bin/bash

# Update existing packages
sudo pacman -Syu

# Dependencies for my System
sudo pacman -S --noconfirm --needed alacritty alsa-plugins aspell
sudo pacman -S --noconfirm --needed base-devel bash-completion biber
sudo pacman -S --noconfirm --needed cmake composer curl
sudo pacman -S --noconfirm --needed dkms dotnet-runtime-7.0 dotnet-runtime-8.0
#sudo pacman -S --noconfirm --needed e
sudo pacman -S --noconfirm --needed feh ffmpeg flameshot fontconfig fuse-common fzf
sudo pacman -S --noconfirm --needed gamescope gimp giflip gnome-text-editor ghostscript git gtk3 gtk4
sudo pacman -S --noconfirm --needed hdf5 hspell htop
sudo pacman -S --noconfirm --needed i3lock imagemagick
sudo pacman -S --noconfirm --needed jdk-openjdk julia
#sudo pacman -S --noconfirm --needed k
sudo pacman -S --noconfirm --needed less libreoffice-fresh linux-lts linux-lts-docs linux-lts-headers luarocks lutris
sudo pacman -S --noconfirm --needed mariadb mermaid-cli
sudo pacman -S --noconfirm --needed ncurse neovim ninja noto-fonts-emoji nuspell nwg-look
sudo pacman -S --noconfirm --needed openal openssh
sudo pacman -S --noconfirm --needed pavucontrol php picom python-neovim
sudo pacman -S --noconfirm --needed qt5 qt6
sudo pacman -S --noconfirm --needed r ripgrep rofi ruby
sudo pacman -S --noconfirm --needed sddm sqlite sshfs steam
sudo pacman -S --noconfirm --needed tectonic texlive thunar timeshift tree-sitter-cli thunderbird
sudo pacman -S --noconfirm --needed ueberzug unzip 
sudo pacman -S --noconfirm --needed vlc vulkan-icd-loader
sudo pacman -S --noconfirm --needed wget wine-staging
#sudo pacman -S --noconfirm --needed x
#sudo pacman -S --noconfirm --needed y
sudo pacman -S --noconfirm --needed zathura zip zoxide

# lib* packages (alphabetically sorted)
sudo pacman -S --noconfirm --needed lib32-alsa-lib lib32-alsa-plugins lib32-giflib lib32-gmp lib32-gnutls \
lib32-libgpg-error lib32-libjpeg-turbo lib32-libldap lib32-libpulse lib32-libxcomposite lib32-libxinerama \
lib32-libxslt lib32-mpg123 lib32-ncurses lib32-opencl-icd-loader lib32-sqlite libgcrypt libgpg-error \
libjpeg-turbo libldap libpng libxcomposite libxinerama libxslt libva v4l-utils

# Install oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s

