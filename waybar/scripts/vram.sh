#!/bin/bash

if ! command -v nvidia-smi >/dev/null 2>&1; then
    echo '{"text":"VRAM N/A","tooltip":"nvidia-smi не найден"}'
    exit 0
fi

used=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits 2>/dev/null | head -n1)
total=$(nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits 2>/dev/null | head -n1)

if [ -z "$used" ] || [ -z "$total" ]; then
    echo '{"text":"VRAM N/A"}'
    exit 0
fi

percent=$((used * 100 / total))

echo "{\"text\":\"󰍹 ${percent}%\",\"tooltip\":\"VRAM\nИспользовано: ${used} MiB\nВсего: ${total} MiB\nЗагрузка: ${percent}%\"}"2