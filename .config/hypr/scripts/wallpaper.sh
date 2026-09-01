#!/bin/bash

DIR="$HOME/Pictures/Wallpapers"
CACHE="$HOME/.cache/awww/current_wallpaper"

mkdir -p "$(dirname "$CACHE")"

CURRENT=""

if [ -f "$CACHE" ]; then
    CURRENT=$(cat "$CACHE")
fi

mapfile -t WALLPAPERS < <(
    find "$DIR" -type f \
        \( -iname "*.jpg" \
        -o -iname "*.jpeg" \
        -o -iname "*.png" \
        -o -iname "*.webp" \)
)

if [ "${#WALLPAPERS[@]}" -eq 0 ]; then
    notify-send "Wallpaper" "Нет изображений в ~/Pictures/Wallpapers"
    exit 1
fi

if [ "${#WALLPAPERS[@]}" -eq 1 ]; then
    WALLPAPER="${WALLPAPERS[0]}"
else
    WALLPAPER=$(printf '%s\n' "${WALLPAPERS[@]}" | grep -Fxv "$CURRENT" | shuf -n 1)
fi

echo "$WALLPAPER" > "$CACHE"

# Меняем обои через awww
awww img "$WALLPAPER" \
    --transition-type random \
    --transition-duration 1

# Генерируем цветовую схему Pywal
wal -i "$WALLPAPER" -n

# Обновляем Waybar
pkill -SIGUSR2 waybar