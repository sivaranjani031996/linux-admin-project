#!/bin/bash

SOURCE="/company"
BACKUP_DIR="/backup/company"
LOG_DIR="/var/log/company-admin"
LOG_FILE="$LOG_DIR/backup-company.log"

mkdir -p "$LOG_DIR"

if [ "$EUID" -ne 0 ]; then
    echo "Dieses Skript muss mit sudo ausgeführt werden."
    exit 1
fi

mkdir -p "$BACKUP_DIR"

DATE=$(date '+%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="$BACKUP_DIR/company-$DATE.tar.gz"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup gestartet" >> "$LOG_FILE"

if tar -czf "$BACKUP_FILE" "$SOURCE"; then
    echo "Backup erfolgreich: $BACKUP_FILE" | tee -a "$LOG_FILE"
else
    echo "Backup FEHLGESCHLAGEN" | tee -a "$LOG_FILE"
    exit 1
fi

find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -delete

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup beendet" >> "$LOG_FILE"