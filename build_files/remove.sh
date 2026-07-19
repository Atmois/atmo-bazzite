#!/bin/bash
set -ouex pipefail

packages=(
    "gnome-disk-utility"
    "lutris"
)

dnf remove -y ${packages[@]}

dnf clean all
