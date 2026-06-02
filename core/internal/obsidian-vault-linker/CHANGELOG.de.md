# Changelog: obsidian-vault-linker

---

### 2. Juni 2026
**Version 1.0 — Initial Release**

* **feat**: Normal-Modus — liest `99_System/vault-index.json` (eine Datei, ~50 KB) statt den Vault zu scannen
* **feat**: 3-Komponenten-Scoring: Tag-Overlap (50%) + Typ-Affinität (30%) + Titelwort-Overlap (20%)
* **feat**: Typ-Affinität Lookup-Tabelle für 11 Note-Typen in `references/linking-logic.md`
* **feat**: Semantisches Fallback wenn Top-Score < 0.15 (LLM liest erste 500 Zeichen des Fließtexts)
* **feat**: Score-Threshold 0.05 — kein Output bei schlechten Matches (keine falschen Links)
* **feat**: Output-Format kompatibel mit vault-curator `related:`-Frontmatter-Feld
* **docs**: README.md + README.de.md mit Algorithmus-Übersicht, Modus-Vergleich, Backlog
* **docs**: `references/linking-logic.md` — vollständige Algorithmus-Spezifikation mit Typ-Affinität-Tabelle

**Kontext:** Companion zu `obsidian-vault-curator`. Ersetzt den Blind-Scan in Schritt 7 des Curators.
Full-Scan für 473 bestehende Notes: `pwsh -File "C:\Antigravity Projects\RAG-intern\vault\full-scan.ps1"`

**Backlog:**
- Geplante Full-Scan Integration via `vault_health.ps1`
- Bidirektionales Linking (symmetrische `related:`-Updates)
