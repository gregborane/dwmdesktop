!#/bin/bash

# Config set up

## Create Base Folders
mkdir -p "$HOME/Downloads" "$HOME/Documents" "$HOME/Pictures" "$HOME/Music" "$HOME/Templates" "$HOME/App"
cp -r "$HOME/.config/dwmdesktop/Scripts" "$HOME/"

## Config Folders
mkdir -p "$HOME/.fonts" "$HOME/.icons" "$HOME/.themes"

## Download and Install a Nerd Font
cd "$HOME/.fonts" || exit
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraMono.zip
unzip FiraMono.zip
rm FiraMono.zip

## Download and Install Icons and Cursors
cd "$HOME/.icons" || exit
cp -r "$HOME/.config/dwmdesktop/Bibata-Modern-Ice" .
git clone https://github.com/zayronxio/Zafiro-icons.git
cd Zafiro-icons || exit
mv Dark ../
cd ..
rm -rf Zafiro-icons

## Download and Install a GTK theme
cd "$HOME/.themes" || exit
git clone https://github.com/EliverLara/Nordic.git

## Startup
mkdir -p "$HOME/.dwm"
cp "$HOME/.config/dwmdesktop/autostart.sh" "$HOME/.dwm/"

## Backgrounds
cp "$HOME/.config/dwmdesktop/wallpaper.png" "$HOME/.config/"
cp "$HOME/.config/dwmdesktop/lock.png" "$HOME/.config/"

## TMUX
cp "$HOME/.config/dwmdesktop/.tmux.conf" "$HOME"

## Rofi
cp -r "$HOME/.config/dwmdesktop/rofi" "$HOME/.config/"

## Neovim
cp -r "$HOME/.config/dwmdesktop/nvim" "$HOME/.config"

## Terminal
cp -r "$HOME/.config/dwmdesktop/alacritty" "$HOME/.config"
alacritty migrate

## Oh-my-posh
cp -r "$HOME/.config/dwmdesktop/omp" "$HOME/.config"

## Fontconfig
cp -r "$HOME/.config/dwmdesktop/fontconfig" "$HOME/.config"

## DWM
cp -r "$HOME/.config/dwmdesktop/dwm" "$HOME/.config/"
cd "$HOME/.config/dwm" || exit
sudo make clean install

## Apply fonts
fc-cache

## Enable StartUp Display Manager
sudo systemctl enable sddm

## Configure StartX
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

