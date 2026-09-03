```bash
#!/bin/bash

SOURCE="/company"
TMPCOMPANY="/tmp/company-restore"
BACKUP_DIR="/backup/company"
LOG_DIR="/var/log/company-admin"
LOG_FILE="$LOG_DIR/restore-company.log"

# Root-Rechte prüfen
if [ "$EUID" -ne 0 ]; then
    echo "Dieses Skript muss mit sudo ausgeführt werden."
    exit 1
fi

# Verzeichnisse vorbereiten
mkdir -p "$LOG_DIR"
mkdir -p "$TMPCOMPANY"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Restore gestartet" | tee -a "$LOG_FILE"

# Neuestes Backup ermitteln
TMPTAR=$(ls -t "$BACKUP_DIR"/*.tar.gz 2>/dev/null | head -n 1)

# Prüfen, ob ein Backup vorhanden ist
if [ -z "$TMPTAR" ]; then
    echo "FEHLER: Kein Backup gefunden in $BACKUP_DIR" | tee -a "$LOG_FILE"
    exit 1
fi

echo "Restore von: $TMPTAR" | tee -a "$LOG_FILE"

# Temporäres Verzeichnis leeren
rm -rf "$TMPCOMPANY"
mkdir -p "$TMPCOMPANY"

# Backup entpacken
if tar -xzf "$TMPTAR" -C "$TMPCOMPANY"; then
    echo "Extract erfolgreich" | tee -a "$LOG_FILE"
else
    echo "Extract FEHLGESCHLAGEN" | tee -a "$LOG_FILE"
    exit 1
fi

# Prüfen, ob die Company-Daten vorhanden sind
if [ ! -d "$TMPCOMPANY/company" ]; then
    echo "FEHLER: /company wurde im Backup nicht gefunden." | tee -a "$LOG_FILE"
    exit 1
fi

# Bestehende Daten entfernen
rm -rf "$SOURCE"

# Wiederherstellen
if cp -a "$TMPCOMPANY/company" "$SOURCE"; then
    echo "Restore erfolgreich: $SOURCE" | tee -a "$LOG_FILE"
else
    echo "Restore FEHLGESCHLAGEN" | tee -a "$LOG_FILE"
    exit 1
fi

# Temporäre Dateien entfernen
rm -rf "$TMPCOMPANY"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Restore beendet" | tee -a "$LOG_FILE"
```
