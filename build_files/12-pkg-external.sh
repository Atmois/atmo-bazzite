#!/bin/bash
set -ouex pipefail

# External packages
triliumTag="$(curl -fsSL -o /dev/null -w '%{url_effective}' https://github.com/TriliumNext/Trilium/releases/latest | xargs basename)"
triliumUrl="https://github.com/TriliumNext/Trilium/releases/download/${triliumTag}/TriliumNotes-${triliumTag}-linux-x64.rpm"

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

# Install External Packages
dnf install -y ${externalPackages[@]}
