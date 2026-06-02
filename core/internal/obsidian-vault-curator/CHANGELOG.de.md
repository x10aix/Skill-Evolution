# Changelog: obsidian-vault-curator

Dieses Dokument verfolgt den Versionsverlauf des obsidian-vault-curator Skills.

---

### 2. Juni 2026
**Version 1.0 — Initial Release**

* **feat**: 7-Schritt-Schreib-Workflow: Input-Analyse → PARA-Routing → Duplikat-Prüfung → Frontmatter-Generierung → Schreiben → Constraint-Check → Verwandte Notes ausgeben
* **feat**: PARA-Routing mit Mermaid-Entscheidungsbaum (`references/para-routing.md`), der alle 5 PARA-Ordner mit x10aix-spezifischen Unterordnern abdeckt
* **feat**: Strenge YAML-Frontmatter-Schema-Durchsetzung (`references/frontmatter-spec.md`) mit 14 Note-Typen, Source-Identifiern und Tag-Konventionen
* **feat**: 3-stufige Duplikat-Erkennung: Exakter Dateiname → `title`-Frontmatter-Übereinstimmung → Fuzzy-Namensähnlichkeit (>70%)
* **feat**: 8-Punkte-Quality-Gate (`references/quality-gate.md`) vor jedem Schreibvorgang validiert
* **feat**: 80%-Konfidenz-Schwellenwert — darunter automatischer Fallback auf `00_Inbox\Inbox_Antigravity\`
* **feat**: Verwandte Notes ausgeben (bis zu 5 Wiki-Links) nach jedem erfolgreichen Schreibvorgang
* **docs**: README.md + README.de.md mit Design-Entscheidungen, Beziehung zum Clawdbot-`obsidian`-Skill und Backlog

**Kontext:** Gebaut als abschließender Schritt des x10aix Second Brain Ingestion Pipeline Projekts (RAG-intern, 2026-06-01). Die Pipeline erstellte 473 Notes; dieser Skill stellt sicher, dass agent-generierte Notes denselben Qualitätsstandard erfüllen.

**Zurückgestellte Backlog-Punkte:**
* Wikilink-Update bei Umbenennung (`scripts/update-links.ps1`) — kein dringender Bedarf, Vault hat aktuell null Wikilinks
* Multi-Vault Portable Config (`vault-config.json` + `setup.ps1`) — implementieren wenn ein zweiter Nutzer den Skill braucht
