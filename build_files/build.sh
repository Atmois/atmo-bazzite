#!/bin/bash
set -ouex pipefail

# Packages from repositories

# https://packages.fedoraproject.org
fedoraPackages=(
    "asciiquarium"
    "blender"
    "composer"
    "golang"
    "hadolint"
    "hyfetch"
    "mediawriter"
    "micro"
    "musescore"
    "nmap"
    "nmap-ncat"
    "nodejs"
    "pavucontrol"
    "php"
    "telnet"
    "tokei"
    "uv"
    "whois"
    "zsh"
    "zsh-autosuggestions"
    "zsh-syntax-highlighting"
)

# https://terra.fyralabs.com
dnf5 -y config-manager setopt "terra".enabled=true
terraPackages=(
    "feishin"
    "starship"
    "vesktop"
)

packages=(
    ${terraPackages[@]}
    ${fedoraPackages[@]}
)

#dnf install -y ${packages[@]}

# External packages
externalPackages=(
    "https://cdn.filen.io/@filen/desktop/release/latest/Filen_linux_x86_64.rpm"
    "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-x86_64.rpm"
    "https://muse-cdn.com/Muse_Sounds_Manager_x64.rpm"
    "https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors.x86_64.rpm"
)

# Ensure /opt is a real directory for RPM installation
if [ -L /opt ]; then
    rm -f /opt
    mkdir -p /opt
elif [ ! -d /opt ]; then
    mkdir -p /opt
fi

# Ensure /usr/local is a real directory for Cloudflared
if [ -L /usr/local ]; then
    rm -f /usr/local
    mkdir -p /usr/local/bin
elif [ ! -d /usr/local ]; then
    mkdir -p /usr/local/bin
else
    mkdir -p /usr/local/bin
fi

# Install external packages (skip all verification for packages without proper digest)
dnf install -y --nogpgcheck --setopt=localpkg_gpgcheck=0 ${externalPackages[@]}

# Relocate /opt contents and set up factory path
mkdir -p /usr/share/factory/var/opt
cp -r /opt/* /usr/share/factory/var/opt/ 2>/dev/null || true
rm -rf /opt/*
rmdir /opt
ln -s /var/opt /opt

# Register tmpfiles config
mkdir -p /usr/lib/tmpfiles.d
cp /ctx/opt-packages.conf /usr/lib/tmpfiles.d/opt-packages.conf
