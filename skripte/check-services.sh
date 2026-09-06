#!/bin/bash

LOG_FILE="/var/log/company-admin/services.log"

echo "=== Service Status ===" | tee -a "$LOG_FILE"

for SERVICE in ssh cron ufw
do
    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE: ACTIVE" | tee -a "$LOG_FILE"
    else
        echo "$SERVICE: NOT ACTIVE" | tee -a "$LOG_FILE"
    fi
done