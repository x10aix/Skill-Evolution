# Changelog: x10aix-skills Monorepo

Alle strukturellen Änderungen am Skill-Ökosystem und der Monorepo-Architektur werden in dieser Datei dokumentiert. 
Die fachlichen Änderungen (Prompt-Updates) an einzelnen Skills sind in den jeweiligen `CHANGELOG.md` Dateien in den Skill-Verzeichnissen (`skills/internal/<skill>`) zu finden.

Das Format basiert auf [Keep a Changelog](https://keepachangelog.com/de-DE/1.0.0/),
und dieses Projekt folgt [Semantic Versioning](https://semver.org/lang/de/).

---

## [1.2.0] - 2026-05-21
### Added
- **Public Publishing Pipeline:** Einführung des `agent-publish-workflow` zur vollautomatischen Neutralisierung von `<!-- CONFIGURATION_START -->` Blöcken (Sanitization von API-Keys und Secrets).
- **Ecosystem Map:** Automatische Generierung der `ECOSYSTEM.md` für 60 Clawdbot-Skills via `skill-mapper`.
- **Hetzner-Server Deployment:** Direkte Synchronisation der `clawdbot`-Skills in die produktive `core-skills` Struktur des Servers.

### Changed
- **Mass Refactoring (XML-Standard):** Über 88 Skills (24 Internal, 4 Vendor, 60 Clawdbot) wurden vollständig auditiert und verlustfrei auf den strikten XML-Tag-Standard (`<role_definition>`, `<operational_rules>`, etc.) umgeschrieben. README-Floskeln wurden durch mechanische Regeln und klare Tabus ersetzt.
- **Skill-Engineer Evolution:** Der `skill-engineer` Hauptskill wurde optimiert: Ecosystem-Mapping ist nun optional und blockiert externe Skill-Imports nicht mehr.

---

## [1.1.0] - 2026-05-21
### Added
- **Submodule Architecture:** Das Skill-Repository (`x10aix/Skill-Evolution`) wurde als Git Submodule unter `skills/` in das Hauptprojekt eingebunden, um eine saubere Trennung für Open-Source Veröffentlichungen zu ermöglichen.
- **Submodule-Awareness:** Der `skill-engineer` wurde um die Fähigkeit erweitert, automatische Zwei-Phasen-Commits durchzuführen, wenn er in Submodulen arbeitet.
- **Audit-Prozess:** Initialer C-Audit für 24 `internal/` Skills durchgeführt (Pilot-Phase für das Massen-Refactoring).

### Changed
- **Dogfooding `skill-engineer`:** Der Meta-Skill wurde restrukturiert und zwingt sich nun selbst in sein eigenes formales XML-Tag-Korsett (`<role_definition>`, `<operational_rules>`, etc.), ohne Logik einzubüßen.

---

## [1.0.0] - 2026-04-29
### Added
- **Monorepo Foundation:** Etablierung des zentralen `x10aix-skills` Repositories als "Single Source of Truth".
- **3-Tier Architektur:** Einführung der Ordnerstruktur `skills/internal`, `skills/forked` und `skills/vendor` zur sauberen Trennung von Eigen- und Fremdentwicklungen.
- **Server Isolation:** Einrichtung des `skills/clawdbot` Ordners zur strikten Isolierung von über 57 Hetzner-Server spezifischen Skills.
- **Ökosystem Mapping:** Erstellung der `ECOSYSTEM.md` Datei zur Visualisierung und matrizengestützten Definition von Skill-Abhängigkeiten (Delegation) via Mermaid.js.
- **Changelog-Architektur:** Einführung einer "Hub & Spoke" Strategie (dieses Root-Changelog für die Architektur, dezentrale Changelogs für interne Skills).

### Changed
- **Wildwuchs-Konsolidierung:** Über 75 verstreute Skills aus verschiedenen Workspaces (`x10aix-marketing-hub`, `Web and Research Analyst`, Antigravity `scratch`) wurden ins Monorepo migriert und Duplikate (wie `ad-expert` und `brand-guidelines`) durch die jeweils aktuellste Version ersetzt.
- **IDE-Anbindung:** Die lokale IDE-Einbindung (`.gemini\antigravity\skills\`) wurde durch dynamische Directory Junctions (Symlinks) auf die `internal` Skills umgestellt.

### Removed
- Vollständige Löschung veralteter Paperclip-Legacy Skills aus temporären Server-Verzeichnissen.
