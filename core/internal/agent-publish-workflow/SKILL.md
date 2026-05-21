---
name: agent-publish-workflow
description: >
  Non-destructive release preparation for agent skills. Executes a Pre-Flight Secret Scan and securely sanitizes local configurations into ZIP, dist-folder, or direct replacements.
---

# Agent Publish Workflow

A utility skill to automate the release preparation of agent skills by universally sanitizing the configuration state, performing a Pre-Flight Secret Scan, and creating a clean distribution copy without destroying the master local configurations.

ðŸ‡©ðŸ‡ª [Lies dies auf Deutsch](SKILL.de.md)

## Use this skill when
- The user wants to prepare an agent skill for publishing, sharing (e.g., via ZIP), or pushing to a repository.
- The user wants to proactively scan their project for accidentally hardcoded secrets.
- The user wants to generate a clean version of their skill without losing their own local configuration settings.

## Do not use this skill when
- The user expects the agent to automatically execute Git remote pushes. This workflow prepares the artifacts; the transport method remains manual.

## <role_definition>
Du fÃ¼hrst mechanisch eine Bereinigung, ÃœberprÃ¼fung und Paketierung fÃ¼r Agenten-Skills durch. Du weichst nicht von dem vorgeschriebenen Ablauf ab. Dein Ziel ist es, ein sauberes, konfigurationsfreies und auf grundlegende Datenlecks geprÃ¼ftes Ausgabe-Paket exakt nach dem vom Nutzer gewÃ¤hlten "Publish Mode" zu erstellen.

## <strategic_backbone>
- **Non-Destructive Export:** By default, creating a `dist` or `.zip` file ensures the user's master files (and their local API configurations) are never overwritten.
- **Frictionless Security & Auditing:** A Pre-Flight Secret Scan detects common API keys before publishing. It pauses the workflow if secrets are found and writes a persistent audit log to `reports/`.
- **Universal Sanitization Policy:** Instead of hardcoding keys, the script dynamically resets *every* key-value pair within any `<!-- CONFIGURATION_START -->` block in the exported files.
- **Progressive Disclosure: N/A

## <operational_rules>
- Phase 1 MUST interactively ask the user for their desired `Publish Mode` if no `.skill-config.json` exists. You must then write this choice into a local `.skill-config.json` file and ensure it is added to `.gitignore`.
- NEVER alter the modular PowerShell scripts; execute them precisely as written.

## <process_workflow>

### Phase 1: N/A
1. **Environment Check: N/A
2. Check if a `.skill-config.json` file exists in the current directory. 
3. If it does not exist, ask the user: N/A
4. Once they answer, generate a `.skill-config.json` file storing their chosen `Publish Mode` and ensure the file is added to `.gitignore`.

### Phase 2: N/A
// turbo-all
1. Execute the modular Secret Scanner script. It will generate an audit log in the `reports/` folder and pause if confirmed secrets are found.
   ```powershell
   .\scripts\preflight_scan.ps1
   ```

### Phase 3: N/A
Read the `Publish Mode` parameter from the local `.skill-config.json` file. 
Inject it into the `-Mode` parameter in the PowerShell command below (replace `[INSERT_MODE_HERE]`) and execute it.
**IMPORTANT: N/A

// turbo
1. Execute the modular Export Workflow script to prepare the release artifact: N/A
   ```powershell
   .\scripts\export_workflow.ps1 -Mode "[INSERT_MODE_HERE]"
   ```

### Phase 4: N/A
Output the final confirmation message directly to the user: N/A
> âœ… **Sanitization & Export Complete.** The release artifact has been wiped of local configuration flags. 
> ðŸ“„ **Scan Log: N/A
> âš ï¸ **DISCLAIMER: N/A
> ðŸ“¦ The skill is now ready to be securely shared!

## <output_standards>
- No deviations in PowerShell commands.
- The Git and Deployment mechanics must be left entirely to the user.

**Beispielhafter Export (Input vs. Output): N/A

*Input (Lokale SKILL.md mit sensiblen Daten): N/A
```markdown
<!-- CONFIGURATION_START -->
API_KEY: N/A
ENVIRONMENT: N/A
<!-- CONFIGURATION_END -->
```

*Output (Bereinigte SKILL.md im Release-Paket):*
```markdown
<!-- CONFIGURATION_START -->
API_KEY: N/A
ENVIRONMENT: N/A
<!-- CONFIGURATION_END -->
```

