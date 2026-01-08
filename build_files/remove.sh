#!/bin/bash
set -ouex pipefail

packages=(
    "lutris"
    "waydroid"
)

dnf remove -y ${packages[@]}
