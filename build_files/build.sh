#!/bin/bash
set -ouex pipefail

# Packages from repositories

# https://packages.fedoraproject.org
fedoraPackages=(
    "asciiquarium"
    "audacity"
    "blender"
    "composer"
    "darktable"
    "digikam"
    "golang"
    "gparted"
    "gwenview"
    "hadolint"
    "haruna"
    "hyfetch"
    "inkscape"
    "kcalc"
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
    "uv"
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
triliumUrl="$(curl -s https://api.github.com/repos/TriliumNext/Trilium/releases/latest | grep -o '"browser_download_url": *"[^"]*x64[^"]*\.rpm"' | cut -d'"' -f4)"
externalPackages=(
    "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-x86_64.rpm"
    "https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors.x86_64.rpm"
    "https://vivaldi.com/download/vivaldi-stable.x86_64.rpm"
    "https://cdn.filen.io/@filen/desktop/release/latest/Filen_linux_x86_64.rpm"
    "$triliumUrl"
)

# Ensure /opt is a real directory for installation
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
