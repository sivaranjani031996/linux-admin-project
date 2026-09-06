# 06 – Cronjobs

### Ziel
Regelmäßige Verwaltungsaufgaben sollen automatisch ausgeführt werden.

### Cron prüfen

```bash
systemctl status cron
sudo systemctl enable --now cron
```

Aktuelle Root-Crontab anzeigen:

```bash
sudo crontab -l
```

Crontab bearbeiten:

```bash
sudo crontab -e
```

### Nachweis
Die konkreten Cronjobs aus der Aufgabenstellung werden hier eingetragen

### Ausführung prüfen

```bash
sudo journalctl -u cron --no-pager
```

Zusätzlich können systemweite Cron-Logs geprüft werden, abhängig von der Ubuntu-Konfiguration.

### Fehleranalyse
Wenn ein Cronjob nicht funktioniert:
1. Crontab prüfen.
2. Pfade mit absoluten Pfaden verwenden.
3. Rechte des Skripts prüfen.
4. Umgebung von Cron berücksichtigen.
5. Cron-Logs prüfen.
6. Skript manuell testen.
7. Nach der Korrektur erneut prüfen.
