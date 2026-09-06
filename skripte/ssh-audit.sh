#!/bin/bash

LOG_FILE="/var/log/company-admin/ssh-audit.log"

echo "=== SSH AUDIT ===" | tee -a "$LOG_FILE"

systemctl is-active ssh | tee -a "$LOG_FILE"

echo "Successful logins:"
last | head -10 | tee -a "$LOG_FILE"

echo "Failed login attempts:"
journalctl _SYSTEMD_UNIT=ssh.service | grep -i "failed" | tail -20 | tee -a "$LOG_FILE"

echo "Root Login setting:"
grep -i "PermitRootLogin" /etc/ssh/sshd_config | tee -a "$LOG_FILE"