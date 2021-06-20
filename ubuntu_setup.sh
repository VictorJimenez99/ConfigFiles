#!bin/bash

sudo apt install curl -y
sudo apt install npm -y
sudo apt install neovim -y
sudo apt install vlc -y
sudo apt install clangd-12 -y

sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100


sudo snap install --classic intellij-idea-ultimate
sudo snap install --classic clion

gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

echo "Dont forget to update your nvidia drivers"





