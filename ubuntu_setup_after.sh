# Run this script after the installing every other package that
# requires the sudo command

# App Dock Gnome
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


# Rust installation
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s - -y

# After
echo "READ BEFORE YOU GO"


echo "You still need to install rstudio download the latest version at"
echo "https://www.rstudio.com/products/rstudio/download/#download"
echo "and use sudo apt install to set everything up"
echo ""


echo "In order to fix jetbrains problem with fish sh you need to go to File -> Settings -> Tools -> Terminal -> (uncheck) Shell Integration"
echo ""

echo "If you want to download STM's IDE for their microcontroller lineup head to "
echo "https://my.st.com/content/my_st_com/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-ides/stm32cubeide.html"
echo "and download the most recent deb package"

echo ""

echo "Dont forget to update your nvidia drivers at software & updates -> additional drivers -> and choosing the (propietary, tested) driver"


