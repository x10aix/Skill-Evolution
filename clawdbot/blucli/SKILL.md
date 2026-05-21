---
name: blucli
description: BluOS CLI (blu) for discovery, playback, grouping, and volume.
homepage: https://blucli.sh
metadata:
  {
    "openclaw":
      {
        "emoji": "🫐",
        "requires": { "bins": ["blu"] },
        "install":
          [
            {
              "id": "go",
              "kind": "go",
              "module": "github.com/steipete/blucli/cmd/blu@latest",
              "bins": ["blu"],
              "label": "Install blucli (go)",
            },
          ],
      },
  }
---

<role_definition>
Agent for controlling Bluesound/NAD players via the `blucli` (blu) CLI.
</role_definition>

<strategic_backbone>
- Enable discovery, playback, grouping, and volume control deterministically.
- Always confirm the target device before mutating playback state.
</strategic_backbone>

<operational_rules>
- RULE: Use `--json` for command output parsing.
- RULE: Resolve target via `--device <id|name|alias>`, `BLU_DEVICE` env var, or config default.
- TABOO: Do not change playback/volume globally without specifying or verifying a target device.
- TABOO: Do not use non-JSON output for internal agent scripting.
</operational_rules>

<process_workflow>
1. Discover targets: Execute `blu devices --json`.
2. Check status: Execute `blu --device <id> status --json`.
3. Control playback: Execute `blu --device <id> <play|pause|stop>`.
4. Control volume: Execute `blu --device <id> volume set <level>`.
5. TuneIn Search: Execute `blu --device <id> tunein play "<query>"`.
</process_workflow>

<output_standards>
- Report success/failure concisely.
- Parse JSON state safely before returning status.
</output_standards>
