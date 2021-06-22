#!bin/bash

UBUNTU_VERSION=20.04

# Global Flags
DOTNET_INSTALLATION=true
NVIDIA_INSTALLATION=true #(nvidia cuda toolkit)
VSCODE_INSTALLATION=true 
SQLITE_INSTALLATION=true #(sqlite3 and dev)
OPENBS_INSTALLATION=true #(OBS)
R_BASE_INSTALLATION=true #(R)


# Versioned packages
CLANGD_PACKAGE=clangd-12
JAVA_PACKAGE=openjdk-16-jdk
DOTNET_PACKAGE=dotnet-sdk-5.0
DOTNET_RUNTIME_PACKAGE=aspnetcore-runtime-5.0

sudo apt update -y
sudo apt upgrade -y


sudo apt install curl npm neovim vlc $JAVA_PACKAGE $CLANGD_PACKAGE fish maven snapd -y


sudo apt install libcurl4-openssl-dev libxml2-dev -y


sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/$CLANGD_PACKAGE 100

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

# R
if (("$R_BASE_INSTALLATION" == true))
then
    sudo apt install r-base -y
    sudo Rscript ./initial_config.R
fi


# DOTNET
if (("$DOTNET_INSTALLATION" == true))
then
    wget https://packages.microsoft.com/config/ubuntu/$UBUNTU_VERSION/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    sudo apt install apt-transport-https -y
    sudo apt update -y
    sudo apt install -y $DOTNET_PACKAGE
    DOTNET_CLI_TELEMETRY_OPTOUT=1
    sudo apt install -y $DOTNET_RUNTIME_PACKAGE
    sudo apt install mono-devel -y
    sudo apt install mono-complete -y
    sudo snap install rider --clasic
 
fi

# Nvidia
if (("$NVIDIA_INSTALLATION" == true))
then
    sudo apt install nvidia-cuda-toolkit -y
fi

# Sqlte
if (("$SQLITE_INSTALLATION" == true))
then
    sudo apt install libsqlite3-dev sqlite3 -y
fi

# VsCode
if (("$VSCODE_INSTALLATION" == true))
then
    sudo snap install code --classic
fi

# OBS
if (("$OPENBS_INSTALLATION" == true))
then
    sudo apt install obs-studio -y
fi

# Rust installation
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s - -y

# After
echo "READ BEFORE YOU GO"


echo "You still need to install rstudio download the latest version at"
echo "https://www.rstudio.com/products/rstudio/download/#download"
echo "and use sudo apt install to set everything up"

echo "In order to fix jetbrains problem with fish sh you need to go to File -> Settings -> Tools -> Terminal -> (uncheck) Shell Integration"

echo "If you want to download STM's IDE for their microcontroller lineup head to "
echo "https://my.st.com/content/my_st_com/en/products/development-tools/software-development-tools/stm32-software-development-tools/stm32-ides/stm32cubeide.html"
echo "and download the most recent deb package"

echo "Dont forget to update your nvidia drivers at software & updates -> additional drivers -> and choosing the (propietary, tested) driver"





