#!/bin/bash
set -ouex pipefail

# Packages from repositories

# https://packages.fedoraproject.org
fedoraPackages=(
    "asciiquarium"
    "audacity"
    "blender"
    "composer"
    "digikam"
    "golang"
    "gwenview"
    "hadolint"
    "haruna"
    "hyfetch"
    "inkscape"
    "kcolorchooser"
    "kdenlive"
    "micro"
    "musescore"
    "nmap"
    "nmap-ncat"
    "nodejs"
    "obs-studio"
    "php"
    "picard"
    "telnet"
    "thunderbird"
    "yt-dlp"
    "zsh-autosuggestions"
    "zsh-syntax-highlighting"
)

# https://terra.fyralabs.com
dnf5 -y config-manager setopt "terra".enabled=true
terraPackages=(
    "feishin"
    "prismlauncher"
    "starship"
    "vesktop"
)


# External packages
externalPackages=(
    "https://cdn.filen.io/@filen/desktop/release/latest/Filen_linux_x86_64.rpm"
    "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-x86_64.rpm"
    "$(curl -s https://api.github.com/repos/ONLYOFFICE/DesktopEditors/releases/latest | grep -oP '"browser_download_url": "\K[^"]*desktopeditors\.x86_64\.rpm')"
    "https://vivaldi.com/download/vivaldi-stable.x86_64.rpm"
    #"$(curl -s https://api.github.com/repos/TriliumNext/Trilium/releases/latest | grep -oP '"browser_download_url": "\K[^"]*linux-x64\.rpm')"
)

# Ensure /opt is a real directory for RPM installation
[ -L /opt ] && rm -f /opt
mkdir -p /opt

# Ensure /usr/local is a real directory for Cloudflared
[ -L /usr/local ] && rm -f /usr/local
mkdir -p /usr/local/bin

# Install Repo Packages
packages=(
    ${terraPackages[@]}
    ${fedoraPackages[@]}
    ${externalPackages[@]}
)
dnf install -y ${packages[@]}

# Relocate /opt contents to factory path and convert to symlink
mkdir -p /usr/share/factory/var/opt
cp -r /opt/* /usr/share/factory/var/opt/ 2>/dev/null || true
rm -rf /opt
ln -s /var/opt /opt

# Register tmpfiles config
mkdir -p /usr/lib/tmpfiles.d
cp /ctx/opt-packages.conf /usr/lib/tmpfiles.d/opt-packages.conf
echo 'R! /var/opt/vivaldi' >> /usr/lib/tmpfiles.d/opt-packages.conf
