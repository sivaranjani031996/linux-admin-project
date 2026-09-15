# 09 – Testprotokoll / Test Protocol

### Ziel
Alle Pflichtfunktionen werden systematisch getestet. Die Aufgabenstellung verlangt mindestens 16 Tests.

| Nr. | Test | Erwartetes Ergebnis | Ergebnis | Status |
|---:|---|---|---|---|
| 1 | SSH-Verbindung | Login funktioniert | | ☐ |
| 2 | Hostname | `server01` | | ☐ |
| 3 | Benutzerprüfung | Benutzer vorhanden | | ☐ |
| 4 | Sales-Rechte | Zugriff erlaubt | | ☐ |
| 5 | Accounting-Zugriff | Schreiben für Sales verweigert | | ☐ |
| 6 | setup-users zweimal | Keine Duplikate/Fehler | | ☐ |
| 7 | setup-folders | Struktur korrekt | | ☐ |
| 8 | Backup | tar.gz erzeugt | | ☐ |
| 9 | Restore | Datei wiederhergestellt | | ☐ |
| 10 | Cron | Job wird ausgeführt | | ☐ |
| 11 | Diskcheck | Speicher wird korrekt angezeigt | | ☐ |
| 12 | Servicecheck | SSH/Cron/UFW erkannt | | ☐ |
| 13 | SSH-Audit | Logins ausgewertet | | ☐ |
| 14 | Log-Report | Bericht erzeugt | | ☐ |
| 15 | Daily Report | Tagesbericht erzeugt | | ☐ |
| 16 | UFW | Firewall aktiv und SSH erlaubt | | ☐ |

### Testprotokoll-Details

Für jeden Test dokumentieren:

**Test Nr.:**  
**Datum:**  
**Befehl:**  
**Erwartetes Ergebnis:**  
**Tatsächliches Ergebnis:**  
**Screenshot:**  
**Status:** Erfolgreich / Fehler