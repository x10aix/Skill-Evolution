---
name: obsidian-inbox-writer
description: >
  Drops a correctly formatted Markdown note into the x10aix Obsidian Inbox.
  Use whenever the user says "save this", "note this", "ins Obsidian", "in den Vault",
  "als Notiz", "speicher das", "ins Second Brain", or when a conversation produces
  something worth keeping. Also triggers when the user says "schreib das auf",
  "merk dir das", "leg das ab". Always targets the Inbox only — PARA sorting and
  curation happens separately via the obsidian-vault-curator skill (Antigravity only).
  Works on all platforms: Claude Code, ChatGPT Desktop, Antigravity (direct write),
  Claude.ai, ChatGPT Web (codeblock fallback).
---

# Obsidian Inbox Writer

Schreibt eine einheitlich formatierte Notiz direkt in den x10aix Vault-Inbox.
**Kein PARA-Routing, kein Linken, kein Kuratieren** — exakt eine Aufgabe: Inbox Drop mit validem Format.

## Use this skill when

- Der Nutzer explizit etwas ablegen will: „speicher das", „ins Obsidian", „als Notiz", „merk dir das"
- Ein Gespräch eine Erkenntnis, Entscheidung, Idee oder Ressource produziert hat, die persistent werden soll
- Der Nutzer sagt „write this to my vault" oder ähnliches in EN/DE

## Do not use this skill when

- Der Nutzer nur eine Zusammenfassung im Chat möchte (kein Ablegen)
- Es um PARA-Routing, Verlinkung oder Vault-Kuration geht → `obsidian-vault-curator`
- Es um Lesen, Suchen oder Bearbeiten bestehender Vault-Notes geht

## Instructions

### Schritt 1: Environment Check

Prüfe, ob eine `.skill-config.json` im Skill-Verzeichnis existiert und `VAULT_INBOX_PATH` enthält.

- **Datei existiert und Pfad gesetzt:** Verwende `VAULT_INBOX_PATH` als Zielordner.
- **Datei fehlt oder Pfad leer:**
  - WARNING ausgeben: `⚠️ Kein Vault-Pfad konfiguriert. Standardpfad wird verwendet: C:\Users\drxle\Documents\x10aix\00_Inbox\Inbox_Antigravity\`
  - Mit dem Standardpfad fortfahren — kein Abbruch.
  - Antigravity: `.skill-config.json` im Skill-Verzeichnis anlegen mit `VAULT_INBOX_PATH` und `STATUS: CONFIGURED`. Sicherstellen, dass `.skill-config.json` in der `.gitignore` steht.

### Schritt 2: Dateiname konstruieren

Format (unveränderlich): `YYYY-MM-DD — [Titel].md`

- Datum: heutiges Datum
- Titel: prägnant, aus dem Konversations-Inhalt extrahiert
- Erlaubte Zeichen: Buchstaben, Zahlen, Leerzeichen, `-`, `_`, `(`, `)`
- Verboten: `< > : " / \ | ? *`
- Maximale Länge: 80 Zeichen (ohne `.md`)

### Schritt 3: Frontmatter befüllen

```yaml
---
title: "[Titel identisch zum Dateinamen ohne Datum]"
type: [typ]
source: [plattform]
tags: [tag1, tag2]
date: YYYY-MM-DD
inbox: true
---
```

**Pflichtfelder:**

| Feld | Wert |
|:---|:---|
| `title` | Titel in Anführungszeichen |
| `type` | Aus der Typ-Liste unten |
| `source` | `claude`, `chatgpt`, `gemini`, `antigravity`, `manual`, `meeting`, `web-research` |
| `tags` | 2–4 Tags, lowercase, Bindestriche (z.B. `ki-strategie`, `antigravity`) |
| `date` | Heutiges Datum `YYYY-MM-DD` |
| `inbox` | Immer `true` |

**Typ-Liste:**

| Typ | Wann |
|:---|:---|
| `insight` | Erkenntnis, Schlussfolgerung |
| `decision` | Getroffene Entscheidung + Begründung |
| `idea` | Offene Idee, noch nicht ausgearbeitet |
| `ai-chat` | Highlight / Zusammenfassung aus AI-Gespräch |
| `meeting-note` | Gesprächs- oder Meeting-Zusammenfassung |
| `research` | Recherche-Ergebnis |
| `resource` | Tool, Artikel, Referenz |
| `project-note` | Projektbezogene Notiz |
| `method` | Framework, Prozess, Methode |

### Schritt 4: Note-Body verfassen

```markdown
# [Titel]

[Kerninhalt — direkt und substanziell, keine Füllsätze]

## Kontext
[Optional: Warum relevant? Aus welchem Gespräch/Projekt?]

## Nächste Schritte
[Optional: Was soll damit passieren?]

---
*[Plattform] | [Datum] | obsidian-inbox-writer*
```

Leere Abschnitte weglassen. Bullet Points bevorzugen. Code in Fenced Blocks mit Sprach-Tag.

### Schritt 5: Constraint-Check (vor Write / Output)

Exakt diese 5 Punkte prüfen — bei Verletzung **still korrigieren, nicht fragen**:

```
☐ Frontmatter öffnet mit --- und schließt mit ---
☐ title, type, source, tags, date, inbox befüllt
☐ inbox: true gesetzt
☐ Dateiname: YYYY-MM-DD — [Titel].md, keine Sonderzeichen
☐ Dateiname ≤ 80 Zeichen
```

### Schritt 6: Ausführen nach Plattform

**Antigravity / Claude Code / ChatGPT Desktop (mit Dateisystem-Zugriff):**
Schreibe die Datei direkt nach `{{VAULT_INBOX_PATH}}\YYYY-MM-DD — [Titel].md`
Bestätige mit: `✅ Gespeichert: [Dateiname]`

**Claude.ai / ChatGPT Web (ohne Dateisystem-Zugriff):**
Gib den kompletten Note-Inhalt als Markdown-Codeblock aus.
ChatGPT kann zusätzlich eine herunterladbare `.md`-Datei erstellen.
Weise den Nutzer an:
```
💾 Speichern als: YYYY-MM-DD — [Titel].md
📁 Ablegen in:   {{VAULT_INBOX_PATH}}
   oder:         Downloads-Ordner (Watcher verarbeitet automatisch)
```

## NIEMALS

- NIEMALS PARA-Routing-Entscheidungen treffen (Ordner außer Inbox)
- NIEMALS bestehende Vault-Notes lesen, ändern oder löschen
- NIEMALS den Nutzer mit Constraint-Verletzungen aufhalten — immer still korrigieren
- NIEMALS `inbox: false` setzen
- NIEMALS Konfiguration (`VAULT_INBOX_PATH` o.ä.) in die `SKILL.md` schreiben — ausschließlich in `.skill-config.json`

## Output Format

Vollständiges Beispiel: → [`examples/example-01-insight.md`](examples/example-01-insight.md)
