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
)

rm /opt
mkdir /opt
dnf install -y ${externalPackages[@]}
mv /opt /usr/share/factory
ln -s /var/opt /opt
