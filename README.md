# x10aix Skill-Evolution

Welcome to **Skill-Evolution**, the public community repository for agent skills engineered by x10aix.tech. This repository contains our highly structured, thoroughly tested, and standardized agent prompts (Skills) for AI systems like Antigravity, Claude Code, and Cursor.

🇩🇪 [Lies dies auf Deutsch](README.de.md)

## 🏗 Repository Structure

Our skills are organized into strict categories to ensure modularity and prevent conflicts:

* **`skills/core/internal/`**: **Core Proprietary Skills**. Our in-house developed, flagship agent skills (e.g., `skill-engineer`, `google-ads-manager`, `agent-publish-workflow`). All skills have been sanitized of internal secrets before publishing.
* **`skills/core/vendor/`**: **Vendor Skills**. Baseline public skills that form the foundation of certain workflows.
* **`skills/forked/`**: **Adapted Third-Party Skills**. Skills originally created by the open-source community, which we have forked and heavily optimized using our `skill-engineer`.
* **`skills/clawdbot/`**: **Server Automation Skills**. A massive library of over 60 highly specialized, single-purpose wrapper skills designed for headless server execution (Clawdbot).

## 🚀 The XML-Tag Standard

All skills in this repository have been built or refactored by our **Skill-Engineer** agent. They adhere to a strict XML-tag architecture, eliminating vague "LLM fluff" and replacing it with verifiable mechanical rules:

1. `<role_definition>`: Precise persona and mechanical capabilities.
2. `<strategic_backbone>`: The philosophy and structural logic.
3. `<operational_rules>`: Strict boundaries, `ALWAYS` rules, and `NEVER` taboos.
4. `<process_workflow>`: Executable, step-by-step instructions.
5. `<output_standards>`: Expected formats and examples.

## 🛠 Usage & Local Setup

To use these skills in your own AI-IDE (e.g., Antigravity):
1. Clone this repository.
2. Copy the desired skill folder directly into your workspace's skill directory (e.g., `.gemini/antigravity/skills/`).
3. If a skill requires configuration, it will usually prompt you or generate a local `.skill-config.json` upon its first run.

## 🤝 Forking & Contributing

Found a great skill somewhere else? Here is the x10aix workflow for adopting foreign skills:
1. Fork the external skill into your private workspace (e.g., `skills/forked`).
2. Run the **Skill-Engineer** in "C-Edit" or "C-Audit" mode on the `SKILL.md` to adapt it to the strict XML standard and remove subjective fluff.
3. Always include an `## Origin / Credits` section at the bottom of your modified `SKILL.md` to reference the original creator!
4. Use the `agent-publish-workflow` to sanitize any private keys before pushing your optimized fork back to the public!

---
*Maintained with ❤️ by x10aix.tech*
