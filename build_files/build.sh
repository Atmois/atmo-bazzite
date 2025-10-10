#!/bin/bash
set -ouex pipefail

# Packages

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

customPackages=(
    "https://muse-cdn.com/Muse_Sounds_Manager_x64.rpm"
)

packages=(
    ${terraPackages[@]}
    ${customPackages[@]}
    ${fedoraPackages[@]}
)

dnf install -y ${packages[@]}
