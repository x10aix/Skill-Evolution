---
name: obsidian-inbox-writer
description: >
  Drops a correctly formatted Markdown note into an Obsidian Vault Inbox.
  Use whenever the user says "save this", "note this", "ins Obsidian", "in den Vault",
  "als Notiz", "speicher das", "ins Second Brain", or when a conversation produces
  something worth keeping (decision, insight, idea, research result).
  Always targets the Inbox only — PARA sorting and curation happens separately.
  Works on all platforms: Claude Code, ChatGPT Desktop, Antigravity.
requires:
  - obsidian-vault-curator  # WARNING if missing: curation step will not run automatically
---

# Obsidian Inbox Writer

Writes a consistently formatted note directly into the configured Obsidian Vault Inbox.
**No PARA routing, no linking, no curation** — that is a separate process handled by `obsidian-vault-curator`.
One job: valid Inbox Drop.

## Setup (once per installation)

Set your Vault Inbox path. Replace the placeholder in the instructions below:

```
VAULT_INBOX = <absolute path to your Obsidian Inbox folder>
Example (Windows): C:\Users\<username>\Documents\<vault>\00_Inbox\Inbox_Antigravity\
Example (macOS):   /Users/<username>/Documents/<vault>/00_Inbox/Inbox_Antigravity/
```

If `obsidian-vault-curator` is not installed, warn the user once per session:
> ⚠️ obsidian-vault-curator not found. Notes will accumulate in Inbox without automatic curation.

## Use this skill when

- User says: "save this", "note this", "ins Obsidian", "in den Vault", "als Notiz", "speicher das", "ins Second Brain"
- A conversation produces a decision, insight, idea, research result, or resource worth keeping
- User explicitly asks for an Obsidian note

## Do not use this skill when

- User wants to search or read existing notes (use vault search instead)
- User wants to move or reorganize notes (use obsidian-vault-curator)
- The content is a temporary calculation or throwaway output

## Instructions

1. **Determine title** — derive a concise title from the content (max 60 chars). Ask user only if completely ambiguous.

2. **Determine type** from this list (pick closest match):

   | Type | When |
   |:-----|:-----|
   | `insight` | Conclusion, realization |
   | `decision` | Decision made + reasoning |
   | `idea` | Open idea, not yet developed |
   | `ai-chat` | Highlight / summary from AI conversation |
   | `meeting-note` | Meeting or conversation summary |
   | `research` | Research result |
   | `resource` | Tool, article, reference |
   | `project-note` | Project-related note |
   | `method` | Framework, process, method |

3. **Determine tags** — 2–4 tags, lowercase, hyphens (e.g. `ki-strategie`, `antigravity`). Derive from content, do not ask.

4. **Determine source** — one of: `claude`, `chatgpt`, `gemini`, `antigravity`, `manual`, `meeting`, `web-research`.

5. **Run Constraint-Check before writing:**
   ```
   ☐ Filename: YYYY-MM-DD — [Title].md  (no special chars: < > : " / \ | ? *)
   ☐ Filename ≤ 80 chars (without .md)
   ☐ Frontmatter opens with --- and closes with ---
   ☐ All fields filled: title, type, source, tags, date, inbox: true
   ☐ Target path = VAULT_INBOX (from Setup)
   ```
   Fix any violation before writing. Do not ask — correct silently.

6. **Write the file** to `VAULT_INBOX/YYYY-MM-DD — [Title].md`

7. **Confirm** with: `✅ Gespeichert: [filename]`

## Output Format

**Input:** User says "Speicher das: Wir haben entschieden, den Runbook-Auditor wöchentlich laufen zu lassen."

**Output (file written to VAULT_INBOX):**

```markdown
---
title: "Entscheidung Runbook-Auditor Frequenz"
type: decision
source: antigravity
tags: [runbooks, prozesse, qualitaet]
date: 2026-06-04
inbox: true
---

# Entscheidung Runbook-Auditor Frequenz

Wir haben entschieden, den Runbook-Auditor wöchentlich laufen zu lassen.

## Kontext
Ergibt sich aus der Runbook-Qualitätssicherung (Chat 46c65217).

---
*antigravity | 2026-06-04 | obsidian-inbox-writer*
```

**Platform fallback (no filesystem access):**
Output the complete note as a Markdown code block and instruct:
```
💾 Save as: YYYY-MM-DD — [Title].md
📁 Place in: VAULT_INBOX
```
