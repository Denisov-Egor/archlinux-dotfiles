#!/bin/bash

mute=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ 2>/dev/null)

if echo "$mute" | grep -q MUTED; then
    echo '{"text":"󰍭","tooltip":"Микрофон выключен","class":"muted"}'
else
    volume=$(echo "$mute" | awk '{printf "%.0f", $2 * 100}')
    echo "{\"text\":\"󰍬 ${volume}%\",\"tooltip\":\"Микрофон включён: ${volume}%\",\"class\":\"on\"}"
fi