# Agent Publish Workflow

A frictionless utility skill designed for "Vibe Coders" to securely automate the release preparation of AI Agent Skills. It sanitizes configuration data project-wide, performs a pre-flight secret scan to prevent data leaks, and packages the clean output without destroying the developer's local master files.

![Agent Publish Workflow](https://img.shields.io/badge/Agent-Skill-blue)

## Core Features

- **Non-Destructive Packaging:** Choose your publish mode (`dist` folder, `.zip` archive, or `direct` overwrite). The workflow safely copies, sanitizes, and packages the project without overwriting your local settings (e.g. your private LLM endpoints or Anthropic API Keys).
- **Pre-Flight Secret Scanner:** Automatically hunts for exposed API Tokens (OpenAI, Anthropic, GitHub) and hardcoded passwords within your `.md`, `.json`, `.py`, and `.txt` files.
- **Audit Logging:** Every scan generates a timestamped `.log` report in the `reports/` directory providing a paper trail of the pre-flight checks.
- **Agentic Configuration Wiper:** Dynamically detects `<!-- CONFIGURATION_START -->` blocks in all documentation files and resets them to the open-source factory default (`UNCONFIGURED` / `N/A`).
- **Heavy Project Recognition:** Built-in safeguards abort recursive scans if large software environments (like `node_modules`, `.sln`, or `package.json`) are accidentally targeted.

## Usage

When triggering this skill via your agent (Cursor, Claude Code, etc.), it will:
1. Verify if your target project is an Agent Skill or a heavy Software Project.
2. Run the Pre-Flight Secret Scan against all readable text files (`< 1MB`).
3. Alert you if potential secrets are found.
4. Read your preferred `Publish Mode`.
5. Wipe the cloned configurations and finalize the export artifact (e.g., `releases/release_vX.zip`).

### ⚠️ Security Limitations
**This is a pragmatic guardrail, NOT an Enterprise Data Loss Prevention (DLP) solution.** The scanner relies on Regex to catch common slip-ups (e.g. pasted OpenAI keys). It does NOT recognize custom internal IPs, proprietary passwords, or complex business logic. You must still manually verify your files before pushing.

### 🤖 Agent Compatibility & Platform Notes
- **Operating System:** Currently, the logic is **100% PowerShell-based**. It runs natively on Windows. Mac/Linux users must have PowerShell Core installed, or wait for the upcoming bash (`.sh`) equivalents.
- **Directives:** You will notice `// turbo-all` or `// turbo` comments above the script blocks in the `.md` files. This is a specific directive for the **Antigravity Agent** to auto-run the commands without asking for permission. If you use Cursor or Claude Code, these agents will simply ignore the comment and run the code normally.

## Files

- `SKILL.md` - English instructions and trigger configuration.
- `SKILL.de.md` - German instructions and trigger configuration.

## Installation

Clone this repository into your agent's skill directory (e.g., `~/.gemini/antigravity/skills/agent-publish-workflow`) and reference it in your assistant to begin safely shipping your Agent architectures.
