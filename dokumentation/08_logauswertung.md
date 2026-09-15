# 08 – Logauswertung / Log Analysis

### Ziel
Der Zustand des Systems und relevante Ereignisse sollen anhand von Logs nachvollziehbar ausgewertet werden.

### SSH-Logs

```bash
journalctl -u ssh --no-pager
sudo journalctl -u ssh -n 50 --no-pager
```

### Systemmeldungen

```bash
sudo journalctl -n 100 --no-pager
```

### Eigene Projektlogs

```bash
sudo ls -lah /var/log/company-admin/
```

### Zu analysierende Informationen
- erfolgreiche SSH-Anmeldungen
- fehlgeschlagene SSH-Anmeldungen
- SSH-Service-Status
- Cron-Probleme
- Backup-Ergebnisse
- relevante Systemmeldungen
- Speicherwarnungen

### Reports
Die Skripte `ssh-audit.sh` und `log-report.sh` sollen verständliche Berichte erzeugen.

### Ergebnis

```text
Ausgewertete Logs:
________________________________________

Wichtige Ereignisse:
________________________________________

Erstellte Reports:
________________________________________
```