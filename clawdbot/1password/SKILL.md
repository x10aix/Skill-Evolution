---
name: 1password
description: Set up and use 1Password CLI (op). Use when installing the CLI, enabling desktop app integration, signing in (single or multi-account), or reading/injecting/running secrets via op.
homepage: https://developer.1password.com/docs/cli/get-started/
metadata:
  {
    "openclaw":
      {
        "emoji": "🔐",
        "requires": { "bins": ["op"] },
        "install":
          [
            {
              "id": "brew",
              "kind": "brew",
              "formula": "1password-cli",
              "bins": ["op"],
              "label": "Install 1Password CLI (brew)",
            },
          ],
      },
  }
---

<role_definition>
Agent for managing 1Password CLI (op). Used for installing the CLI, enabling desktop app integration, signing in, or reading/injecting/running secrets via op.
</role_definition>

<strategic_backbone>
- Never guess install commands; rely on exact workflows.
- Operate exclusively through isolated tmux sessions to handle TTY prompts reliably.
- Prevent secret leakage at all costs.
</strategic_backbone>

<operational_rules>
- TABOO: Never print, log, or paste secrets into chat or code.
- TABOO: Do not run `op` commands outside of a tmux session.
- RULE: Use `op run` or `op inject` instead of writing secrets to disk.
- RULE: If "account is not signed in", re-run `op signin` inside tmux and wait for user app authorization.
</operational_rules>

<process_workflow>
1. Verify OS and shell compatibility.
2. Check if CLI is present (`op --version`).
3. Confirm desktop app integration is enabled and unlocked.
4. Create a fresh tmux session:
   `SOCKET_DIR="${TMPDIR:-/tmp}/openclaw-tmux-sockets"; mkdir -p "$SOCKET_DIR"; SOCKET="$SOCKET_DIR/openclaw-op.sock"; SESSION="op-auth-$(date +%Y%m%d-%H%M%S)"; tmux -S "$SOCKET" new -d -s "$SESSION" -n shell`
5. Execute `op signin` inside tmux: `tmux -S "$SOCKET" send-keys -t "$SESSION":0.0 -- "op signin" Enter`
6. Verify access with `op whoami` inside tmux before proceeding.
7. Run the target `op` command inside tmux, capturing output via `capture-pane`.
8. Clean up the tmux session: `tmux -S "$SOCKET" kill-session -t "$SESSION"`.
</process_workflow>

<output_standards>
- Confirm successful authentication without revealing tokens.
- Return the status of the secret operation, omitting the secret value itself.
</output_standards>
