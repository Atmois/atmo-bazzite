#!/bin/bash
set -ouex pipefail

# https://terra.fyralabs.com
dnf5 -y config-manager setopt "terra".enabled=true
terraPackages=(
    "feishin"
    "prismlauncher"
    "starship"
    "vesktop"
)

dnf install -y ${terraPackages[@]}
