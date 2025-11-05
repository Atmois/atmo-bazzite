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
    "python3-tkinter"
    "telnet"
    "tokei"
    "uv"
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

dnf install -y ${packages[@]}

# External packages
externalPackages=(
    "https://cdn.filen.io/@filen/desktop/release/latest/Filen_linux_x86_64.rpm"
    "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-x86_64.rpm"
    "https://muse-cdn.com/Muse_Sounds_Manager_x64.rpm"
)

# Ensure /opt is a real directories for RPM installation
[ -L /opt ] && rm -f /opt
mkdir -p /opt

# Ensure /usr/local is a real directory for Cloudflared
[ -L /usr/local ] && rm -f /usr/local
mkdir -p /usr/local/bin

# Install external packages
dnf install -y ${externalPackages[@]}

# Relocate /opt contents to factory path and convert to symlink
mkdir -p /usr/share/factory/var/opt
cp -r /opt/* /usr/share/factory/var/opt/ 2>/dev/null || true
rm -rf /opt
ln -s /var/opt /opt

# Register tmpfiles config
mkdir -p /usr/lib/tmpfiles.d
cp /ctx/opt-packages.conf /usr/lib/tmpfiles.d/opt-packages.conf
