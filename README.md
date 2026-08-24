# Atmois's Custom Bazzite Image
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/atmo-bazzite)](https://artifacthub.io/packages/search?repo=atmo-bazzite)
[![Build container image](https://github.com/Atmois/atmo-bazzite/actions/workflows/build.yml/badge.svg)](https://github.com/Atmois/atmo-bazzite/actions/workflows/build.yml)


I made this so I could install and remove some extra stuff from bazzite-dx. I won't take PRs or anything for it as its just for my own personal use. Some of the changes I have done are listed below. I would personally not reccommend you use this for your own setup unless you know what you are doing.

## Available Variants

As I do not build my own ISO files you will need to install Bazzite first and then rebase to this image. **Please ensure you have chosen the variant using the same DE you plan to use as well as the correct hardware options.**

This repo builds two variants:
- **GNOME** (`latest-gnome`): Based on `ghcr.io/ublue-os/bazzite-dx-nvidia-gnome:stable` (CURRENTLY NOT BEING UPDATED, DO NOT USE)
  - You can rebase to the image using `rpm-ostree rebase ostree-image-signed:docker://ghcr.io/atmois/atmo-bazzite:latest-gnome`

- **KDE Plasma** (`latest-kde`): Based on `ghcr.io/ublue-os/bazzite-dx-nvidia:stable`
  - You can rebase to the image using `rpm-ostree rebase ostree-image-signed:docker://ghcr.io/atmois/atmo-bazzite:latest-kde`

### Sources

- [Bazzite](https://bazzite.gg)
- [UniversalBlue](https://universal-blue.org)

## Changes on All Images

### Extra Packages
#### [Fedora](https://packages.fedoraproject.org)
- [Asciiquarium](https://robobunny.com/projects/asciiquarium/html/)
- [Audacity](https://audacityteam.org/)
- [Blender](https://blender.org/)
- [Composer](https://getcomposer.org/)
- [Dijikam](https://digikam.org/)
- [Golang](https://golang.org/)
- [Gwenview](https://kde.org/applications/graphics/gwenview/)
- [Hadolint](https://github.com/hadolint/hadolint)
- [Haruna](https://haruna.kde.org/)
- [Hyfetch](https://github.com/hykilpikonna/hyfetch)
- [KColorChooser](https://kde.org/applications/graphics/kcolorchooser/)
- [Inkscape](https://inkscape.org/)
- [Kdenlive](https://kdenlive.org/)
- [Micro](https://micro-editor.github.io/)
- [Netcat](https://nmap.org)
- [Nmap](https://nmap.org/)
- [Nodejs](https://nodejs.org/)
- [MuseScore](https://musescore.org/)
- [OBS](https://obsproject.com/)
- [PHP](https://php.net/)
- [Piper](https://github.com/libratbag/piper)
- [Picard](https://picard.musicbrainz.org/)
- [Telnet](https://gnu.org/software/inetutils/)
- [Thunderbird](https://thunderbird.net/)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [Zsh-Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [Zsh-Syntax-Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

#### [Terra](https://terra.fyralabs.com)
- [Feishin](https://github.com/jeffvli/feishin)
- [Prism Launcher](https://prismlauncher.org)
- [ProtonPlus](https://protonplus.vysp3r.com)
- [Starship](https://starship.rs)
- [Vesktop](https://vesktop.vencord.dev)

#### External Packages
- [Cloudflared](https://github.com/cloudflare/cloudflared)
- [Filen](https://filen.io)
- [OnlyOffice](https://onlyoffice.com/)
- [Trillium Notes](https://triliumnotes.org)
- [Vivaldi](https://vivaldi.com/)

### Removed Packages
- Lutris
