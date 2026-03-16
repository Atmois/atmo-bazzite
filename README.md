# Atmois's Custom Bazzite Image
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/atmo-bazzite)](https://artifacthub.io/packages/search?repo=atmo-bazzite)
[![Build container image](https://github.com/Atmois/atmo-bazzite/actions/workflows/build.yml/badge.svg)](https://github.com/Atmois/atmo-bazzite/actions/workflows/build.yml)


I made this so I could install and remove some extra stuff from bazzite-dx. I won't take PRs or anything for it as its just for my own personal use. Some of the changes I have done are listed below. I would personally not reccommend you use this for your own setup unless you know what you are doing.

## Available Variants

As I do not build my own ISO files you will need to install Bazzite first and then rebase to this image. **Please ensure you have chosen the variant using the same DE you plan to use as well as the correct hardware options.**

This repo builds three variants:
- **GNOME** (`latest-gnome`): Based on `ghcr.io/ublue-os/bazzite-dx-nvidia-gnome:stable`
  - You can rebase to the image using `rpm-ostree rebase ostree-image-signed:docker://ghcr.io/atmois/atmo-bazzite:latest-gnome`

- **KDE Plasma** (`latest-kde`): Based on `ghcr.io/ublue-os/bazzite-dx-nvidia:stable`
  - You can rebase to the image using `rpm-ostree rebase ostree-image-signed:docker://ghcr.io/atmois/atmo-bazzite:latest-kde`

- **SwayFX** (`latest-swayfx`): Based on `ghcr.io/ublue-os/bazzite-dx-nvidia-gnome:stable`
  - You can rebase to the image using `rpm-ostree rebase ostree-image-signed:docker://ghcr.io/atmois/atmo-bazzite:latest-swayfx`
> As this image is a barebones form of the GNOME image, I reccomend rebasing from a GNOME image.

### Sources

- [Bazzite](https://bazzite.gg)
- [UniversalBlue](https://universal-blue.org)

## Changes on All Images

### Extra Packages
#### [Fedora](https://packages.fedoraproject.org)
- [Asciiquarium](https://robobunny.com/projects/asciiquarium/html/)
- [Composer](https://getcomposer.org/)
- [Golang](https://golang.org/)
- [Graphviz](https://gparted.org)
- [Hadolint](https://github.com/hadolint/hadolint)
- [Hyfetch](https://github.com/hykilpikonna/hyfetch)
- [Micro](https://micro-editor.github.io/)
- [MediaWriter](https://github.com/FedoraQt/MediaWriter)
- [Netcat](https://nmap.org)
- [Nmap](https://nmap.org/)
- [Nodejs](https://nodejs.org/)
- [PHP](https://php.net/)
- [Telnet](https://www.gnu.org/software/inetutils/)
- [Thunar](https://docs.xfce.org/xfce/thunar)
- [Thunar Archive Plugin](https://docs.xfce.org/xfce/thunar/archive)
- [Thunar Media Tags Plugin](https://docs.xfce.org/xfce/thunar/media-tags)
- [Thunar VCS Plugin](https://docs.xfce.org/xfce/thunar/thunar-vcs-plugin)
- [Tokei](https://github.com/XAMPPRocky/tokei)
- [UV](https://github.com/astral-sh/uv)
- [Zsh-Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [Zsh-Syntax-Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

#### [Terra](https://terra.fyralabs.com)
- [Feishin](https://github.com/jeffvli/feishin)
- [Starship](https://starship.rs)
- [Vesktop](https://vesktop.vencord.dev)

#### External Packages
- [Cloudflared](https://github.com/cloudflare/cloudflared)
- [Filen](https://filen.io)
- [Trillium Notes](https://triliumnotes.org)
- [Vivaldi](https://vivaldi.com/)

### Removed Packages
- Lutris
- Waydroid

## SwayFX Image

### Extra Packages
#### [Fedora](https://packages.fedoraproject.org)
- [Adwaita Fonts All](https://gitlab.gnome.org/GNOME/adwaita-fonts)
- [Adwaita Icon Theme](https://gitlab.gnome.org/GNOME/adwaita-icon-theme)
- [Blueman](https://github.com/blueman-project/blueman)
- [Grim](https://gitlab.freedesktop.org/emersion/grim)
- [Gvfs](https://gitlab.gnome.org/GNOME/gvfs)
- [Gvfs Mtp](https://gitlab.gnome.org/GNOME/gvfs)
- [Network Manager Applet](https://gitlab.gnome.org/GNOME/network-manager-applet)
- [Openssh Askpass](https://www.openssh.com/)
- [Sddm](https://github.com/sddm/sddm)
- [Slurp](https://github.com/emersion/slurp)
- [Swayidle](https://github.com/swaywm/swayidle)
- [SwayNotificationCenter](https://github.com/ErikReider/SwayNotificationCenter)
- [Thunar Volman](https://gitlab.xfce.org/xfce/thunar-volman)
- [Tumbler](https://gitlab.xfce.org/xfce/tumbler)
- [Ulauncher](https://ulauncher.io/)
- [Waybar](https://github.com/Alexays/Waybar)
- [Wl Clipboard](https://github.com/bugaevc/wl-clipboard)
- [Xdg Desktop Portal Gtk](https://github.com/flatpak/xdg-desktop-portal-gtk)
- [Xdg Desktop Portal Wlr](https://github.com/emersion/xdg-desktop-portal-wlr)
- [Xfce Polkit](https://github.com/ncopa/xfce-polkit)

#### [Terra](https://terra.fyralabs.com)
- [nwg-look](https://github.com/nwg-piotr/nwg-look)
- [SwayFX](https://github.com/swaywm/swayfx)
- [Swaylock Effects](https://github.com/mortie/swaylock-effects)

#### External Packages
- [SwayOSD](https://github.com/ErikReider/SwayOSD) from [erikreider/swayosd on COPR](https://copr.fedorainfracloud.org/coprs/erikreider/swayosd)
- [UWSM](https://github.com/Vladimir-csp/uwsm) from [solopasha/hyprland on COPR](https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/)

### Removed Packages


### Preserved Packages
- [Gnome Disk Utility](https://gitlab.gnome.org/GNOME/gnome-disk-utility)
- [gnome-keyring](https://gitlab.gnome.org/GNOME/gnome-keyring)
- [gnome-keyring-pam](https://gitlab.gnome.org/GNOME/gnome-keyring)
- [pinentry-gnome3](https://www.gnupg.org/aegypten)
