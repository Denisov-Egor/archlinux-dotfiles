#!/bin/bash

wal_file="$HOME/.cache/wal/wal"

if [ -f "$wal_file" ]; then
    wallpaper=$(cat "$wal_file")
    name=$(basename "$wallpaper")

    echo "{\"text\":\"󰸉 ${name}\",\"tooltip\":\"Текущие обои:\\n${wallpaper}\"}"
else
    echo '{"text":"󰸉 —","tooltip":"Обои не определены"}'
fi