#!/bin/bash

if ! command -v nvidia-smi >/dev/null 2>&1; then
    echo '{"text":"GPU N/A","tooltip":"nvidia-smi не найден","class":"error"}'
    exit 0
fi

util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null | head -n1)
temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits 2>/dev/null | head -n1)

if [ -z "$util" ]; then
    echo '{"text":"󰢮 N/A","tooltip":"GPU недоступен","class":"error"}'
    exit 0
fi

echo "{\"text\":\"󰢮 ${util}%\",\"tooltip\":\"NVIDIA GPU\nЗагрузка: ${util}%\nТемпература: ${temp}°C\"}"