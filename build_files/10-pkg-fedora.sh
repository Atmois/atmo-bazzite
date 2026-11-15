#!/bin/bash
set -ouex pipefail

# https://packages.fedoraproject.org
fedoraPackages=(
    "asciiquarium"
    "audacity"
    "blender"
    "composer"
    "darktable"
    "digikam"
    "golang"
    "gparted"
    "gwenview"
    "hadolint"
    "haruna"
    "hyfetch"
    "inkscape"
    "kcalc"
    "kcolorchooser"
    "kdenlive"
    "micro"
    "musescore"
    "nmap"
    "nmap-ncat"
    "nodejs"
    "obs-studio"
    "php"
    "picard"
    "telnet"
    "thunderbird"
    "uv"
    "yt-dlp"
    "zsh-autosuggestions"
    "zsh-syntax-highlighting"
)

dnf install -y ${fedoraPackages[@]}
