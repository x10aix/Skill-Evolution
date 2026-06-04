# obsidian-inbox-writer: Architektur & Funktionsweise

**Version:** 1.1 — Prozess-Konformität & Struktur-Repair (2026-06-04)

🇬🇧 [Read in English](README.md)

> **Plattform-Hinweis:** Dieser Skill ist **plattform-agnostisch** konzipiert. Er funktioniert auf Claude Code, ChatGPT Desktop (mit Dateisystem-Zugriff), Claude.ai / ChatGPT Web (als Codeblock-Output) und Antigravity (direkter Datei-Write). Er ist der leichtgewichtige Eingangspunkt des x10aix Second Brain — Sortierung und Kuration übernimmt der separate `obsidian-vault-curator` Skill.

---

## Was dieser Skill tut

Der `obsidian-inbox-writer` ist ein **format-enforcing Inbox-Drop-Skill**. Er schreibt — oder generiert zur manuellen Ablage — eine einzelne, korrekt formatierte Markdown-Notiz in den `00_Inbox/Inbox_Antigravity/`-Ordner des x10aix Obsidian Vaults.

Er trifft **keine inhaltlichen Entscheidungen** über PARA-Zuordnung, Verlinkung oder Deduplizierung. Diese Aufgaben liegen beim nachgelagerten `obsidian-vault-curator`-Prozess (Antigravity).

**Er ist kein CRUD-Skill.** Zum Lesen, Verschieben oder Löschen von Vault-Notes werden andere Werkzeuge genutzt.

---

## Warum er existiert — Intent

### Das Problem

Der `obsidian-vault-curator` ist mächtig, aber zu komplex für Claude und ChatGPT: Er erfordert PARA-Routing-Entscheidungen, Duplikat-Prüfungen im Dateisystem und Schreibzugriff. Unterschiedliche Modelle würden ohne einheitlichen, minimalen Skill jedes Mal ihr eigenes Format erfinden — inkonsistente Frontmatter-Felder, fehlende Tags, falsche Ordner.

### Der gewählte Weg: Strikte Aufgabenteilung

Anstatt einen universellen Skill zu bauen, wurde die Verantwortung explizit aufgeteilt:

| Aufgabe | Skill | Plattformen |
|:---|:---|:---|
| Notiz korrekt formatiert in Inbox schreiben | `obsidian-inbox-writer` | Alle (Claude, ChatGPT, Antigravity) |
| Sortieren, PARA-Routing, Linken, Kuratieren | `obsidian-vault-curator` | Nur Antigravity |

Die Inbox fungiert als **Pufferzone**: Jede Notiz landet dort zuerst, unabhängig vom Modell. Der nachgelagerte Ingestion-Prozess (`run_ingestion.ps1`) oder der Vault-Kurator entscheiden dann über die finale Ablage.

### Warum einheitlicher Output wichtiger ist als Smart Placement

Wenn Claude eine Notiz als `insight` in einen falschen PARA-Ordner schreibt und ChatGPT sie als `resource` in einen anderen, entstehen Inkonsistenzen die schwer zu bereinigen sind. Wenn beide immer in die Inbox schreiben — mit identischem Schema — kann ein einziger Antigravity-Prozess die Sortierung übernehmen und hat dabei volle Kontrolle.

---

## Wichtige Design-Entscheidungen

| Entscheidung | Begründung |
|:---|:---|
| **Inbox-Only** | Eliminiert PARA-Routing-Fehler durch Modelle ohne Vault-Kontext |
| **Fixes Dateiname-Format** (`YYYY-MM-DD — Titel.md`) | Chronologische Sortierung, kollisionsarm, sofort lesbar |
| **`inbox: true` Frontmatter-Flag** | Ermöglicht automatisches Filtern durch Vault-Kurator und Dataview-Queries |
| **Plattform-Fallback** (Dateisystem vs. Codeblock) | Skill funktioniert auf allen Plattformen ohne separate Versionen |
| **Kein Constraint-Dialog** | Fehler werden still korrigiert, nicht in Rückfragen eskaliert — schnelles Ablegen hat Vorrang |

---

## Beziehung zu anderen Skills

```
[Claude / ChatGPT / Antigravity]
         │
         │  schreibt in
         ▼
[obsidian-inbox-writer]   ←── dieser Skill (Inbox Drop, einheitliches Format)
         │
         │  landet in
         ▼
[00_Inbox/Inbox_Antigravity/]   x10aix Obsidian Vault
         │
         │  wird kuratiert von
         ▼
[obsidian-vault-curator]   (Antigravity only — PARA-Routing, Linking, Dedup)
```

Der `run_watcher.ps1` (RAG-intern) überwacht den Downloads-Ordner und leitet `.md`-Dateien automatisch in die Inbox — komplementär zu diesem Skill.

---

## Entstehung

Gebaut am **04.06.2026** als Ergänzung zum `obsidian-vault-curator`. Auslöser war der Wunsch, Claude und ChatGPT mit demselben Vault-Schreib-Skill auszustatten wie Antigravity — ohne die Komplexität des Kurators auf Plattformen zu bringen, die keinen vollständigen Vault-Kontext haben.

---

## Backlog

| Punkt | Priorität | Hinweise |
|:---|:---|:---|
| **Tag-Normalisierung** | Mittel | Abgleich gegen `tag-catalog.json` — aktuell werden Tags unkontrolliert vergeben. Sinnvoll sobald der Vault mehr als 500 Notes hat. |
| **Automatische Inbox-Review-Note** | Niedrig | Nach jedem Inbox-Drop eine Review-Zeile in die tägliche `INBOX-REVIEW-YYYY-MM-DD.md` schreiben. |
| **Multi-Vault Support** | Niedrig | Vault-Pfad konfigurierbar machen sobald ein zweiter Nutzer den Skill einsetzt. |

---

*(Dieses Dokument ist eine manuell gepflegte Systembeschreibung des Skills)*
