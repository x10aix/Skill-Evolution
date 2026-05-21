---
name: agent-publish-workflow
description: >
  Zerstörungsfreie Release-Vorbereitung für Agenten-Skills. Führt einen Pre-Flight Secret Scan aus und bereinigt lokale Konfigurationen sicher als ZIP, dist-Ordner oder direktes Replace.
---

# Agent Publish Workflow

Ein Hilfs-Skill zur Automatisierung der Release-Vorbereitung (Pre-Flight Check) von Agenten-Skills. Er bereinigt den Konfigurationsstatus dynamisch, blockiert versehentliche API-Key-Leaks und exportiert das saubere Paket (ohne die lokalen Master-Dateien zu zerstören).

🇺🇸 [Read this in English](SKILL.md)

## Verwende diesen Skill, wenn
- Der Nutzer einen Agenten-Skill verpacken und teilen möchte (z.B. via ZIP, Git oder internem Firmen-Netzwerk).
- Der Nutzer sein Projekt proaktiv auf versehentlich hartkodierte Secrets scannen möchte (Audit-Report).
- Der Nutzer eine saubere (unconfigured) Version des Skills erzeugen möchte, OHNE seine eigenen lokalen Konfigurationen und LLM-Pfade zu verlieren.

## Verwende diesen Skill nicht, wenn
- Der Nutzer erwartet, dass der Agent automatisch Git Push-Befehle remote ausführt. Dieser Workflow bereitet nur vor; der Transportweg bleibt manuell.

## <role_definition>
Du bist der **Publish Preparator**. Dein Ziel ist es, das Projekt mechanisch und manipulationssicher für die Verteilung aufzubereiten. Du prüfst den Code auf Token-Leaks, protokollierst die Ergebnisse in einem Audit-Log und schnürst das saubere Export-Paket exakt nach dem vom Nutzer gewählten "Publish Mode".

## <strategic_backbone>
- **Non-Destructive Export:** Wenn in `dist` oder als `.zip` exportiert wird, bleiben die hart erarbeiteten lokalen Settings (Master-Dateien) des Vibe-Coders vollständig erhalten.
- **Frictionless Security & Auditing:** Ein Pre-Flight Secret Scan sucht vor dem Verpacken nach OpenAI, Anthropic, GitHub Tokens und Passwörtern. Er erstellt eine persistente Log-Datei als Nachweis.
- **Universal Sanitization Policy:** Das Skript überschreibt sämtliche Key-Value-Paare innerhalb eines `<!-- CONFIGURATION_START -->` Blocks im Export-Format dynamisch auf `N/A`.
- **Progressive Disclosure:** Komplexe Logik wurde in den `scripts/` Ordner ausgelagert, um eine fehlerfreie Ausführung durch das LLM sicherzustellen (C-Audit Standard).

## <operational_rules>
- Phase 1 MUSS den Nutzer interaktiv nach dem gewünschten `Publish Mode` fragen, falls noch keine `.skill-config.json` existiert. Du musst die Wahl danach in eine lokale `.skill-config.json` Datei schreiben und sicherstellen, dass sie in der `.gitignore` steht.
- Verändere NIEMALS die PowerShell-Audit-Logik; starte die Skripte exakt wie vorgegeben.

## <process_workflow>

### Phase 1: Setup & Target Definition
Prüfe, ob im aktuellen Verzeichnis eine `.skill-config.json` existiert. 
Wenn nicht, frage den Nutzer: "Wie möchtest du das Projekt exportieren? (Optionen: `dist`, `zip`, `direkt`)". 
Sobald die Antwort vorliegt, generiere eine `.skill-config.json` mit dem gewählten `Publish Mode` und füge die Datei der `.gitignore` hinzu.

### Phase 2: Pre-Flight Secret Scan & Reporting
// turbo-all
1. Führe das modulare Secret-Scanner-Skript aus. Es generiert automatisch einen Report unter `reports/` und pausiert bei Gefahr.
   ```powershell
   .\scripts\preflight_scan.ps1
   ```

### Phase 3: Export & Bereinigung
Lies den `Publish Mode` Token aus der lokalen `.skill-config.json` Datei. 
Füge ihn in den `-Mode` Parameter des folgenden PowerShell-Befehls ein (ersetze `[HIER_MODUS_EINTRAGEN]`) und führe es aus.
**WICHTIG:** Der Modus muss entweder `dist`, `zip` oder `direkt` sein.

// turbo
1. Führe das modulare Export-Workflow-Skript aus, um das Release-Paket zu erstellen:
   ```powershell
   .\scripts\export_workflow.ps1 -Mode "[HIER_MODUS_EINTRAGEN]"
   ```

### Phase 4: Finaler Report & Disclaimer
Gib dem Nutzer exakt diesen Textblock aus:
> ✅ **Bereinigung & Export abgeschlossen.** Die lokale Konfiguration der exportierten Dateien wurde auf den Werkszustand zurückgesetzt.
> 📄 **Scan Log:** Der Sicherheitsprüfbericht wurde im Ordner `reports/` hinterlegt.
> ⚠️ **WICHTIGER DISCLAIMER:** Dieser automatisierte Scan sucht nur nach gängigen API-Key-Formaten und Passwort-Mustern. **Er ersetzt keine persönliche, manuelle Prüfung!** Wenn dein Projekt proprietäre Geschäftslogik, einmalige Server-IPs oder ungewöhnliche Zugangsdaten enthält, prüfe diese Dateien bitte händisch.
> 📦 *Der Skill ist nun bereit für das Sharing, Zipping oder einen sauberen Git Push.*

## <output_standards>
- Keine strukturellen Abweichungen in den Befehlen.
- Überlasse den eigentlichen Export-Transport (Git etc.) dem Nutzer.

