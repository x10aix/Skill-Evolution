# Changelog: obsidian-vault-curator

This document tracks the version history of the obsidian-vault-curator skill.

---

### June 2, 2026
**Version 1.0 — Initial Release**

* **feat**: 7-step write workflow: Input analysis → PARA routing → Duplicate check → Frontmatter generation → Write → Constraint check → Related notes output
* **feat**: PARA routing with Mermaid decision tree (`references/para-routing.md`) covering all 5 PARA folders with x10aix-specific subfolders
* **feat**: Strict YAML frontmatter schema enforcement (`references/frontmatter-spec.md`) with 14 note types, source identifiers, and tag conventions
* **feat**: 3-stage duplicate detection: exact filename → `title` frontmatter match → fuzzy name similarity (>70%)
* **feat**: 8-point quality gate (`references/quality-gate.md`) validated before every write
* **feat**: 80% confidence threshold — below this, automatic fallback to `00_Inbox\Inbox_Antigravity\`
* **feat**: Related notes output (up to 5 wiki-links) after every successful write
* **docs**: README.md + README.de.md with design decisions, relationship to Clawdbot `obsidian` skill, and backlog

**Context:** Built as the final step of the x10aix Second Brain ingestion pipeline project (RAG-intern, 2026-06-01). Pipeline created 473 notes; this skill ensures agent-generated notes meet the same quality standard.

**Backlog items deferred:**
* Wikilink-update on rename (`scripts/update-links.ps1`) — no urgent need, vault has zero wikilinks currently
* Multi-vault portable config (`vault-config.json` + `setup.ps1`) — implement when a second user needs the skill
