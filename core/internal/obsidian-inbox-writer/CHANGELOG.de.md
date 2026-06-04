# Changelog: obsidian-inbox-writer

Dieses Dokument verfolgt den Versionsverlauf des obsidian-inbox-writer Skills.

---

### 4. Juni 2026
**Version 1.1 — Prozess-Konformität & Struktur-Repair**

* **fix**: `SKILL.md` auf Modus-D Light-Template (Skill-Engineer-konform) umgestellt
* **fix**: Eingebetteten `<!-- CONFIGURATION_START -->` Block aus `SKILL.md` entfernt — verletzt „Logic vs. State"-Architektur
* **fix**: Hardcodierte absolute Pfade aus committeter `SKILL.md` entfernt — `{{VAULT_INBOX_PATH}}` wird nun aus lokaler `.skill-config.json` gelesen (gitignored)
* **feat**: `NIEMALS`-Tabu-Sektion ergänzt (Skill-Engineer Qualitätsgate Kriterium 3)
* **feat**: `examples/`-Ordner mit `example-01-insight.md` angelegt (Kriterium 5)
* **feat**: `.skill-config.json` lokal für x10aix-Installation konfiguriert
* **docs**: `README.md` + `README.de.md` auf Version 1.1 aktualisiert
* **chore**: `ECOSYSTEM.md` aktualisiert — `obsidian-inbox-writer` in Dependency Graph und Index ergänzt

**Kontext:** v1.0 wurde ohne Einhaltung des Skill-Engineer-Prozesses (Modus D) erstellt und direkt committed. v1.1 behebt alle strukturellen Mängel ohne inhaltliche Änderungen an der Fachlogik. Der Skill klassifiziert als Modus D (werkzeugartiger Lightweight-Skill mit eindeutigem Input→Output-Mapping).

---

### 4. Juni 2026
**Version 1.0 — Initial Release**

* **feat**: Plattform-agnostischer Inbox-Drop mit fixem Dateiname-Format (`YYYY-MM-DD — Titel.md`)
* **feat**: Einheitliches YAML-Frontmatter-Schema: `title`, `type`, `source`, `tags`, `date`, `inbox: true`
* **feat**: 9 Note-Typen: `insight`, `decision`, `idea`, `ai-chat`, `meeting-note`, `research`, `resource`, `project-note`, `method`
* **feat**: Plattform-Fallback: Direkter Datei-Write (Claude Code / ChatGPT Desktop) oder Codeblock-Output (Web-Varianten)
* **feat**: 5-Punkte Constraint-Check vor jedem Write/Output — stille Selbstkorrektur ohne Rückfragen
* **docs**: README.md + README.de.md mit Intent, Design-Entscheidungen und Backlog

**Kontext:** Gebaut als Ergänzung zum `obsidian-vault-curator` (2026-06-02). Auslöser war der Wunsch, Claude und ChatGPT mit demselben Vault-Schreib-Workflow auszustatten wie Antigravity — ohne die Kurator-Komplexität auf plattformbeschränkte Modelle zu bringen. Kern-Designprinzip: strikte Aufgabenteilung zwischen Inbox-Drop (dieser Skill, alle Plattformen) und Kuration/PARA-Routing (obsidian-vault-curator, nur Antigravity).

**Zurückgestellte Backlog-Punkte:**
* Tag-Normalisierung gegen `tag-catalog.json` — sobald Vault >500 Notes
* Auto-Eintrag in tägliche Inbox-Review-Note
* Multi-Vault-Support via konfigurierbarem Vault-Pfad
