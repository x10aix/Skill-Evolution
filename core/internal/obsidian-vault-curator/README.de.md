# obsidian-vault-curator: Architektur & Funktionsweise

**Version:** 1.0 — Initial Release (2026-06-02)

🇬🇧 [Read in English](README.md)

> ⚠️ **Plattform-Hinweis:** Dieser Skill ist für **Antigravity (Windows, PowerShell)** konzipiert. Er schreibt direkt ins lokale Dateisystem — keine externe API, keine CLI-Abhängigkeit. Er ist **nicht** für OpenClaw oder macOS-Deployments geeignet ohne Konfigurationsanpassungen.

---

## Was dieser Skill tut

Der `obsidian-vault-curator` ist ein **write-only, schema-enforcing Agent-Skill**, der Wissen dauerhaft in den x10aix Obsidian Second Brain Vault schreibt. Er ist das strukturierte Gegenstück zu Bulk-Ingestion-Pipelines: Wo `run_ingestion.ps1` Massenimporte übernimmt, verwaltet dieser Skill einzelne, semantisch bedeutsame Notes, die ein Agent während eines Workflows produziert.

**Er ist kein allgemeiner Obsidian CRUD-Skill.** Zum Lesen, Suchen, Verschieben oder Löschen von Vault-Notes werden direkte Datei-Tools oder der `obsidian`-Skill aus dem Clawdbot-Ökosystem genutzt.

---

## Warum er existiert

Drei Probleme haben diesen Skill motiviert:

1. **Schema-Drift:** Ohne Durchsetzung schreiben Agenten Notes mit inkonsistentem oder fehlendem YAML-Frontmatter — diese sind für Smart Connections, Dataview und andere Obsidian-Plugins unsichtbar.
2. **PARA-Chaos:** Notes landen in falschen Ordnern, weil Agenten keine Kenntnis der Vault-Organisationsstruktur haben.
3. **Stille Duplikation:** Dasselbe Wissen wird zweimal unter leicht unterschiedlichen Dateinamen geschrieben und verschmutzt Suchergebnisse und Graph-View.

---

## Wichtige Design-Entscheidungen

| Entscheidung | Begründung |
|:---|:---|
| **Write-only Scope** | Separation of Concerns — Lesen erledigt der aufrufende Agent via Datei-Tools; Schreiben ist die einzige Verantwortung dieses Skills |
| **PARA-Routing via Entscheidungsbaum** | Explizites Mermaid-Flowchart in `references/para-routing.md` verhindert mehrdeutige Ordner-Platzierung |
| **80%-Konfidenz-Schwellenwert** | Darunter fällt der Skill immer auf `00_Inbox` zurück, statt zu raten |
| **3-stufige Duplikat-Prüfung** | Exakter Dateiname → gleiches `title`-Frontmatter → Fuzzy-Namensähnlichkeit, in Reihenfolge der Kosten |
| **Keine `obsidian-cli`-Abhängigkeit** | Windows-First; vermeidet macOS-spezifische Tools; reines PowerShell-Dateioperationen |
| **Hardcodierter Vault-Root** | Bewusst auf den x10aix Vault beschränkt — Portabilität ist ein zukünftiges Anliegen (siehe Backlog) |

---

## Beziehung zu anderen Skills

```
[Beliebiger Agent-Skill]
    │
    │  delegiert Vault-Schreiben an
    ▼
[obsidian-vault-curator]   ←── dieser Skill (nur Schreiben)
    │
    │  schreibt in
    ▼
[x10aix Obsidian Vault]   C:\Users\drxle\Documents\x10aix\

[obsidian] (Clawdbot)     ←── separater Skill: macOS, generisches CRUD, Wikilink-sichere Moves
```

Der `obsidian`-Skill in `skills/clawdbot/obsidian/` ist **komplementär, nicht redundant**:
- Er behandelt macOS, beliebige Vaults und CRUD inklusive Move/Delete mit Wikilink-Updates
- Dieser Skill behandelt Windows, den x10aix Vault spezifisch, und Write-Operationen mit Schema-Durchsetzung

---

## Entstehung

Gebaut am **02.06.2026** als abschließender Schritt des x10aix Second Brain Ingestion Pipeline Projekts (RAG-intern). Die Pipeline hat 473 Notes aus Antigravity Projects, Google Drive und GitHub erstellt — dieser Skill stellt sicher, dass jede zukünftige agent-generierte Note denselben Qualitätsstandard erfüllt wie die ingesierten Notes.

---

## Backlog

| Punkt | Priorität | Hinweise |
|:---|:---|:---|
| **Wikilink-Update bei Umbenennung** | Niedrig | PowerShell-Regex-basierter Link-Updater (`scripts/update-links.ps1`). Kein dringender Bedarf — der Vault hat aktuell null Wikilinks. Implementieren wenn aktives Querverlinken beginnt. |
| **Multi-Vault / Portable Config** | Niedrig | Hardcodierten Vault-Root durch `vault-config.json` + `setup.ps1` ersetzen. Ca. ~6–7h Aufwand. Implementieren wenn ein zweiter Nutzer oder ein zweites System den Skill braucht. |

---

*(Dieses Dokument ist eine manuell gepflegte Systembeschreibung des Skills)*
