# Arch Linux Dotfiles

Personal **Arch Linux + Hyprland** configuration focused on a clean, minimal and reproducible desktop environment.

> ⚠️ This repository contains my personal configuration. Some paths, applications and settings may be specific to my hardware and workflow.

---

## ✦ Overview

This repository contains my complete desktop configuration for Arch Linux, including:

* **Hyprland** — Wayland compositor
* **Waybar** — status bar
* **Kitty** — terminal
* **Zsh + Starship** — shell environment
* **Neovim** — editor
* **Wofi** — application launcher
* **Zellij** — terminal multiplexer
* **WirePlumber / PipeWire** — audio configuration
* **GTK** — desktop appearance
* **Systemd user services** — background tasks
* **Wallpaper automation**
* **Happ** autostart configuration

The repository also contains package lists for both official Arch repositories and the AUR.

---

## ✦ Features

### Desktop

* Hyprland-based Wayland environment
* Minimal UI
* Waybar
* Wofi
* GTK 3 / GTK 4 configuration
* Custom application and terminal configuration
* Automated wallpaper handling

### Shell

* Zsh
* Bash
* Starship prompt
* zoxide
* zsh-autosuggestions
* zsh-syntax-highlighting
* Useful CLI utilities

### Development

* Neovim
* Git
* CMake
* GDB
* Valgrind
* Node.js / npm
* .NET SDK
* Rust toolchain

### Media

* MPV
* VLC
* Cava
* CMUS
* Yandex Music

### System

* PipeWire
* WirePlumber
* NVIDIA configuration
* Bluetooth
* NetworkManager
* zram
* systemd user services

---

## ✦ Repository Structure

```text
.
├── .bashrc
├── .zshrc
├── starship.toml
│
├── packages.txt
├── aur-packages.txt
│
├── install.sh
│
├── autostart/
│   └── Happ.desktop
│
├── systemd/
│   └── user/
│       ├── wallpaper.service
│       └── wallpaper.timer
│
├── btop/
├── cava/
├── cmus/
├── fastfetch/
├── gtk-3.0/
├── gtk-4.0/
├── hypr/
├── kitty/
├── nvim/
├── nwg-look/
├── ranger/
├── waybar/
├── wireplumber/
├── wofi/
├── xsettingsd/
├── zathura/
└── zellij/
```

---

## ✦ Installation

Clone the repository:

```bash
git clone git@github.com:Denisov-Egor/archlinux-dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Run the installer:

```bash
bash install.sh
```

The installer will:

1. Install official packages from `packages.txt`
2. Install AUR packages from `aur-packages.txt`
3. Create required configuration directories
4. Back up existing configuration files
5. Create symlinks to the repository
6. Reload systemd user units
7. Enable the wallpaper timer when available

---

## ✦ Backup

The installer does **not** blindly overwrite existing configuration.

Existing files are moved to a timestamped backup directory:

```text
~/.dotfiles-backup/YYYYMMDD-HHMMSS/
```

For example:

```text
~/.dotfiles-backup/
└── 20260901-153936/
    ├── .bashrc
    ├── .zshrc
    └── starship.toml
```

This makes the installation reversible and protects existing configuration.

---

## ✦ Symlink-based Configuration

Configuration files are linked directly to the repository.

For example:

```text
~/.config/hypr
        ↓
~/dotfiles/hypr
```

and:

```text
~/.zshrc
        ↓
~/dotfiles/.zshrc
```

This means configuration changes can be tracked with Git immediately.

---

## ✦ Package Management

### Official repositories

Packages are listed in:

```text
packages.txt
```

Installation:

```bash
sudo pacman -S --needed - < packages.txt
```

### AUR

AUR packages are listed in:

```text
aur-packages.txt
```

The installer uses `yay` when it is available.

---

## ✦ Installer Safety

The installer was tested against a temporary `$HOME` environment.

The test verifies:

* existing configuration is backed up
* configuration files become symlinks
* directories are linked correctly
* systemd units are linked
* repeated installation does not create unnecessary backups
* the repository remains clean after testing

The installer is designed to be **idempotent**:

```text
first run  → create links
second run → Already linked
```

---

## ✦ Validation

Shell syntax is checked with:

```bash
bash -n install.sh
```

Static analysis is performed with:

```bash
shellcheck install.sh
```

Repository state:

```bash
git status
```

Package lists are also checked for duplicates.

---

## ✦ Philosophy

The goal of this repository is not to provide a universal Arch Linux setup.

It is a **personal, reproducible Linux environment** where:

* configuration is version-controlled
* installation is automated
* existing files are protected
* changes are easy to review
* the desktop remains minimal
* the entire setup can be restored from Git

---

## ✦ Screenshots

Screenshots will be added here.

```text
Hyprland
Waybar
Kitty
Neovim
Wofi
```

---

## ✦ Disclaimer

This configuration is primarily designed for my own Arch Linux installation.

Before running the installer on another machine, review:

```text
install.sh
packages.txt
aur-packages.txt
```

Hardware-specific configuration, package choices and application settings may need to be adjusted.

---

## License

Personal configuration. Use, modify and adapt it as needed.
