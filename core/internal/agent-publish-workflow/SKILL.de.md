---
name: agent-publish-workflow
description: >
  ZerstÃ¶rungsfreie Release-Vorbereitung fÃ¼r Agenten-Skills. FÃ¼hrt einen Pre-Flight Secret Scan aus und bereinigt lokale Konfigurationen sicher als ZIP, dist-Ordner oder direktes Replace.
---

# Agent Publish Workflow

Ein Hilfs-Skill zur Automatisierung der Release-Vorbereitung (Pre-Flight Check) von Agenten-Skills. Er bereinigt den Konfigurationsstatus dynamisch, blockiert versehentliche API-Key-Leaks und exportiert das saubere Paket (ohne die lokalen Master-Dateien zu zerstÃ¶ren).

ðŸ‡ºðŸ‡¸ [Read this in English](SKILL.md)

## Verwende diesen Skill, wenn
- Der Nutzer einen Agenten-Skill verpacken und teilen mÃ¶chte (z.B. via ZIP, Git oder internem Firmen-Netzwerk).
- Der Nutzer sein Projekt proaktiv auf versehentlich hartkodierte Secrets scannen mÃ¶chte (Audit-Report).
- Der Nutzer eine saubere (unconfigured) Version des Skills erzeugen mÃ¶chte, OHNE seine eigenen lokalen Konfigurationen und LLM-Pfade zu verlieren.

## Verwende diesen Skill nicht, wenn
- Der Nutzer erwartet, dass der Agent automatisch Git Push-Befehle remote ausfÃ¼hrt. Dieser Workflow bereitet nur vor; der Transportweg bleibt manuell.

## <role_definition>
Du bist der **Publish Preparator**. Dein Ziel ist es, das Projekt mechanisch und manipulationssicher fÃ¼r die Verteilung aufzubereiten. Du prÃ¼fst den Code auf Token-Leaks, protokollierst die Ergebnisse in einem Audit-Log und schnÃ¼rst das saubere Export-Paket exakt nach dem vom Nutzer gewÃ¤hlten "Publish Mode".

## <strategic_backbone>
- **Non-Destructive Export:** Wenn in `dist` oder als `.zip` exportiert wird, bleiben die hart erarbeiteten lokalen Settings (Master-Dateien) des Vibe-Coders vollstÃ¤ndig erhalten.
- **Frictionless Security & Auditing:** Ein Pre-Flight Secret Scan sucht vor dem Verpacken nach OpenAI, Anthropic, GitHub Tokens und PasswÃ¶rtern. Er erstellt eine persistente Log-Datei als Nachweis.
- **Universal Sanitization Policy:** Das Skript Ã¼berschreibt sÃ¤mtliche Key-Value-Paare innerhalb eines `<!-- CONFIGURATION_START -->` Blocks im Export-Format dynamisch auf `N/A`.
- **Progressive Disclosure: N/A

## <operational_rules>
- Phase 1 MUSS den Nutzer interaktiv nach dem gewÃ¼nschten `Publish Mode` fragen, falls noch keine `.skill-config.json` existiert. Du musst die Wahl danach in eine lokale `.skill-config.json` Datei schreiben und sicherstellen, dass sie in der `.gitignore` steht.
- VerÃ¤ndere NIEMALS die PowerShell-Audit-Logik; starte die Skripte exakt wie vorgegeben.

## <process_workflow>

### Phase 1: N/A
PrÃ¼fe, ob im aktuellen Verzeichnis eine `.skill-config.json` existiert. 
Wenn nicht, frage den Nutzer: N/A
Sobald die Antwort vorliegt, generiere eine `.skill-config.json` mit dem gewÃ¤hlten `Publish Mode` und fÃ¼ge die Datei der `.gitignore` hinzu.

### Phase 2: N/A
// turbo-all
1. FÃ¼hre das modulare Secret-Scanner-Skript aus. Es generiert automatisch einen Report unter `reports/` und pausiert bei Gefahr.
   ```powershell
   .\scripts\preflight_scan.ps1
   ```

### Phase 3: N/A
Lies den `Publish Mode` Token aus der lokalen `.skill-config.json` Datei. 
FÃ¼ge ihn in den `-Mode` Parameter des folgenden PowerShell-Befehls ein (ersetze `[HIER_MODUS_EINTRAGEN]`) und fÃ¼hre es aus.
**WICHTIG: N/A

// turbo
1. FÃ¼hre das modulare Export-Workflow-Skript aus, um das Release-Paket zu erstellen: N/A
   ```powershell
   .\scripts\export_workflow.ps1 -Mode "[HIER_MODUS_EINTRAGEN]"
   ```

### Phase 4: N/A
Gib dem Nutzer exakt diesen Textblock aus: N/A
> âœ… **Bereinigung & Export abgeschlossen.** Die lokale Konfiguration der exportierten Dateien wurde auf den Werkszustand zurÃ¼ckgesetzt.
> ðŸ“„ **Scan Log: N/A
> âš ï¸ **WICHTIGER DISCLAIMER: N/A
> ðŸ“¦ *Der Skill ist nun bereit fÃ¼r das Sharing, Zipping oder einen sauberen Git Push.*

## <output_standards>
- Keine strukturellen Abweichungen in den Befehlen.
- Ãœberlasse den eigentlichen Export-Transport (Git etc.) dem Nutzer.

