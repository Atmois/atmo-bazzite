#!/bin/bash
set -ouex pipefail

packages=(
    "lutris"
)

dnf remove -y ${packages[@]}

dnf clean all
