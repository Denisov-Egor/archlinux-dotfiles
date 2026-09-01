#!/bin/bash

# Получаем выбранную запись из cliphist
selected=$(cliphist list | wofi --dmenu --prompt "Clipboard")

# Если ничего не выбрано — выходим
[ -z "$selected" ] && exit 0

# Декодируем выбранную запись и помещаем её в буфер
cliphist decode <<< "$selected" | wl-copy

# Небольшая задержка, чтобы wl-copy успел установить буфер
sleep 0.05

# Вставляем содержимое в активное окно
wtype -M ctrl -k v -m ctrl
