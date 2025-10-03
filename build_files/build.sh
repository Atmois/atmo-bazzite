#!/bin/bash
set -ouex pipefail

# Packages

dnf5 -y config-manager setopt "terra".enabled=true
terraPackages=(
    "vesktop"
    "feishin"
)

wget -O Filen_linux_x86_64.rpm https://cdn.filen.io/@filen/desktop/release/latest/Filen_linux_x86_64.rpm
packages=(
    "./Filen_linux_x86_64.rpm"
)

packages=(
    ${terraPackages[@]}
)

dnf install -y ${packages[@]}

# Cleanup
rm -f Filen_linux_x86_64.rpm
