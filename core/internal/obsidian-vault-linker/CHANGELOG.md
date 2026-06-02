# Changelog: obsidian-vault-linker

---

### June 2, 2026
**Version 1.0 — Initial Release**

* **feat**: Normal Mode — reads `99_System/vault-index.json` (single file, ~50 KB) instead of scanning vault
* **feat**: 3-component scoring: Tag Overlap (50%) + Type Affinity (30%) + Title Word Overlap (20%)
* **feat**: Type affinity lookup table for 11 note types in `references/linking-logic.md`
* **feat**: Semantic fallback when top score < 0.15 (LLM reads first 500 chars of body)
* **feat**: Score threshold 0.05 — no output for poor matches (no false links)
* **feat**: Output format compatible with vault-curator `related:` frontmatter field
* **docs**: README.md + README.de.md with algorithm overview, mode comparison, backlog
* **docs**: `references/linking-logic.md` — full algorithm spec with type affinity table

**Context:** Companion to `obsidian-vault-curator`. Replaces the curator's Step 7 blind vault scan.
Full-Scan for 473 existing notes: `pwsh -File "C:\Antigravity Projects\RAG-intern\vault\full-scan.ps1"`

**Backlog:**
- Scheduled full-scan integration via `vault_health.ps1`
- Bidirectional linking (symmetric `related:` updates)
