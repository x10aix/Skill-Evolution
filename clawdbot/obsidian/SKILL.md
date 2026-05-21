---
name: obsidian
description: Work with Obsidian vaults (plain Markdown notes) and automate via obsidian-cli.
homepage: https://help.obsidian.md
metadata:
  {
    "openclaw":
      {
        "emoji": "💎",
        "requires": { "bins": ["obsidian-cli"] },
        "install":
          [
            {
              "id": "brew",
              "kind": "brew",
              "formula": "yakitrak/yakitrak/obsidian-cli",
              "bins": ["obsidian-cli"],
              "label": "Install obsidian-cli (brew)",
            },
          ],
      },
  }
---

<role_definition>
Agent for managing and editing Obsidian vaults, Markdown notes, and attachments via `obsidian-cli` and direct file operations.
</role_definition>

<strategic_backbone>
- Tooling: `obsidian-cli` (for vault-aware operations) and standard UNIX text processing tools for direct Markdown edits.
- Core Context: Obsidian vaults are plain folders on disk. The active vault state is tracked in `~/Library/Application Support/obsidian/obsidian.json`.
- Capability Scope: Reading, searching, creating, moving, deleting, and editing vault files.
</strategic_backbone>

<operational_rules>
- NEVER guess the vault path. MUST read `~/Library/Application Support/obsidian/obsidian.json` and use the vault with `"open": true`, or use `obsidian-cli print-default --path-only`.
- AVOID writing hardcoded vault paths into scripts.
- MUST NOT modify contents of `.obsidian/` (workspace/plugin configs) unless explicitly requested.
- MUST use `obsidian-cli move` instead of standard `mv` when renaming or moving notes to automatically update `[[wikilinks]]` and Markdown links across the vault.
- AVOID creating notes under hidden dot-folders (e.g., `.hidden/`) via `obsidian-cli create` (Obsidian URI handler may refuse).
- MUST prefer direct file edits (e.g., `sed`, `echo`, or native write tools) on `*.md` files when manipulating note content instead of relying solely on the CLI.
</operational_rules>

<process_workflow>
1. Determine the active vault:
   - Run `obsidian-cli print-default --path-only` or parse `~/Library/Application Support/obsidian/obsidian.json`.
   - If no default is set, prompt user or set it via `obsidian-cli set-default "<vault-folder-name>"`.
2. Select the appropriate operation:
   - Search: `obsidian-cli search "query"` or `obsidian-cli search-content "query"`.
   - Create: `obsidian-cli create "Path/Note" --content "..." --open`.
   - Refactor/Move: `obsidian-cli move "old/path" "new/path"`.
   - Delete: `obsidian-cli delete "path/note"`.
   - Edit Content: Modify the `.md` file directly on disk using standard text tools.
3. Execute the operation and verify success.
</process_workflow>

<output_standards>
- Confirm the operation performed (e.g., "Created note X", "Moved note X to Y").
- Output the absolute path of any newly created or modified notes.
- Only show relevant search snippets when executing `search-content`.
</output_standards>
