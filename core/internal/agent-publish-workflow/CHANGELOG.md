# Changelog

All notable changes to the `agent-publish-workflow` will be documented in this file.

## [1.2.0] - 2026-04-29

### Changed
- **Stateless Architecture:** Refactored configuration mechanism from inline `SKILL.md` blocks to a centralized `.skill-config.json` approach to avoid git conflicts and separate logic from user state.
- **Export Script Updates:** The `export_workflow.ps1` script now correctly ignores `.skill-config.json` and `.env` files during standard packaging.

## [1.1.0] - 2026-03-27

### Changed
- **Progressive Disclosure:** Refactored monolithic PowerShell blocks from `SKILL.md` into modular `scripts/preflight_scan.ps1` and `scripts/export_workflow.ps1` to prevent LLM string-interpolation errors during execution (C-Audit recommendation).
- **Adversarial Validation (False-Positive Check):** Updated the Pre-Flight Scanner to actively ignore `.example` and `.sample` files, as well as dummy keys (e.g., `sk-123456789`), dramatically reducing false positive blocks when building agent skills.

## [1.0.0] - 2026-03-27

### Added
- **Non-Destructive Publishing:** Introduced `dist`, `zip`, and `direct` configuration modes to allow vibe-coders to securely export their skills without accidentally overriding their local master setups.
- **Pre-Flight Secret Scanner:** Integrated a frictionless, zero-dependency PowerShell Regex scanner that detects exposed OpenAI, Anthropic, and GitHub tokens, as well as generic hardcoded passwords, across all text files prior to packaging.
- **Audit Logging:** Automated generation of timestamped security scan reports within the `reports/` folder.
- **Project Type Safeguards:** Added "Heavy Project" detection for environments incorporating `package.json`, `pom.xml`, or `.sln` files to deter scanning colossal non-skill repositories.
- **Universal Sanitization Policy:** Implemented a robust configuration wiper that dynamically isolates `<!-- CONFIGURATION_START -->` blocks in all textual files (under 1MB) and firmly resets them (`STATUS: UNCONFIGURED`, `N/A`) for safe open-source distribution.
