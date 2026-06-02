# Frontmatter-Spezifikation — x10aix Obsidian Vault

> Jede Note im Vault MUSS ein valides YAML-Frontmatter haben.
> Pflichtfelder sind mit ✅ markiert, optionale mit 🔲.

## Vollständiges Template

```yaml
---
title: "[Vollständiger Titel der Note]"           # ✅ Pflicht — in Anführungszeichen
type: [note-type]                                  # ✅ Pflicht — aus Typ-Liste unten
source: [source-identifier]                        # ✅ Pflicht — Herkunft des Inhalts
tags: [tag1, tag2, tag3]                          # ✅ Pflicht — 2-5 Tags, lowercase
date: YYYY-MM-DD                                   # ✅ Pflicht — Erstellungsdatum
last_updated: YYYY-MM-DD                           # 🔲 Optional — nur bei Updates
author: "[Name oder Agent-ID]"                     # 🔲 Optional
related: ["[[Note A]]", "[[Note B]]"]              # 🔲 Optional — Wiki-Links
status: [active|archived|draft]                    # 🔲 Optional — Default: active
---
```

## Typ-Liste (`type`)

| Typ-Wert | Bedeutung | Typischer Ordner |
|:---|:---|:---|
| `project-index` | Index-Note für ein Projekt | `10_Projects\`, `30_Resources\Knowledge\Antigravity\` |
| `project-note` | Einzelne Notiz zu einem Projekt | `10_Projects\` |
| `area-note` | Verantwortungsbereich-Notiz | `20_Areas\` |
| `resource` | Allgemeine Ressource / Dokument | `30_Resources\` |
| `resource-link` | Link auf externe Datei (PDF etc.) | `30_Resources\` |
| `github-repo` | GitHub Repository Index | `30_Resources\Knowledge\GitHub\` |
| `ai-chat` | Export eines AI-Chat-Gesprächs | `00_Inbox\Inbox_Antigravity\AI-Chats\` |
| `insight` | Erkenntnis / Deep Research Ergebnis | `30_Resources\Insights\` |
| `method` | Methode / Framework / Prozess | `30_Resources\Methods\` |
| `tool-note` | Notiz zu einem Tool / Software | `30_Resources\Tools\` |
| `index` | Inhaltsverzeichnis / Übersicht | Beliebig |
| `inbox-review` | Automatischer Ingestion-Report | `00_Inbox\Inbox_Antigravity\` |
| `vault-health` | Vault-Analyse-Report | `00_Inbox\Inbox_Antigravity\` |
| `sop` | Standard Operating Procedure | `99_System\` |
| `template` | Wiederverwendbare Vorlage | `99_System\` |

## Source-Identifier (`source`)

| Wert | Bedeutung |
|:---|:---|
| `manual` | Manuell vom Nutzer erstellt |
| `local-antigravity` | Aus `C:\Antigravity Projects\` |
| `google-drive` | Aus `G:\Geteilte Ablagen\x10aix.tech Ressourcen\` |
| `github` | Von GitHub via `gh` CLI |
| `chatgpt` | ChatGPT Chat-Export |
| `claude` | Claude Chat-Export |
| `gemini` | Gemini Chat-Export |
| `antigravity-agent` | Von Antigravity-Agent generiert |
| `clawdi` | Von Clawdi (OpenClaw) generiert |
| `web-research` | Aus Web-Recherche |
| `notebooklm` | Aus NotebookLM Export |

## Tag-Konventionen

- Immer **lowercase**
- Keine Leerzeichen → Bindestriche: `ki-strategie` statt `KI Strategie`
- 2 Pflicht-Tags: Herkunft + Thema (z.B. `[google-drive, ki-strategie]`)
- Max. 5 Tags — Qualität vor Quantität
- Bewährte Tags: `antigravity`, `github`, `google-drive`, `ai-chat`, `ki`, `marketing`,
  `sales`, `strategie`, `methode`, `tool`, `code`, `inbox`, `automatisch`

## Dateinamens-Konventionen

```
[Prefix] — [Titel].md
```

| Prefix | Bedeutung |
|:---|:---|
| `AG —` | Antigravity lokales Projekt |
| `GH —` | GitHub Repository |
| `YYYY-MM-DD —` | Datumsstempel (für Chats, Reports) |
| *(kein Prefix)* | Allgemeine Ressource |

**Verbotene Zeichen im Dateinamen:** `< > : " / \ | ? *`  
**Maximale Länge:** 80 Zeichen (ohne `.md`)
