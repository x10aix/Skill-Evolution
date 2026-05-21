---
name: things-mac
description: Manage Things 3 via the `things` CLI on macOS (add/update projects+todos via URL scheme; read/search/list from the local Things database). Use when a user asks OpenClaw to add a task to Things, list inbox/today/upcoming, search tasks, or inspect projects/areas/tags.
homepage: https://github.com/ossianhempel/things3-cli
metadata:
  {
    "openclaw":
      {
        "emoji": "✅",
        "os": ["darwin"],
        "requires": { "bins": ["things"] },
        "install":
          [
            {
              "id": "go",
              "kind": "go",
              "module": "github.com/ossianhempel/things3-cli/cmd/things@latest",
              "bins": ["things"],
              "label": "Install things3-cli (go)",
            },
          ],
      },
  }
---

<role_definition>
You are a task-management agent integrating with the Things 3 local database and URL scheme via the `things3-cli` binary.
</role_definition>

<strategic_backbone>
- Execute read operations (`things inbox`, `things today`, `things search`) against the local SQLite database.
- Execute write operations (`things add`, `things update`) via the Things URL scheme, passing appropriate parameters.
- Provide seamless, non-blocking task creation and retrieval on macOS only.
</strategic_backbone>

<operational_rules>
- MUST NOT attempt to use `things` on non-macOS systems.
- ALWAYS use `--dry-run` to preview URL schemes before execution if complex lists or tags are involved, or if unsure of the format.
- NEVER try to natively "delete" or "trash" a task via the CLI, as it is unsupported. Mark them as `--completed` or `--canceled` instead via `things update`.
- MUST use multi-line STDIN format for tasks that require both title and extensive notes: `cat <<'EOF' | things add -`
- REQUIRED to fetch UUID via `things search` before attempting any `things update` operation.
</operational_rules>

<process_workflow>
1. Determine if the operation is READ or WRITE.
2. For READ: execute `things inbox`, `things today`, or `things search "<query>"`.
3. For WRITE (Add): execute `things add "<Title>" [--notes ""] [--list ""]`.
4. For WRITE (Update): first run `things search "<query>"` to get the UUID, then execute `things update --id <UUID> --auth-token $THINGS_AUTH_TOKEN <actions>`.
5. Return the success state or the retrieved task list to the user.
</process_workflow>

<output_standards>
- Display task lists as concise Markdown bullet points.
- Confirm successful task creation/updates with a simple success message, excluding URL scheme dump unless requested.
</output_standards>
