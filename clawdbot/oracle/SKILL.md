---
name: oracle
description: Best practices for using the oracle CLI (prompt + file bundling, engines, sessions, and file attachment patterns).
homepage: https://askoracle.dev
metadata:
  {
    "openclaw":
      {
        "emoji": "🧿",
        "requires": { "bins": ["oracle"] },
        "install":
          [
            {
              "id": "node",
              "kind": "node",
              "package": "@steipete/oracle",
              "bins": ["oracle"],
              "label": "Install oracle (node)",
            },
          ],
      },
  }
---

<role_definition>
Agent for bundling prompts with specific project file contexts and routing them to LLMs via the Oracle CLI for one-shot advisory workflows.
</role_definition>

<strategic_backbone>
- Tooling: `oracle` CLI (or `npx -y @steipete/oracle`).
- Execution Mode: Terminal execution (often long-running tasks).
- Capability Scope: Generating context-rich payloads, performing token dry-runs, and executing browser or API-based LLM queries.
</strategic_backbone>

<operational_rules>
- MUST explicitly pick a tight file set containing only necessary context using `--file` (accepts files, directories, globs) and exclusion patterns (`--file "!..."`).
- NEVER attach files larger than 1 MB, or secrets (e.g., `.env`, key files, auth tokens). Aggressively redact sensitive data.
- MUST use `--dry-run summary --files-report` before executing a long task to preview the payload and token footprint.
- MUST use `--engine browser` for GPT/Gemini long-thinking paths, and `--engine api` for Claude/Grok/Codex or multi-model runs.
- MUST set a readable `--slug "<3-5 words>"` to label sessions clearly.
- MUST provide an exhaustive prompt containing project briefing, boundaries, exact errors, constraints, and desired output formats.
- NEVER repeatedly re-run a timed-out browser execution. MUST reattach to the existing session via `oracle session <id> --render`.
- MUST use `--force` only when intentionally circumventing the duplicate prompt guard for a fresh run.
</operational_rules>

<process_workflow>
1. Define the precise set of input files, avoiding ignored folders (`node_modules`, `dist`, `.git`, etc.) unless explicitly needed.
2. Build a high-signal prompt defining context, repro steps, constraints, and expected output.
3. Run a dry run to check file selection and token usage: `oracle --dry-run summary --files-report -p "<prompt>" --file "<pattern>"`
4. Execute the Oracle run (e.g., `oracle --engine browser --model gpt-5.2-pro --slug "my-task" -p "<prompt>" --file "<pattern>"`).
5. If the terminal process times out or detaches during a browser run, check status via `oracle status --hours 72` and reattach via `oracle session <id> --render`.
</process_workflow>

<output_standards>
- Treat Oracle outputs as advisory; verify code changes against tests and existing architecture.
- Do not dump the entire raw generated code unless specifically requested; extract the patch plan or the key recommendations.
- Notify the user if a session detaches and provide the command to reattach.
</output_standards>
