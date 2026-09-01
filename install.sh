#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

log() {
    printf '\n==> %s\n' "$1"
}

backup_and_link() {
    local source="$1"
    local target="$2"

    mkdir -p "$(dirname "$target")"

    if [ -e "$target" ] || [ -L "$target" ]; then
        if [ -L "$target" ] && [ "$(readlink -f "$target")" = "$(readlink -f "$source")" ]; then
            echo "Already linked: $target"
            return
        fi

        mkdir -p "$BACKUP_DIR"
        echo "Backing up: $target"
        mv "$target" "$BACKUP_DIR/"
    fi

    ln -s "$source" "$target"
    echo "Linked: $target -> $source"
}

install_packages() {
    log "Installing official packages"

    if [ -f "$DOTFILES_DIR/packages.txt" ]; then
        sudo pacman -S --needed - < "$DOTFILES_DIR/packages.txt"
    fi

    if [ -f "$DOTFILES_DIR/aur-packages.txt" ]; then
        if command -v yay >/dev/null 2>&1; then
            log "Installing AUR packages"
            yay -S --needed - < "$DOTFILES_DIR/aur-packages.txt"
        else
            echo "WARNING: yay is not installed."
            echo "Skipping AUR packages."
        fi
    fi
}

install_config() {
    log "Installing configuration files"

    # Shell
    backup_and_link "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
    backup_and_link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    backup_and_link "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"

    # XDG configuration
    local configs=(
        btop
        cava
        cmus
        fastfetch
        gtk-3.0
        gtk-4.0
        hypr
        kitty
        nvim
        nwg-look
        ranger
        waybar
        wireplumber
        wofi
        xsettingsd
        zathura
        zellij
    )

    for config in "${configs[@]}"; do
        backup_and_link \
            "$DOTFILES_DIR/$config" \
            "$HOME/.config/$config"
    done

    # Autostart
    mkdir -p "$HOME/.config/autostart"
    backup_and_link \
        "$DOTFILES_DIR/autostart/Happ.desktop" \
        "$HOME/.config/autostart/Happ.desktop"

    # systemd user units
    mkdir -p "$HOME/.config/systemd/user"

    for unit in "$DOTFILES_DIR"/systemd/user/*; do
        [ -e "$unit" ] || continue

        backup_and_link \
            "$unit" \
            "$HOME/.config/systemd/user/$(basename "$unit")"
    done
}

enable_services() {
    log "Reloading systemd user units"

    systemctl --user daemon-reload

    if [ -f "$HOME/.config/systemd/user/wallpaper.timer" ]; then
        systemctl --user enable --now wallpaper.timer
    fi
}

main() {
    log "Arch Linux dotfiles installer"
    echo "Repository: $DOTFILES_DIR"
    echo "Backup:     $BACKUP_DIR"

    install_packages
    install_config
    enable_services

    log "Installation complete"

    if [ -d "$BACKUP_DIR" ]; then
        echo "Previous configuration was backed up to:"
        echo "$BACKUP_DIR"
    fi
}

main "$@"
