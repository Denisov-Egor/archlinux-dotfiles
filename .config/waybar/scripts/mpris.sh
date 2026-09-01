#!/bin/bash

player=$(playerctl -l 2>/dev/null | head -n 1)

if [ -z "$player" ]; then
    echo '{"text":"󰝚 —","tooltip":"Музыка не запущена","class":"stopped"}'
    exit 0
fi

status=$(playerctl status 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

if [ -z "$title" ]; then
    echo '{"text":"󰝚 —","tooltip":"Нет текущего трека","class":"stopped"}'
    exit 0
fi

text="󰝚 $artist — $title"

if [ "$status" = "Playing" ]; then
    class="playing"
    icon="󰐊"
else
    class="paused"
    icon="󰏤"
fi

tooltip="$artist — $title\nСтатус: $status"

printf '{"text":"%s %s","tooltip":"%s","class":"%s"}\n' \
    "$icon" \
    "$text" \
    "$tooltip" \
    "$class"