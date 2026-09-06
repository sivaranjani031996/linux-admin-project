#!/bin/bash

REPORT_DIR="/var/log/company-admin"
REPORT="$REPORT_DIR/daily-report-$(date '+%Y-%m-%d').txt"

mkdir -p "$REPORT_DIR"

{
echo "========================================"
echo "XYZ GmbH - Daily Admin Report"
echo "Datum: $(date)"
echo "Server: $(hostname)"
echo "========================================"

echo
echo "=== Speicher ==="
df -h /

echo
echo "=== Dienste ==="
systemctl is-active ssh
systemctl is-active cron
systemctl is-active ufw

echo
echo "=== SSH ==="
systemctl is-active ssh
last | head -5

echo
echo "=== Backup ==="
ls -lh /backup/company | head

echo
echo "=== Ende Bericht ==="

} > "$REPORT"

echo "Daily Report erstellt: $REPORT"