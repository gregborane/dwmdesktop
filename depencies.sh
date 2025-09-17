#!/bin/bash

# Install some packages
$HOME/.config/dwmdesktop/pacpack.sh

# Install oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# Copy dwmdesktop config if missing
if [ ! -d "$HOME/.config/dwmdesktop" ]; then
    cp -r ../dwmdesktop "$HOME/.config"
fi

# Create Base Folders
mkdir -p "$HOME/Downloads" "$HOME/Documents" "$HOME/Pictures" "$HOME/Music" "$HOME/Templates" "$HOME/App"
cp -r "$HOME/.config/dwmdesktop/Scripts" "$HOME/"

# Config Folders
mkdir -p "$HOME/.fonts" "$HOME/.icons" "$HOME/.themes"

# Download and Install a Nerd Font
cd "$HOME/.fonts" || exit
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraMono.zip
unzip FiraMono.zip
rm FiraMono.zip

# Download and Install Icons and Cursors
cd "$HOME/.icons" || exit
cp -r "$HOME/.config/dwmdesktop/Bibata-Modern-Ice" .
git clone https://github.com/zayronxio/Zafiro-icons.git
cd Zafiro-icons || exit
mv Dark ../
cd ..
rm -rf Zafiro-icons

# Download and Install a GTK theme
cd "$HOME/.themes" || exit
git clone https://github.com/EliverLara/Nordic.git

fc-cache

# Config setup
mkdir -p "$HOME/.dwm"
cp "$HOME/.config/dwmdesktop/autostart.sh" "$HOME/.dwm/"
cp "$HOME/.config/dwmdesktop/wallpaper.png" "$HOME/.config/"
cp "$HOME/.config/dwmdesktop/lock.png" "$HOME/.config/"
cp "$HOME/.config/dwmdesktop/.tmux.conf" "$HOME"
cp -r "$HOME/.config/dwmdesktop/rofi" "$HOME/.config/"
cp -r "$HOME/.config/dwmdesktop/nvim" "$HOME/.config"
cp -r "$HOME/.config/dwmdesktop/alacritty" "$HOME/.config"
cp -r "$HOME/.config/dwmdesktop/omp" "$HOME/.config"
cp -r "$HOME/.config/dwmdesktop/dwm" "$HOME/.config/"
cd "$HOME/.config/dwm" || exit
sudo make clean install
alacritty migrate 

# Enable StartUp Display Manager
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
cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si --noconfirm

# Install zoxide
zoxide init bash >> "$HOME/.bash_zoxide"

cat <<'EOF' >> "$HOME/.bashrc"

if [ -f "$HOME/.bash_zoxide" ]; then
    . "$HOME/.bash_zoxide"
fi

if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

# Path Variables
export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'

tmux >> /dev/null
eval $(ssh-agent -s) >> /dev/null

eval $(oh-my-posh init bash --config /home/greg/.config/omp/theme.json)
EOF

# aliases
cat >> "$HOME/.bash_aliases" <<'EOF'
#!/bin/bash

# ls
alias ls="ls --color=auto"
alias ll="ls -lFA"
alias la='ls -a'
alias l='ls -CF'
alias lsd='ls -d */'
alias lh='ls -lh'
alias lsr='ls -R'

# tree
alias lt="tree -C ."

# grep
alias grep="grep --color=auto"

# cd
alias cd="z"

# sudo
alias sudo="sudo -E"
EOF

# profile PATH setup
cat >> "$HOME/.bash_profile" <<'EOF'
if [ -d "$HOME/.local/bin" ]; then
    PATH=$PATH:$HOME/.local/bin
fi

if [ -d "$HOME/Scripts" ]; then
    PATH=$PATH:$HOME/Scripts
fi

export PATH
EOF

# Create command wrappers
sudo tee /usr/bin/vim > /dev/null <<'EOF'
#!/bin/bash
nvim "$@"
EOF
sudo chmod +x /usr/bin/vim

sudo tee /usr/bin/gedit > /dev/null <<'EOF'
#!/bin/bash
gnome-text-editor "$@"
EOF
sudo chmod +x /usr/bin/gedit

sudo tee /usr/bin/nano > /dev/null <<'EOF'
#!/bin/bash
nvim "$@"
EOF
sudo chmod +x /usr/bin/nano

