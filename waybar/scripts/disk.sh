#!/bin/bash

usage=$(df -h / | awk 'NR==2 {print $5}')
used=$(df -h / | awk 'NR==2 {print $3}')
total=$(df -h / | awk 'NR==2 {print $2}')

echo "{\"text\":\"󰋊 ${usage}\",\"tooltip\":\"Диск /\nИспользовано: ${used}\nВсего: ${total}\"}"