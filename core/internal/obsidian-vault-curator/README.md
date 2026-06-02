# obsidian-vault-curator: Architecture & Core Mechanics

**Version:** 1.0 — Initial Release (2026-06-02)

🇩🇪 [Lies dies auf Deutsch](README.de.md)

> ⚠️ **Platform Note:** This skill is designed for **Antigravity (Windows, PowerShell)**. It writes directly to the local filesystem — no external API, no CLI dependency. It is **not** suitable for OpenClaw or macOS deployments without configuration changes.

---

## What This Skill Does

The `obsidian-vault-curator` is a **write-only, schema-enforcing agent skill** that persists knowledge permanently into the x10aix Obsidian Second Brain vault. It is the structured counterpart to bulk ingestion pipelines: where `run_ingestion.ps1` handles mass imports, this skill handles single, semantically meaningful notes that an agent produces during a workflow.

**It is not a general Obsidian CRUD skill.** For reading, searching, moving, or deleting vault notes, use direct file tools or the `obsidian` skill from the Clawdbot ecosystem.

---

## Why It Exists

Three problems motivated this skill:

1. **Schema drift:** Without enforcement, agents write notes with inconsistent or missing YAML frontmatter, making them invisible to Smart Connections, Dataview, and other Obsidian plugins.
2. **PARA chaos:** Notes end up in wrong folders because agents have no knowledge of the vault's organizational structure.
3. **Silent duplication:** The same knowledge gets written twice under slightly different filenames, polluting search results and the graph view.

---

## Key Design Decisions

| Decision | Rationale |
|:---|:---|
| **Write-only scope** | Separation of concerns — reading is done by the calling agent via file tools; writing is this skill's single responsibility |
| **PARA routing via decision tree** | Explicit Mermaid flowchart in `references/para-routing.md` prevents ambiguous folder placement |
| **80% confidence threshold** | Below this, the skill always falls back to `00_Inbox` rather than guessing |
| **3-stage duplicate check** | Exact filename → same `title` frontmatter → fuzzy name similarity, in order of cost |
| **No `obsidian-cli` dependency** | Windows-first; avoids macOS-only tooling; pure PowerShell file operations |
| **Hardcoded vault root** | Intentionally scoped to the x10aix vault — portability is a future concern (see Backlog) |

---

## Relationship to Other Skills

```
[Any Agent Skill]
    │
    │  delegates vault write to
    ▼
[obsidian-vault-curator]   ←── this skill (write only)
    │
    │  writes to
    ▼
[x10aix Obsidian Vault]   C:\Users\drxle\Documents\x10aix\

[obsidian] (Clawdbot)     ←── separate skill: macOS, generic CRUD, wikilink-safe moves
```

The `obsidian` skill in `skills/clawdbot/obsidian/` is **complementary, not redundant**:
- It handles macOS, generic vaults, and CRUD including move/delete with wikilink updates
- This skill handles Windows, the x10aix vault specifically, and write operations with schema enforcement

---

## Origin

Built on **2026-06-02** as the final step of the x10aix Second Brain ingestion pipeline project (RAG-intern). The pipeline created 473 notes from Antigravity Projects, Google Drive, and GitHub — this skill ensures that any future agent-generated note meets the same quality standard as those ingested notes.

---

## Backlog

| Item | Priority | Notes |
|:---|:---|:---|
| **Wikilink-update on rename** | Low | PowerShell regex-based link updater (`scripts/update-links.ps1`). No urgent need — vault currently has zero wikilinks. Implement when active cross-linking begins. |
| **Multi-vault / portable config** | Low | Replace hardcoded vault root with `vault-config.json` + `setup.ps1`. Est. ~6–7h. Implement when a second user or system needs the skill. |

---

*(This document is a manually curated system description of the skill)*
