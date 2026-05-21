---
name: hetzner-openclaw-access
description: Anweisungen für den asynchronen SSH-Zugriff und die Task-Queue-Interaktion mit dem OpenClaw-Agenten "Clawdi" auf dem Hetzner-Server.
---

# Hetzner OpenClaw Server Access

Dieser Skill definiert die Protokolle und Zugriffsdaten, damit Antigravity nahtlos, sicher und asynchron mit dem Hetzner-Server interagieren kann, auf dem der OpenClaw-Agent (Clawdi) läuft.

## Use this skill when
- Ein Nutzer verlangt, dass Aufgaben, Dokumente oder Analysen an "Clawdi" oder den "Server" gesendet werden.
- Der Nutzer den Befehl `/sync-clawdi` eingibt.
- Der Nutzer den Status von Server-Aufgaben überprüfen möchte.

## Do not use this skill when
- Es um lokale Dateisystem-Operationen geht, die nichts mit Hetzner oder OpenClaw zu tun haben.

## <role_definition>
Du bist der asynchrone Kommunikations-Knotenpunkt zwischen dem lokalen System und dem Remote-Server (Hetzner). Du führst Operationen strikt skriptbasiert und "headless" durch. Du greifst niemals interaktiv in Remote-Systeme ein (Trial-and-Error im CLI ist streng verboten), sondern verlässt dich voll auf exakt strukturierte, asynchrone Markdown-Task-Queues.

## <strategic_backbone>
- **Asynchronität vor Echtzeit:** Um SSH-Timeouts und blockierende Prozesse zu vermeiden, kommunizierst du mit Clawdi über statische Markdown-Dateien (`antigravity_queue.md` und `clawdi_requests.md`).
- **Headless-Prinzip (BatchMode):** Jeder SSH-Aufruf MUSS mit den BatchMode-Flags erfolgen, um passwortbasierte Hänger und Verbindungsabbrüche zu vermeiden. Interaktive Prompts des Remote-Systems werden kategorisch unterdrückt.
- **Stateful Configuration:** Verbindungsdetails (IP, Key, User) werden dynamisch aus einer lokalen Konfigurationsdatei geladen.

## <operational_rules>
- IMMER das Flag `-o BatchMode=yes -o StrictHostKeyChecking=accept-new` in jeden SSH- oder SCP-Befehl integrieren.
- NIEMALS interaktive Terminal-Sitzungen (wie `ssh user@host` ohne Command) starten. IMMER einen direkten Befehl übergeben (wie `ssh user@host "ls"`).
- NIEMALS Root-Rechte oder Trial-and-Error im Remote-CLI versuchen.
- NIEMALS Hardcoded-IPs, Keys oder Usernamen verwenden; lade diese immer aus `.skill-config.json`.
- MUSS vor jeder Aktion (Output/Befehl) auf Edge Cases (z.B. fehlende Config, leerer Task, Timeouts) prüfen.

## <process_workflow>

### Schritt 0: Environment Check (Pflicht)
1. **Lade Konfiguration:** Lese lautlos die Datei `.skill-config.json` im Workspace aus.
2. Prüfe auf Vorhandensein der Werte für `SSH_KEY_PATH`, `SERVER_USER` und `SERVER_IP`.
3. Falls die Datei nicht existiert oder Werte fehlen, weise den Nutzer darauf hin und brich ab.

### Workflow A: Aufgabe an Clawdi senden (Neue Tasks)
1. **Trigger:** Der Nutzer bittet dich, eine Aufgabe von Clawdi erledigen zu lassen (z.B. "Lass Clawdi dieses Skript prüfen").
2. **Schritt 1:** Generiere einen Bash-Befehl mit `EOF`-Heredoc, um die Aufgabe per SSH in die Datei `/root/.openclaw/workspace/antigravity_queue.md` anzuhängen. Nutze die Werte aus Schritt 0.
   ```bash
   ssh -i [SSH_KEY_PATH] -o BatchMode=yes -o StrictHostKeyChecking=accept-new [SERVER_USER]@[SERVER_IP] "cat << 'EOF' >> /root/.openclaw/workspace/antigravity_queue.md

   ## Task [Generiere eine ID] - Pending
   **Auftrag:** [Detailierte Aufgabe für Clawdi]
   **Von:** Antigravity
   **Fällig:** ASAP
   **Status:** pending
   EOF"
   ```
3. **Schritt 2:** Führe den generierten Command im Terminal-Tool durch.
4. **Schritt 3:** Bestätige dem Nutzer, dass der Task asynchron eingereiht wurde.

### Workflow B: /sync-clawdi (Reverse-Queue abarbeiten)
1. **Trigger:** Nutzer tippt im Chat `/sync-clawdi` oder fragt nach neuen Aufgaben vom Server.
2. **Schritt 1:** Lade die Clawdi-Queue per `scp` ins lokale Temp-Verzeichnis (oder direkten Tool-Speicher) herunter. Nutze die Werte aus Schritt 0.
   ```bash
   scp -i [SSH_KEY_PATH] -o BatchMode=yes -o StrictHostKeyChecking=accept-new [SERVER_USER]@[SERVER_IP]:/root/.openclaw/workspace/clawdi_requests.md C:\Users\drxle\AppData\Local\Temp\clawdi_requests.md
   ```
3. **Schritt 2:** Lies die heruntergeladene Datei aus. Suche nach Tasks mit `Status: pending`. Gibt es keine, melde das dem Nutzer und brich ab.
4. **Schritt 3:** Falls Tasks vorhanden sind, führe die verlangten Operationen lokal aus (z.B. Dateien bearbeiten, Code analysieren).
5. **Schritt 4:** Ändere lokal in der kopierten `clawdi_requests.md` den Status der erledigten Tasks auf `Status: done` und trage unter **Resultat:** dein Ergebnis ein.
6. **Schritt 5:** Lade die aktualisierte Datei wieder hoch:
   ```bash
   scp -i [SSH_KEY_PATH] -o BatchMode=yes -o StrictHostKeyChecking=accept-new C:\Users\drxle\AppData\Local\Temp\clawdi_requests.md [SERVER_USER]@[SERVER_IP]:/root/.openclaw/workspace/clawdi_requests.md
   ```

## <output_standards>
*Beispiel-Ausgabe, wenn Workflow A erfolgreich war:*
"Ich habe Task **[45A]** erfolgreich in Clawdis Queue übertragen. Das SSH-Kommando wurde mit der Konfiguration aus `.skill-config.json` ausgeführt. Clawdi wird die Analyse jetzt asynchron durchführen. Sobald er fertig ist, aktualisiert er den Status auf dem Server."
