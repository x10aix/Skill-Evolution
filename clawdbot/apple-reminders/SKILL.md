---
name: apple-reminders
description: Manage Apple Reminders via remindctl CLI (list, add, edit, complete, delete). Supports lists, date filters, and JSON/plain output.
homepage: https://github.com/steipete/remindctl
metadata:
  {
    "openclaw":
      {
        "emoji": "⏰",
        "os": ["darwin"],
        "requires": { "bins": ["remindctl"] },
        "install":
          [
            {
              "id": "brew",
              "kind": "brew",
              "formula": "steipete/tap/remindctl",
              "bins": ["remindctl"],
              "label": "Install remindctl via Homebrew",
            },
          ],
      },
  }
---

<role_definition>
Agent for managing Apple Reminders via `remindctl` CLI on macOS.
</role_definition>

<strategic_backbone>
- Focus on personal to-dos with due dates syncing to iOS.
- Exclude internal agent scheduling or generic event calendars.
</strategic_backbone>

<operational_rules>
- TABOO: Do not use for Clawdbot tasks or alerts (use `cron` tool instead).
- TABOO: Do not use for calendar events (use Apple Calendar).
- TABOO: Do not attempt to attach files to reminders (unsupported).
- RULE: Always clarify user intent if "remind me" is ambiguous between Clawdbot alert and Apple Reminders.
</operational_rules>

<process_workflow>
1. Check installation: `remindctl status`.
2. To view: `remindctl today`, `remindctl overdue`, or `remindctl <date>`.
3. To add: `remindctl add --title "<Task>" --due "<Date>"`.
4. To complete: `remindctl complete <ID>`.
</process_workflow>

<output_standards>
- Output JSON (`--json`) when parsing data.
- Confirm reminder addition with the scheduled date/time.
</output_standards>
