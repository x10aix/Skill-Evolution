# Changelog — obsidian-inbox-writer

## [1.1] — 2026-06-04

**Was:** Skill nach Skill-Engineer Modus D Light-Template standardisiert.

**Root Cause:** Skill wurde von einem RAG-intern Agenten ohne Skill-Engineer-Workflow erstellt (Rule 7 Verletzung). Enthielt persönliche Konfigurationsdaten (Benutzername, Vault-Pfad), keinen portablen Pfad-Mechanismus, und folgte nicht dem Light-Template-Standard (kein `Use/Do not use`, kein konformes Output-Format-Beispiel).

**Vorfall:** Beim Versuch den Skill zu reparieren und zu veröffentlichen wurde die Divergenz-Blockade in `skill-publishing.md` ausgelöst (→ AUDIT_LOG Vorfall #1). Der Skill war nicht public-ready.

**Änderungen:**
- `CONFIGURATION_START` Block entfernt (enthielt `Ziel-Nutzer: Michael Drexler`, hardcodierter Pfad)
- Vault-Pfad portabel gemacht via `## Setup` Sektion mit `VAULT_INBOX` Placeholder
- `requires: obsidian-vault-curator` in Frontmatter deklariert
- `## Use this skill when` / `## Do not use this skill when` ergänzt
- Tabus explizit als `Do not use` benannt (Kriterium 3)
- Vollständiges Input→Output-Beispiel ergänzt (Kriterium 5)
- Light-Template-Struktur eingehalten (Modus D)

## [1.0] — 2026-06-03

**Was:** Erstversion (improvisiert, ohne Skill-Engineer-Workflow).

**Root Cause:** Erstellt durch RAG-intern Agent ohne Interview, Qualitätsgate oder Workflow-Compliance. Direkt gepusht ohne Review.
