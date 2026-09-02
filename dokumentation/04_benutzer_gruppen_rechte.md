# 04 – Benutzer, Gruppen und Rechte 

### Ziel
Benutzer und Gruppen werden zentral über CSV-Dateien verwaltet. Die Erstellung erfolgt automatisiert mit `setup-users.sh`.

### Gruppen

```csv
groupname,description
it,IT-Abteilung
sales,Vertrieb
accounting,Buchhaltung
management,Geschäftsführung
employees,Alle Mitarbeiter
```

### Benutzer

```csv
username,primary_group,additional_group,fullname
it.admin,it,employees,IT Administrator
support01,it,employees,Support Mitarbeiter 01
sales01,sales,employees,Vertrieb Mitarbeiter 01
sales02,sales,employees,Vertrieb Mitarbeiter 02
accounting01,accounting,employees,Buchhaltung Mitarbeiter 01
management01,management,employees,Geschäftsführung 01
intern01,employees,,Praktikant 01
```

### Rechtekonzept

| Ordner | Gruppe | Rechte |
|---|---|---|
| `/company/it` | `it` | 770 |
| `/company/sales` | `sales` | 770 |
| `/company/accounting` | `accounting` | 770 |
| `/company/management` | `management` | 770 |
| `/company/public` | `employees` | 775 oder 770 |
| `/backup/company` | `root` oder `it` | 700 oder 750 |

### Prüfung

```bash
id it.admin
id sales01
groups sales01
getent group it
getent group sales
ls -ld /company/*
```

### Warum Gruppen?
Gruppen ermöglichen eine zentrale und nachvollziehbare Rechteverwaltung. Benutzer müssen nicht einzeln auf jedem Ordner berechtigt werden.