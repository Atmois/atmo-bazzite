#!/bin/bash
set -ouex pipefail

# External packages
triliumUrl="$(curl -sS https://api.github.com/repos/TriliumNext/Trilium/releases/latest | grep -o 'https://[^"]*linux-x64\.rpm')"
externalPackages=(
    "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-x86_64.rpm"
    "https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors.x86_64.rpm"
    "https://vivaldi.com/download/vivaldi-stable.x86_64.rpm"
    "https://cdn.filen.io/@filen/desktop/release/latest/Filen_linux_x86_64.rpm"
    "https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
    "$triliumUrl"
)

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
