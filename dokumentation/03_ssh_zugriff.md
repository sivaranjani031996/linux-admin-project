# 03 – SSH-Zugriff 

### Ziel
Der Ubuntu-Server soll vom eigenen Rechner aus sicher per SSH administriert werden.

### Ubuntu – SSH installieren

```bash
sudo apt update
sudo apt install openssh-server -y
```

SSH starten und beim Booten aktivieren:

```bash
sudo systemctl enable --now ssh
systemctl status ssh
```

### IP-Adresse ermitteln

```bash
ip a
ip route
hostname
```

Die tatsächliche IP-Adresse der VM wird hier eingetragen:

For Example:
```text
VM_IP = 192.168.2.53
```

### Verbindung vom Windows Host

PowerShell:

```powershell
ssh administrator@192.168.2.53
```

Nach erfolgreicher Anmeldung prüfen:

```bash
whoami
hostname
ip a
```

### SSH-Key

Auf dem Windows Host:

```powershell
ssh-keygen
```

Den öffentlichen Schlüssel anschließend auf dem Server hinterlegen. Falls `ssh-copy-id` verfügbar ist:

```powershell
ssh-copy-id administrator@192.168.2.53
```

Falls der Befehl unter Windows nicht verfügbar ist, wird der Inhalt des Public Keys manuell in `~/.ssh/authorized_keys` des Benutzers `administrator` eingetragen.

### Sicherheitsprüfung

```bash
sudo grep -i PermitRootLogin /etc/ssh/sshd_config
```

Root-Login über SSH soll nicht für die normale Administration verwendet werden.
