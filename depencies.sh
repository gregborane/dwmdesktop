#!/bin/bash

# Dependencies for my System
sudo pacman -S --noconfirm --needed alacritty aspell
sudo pacman -S --noconfirm --needed base-devel bash-completion 
sudo pacman -S --noconfirm --needed cmake curl 
sudo pacman -S --noconfirm --needed dkms dotnet-runtime-8.0 dotnet-runtime-7.0 
sudo pacman -S --noconfirm --needed feh ffmpeg flameshot fuse-common fzf 
sudo pacman -S --noconfirm --needed gamescope gnome-text-editor gimp git gtk3 gtk4
sudo pacman -S --noconfirm --needed hdf5 htop hspell
sudo pacman -S --noconfirm --needed i3lock imagemagick
sudo pacman -S --noconfirm --needed less libreoffice-fresh linux-lts linux-lts-docs linux-lts-headers libvoikko
sudo pacman -S --noconfirm --needed mariadb
sudo pacman -S --noconfirm --needed neovim ninja noto-fonts nuspell nwg-look
sudo pacman -S --noconfirm --needed openssh
sudo pacman -S --noconfirm --needed pavucontrol picom
sudo pacman -S --noconfirm --needed qt5 qt6 
sudo pacman -S --noconfirm --needed r rofi
sudo pacman -S --noconfirm --needed sddm steam
sudo pacman -S --noconfirm --needed thunar thunderbird timeshift
sudo pacman -S --noconfirm --needed unzip
sudo pacman -S --noconfirm --needed vlc
sudo pacman -S --noconfirm --needed wget
sudo pacman -S --noconfirm --needed zip zoxide

if [ ! -f ../dwmdesktop/depencies ];
	echo "execute file in dwmdesktop folder"
	exit 1
fi

if [ ! -d $HOME/.config/dwmdesktop]; then
    cp -p ../dwmdesktop $HOME/.config
fi

# Create Base Folders
mkdir -p "$HOME/Downloads" "$HOME/Documents" "$HOME/Pictures" "$HOME/Music" "$HOME/Templates" "$HOME/App" "$HOME/Scripts"

# Config Folders
mkdir -p "$HOME/.fonts" "$HOME/.icons" "$HOME/.themes"

# Download and Install a Nerd Font
cd "$HOME/.fonts"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraMono.zip
unzip FiraMono.zip
rm FiraMono.zip

# Download and Install Icons and Cursors
cd "$HOME/.icons"
cp -r "$HOME/.config/dwmdesktop/Bibata-Modern-Classic" .
git clone https://github.com/zayronxio/Zafiro-icons.git
cd Zafiro-icons
mv Dark ../
cd ..
rm -rf Zafiro-icons

# Download and Install a GTK theme
cd "$HOME/.themes"
git clone https://github.com/EliverLara/Nordic.git

fc-cache

# DWM SET UP
mkdir -p "$HOME/.dwm"
cp "$HOME/.config/dwmdesktop/autostart.sh" "$HOME/.dwm/"
cp "$HOME/.config/dwmdesktop/wallpaper.png" "$HOME/.config/"
cp "$HOME/.config/dwmdesktop/lock.png" "$HOME/.config/"
cp -r "$HOME/.config/dwmdesktop/rofi" "$HOME/.config/"
cp -r "$HOME/.config/dwmdesktop/dwm" "$HOME/.config/"
cd "$HOME/.config/dwm"
sudo make clean install

# Create StartUp Display Manager
sudo systemctl enable sddm

# Configure StartX
cp /etc/X11/xinit/xinitrc "$HOME/.xinitrc"
sed -i '$d' "$HOME/.xinitrc"
echo "exec dwm" >> "$HOME/.xinitrc"

cat <<'EOF' >> "$HOME/.bash_profile"
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
EOF

sudo mkdir -p /usr/share/xsessions
sudo tee /usr/share/xsessions/dwm.desktop > /dev/null <<EOF
[Desktop Entry]
Name=DWM
Comment=Light Weight Tile Windows Manager
Exec=/usr/local/bin/dwm
Type=Application
EOF

# Set up AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# Install zoxide
zoxide init bash >> "$HOME/.bash_zoxide"

cat <<'EOF' >> "$HOME/.bashrc"
if [ -f $HOME/.bash_zoxide ]; then
    . $HOME/.bash_zoxide
fi
EOF

echo 'alias cd="z"' >> "$HOME/.bashrc"

sudo tee /usr/bin/vim > /dev/null <<EOF
#!/bin/bash
nvim "$@"
EOF
sudo chmod +x /usr/bin/vim

sudo tee /usr/bin/gedit > /dev/null <<EOF
#!/bin/bash
gnome-text-editor "$@"
EOF
sudo chmod +x /usr/bin/gedit

if [ -d $HOME/anaconda3 ]; then
	$HOME/.config/dwmdesktop/python
fi
