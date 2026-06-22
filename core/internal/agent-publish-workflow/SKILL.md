---
name: agent-publish-workflow
description: >
  Non-destructive release preparation and publishing pipeline for agent skills (SKILL.md packages).
  Executes a Pre-Flight Secret Scan, sanitizes local configuration, and packages skills into ZIP,
  dist-folder, or direct-replace artifacts. Use when the user wants to publish, share, release,
  or push a skill to a repository. Also triggers on: "Skill veröffentlichen", "Skill publishen",
  "Secret Scan", "Release vorbereiten", "saubere Version exportieren".
  Do NOT use when the user only wants to write or update a skill without publishing it
  (use skill-engineer instead), or when the user expects automatic Git remote pushes.
---

# Agent Publish Workflow

A utility skill to automate the release preparation of agent skills by universally sanitizing the configuration state, performing a Pre-Flight Secret Scan, and creating a clean distribution copy without destroying the master local configurations.

🇩🇪 [Lies dies auf Deutsch](SKILL.de.md)

## Use this skill when
- The user wants to prepare an agent skill for publishing, sharing (e.g., via ZIP), or pushing to a repository.
- The user wants to proactively scan their project for accidentally hardcoded secrets.
- The user wants to generate a clean version of their skill without losing their own local configuration settings.

## Do not use this skill when
- The user expects the agent to automatically execute Git remote pushes. This workflow prepares the artifacts; the transport method remains manual.

## <role_definition>
Du führst mechanisch eine Bereinigung, Überprüfung und Paketierung für Agenten-Skills durch. Du weichst nicht von dem vorgeschriebenen Ablauf ab. Dein Ziel ist es, ein sauberes, konfigurationsfreies und auf grundlegende Datenlecks geprüftes Ausgabe-Paket exakt nach dem vom Nutzer gewählten "Publish Mode" zu erstellen.

## <strategic_backbone>
- **Non-Destructive Export:** By default, creating a `dist` or `.zip` file ensures the user's master files (and their local API configurations) are never overwritten.
- **Frictionless Security & Auditing:** A Pre-Flight Secret Scan detects common API keys before publishing. It pauses the workflow if secrets are found and writes a persistent audit log to `reports/`.
- **Universal Sanitization Policy:** Instead of hardcoding keys, the script dynamically resets *every* key-value pair within any `<!-- CONFIGURATION_START -->` block in the exported files.
- **Progressive Disclosure:** Complex logic is offloaded to the `scripts/` directory to ensure flawless execution context for LLMs.

## <operational_rules>
- Phase 1 MUST interactively ask the user for their desired `Publish Mode` if no `.skill-config.json` exists. You must then write this choice into a local `.skill-config.json` file and ensure it is added to `.gitignore`.
- NEVER alter the modular PowerShell scripts; execute them precisely as written.
- NIEMALS einen Skill veröffentlichen, ohne zuvor Phase 2 (Pre-Flight Secret Scan) vollständig abgeschlossen zu haben — auch dann nicht, wenn der Nutzer dazu auffordert.
- NIEMALS sensible Daten (API-Keys, Server-IPs, OAuth-Tokens) in den Export-Artefakten lassen. Der Scan reicht allein nicht — prüfe den `CONFIGURATION_START`-Block zusätzlich manuell.
- NIEMALS einen `git push` ausführen — der Transport bleibt beim Nutzer.
- IMMER vor jedem destruktiven Schritt (z.B. `direct`-Modus, der Originaldateien überschreibt) eine explizite Nutzerbestätigung einholen.

## <process_workflow>

### Phase 1: Setup & Target Definition (Environment Check)
1. **Environment Check:** Überprüfe ZUERST, ob die Skripte `scripts/preflight_scan.ps1` und `scripts/export_workflow.ps1` im aktuellen Verzeichnis existieren. Wenn sie fehlen, brich den Vorgang ab und informiere den Nutzer, dass die Abhängigkeiten fehlen.
2. Check if a `.skill-config.json` file exists in the current directory. 
3. If it does not exist, ask the user: "How do you want to export this project? (Options: `dist`, `zip`, `direct`)". 
4. Once they answer, generate a `.skill-config.json` file storing their chosen `Publish Mode` and ensure the file is added to `.gitignore`.

### Phase 2: Pre-Flight Secret Scan & Reporting
// turbo-all
1. Execute the modular Secret Scanner script. It will generate an audit log in the `reports/` folder and pause if confirmed secrets are found.
   ```powershell
   .\scripts\preflight_scan.ps1
   ```

### Phase 3: Export & Sanitization
Read the `Publish Mode` parameter from the local `.skill-config.json` file. 
Inject it into the `-Mode` parameter in the PowerShell command below (replace `[INSERT_MODE_HERE]`) and execute it.
**IMPORTANT:** The mode must be either `dist`, `zip`, or `direct`.

// turbo
1. Execute the modular Export Workflow script to prepare the release artifact:
   ```powershell
   .\scripts\export_workflow.ps1 -Mode "[INSERT_MODE_HERE]"
   ```

### Phase 4: Self-Correction (Pflicht vor Ausgabe)
Führe intern diese Prüfung durch, bevor die finale Bestätigung ausgegeben wird:
- [ ] Wurde der Pre-Flight Secret Scan ohne Funde abgeschlossen (oder Funde durch Nutzer bestätigt)?
- [ ] Sind alle `CONFIGURATION_START`-Blöcke vollständig geleert (alle Werte = `""`)?
- [ ] Enthält das Export-Artefakt keine Datei `.skill-config.json` (oder ist sie korrekt als leer markiert)?
- [ ] Ist der Modus (`dist`, `zip`, `direct`) korrekt aus der Config gelesen worden?
- [ ] Wurde bei `direct`-Modus eine explizite Nutzerbestätigung eingeholt?

Bei Verletzung: Abbruch und Nutzer informieren.

### Phase 5: Final Audit & Disclaimer
Output the final confirmation message directly to the user:
> ✅ **Sanitization & Export Complete.** The release artifact has been wiped of local configuration flags. 
> 📄 **Scan Log:** Check the `reports/` folder for the security audit.
> ⚠️ **DISCLAIMER:** The Pre-Flight Scanner checks for common API keys and token formats. **It does NOT replace manual review.** Proprietary business logic, unique server IPs, or custom password schemas must be manually verified before publishing.
> 📦 The skill is now ready to be securely shared!

## <output_standards>
- No deviations in PowerShell commands.
- The Git and Deployment mechanics must be left entirely to the user.

**Beispielhafter Export (Input vs. Output):**

*Input (Lokale SKILL.md mit sensiblen Daten):*
```markdown
<!-- CONFIGURATION_START -->
API_KEY: <wird_hier_eingetragen>
ENVIRONMENT: production
<!-- CONFIGURATION_END -->
```

*Output (Bereinigte SKILL.md im Release-Paket):*
```markdown
<!-- CONFIGURATION_START -->
API_KEY: ""
ENVIRONMENT: ""
<!-- CONFIGURATION_END -->
```


## <security>
- NIEMALS Konfiguration (API-Keys, Vault-Pfade, OAuth-Tokens) in der SKILL.md speichern — ausschließlich in `.skill-config.json` oder `.env`.
- `.skill-config.json` / `.env` MUSS in `.gitignore` eingetragen sein, bevor der Skill in ein Repository gepusht wird.
- Kein State-schreibender Schritt ohne expliziten Bestätigungs-Mechanismus für destruktive Aktionen.
