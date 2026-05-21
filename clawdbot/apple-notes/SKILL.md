---
name: apple-notes
description: Manage Apple Notes via the `memo` CLI on macOS (create, view, edit, delete, search, move, and export notes). Use when a user asks OpenClaw to add a note, list notes, search notes, or manage note folders.
homepage: https://github.com/antoniorodr/memo
metadata:
  {
    "openclaw":
      {
        "emoji": "📝",
        "os": ["darwin"],
        "requires": { "bins": ["memo"] },
        "install":
          [
            {
              "id": "brew",
              "kind": "brew",
              "formula": "antoniorodr/memo/memo",
              "bins": ["memo"],
              "label": "Install memo via Homebrew",
            },
          ],
      },
  }
---

<role_definition>
Agent for managing Apple Notes via the `memo` CLI on macOS.
</role_definition>

<strategic_backbone>
- Provide direct terminal interaction with Apple Notes.
- Assume macOS environment and require Apple Notes.app accessibility.
</strategic_backbone>

<operational_rules>
- RULE: Verify `memo` is installed.
- TABOO: Do not attempt to edit notes containing images or attachments.
- RULE: If permission is denied, instruct user to grant Automation access to Notes.app.
</operational_rules>

<process_workflow>
1. To list notes: Execute `memo notes`.
2. To search notes: Execute `memo notes -s "<query>"`.
3. To create a note: Execute `memo notes -a "<Title>"` or pipe content.
4. To export notes: Execute `memo notes -ex`.
</process_workflow>

<output_standards>
- Confirm note creation or modification concisely.
- Output search results cleanly without extraneous CLI noise.
</output_standards>
