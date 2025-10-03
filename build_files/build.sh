#!/bin/bash
set -ouex pipefail

# Prework
rm -rf /opt/Filen/

# Packages
dnf5 -y config-manager setopt "terra".enabled=true
terraPackages=(
    "vesktop"
    "feishin"
)

wget -O Filen_linux_x86_64.rpm https://cdn.filen.io/@filen/desktop/release/latest/Filen_linux_x86_64.rpm
direct_packages=(
    "./Filen_linux_x86_64.rpm"
)

packages=(
    ${terraPackages[@]}
    ${direct_packages[@]}
)

dnf install -y ${packages[@]}

# Cleanup
rm -f Filen_linux_x86_64.rpm
