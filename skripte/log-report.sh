#!/bin/bash

REPORT="/var/log/company-admin/log-report-$(date '+%Y-%m-%d').txt"

{
echo "================================"
echo "Daily Log Report"
echo "Datum: $(date)"
echo "================================"

echo
echo "=== Active Users ==="
who

echo
echo "=== Failed SSH Attempts ==="
journalctl _SYSTEMD_UNIT=ssh.service | grep -i failed | tail -20

echo
echo "=== Important Services ==="
systemctl is-active ssh
systemctl is-active cron
systemctl is-active ufw

echo
echo "=== Recent System Messages ==="
journalctl -p warning -n 20

} > "$REPORT"

echo "Report erstellt: $REPORT"