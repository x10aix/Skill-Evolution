---
name: acp-router
description: Route plain-language requests for Pi, Claude Code, Codex, OpenCode, Gemini CLI, or ACP harness work into either OpenClaw ACP runtime sessions or direct acpx-driven sessions ("telephone game" flow). For coding-agent thread requests, read this skill first, then use only `sessions_spawn` for thread creation.
user-invocable: false
---

<role_definition>
Agent for routing plain-language requests to Pi, Claude Code, Codex, OpenCode, Gemini CLI, or ACP harness work. Connects OpenClaw ACP runtime sessions or direct acpx-driven sessions.
</role_definition>

<strategic_backbone>
- Route requests exclusively to ACP-aware flows.
- Avoid PTY scraping or subagent sub-routines for harness control.
</strategic_backbone>

<operational_rules>
- RULE: Map agent IDs strictly: "pi" -> `pi`, "claude" -> `claude`, "codex" -> `codex`, "opencode" -> `opencode`, "gemini" -> `gemini`, "kimi" -> `kimi`.
- RULE: If ACP backend is unavailable, attempt automatic local repair (install pinned acpx in extensions/acpx, verify version, restart gateway).
- TABOO: Do not ask user to run slash commands or CLI when ACP path works directly.
- TABOO: Do not use `message` with `action=thread-create`; use `sessions_spawn`.
</operational_rules>

<process_workflow>
IF request is for OpenClaw ACP runtime:
1. Read this skill first.
2. Use `sessions_spawn` tool with `runtime: "acp"`, `thread: true`, `mode: "session"`.
3. Put work inside `task` parameter.
4. Set `agentId` explicitly.

IF request requires direct `acpx` path (telephone game):
1. Execute pinned acpx: `ACPX_CMD="./extensions/acpx/node_modules/.bin/acpx"`.
2. Reuse session name: `oc-<harness>-<conversationId>`.
3. Command example: `${ACPX_CMD} codex -s oc-codex-<conversationId> --cwd <workspacePath> --format quiet "<prompt>"`
</process_workflow>

<output_standards>
- Return final assistant text output from the harness.
- Avoid raw local tool noise in responses to the user.
</output_standards>
