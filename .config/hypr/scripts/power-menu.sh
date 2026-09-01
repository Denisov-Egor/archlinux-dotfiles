#!/usr/bin/env bash

# ==========================================
# Hyprland Power Menu
# Minimal / Dark / Japanese
# ==========================================

entries="\
󰌾  Заблокировать
󰤄  Сон
󰜉  Перезагрузка
󰐥  Выключение"

choice=$(printf '%s\n' "$entries" | wofi \
    --dmenu \
    --conf ~/.config/wofi/power-menu.conf \
    --style ~/.config/wofi/power-menu.css \
    --cache-file /dev/null)

case "$choice" in
    "󰌾  Заблокировать")
        hyprlock
        ;;

    "󰤄  Сон")
        systemctl suspend
        ;;

    "󰜉  Перезагрузка")
        systemctl reboot
        ;;

    "󰐥  Выключение")
        systemctl poweroff
        ;;
esac