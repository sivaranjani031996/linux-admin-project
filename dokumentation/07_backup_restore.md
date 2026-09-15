# 07 – Backup und Restore / Backup and Restore

### Ziel
Die Daten unter `/company` sollen regelmäßig gesichert und bei Bedarf wiederhergestellt werden können.

### Backup-Verzeichnis

```bash
sudo mkdir -p /backup/company
sudo ls -ld /backup/company
```

### Backup-Anforderungen
`backup-company.sh` soll:
- `/company` sichern
- eine `tar.gz`-Datei erzeugen
- Datum und Uhrzeit im Dateinamen verwenden
- Erfolg oder Fehler protokollieren
- Backups älter als 7 Tage löschen

Beispielprüfung:

```bash
sudo /opt/company/scripts/backup-company.sh
sudo ls -lh /backup/company
```

### Restore-Test

Testdatei erzeugen:

```bash
sudo mkdir -p /company/public/restore-test
echo "Restore test" | sudo tee /company/public/restore-test/test.txt
```

Backup durchführen:

```bash
sudo /opt/company/scripts/backup-company.sh
```

Testdatei löschen:

```bash
sudo rm /company/public/restore-test/test.txt
```

Danach die Datei mit `restore-company.sh` bzw. der dokumentierten Restore-Befehlskette wiederherstellen.

Prüfen:

```bash
cat /company/public/restore-test/test.txt
```

### Warum Restore testen?
Ein Backup ist nur dann zuverlässig, wenn die Wiederherstellung praktisch getestet wurde.
