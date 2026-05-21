# x10aix Skill-Evolution

Willkommen bei **Skill-Evolution**, dem öffentlichen Community-Repository für Agent-Skills, entwickelt von x10aix.tech. Dieses Repo enthält unsere hochstrukturierten, intensiv getesteten und standardisierten Agenten-Prompts (Skills) für KI-Systeme wie Antigravity, Claude Code und Cursor.

🇬🇧 [Read this in English](README.md)

## 🏗 Repository-Struktur

Unsere Skills sind in strikte Kategorien unterteilt, um Modularität zu gewährleisten und Konflikte zu vermeiden:

* **`skills/core/internal/`**: **Proprietäre Kern-Skills**. Unsere selbstentwickelten Flaggschiff-Skills (z.B. `skill-engineer`, `google-ads-manager`, `agent-publish-workflow`). Alle Skills wurden vor der Veröffentlichung von internen Secrets bereinigt.
* **`skills/core/vendor/`**: **Vendor Skills**. Öffentliche Basis-Skills, die das Fundament bestimmter Workflows bilden.
* **`skills/forked/`**: **Angepasste Fremd-Skills**. Ursprünglich von der Open-Source-Community erstellte Skills, die wir "geforkt" und mithilfe unseres `skill-engineer` stark optimiert haben.
* **`skills/clawdbot/`**: **Server-Automatisierungs-Skills**. Eine massive Bibliothek von über 60 hochspezialisierten, dedizierten Wrapper-Skills, die für die Ausführung auf Headless-Servern (Clawdbot) konzipiert sind.

## 🚀 Der XML-Tag Standard

Alle Skills in diesem Repository wurden von unserem Agenten **Skill-Engineer** entwickelt oder überarbeitet. Sie folgen einer strikten XML-Tag-Architektur, die vages "LLM-Geschwafel" eliminiert und durch überprüfbare, mechanische Regeln ersetzt:

1. `<role_definition>`: Präzise Persona und mechanische Fähigkeiten.
2. `<strategic_backbone>`: Die Philosophie und strukturelle Logik.
3. `<operational_rules>`: Strikte Grenzen, `IMMER`-Regeln und `NIEMALS`-Tabus.
4. `<process_workflow>`: Ausführbare Schritt-für-Schritt-Anweisungen.
5. `<output_standards>`: Erwartete Formate und Beispiele.

## 🛠 Nutzung & Lokales Setup

Um diese Skills in deiner eigenen KI-IDE (z.B. Antigravity) zu nutzen:
1. Klone dieses Repository.
2. Kopiere den gewünschten Skill-Ordner direkt in das Skill-Verzeichnis deines Workspaces (z.B. `.gemini/antigravity/skills/`).
3. Falls ein Skill konfiguriert werden muss, wird er dich beim ersten Start entweder danach fragen oder automatisch eine lokale `.skill-config.json` generieren.

## 🤝 Forking & Workflow für Fremd-Skills

Einen tollen Skill woanders gefunden? So sieht der x10aix-Workflow für die Integration fremder Skills aus:
1. **Forke** den externen Skill in deinen privaten Workspace (z.B. unter `skills/forked`).
2. Lass den **Skill-Engineer** (im Modus "C-Edit" oder "C-Audit") über die `SKILL.md` laufen, um sie an den strengen XML-Standard anzupassen und Floskeln zu entfernen.
3. Füge **IMMER** einen `## Origin / Credits`-Block am Ende deiner modifizierten `SKILL.md` ein, um den ursprünglichen Autor/das Original-Repo sauber zu referenzieren!
4. Nutze den `agent-publish-workflow`, um lokale API-Keys zu entfernen, bevor du den optimierten Fork wieder in die Öffentlichkeit pushst!

---
*Maintained with ❤️ by x10aix.tech*
