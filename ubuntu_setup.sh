#!bin/bash

CLANGD_PACKAGE=clangd-12

sudo apt install curl npm neovim vlc $(CLANGD_PACKAGE) fish libsqlite3-dev sqlite3 r-base -y

sudo apt install libcurl4-openssl-dev libxml2-dev -y


sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/$(CLANGD_PACKAGE) 100

sudo snap install --classic intellij-idea-ultimate
sudo snap install --classic clion

gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'

# Neovim Config
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

# Fish Config
chsh -s /usr/bin/fish
mkdir -p ~/.config/fish
touch ~/.config/fish/config.fish
echo "set -g -x fish_greeting 'The fish Shell has been configured as your main shell 
if you want to remove it you can use the command chsh -s /bin/bash.
If you want to change this message, you can overwrite it in ~/.config/fish/config.fish'" > ~/.config/fish/config.fish

# R Config
sudo Rscript ./initial_config.R

# Rust installation
# Rust installation needs user input and its not that big to be a problem 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


# After
echo "READ BEFORE YOU GO"


echo "You still need to install rstudio download the latest version at"
echo "https://www.rstudio.com/products/rstudio/download/#download"
echo "and use sudo apt install to set everything up"

echo "Dont forget to update your nvidia drivers"





