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


sudo apt install curl npm neovim vlc $JAVA_PACKAGE $CLANGD_PACKAGE fish maven snapd clangd-format -y


sudo apt install libcurl4-openssl-dev libxml2-dev libfontconfig-dev -y


sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/$CLANGD_PACKAGE 100

sudo snap install --classic intellij-idea-ultimate
sudo snap install --classic clion

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
    sudo snap install rider --classic
 
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

