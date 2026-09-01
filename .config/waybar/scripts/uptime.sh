#!/bin/bash

uptime_text=$(uptime -p | sed 's/up //')

echo "{\"text\":\"󰔟 ${uptime_text}\",\"tooltip\":\"Система работает: ${uptime_text}\"}"