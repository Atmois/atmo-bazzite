#!/bin/bash
set -ouex pipefail

# Packages from repositories

# https://packages.fedoraproject.org
fedoraPackages=(
    "musescore"
)

# https://terra.fyralabs.com
dnf5 -y config-manager setopt "terra".enabled=true
terraPackages=(
    "vesktop"
    "feishin"
)

packages=(
    ${terraPackages[@]}
    ${fedoraPackages[@]}
)

dnf install -y ${packages[@]}

# External packages

externalPackages=(
    "https://muse-cdn.com/Muse_Sounds_Manager_x64.rpm"
    "https://cdn.filen.io/@filen/desktop/release/latest/Filen_linux_x86_64.rpm"
)

rm /opt
mkdir -p /opt
dnf install -y ${externalPackages[@]}
mkdir -p /usr/share/factory/var/opt
cp -r /opt/* /usr/share/factory/var/opt/ 2>/dev/null || true
rm -rf /opt/*
rmdir /opt
ln -s /var/opt /opt
mkdir -p /usr/lib/tmpfiles.d
cp /ctx/build_files/opt-packages.conf /usr/lib/tmpfiles.d/opt-packages.conf
