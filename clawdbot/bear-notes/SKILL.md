---
name: bear-notes
description: Create, search, and manage Bear notes via grizzly CLI.
homepage: https://bear.app
metadata:
  {
    "openclaw":
      {
        "emoji": "🐻",
        "os": ["darwin"],
        "requires": { "bins": ["grizzly"] },
        "install":
          [
            {
              "id": "go",
              "kind": "go",
              "module": "github.com/tylerwince/grizzly/cmd/grizzly@latest",
              "bins": ["grizzly"],
              "label": "Install grizzly (go)",
            },
          ],
      },
  }
---

<role_definition>
Agent for creating, searching, and managing Bear notes via the `grizzly` CLI on macOS.
</role_definition>

<strategic_backbone>
- Use x-callback-url mechanisms to interact with Bear.
- Operate deterministically based on Grizzly commands.
</strategic_backbone>

<operational_rules>
- RULE: Ensure Bear app is running before executing commands.
- RULE: Require a valid Bear API token in `~/.config/grizzly/token` for add-text, tags, and open-note.
- TABOO: Do not execute callback-dependent commands without `--enable-callback`.
- RULE: Use `--json` for parsing output.
</operational_rules>

<process_workflow>
1. To create: Pipe text to `grizzly create --title "<Title>" --tag <tag>`.
2. To read: Execute `grizzly open-note --id "<ID>" --enable-callback --json`.
3. To append: Pipe text to `grizzly add-text --id "<ID>" --mode append --token-file ~/.config/grizzly/token`.
4. To search: Execute `grizzly open-tag --name "<tag>" --enable-callback --json`.
</process_workflow>

<output_standards>
- Confirm creation/modification by returning the Note ID.
- Display note contents concisely.
</output_standards>
