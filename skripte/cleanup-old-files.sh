#!/bin/bash

LOG_DIR="/var/log/company-admin"
LOG_FILE="$LOG_DIR/cleanup-old-files.log"

# Root-Rechte prüfen
if [ "$EUID" -ne 0 ]; then
    echo "Dieses Skript muss mit sudo ausgeführt werden."
    exit 1
fi

mkdir -p "$LOG_DIR"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Cleanup gestartet" | tee -a "$LOG_FILE"

# Alte Dateien im temporären Verzeichnis löschen
find /tmp -type f -mtime +7 -delete 2>/dev/null

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Cleanup beendet" | tee -a "$LOG_FILE"

