#!/bin/bash
set -ouex pipefail

# Packages
terraPackages=(
    "vesktop"
    "feishin"
)

packages=(
    ${terraPackages[@]}
)

dnf install -y ${packages[@]}
