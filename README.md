# My X11 config using DWM based on Arch

## EXECUTE DEPENCIES.SH for set up.

## Windows Manager : DWM 
Contains 3 patches :
- Autostart
- Better Full Gaps, BarPadding is an old patch which is currently not used
- Systray notifications (soon)
- Fullscreen

Use my custom wallpaper for i3lock and feh background, feel free to use them if you want.

### Icons, Fonts, Themes
Create default folder : Documents, Music, Downloads, Pictures, Templates and App.
Create config folder: $HOME/.fonts, .icons and .themes.
in which are put a FireMonoNerdFont, BibataModernClassic, Zafiro icons and Nordic themes in their $HOME respective folders.
Move my daily Scripts/ to $HOME as well.

### Menu : Rofi

I do not use default theme, that's why you can find rofi configuration folder.

## Init and log in : SDDM (soon) 

Easy set up using "astraunaut theme sddm" from github. I like japenese aesthetic so I put it.
Creating DWM entrie for log in as well.

## Packages 

List in alphabetical orders which can be found in depencies.sh.
I use Yay so it is installed as well.

## Python set up

Packages are installed in an anaconda environment and it is a requirement for the installation. 
If no $HOME/anaconda3 is found this is skipped.

## Creates some aliases 

nvim into vim
gnome-text-editor into gedit
install zoxide for bash and modify cd with zoxide.

## Neovim 

Setup some plugins and keymaps for neovim 
plugins : 

- tokyonight theme
- LSP and formatting
- python notebooks editing, rendering and executing
- neotree
- bufferline

TO ADD : 
.bashrc file 
set up $PATH



