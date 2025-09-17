!#/bin/bash

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

