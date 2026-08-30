# 02 – Systemaufbau / System Architecture

### Aufbau

```text
Windows Host
     |
     | Netzwerkbrücke / Bridged Adapter
     |
VirtualBox
     |
Ubuntu Server VM
ubuntu-firmenserver
Hostname: server01
     |
     +-- /company
     |    +-- it
     |    +-- sales
     |    +-- accounting
     |    +-- management
     |    +-- public
     |
     +-- /opt/company/scripts
     +-- /opt/company/data
     +-- /var/log/company-admin
     +-- /backup/company
```

### VirtualBox-Netzwerk
Für dieses Projekt wird **Netzwerkbrücke** verwendet. Dadurch erhält die VM eine IP-Adresse im gleichen Netzwerk wie der Host.

Bei einer WLAN-Verbindung des Windows-Rechners wird in VirtualBox als Name der physische WLAN-Adapter ausgewählt, z. B. der **Realtek RTL8852BE WiFi 6 802.11ax PCIe Adapter**.

### Serverkonfiguration

| Einstellung | Wert |
|---|---|
| VM | ubuntu-firmenserver |
| OS | Ubuntu Server |
| Hostname | server01 |
| Benutzer | administrator |
| Netzwerk | Netzwerkbrücke |
| RAM | ≥ 2 GB |
| CPU | 2 |
| Festplatte | ≥ 25 GB |

### Wichtige Verzeichnisse

| Pfad | Zweck |
|---|---|
| `/company` | Firmen- und Abteilungsdaten |
| `/opt/company/scripts` | ausführbare Administrationsskripte |
| `/opt/company/data` | CSV-Dateien |
| `/var/log/company-admin` | eigene Logs und Reports |
| `/backup/company` | Backups |
