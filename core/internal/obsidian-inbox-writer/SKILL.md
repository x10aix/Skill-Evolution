---
name: obsidian-inbox-writer
description: >
  Drops a correctly formatted Markdown note into the x10aix Obsidian Inbox.
  Use whenever the user says "save this", "note this", "ins Obsidian", "in den Vault",
  "als Notiz", "speicher das", "ins Second Brain", or when a conversation produces
  something worth keeping. Always targets the Inbox only — PARA sorting and curation
  happens separately via the obsidian-vault-curator skill (Antigravity). Works on all
  platforms: Claude Code, ChatGPT Desktop, Antigravity.
---

# Obsidian Inbox Writer

Schreibt eine einheitlich formatierte Notiz direkt in den x10aix Vault-Inbox.
**Kein PARA-Routing, kein Linken, kein Kuratieren** — das macht ein separater Prozess.
Diese Skill-Instanz hat exakt eine Aufgabe: Inbox Drop mit validem Format.

## Vault-Inbox-Pfad

```
C:\Users\drxle\Documents\x10aix\00_Inbox\Inbox_Antigravity\
```

## Dateiname-Format (Pflicht, unveränderlich)

```
YYYY-MM-DD — [Titel].md
```

Beispiel: `2026-06-04 — Entscheidung RAG-intern Ingestion.md`

Erlaubte Zeichen im Titel: Buchstaben, Zahlen, Leerzeichen, `-`, `_`, `(`, `)`.
Verboten: `< > : " / \ | ? *`
Maximale Länge: 80 Zeichen (ohne `.md`)

## Frontmatter-Template (Pflicht, unveränderlich)

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

### Pflichtfelder

| Feld | Wert |
|:---|:---|
| `title` | Titel in Anführungszeichen |
| `type` | Aus der Typ-Liste unten |
| `source` | `claude`, `chatgpt`, `gemini`, `antigravity`, `manual`, `meeting`, `web-research` |
| `tags` | 2–4 Tags, lowercase, Bindestriche (z.B. `ki-strategie`, `antigravity`) |
| `date` | Heutiges Datum `YYYY-MM-DD` |
| `inbox` | Immer `true` |

### Typ-Liste

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

## Note-Struktur (Pflicht)

```markdown
---
[Frontmatter]
---

# [Titel]

[Kerninhalt — direkt und substanziell, keine Füllsätze]

## Kontext
[Optional: Warum relevant? Aus welchem Gespräch/Projekt?]

## Nächste Schritte
[Optional: Was soll damit passieren?]

---
*[Plattform] | [Datum] | obsidian-inbox-writer*
```

**Regeln:**
- Leere Abschnitte (`## Kontext`, `## Nächste Schritte`) weglassen wenn nicht relevant
- Bullet Points bevorzugen
- Code in Fenced Blocks mit Sprach-Tag

## Ausführung nach Plattform

**Claude Code / ChatGPT Desktop (mit Dateisystem-Zugriff):**
Schreibe die Datei direkt nach:
`C:\Users\drxle\Documents\x10aix\00_Inbox\Inbox_Antigravity\YYYY-MM-DD — [Titel].md`
Bestätige mit: `✅ Gespeichert: [Dateiname]`

**Claude.ai / ChatGPT Web (ohne Dateisystem-Zugriff):**
Gib den kompletten Note-Inhalt als Markdown-Codeblock aus.
ChatGPT kann zusätzlich eine herunterladbare `.md`-Datei erstellen.
Weise den Nutzer an:
```
💾 Speichern als: YYYY-MM-DD — [Titel].md
📁 Ablegen in:   C:\Users\drxle\Documents\x10aix\00_Inbox\Inbox_Antigravity\
   oder:         Downloads-Ordner (Watcher verarbeitet automatisch)
```

## Constraint-Check (vor jedem Write / Output)

Exakt diese 5 Punkte prüfen — bei Verletzung korrigieren, nicht fragen:

```
☐ Frontmatter öffnet mit --- und schließt mit ---
☐ title, type, source, tags, date, inbox befüllt
☐ inbox: true gesetzt
☐ Dateiname: YYYY-MM-DD — [Titel].md, keine Sonderzeichen
☐ Dateiname ≤ 80 Zeichen
```

<!-- CONFIGURATION_START -->
STATUS: CONFIGURED
Zielplattform: Claude Code, Claude.ai, ChatGPT Desktop, ChatGPT Web, Antigravity
Ziel-LLM: Model-Agnostic
Ziel-Nutzer: Michael Drexler (x10aix)
Vault-Inbox: C:\Users\drxle\Documents\x10aix\00_Inbox\Inbox_Antigravity\
Sprache: Deutsch bevorzugt, gemischt DE/EN je nach Input
Kuration / PARA-Routing: obsidian-vault-curator (separater Skill, nur Antigravity)
<!-- CONFIGURATION_END -->
