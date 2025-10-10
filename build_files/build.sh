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

packages=(
    ${terraPackages[@]}
    ${fedoraPackages[@]}
)

dnf install -y ${packages[@]}
