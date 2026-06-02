# obsidian-vault-linker

**Version:** 1.0 — Initial Release (2026-06-02)

🇩🇪 [Lies dies auf Deutsch](README.de.md)

> ⚠️ **Platform Note:** Internal skill for the x10aix vault (Windows, local filesystem). Depends on `99_System/vault-index.json` — run `full-scan.ps1` first if the index is empty.

---

## What This Skill Does

The `obsidian-vault-linker` finds the top-N most related notes for a given note by reading a single pre-built metadata index file (`vault-index.json`) instead of scanning the entire vault. It returns the results as Obsidian wiki-links suitable for the `related:` frontmatter field.

It is called by `obsidian-vault-curator` after every write (Normal Mode). For bulk retroactive linking (e.g., after initial ingestion of 473 notes), use `full-scan.ps1` instead.

---

## Why It Exists

The naive approach — scanning all notes at write time — becomes expensive as the vault grows:
- 473 notes today → 1000+ tomorrow
- Each scan reads hundreds of files → slow, token-heavy
- Result quality degrades as tags drift without normalization

The solution: a pre-built index of metadata only (title, type, tags, date) that fits entirely in one LLM context window (~50 KB for 500 notes). Combined with the tag catalog (`tag-catalog.json`), matching quality stays consistent regardless of vault size.

---

## Matching Algorithm

```
Score(N, M) = (TagOverlap × 0.5) + (TypeAffinity × 0.3) + (TitleOverlap × 0.2)
```

| Component | Weight | Method |
|:---|:---:|:---|
| Tag Overlap | 50% | Set intersection of canonical tags |
| Type Affinity | 30% | Lookup table (method↔method=1.0, etc.) |
| Title Word Overlap | 20% | Tokenized word intersection (>3 chars) |

Full algorithm details: [linking-logic.md](references/linking-logic.md)

**Semantic Fallback:** If top score < 0.15 (no tags or novel topic), the LLM reads the first 500 chars of the note body and finds candidates semantically.

---

## Relationship to Other Skills

```
[obsidian-vault-curator]
    │ calls after every write
    ▼
[obsidian-vault-linker]   ← this skill
    │ reads
    ▼
[vault-index.json]   99_System/vault-index.json

[full-scan.ps1]   RAG-intern/vault/full-scan.ps1
    │ builds/updates
    ▼
[vault-index.json]
    │ also writes related: to all existing notes
    ▼
[x10aix Vault]   C:\Users\drxle\Documents\x10aix\
```

---

## Full-Scan vs. Normal Mode

| | Normal Mode (this skill) | Full-Scan (`full-scan.ps1`) |
|:---|:---|:---|
| **Trigger** | After each curator write | Manually / after bulk ingestion |
| **Engine** | LLM (with semantic fallback) | Pure PowerShell (algorithmic) |
| **Input** | One new note's metadata | All notes in vault |
| **Output** | `related:` for the new note | `related:` for all notes without it |
| **Speed** | ~1–2s | ~30–60s for 500 notes |
| **LLM needed** | Yes (for fallback) | No |

---

## Backlog

| Item | Priority | Notes |
|:---|:---|:---|
| Scheduled full-scan via vault_health.ps1 | Low | Auto-refresh index monthly or after bulk ingestion |
| Bidirectional linking | Low | If Note A lists Note B as related, add Note A to Note B's related too |
