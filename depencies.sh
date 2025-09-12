#!/bin/bash

if [ ! -f ../dwmdesktop/depencies ];
	echo "execute file in dwmdesktop folder"
	exit 1
fi

$HOME/.config/dwmdesktop/pacpack.sh

if [ ! -d $HOME/.config/dwmdesktop]; then
    cp -p ../dwmdesktop $HOME/.config
fi

# Create Base Folders
mkdir -p "$HOME/Downloads" "$HOME/Documents" "$HOME/Pictures" "$HOME/Music" "$HOME/Templates" "$HOME/App"
cp -r $HOME/.config/dwmdesktop/Scripts $HOME/

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
nvim '$@'
EOF
sudo chmod +x /usr/bin/vim

sudo tee /usr/bin/gedit > /dev/null <<EOF
#!/bin/bash
gnome-text-editor '$@'
EOF
sudo chmod +x /usr/bin/gedit

sudo tee /usr/bin/nano > /dev/null <<EOF
#!/bin/bash
nvim'$@'
EOF
sudo chmod +x /usr/bin/nano

if [ -d $HOME/anaconda3 ]; then
	$HOME/Scripts/python/conda
	$HOME/Scripts/python/python
fi

cp -r $HOME/.config/dwmdesktop/nvim $HOME/.config
