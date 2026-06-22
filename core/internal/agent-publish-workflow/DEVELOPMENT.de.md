# Entwicklungsgeschichte & Architektur-Entscheidungen

🇺🇸 [Read this in English](DEVELOPMENT.md)

## Ursprung (Die "Kontext" Phase)

Der `agent-publish-workflow` entstand ursprünglich als ein lokaler, pragmatischer Bash-Skript-Workaround während der Entwicklung des Meta-Skills *Skill-Engineer*.
Beim Bau fortschrittlicher AI-Agent-Muster stießen wir auf zwei massive operationale Risiken, die beim Veröffentlichen von Open-Source-Agenten-Repositories (welche stark auf `references/`, `scripts/` oder `<configuration>` Umgebungen angewiesen sind) entstehen:

1. **Stateful Pollution (Zustandsverschmutzung):** Agenten-Skills speichern akribisch den lokalen Status des Nutzers (z.B. `STATUS: UNCONFIGURED`, `Target Platform: Claude Code`). Wenn diese Dateien unverändert committet werden, erbt der Endnutzer einen "verschmutzten" Zustand, wodurch das eigentlich notwendige Setup-Interview des Agenten umgangen wird.
2. **Data Leaks (DLP-Risiko):** Da KI-Agenten mit echten lokalen Daten arbeiten, um RAG-Referenzen zusammenzustellen oder Tests auszuführen, besteht das immense Risiko, dass funktionsfähige API-Keys, echte Kundendaten, interne Firmen-IPs (`intern.x10aix.tech`) oder Server-Passwörter aus Versehen in den `examples/` Ordnern festkodiert und blindlings auf GitHub gepusht werden.

Unser erster Prototyp war ein destruktiver File-Wiper (Datei-Löschskript), gefolgt von einem automatischen `git push`. Wir erkannten jedoch schnell, dass diese Methode die iterative, reibungslose Philosophie des modernen "Vibe-Codings" komplett zerstörte. Die Schlussfolgerung war klar: **Dies muss sich zu einem eigenständigen, daten- und plattformagnostischen Open-Source-Agenten-Workflow entwickeln.**

## Evolution: Der agnostische Publish Preparator

Während unserer iterativen Ausarbeitung (v1.0.0) deckten wir einen kritischen UX-Fehler auf: Das direkte Erzwingen einer Bereinigung im Root-Ordner zerstörte die aktiven Master-Konfigurationen des Entwicklers vollständig. Ein Entwickler würde also direkt nach dem Veröffentlichen die Konfiguration in seiner eigenen Agenten-Umgebung verlieren.

Um dies zu verhindern, haben wir die Architektur chirurgisch umgebaut und das Tool in einen **zerstörungsfreien, agnostischen Publisher (Non-Destructive Agnostic Publisher)** verwandelt:

1. **Distributions-Modi (`dist` & `zip`):** Anstatt Master-Dateien zu vernichten, dupliziert das Skript das Projekt nun lautlos in einen temporären Cache, führt dort die strengen Bereinigungsregeln aus und archiviert es in einer ZIP-Datei (`releases/`). Die lokale Vibe-Coding-Umgebung bleibt somit einwandfrei und zu 100 % erhalten.
2. **Der reibungslose Secret Scanner (Frictionless Pre-Flight):** Anstatt uns auf schwere Third-Party-Abhängigkeiten (wie TruffleHog, Docker-Container oder Pythons `pre-commit` Hooks, die enorme Reibung erzeugen) zu stützen, haben wir einen nativen Pre-Flight-Scanner in absolut purem PowerShell entwickelt. Er operiert global und sofort, beschränkt sich strikt auf lesbare Textdateien unter 1 MB (um RAM-Abstürze bei unlesbaren `.docx`-Datensätzen zu verhindern), maskiert das gefundene Geheimnis in der Konsolenausgabe (um Terminal-History-Logging zu vermeiden) und fordert interaktiv ein Veto vom Nutzer, falls ein Leak entdeckt wird (samt False-Positives Check).
3. **Heavy Project Safeguards (Schutz vor großen Projekten):** Da immer die Gefahr besteht, dass Vibe-Coder dieses Tool global aus Versehen auslösen, haben wir eine Notbremse eingebaut, die bei Markern wie `package.json` oder `.sln` (welche auf gigantische oder nicht-agenten-lokalisierte Repositories hindeuten) eine explizite Warnung ausgibt.

## Fazit

Als krönender Abschluss dient dieser Workflow heute als definitives CI/CD Export-Sicherheitsnetz, das exklusiv auf Agentic Workflows zugeschnitten ist. Es schützt geistiges Eigentum (DLP) und lokale Hardware-Konfigurationen gleichzeitig, agiert vollständig offline, arbeitet nativ innerhalb der IDE des Agenten und verzichtet komplett auf jegliche fremde Software-Installation (Zero Dependencies).
