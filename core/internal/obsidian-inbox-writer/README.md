# obsidian-inbox-writer: Architecture & How It Works

**Version:** 1.1 — Process Compliance Repair (2026-06-04)

🇩🇪 [Auf Deutsch lesen](README.de.md)

> **Platform Note:** This skill is **platform-agnostic**. It works on Claude Code, ChatGPT Desktop (with filesystem access), Claude.ai / ChatGPT Web (as codeblock output), and Antigravity (direct file write). It is the lightweight entry point of the x10aix Second Brain — sorting and curation are handled by the separate `obsidian-vault-curator` skill.

---

## What This Skill Does

The `obsidian-inbox-writer` is a **format-enforcing inbox drop skill**. It writes — or generates for manual saving — a single, correctly formatted Markdown note into the `00_Inbox/Inbox_Antigravity/` folder of the x10aix Obsidian vault.

It makes **no content decisions** about PARA assignment, linking, or deduplication. Those tasks belong to the downstream `obsidian-vault-curator` process (Antigravity only).

**It is not a CRUD skill.** Reading, moving, or deleting vault notes uses different tools.

---

## Why It Exists — Intent

### The Problem

The `obsidian-vault-curator` is powerful but too complex for Claude and ChatGPT: it requires PARA routing decisions, filesystem duplicate checks, and write access. Without a minimal, unified skill, different models would invent their own format every time — inconsistent frontmatter fields, missing tags, wrong folders.

### The Approach: Strict Separation of Concerns

Instead of building one universal skill, responsibilities are explicitly divided:

| Task | Skill | Platforms |
|:---|:---|:---|
| Write a correctly formatted note to Inbox | `obsidian-inbox-writer` | All (Claude, ChatGPT, Antigravity) |
| Sort, PARA-route, link, curate | `obsidian-vault-curator` | Antigravity only |

The Inbox acts as a **buffer zone**: every note lands there first, regardless of which model wrote it. A downstream ingestion process (`run_ingestion.ps1`) or the Vault Curator then decides on final placement.

### Why Consistent Output Matters More Than Smart Placement

If Claude writes a note as `insight` into the wrong PARA folder and ChatGPT writes it as `resource` into another, inconsistencies accumulate that are hard to clean up. If both always write to the Inbox — with an identical schema — a single Antigravity process can handle sorting with full control.

---

## Key Design Decisions

| Decision | Rationale |
|:---|:---|
| **Inbox-Only** | Eliminates PARA routing errors from models without full vault context |
| **Fixed filename format** (`YYYY-MM-DD — Title.md`) | Chronological sorting, low collision risk, immediately readable |
| **`inbox: true` frontmatter flag** | Enables automatic filtering by Vault Curator and Dataview queries |
| **Platform fallback** (filesystem vs. codeblock) | Skill works on all platforms without separate versions |
| **No constraint dialog** | Errors are silently corrected, not escalated into follow-up questions — fast capture takes priority |

---

## Relationship to Other Skills

```
[Claude / ChatGPT / Antigravity]
         │
         │  writes to
         ▼
[obsidian-inbox-writer]   ←── this skill (Inbox drop, consistent format)
         │
         │  lands in
         ▼
[00_Inbox/Inbox_Antigravity/]   x10aix Obsidian Vault
         │
         │  curated by
         ▼
[obsidian-vault-curator]   (Antigravity only — PARA routing, linking, dedup)
```

The `run_watcher.ps1` (RAG-intern) watches the Downloads folder and automatically routes `.md` files into the Inbox — complementary to this skill.

---

## Origin

Built on **2026-06-04** as a complement to the `obsidian-vault-curator`. The trigger was the need to equip Claude and ChatGPT with the same vault-writing capability as Antigravity — without bringing the Curator's complexity to platforms that lack full vault context.

---

## Backlog

| Item | Priority | Notes |
|:---|:---|:---|
| **Tag normalization** | Medium | Cross-check against `tag-catalog.json` — tags are currently uncontrolled. Worthwhile once vault exceeds 500 notes. |
| **Auto inbox-review entry** | Low | Append a review line to the daily `INBOX-REVIEW-YYYY-MM-DD.md` after each inbox drop. |
| **Multi-vault support** | Low | Make vault path configurable once a second user adopts the skill. |

---

*(This document is a manually maintained system description of the skill)*
