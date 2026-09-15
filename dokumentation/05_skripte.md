# 05 – Administrationsskripte / Administration Scripts

### Ziel
Wiederkehrende Verwaltungsaufgaben werden mit Bash-Skripten automatisiert.

### Pflichtskripte

| Skript | Funktion |
|---|---|
| `setup-users.sh` | Benutzer und Gruppen aus CSV erstellen |
| `setup-folders.sh` | Firmenordner und Rechte einrichten |
| `backup-company.sh` | `/company` sichern |
| `restore-company.sh` | Dateien wiederherstellen |
| `check-disk.sh` | Speicherplatz prüfen |
| `check-services.sh` | SSH, Cron und UFW prüfen |
| `ssh-audit.sh` | SSH-Zustand und Logins prüfen |
| `log-report.sh` | Logs auswerten |
| `cleanup-old-files.sh` | alte Dateien bereinigen |
| `daily-admin-report.sh` | täglichen Systembericht erstellen |

### Ablage

```text
/opt/company/scripts
```

Skripte ausführbar machen:

```bash
sudo chmod +x /opt/company/scripts/*.sh
```

### Anforderungen
Die Skripte sollen:
- Fehler erkennen
- verständliche Ausgaben erzeugen
- relevante Aktionen protokollieren
- bei wiederholter Ausführung keinen fehlerhaften Zustand erzeugen
- sichere Pfade verwenden

### Logging

Eigene Logs:

```text
/var/log/company-admin/
```

Beispiel:

```bash
sudo ls -lah /var/log/company-admin/
```
