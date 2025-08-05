#!/bin/bash
set -ouex pipefail

# Packages
dnf5 -y config-manager setopt "terra".enabled=true
terraPackages=(
    "vesktop"
    "feishin"
)

packages=(
    ${terraPackages[@]}
)

dnf install -y ${packages[@]}
