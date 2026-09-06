#!/bin/bash

LOG_FILE="/var/log/company-admin/disk.log"

USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
FREE=$(df -h / | awk 'NR==2 {print $4}')
USED=$(df -h / | awk 'NR==2 {print $3}')

echo "Disk usage: $USAGE%"
echo "Used: $USED"
echo "Free: $FREE"

if [ "$USAGE" -ge 80 ]; then
    echo "WARNUNG: Speicherplatz über 80%"
    echo "[$(date)] WARNUNG: Disk usage $USAGE%" >> "$LOG_FILE"
else
    echo "Speicherplatz ist OK."
fi