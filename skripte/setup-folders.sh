#!/bin/bash

LOG_DIR="/var/log/company-admin"
LOG_FILE="$LOG_DIR/setup-folders.log"

if [ "$EUID" -ne 0 ]; then
    echo "Dieses Skript muss mit sudo ausgeführt werden."
    exit 1
fi

mkdir -p "$LOG_DIR"

mkdir -p /company/it
mkdir -p /company/sales
mkdir -p /company/accounting
mkdir -p /company/management
mkdir -p /company/public

chown root:it /company/it
chown root:sales /company/sales
chown root:accounting /company/accounting
chown root:management /company/management
chown root:employees /company/public

chmod 770 /company/it
chmod 770 /company/sales
chmod 770 /company/accounting
chmod 770 /company/management
chmod 775 /company/public

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Ordnerstruktur eingerichtet" >> "$LOG_FILE"

ls -ld /company/* | tee -a "$LOG_FILE"