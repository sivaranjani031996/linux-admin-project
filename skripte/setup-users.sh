#!/bin/bash

LOG_DIR="/var/log/company-admin"
LOG_FILE="$LOG_DIR/setup-users.log"
GROUP_FILE="/opt/company/data/groups.csv"
USER_FILE="/opt/company/data/users.csv"

# ============================================================
# ROOT CHECK
# ============================================================

if [ "$EUID" -ne 0 ]; then
    echo "Dieses Skript muss mit sudo ausgeführt werden."
    exit 1
fi

# ============================================================
# LOG DIRECTORY
# ============================================================

sudo mkdir -p "$LOG_DIR"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] setup-users gestartet" >> "$LOG_FILE"

# ============================================================
# CHECK CSV FILES
# ============================================================

if [ ! -f "$GROUP_FILE" ]; then
    echo "FEHLER: groups.csv nicht gefunden: $GROUP_FILE" | tee -a "$LOG_FILE"
    exit 1
fi

if [ ! -f "$USER_FILE" ]; then
    echo "FEHLER: users.csv nicht gefunden: $USER_FILE" | tee -a "$LOG_FILE"
    exit 1
fi

# ============================================================
# GROUPS / GRUPPEN
# ============================================================

echo "=== Gruppen werden eingerichtet ===" | tee -a "$LOG_FILE"

tail -n +2 "$GROUP_FILE" | while IFS=',' read -r groupname description
do
    # Remove possible whitespace
    groupname="$(echo "$groupname" | xargs)"

    if [ -z "$groupname" ]; then
        continue
    fi

    # Check if group already exists
    if getent group "$groupname" > /dev/null 2>&1; then
        echo "Gruppe existiert bereits: $groupname" | tee -a "$LOG_FILE"
    else
        # Create group
        if sudo groupadd "$groupname"; then
            echo "Gruppe erstellt: $groupname" | tee -a "$LOG_FILE"
        else
            echo "FEHLER beim Erstellen der Gruppe: $groupname" | tee -a "$LOG_FILE"
        fi
    fi
done

# ============================================================
# USERS / BENUTZER
# ============================================================

echo "=== Benutzer werden eingerichtet ===" | tee -a "$LOG_FILE"

tail -n +2 "$USER_FILE" | while IFS=',' read -r username primary_group additional_group fullname
do
    username="$(echo "$username" | xargs)"
    primary_group="$(echo "$primary_group" | xargs)"
    additional_group="$(echo "$additional_group" | xargs)"
    fullname="$(echo "$fullname" | xargs)"

    if [ -z "$username" ]; then
        continue
    fi

    # ========================================================
    # CHECK PRIMARY GROUP
    # ========================================================

    if ! getent group "$primary_group" > /dev/null 2>&1; then
        echo "FEHLER: Primäre Gruppe existiert nicht: $primary_group für $username" | tee -a "$LOG_FILE"
        continue
    fi

    # ========================================================
    # CREATE USER
    # ========================================================

    if id "$username" > /dev/null 2>&1; then
        echo "Benutzer existiert bereits: $username" | tee -a "$LOG_FILE"
    else
        if sudo useradd -m -g "$primary_group" -c "$fullname" "$username"; then
            echo "Benutzer erstellt: $username" | tee -a "$LOG_FILE"
        else
            echo "FEHLER beim Erstellen des Benutzers: $username" | tee -a "$LOG_FILE"
            continue
        fi
    fi

    # ========================================================
    # ADDITIONAL GROUP
    # ========================================================

    if [ -n "$additional_group" ]; then

        if getent group "$additional_group" > /dev/null 2>&1; then

            if sudo usermod -aG "$additional_group" "$username"; then
                echo "Zusatzgruppe hinzugefügt: $additional_group -> $username" | tee -a "$LOG_FILE"
            else
                echo "FEHLER bei Zusatzgruppe: $additional_group -> $username" | tee -a "$LOG_FILE"
            fi

        else
            echo "FEHLER: Zusatzgruppe existiert nicht: $additional_group" | tee -a "$LOG_FILE"
        fi

    fi

done

# ============================================================
# FINISH
# ============================================================

echo "[$(date '+%Y-%m-%d %H:%M:%S')] setup-users beendet" >> "$LOG_FILE"

echo "=== setup-users abgeschlossen ==="

