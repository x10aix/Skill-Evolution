# Project Context: Agent Publish Workflow (DLP & Config Guard)

## 📌 Origin Story
Die Idee für dieses Tool entstand direkt aus der Praxis beim Bau des **Skill-Engineers**. Während der Entwicklung fiel uns auf, dass Agent-Repositories (die naturgemäß oft `references/`, `scripts/` oder `<configuration>` Blöcke enthalten) zwei massive operationale Risiken beim Open-Source-Publishing oder bei Team-Übergaben bergen:

1. **Stateful Pollution:** Agenten-Skills merken sich oft den Kontext des letzten Nutzers (z.B. `STATUS: UNCONFIGURED`, `Target Platform: Claude Code`). Wenn der Entwickler das pusht, erhält der nächste Nutzer einen vorkonfigurierten Zustand und das Setup-Interview des Agenten wird übersprungen.
2. **Data Leaks (DLP-Risiko):** Da Agenten lokal mit echten Daten arbeiten, um Tests oder RAG-Referenzen zu generieren, besteht die ständige Gefahr, dass aus Versehen echte API-Keys, Kundennamen, interne Server-IPs (`intern.x10aix.tech`) oder Passwörter in den `references/`- oder `examples/`-Ordnern landen und an GitHub gepusht werden.

Um das zu lösen, haben wir quick-and-dirty ein lokales Antigravity-Skript (`.agents/workflows/publish.md`) geschrieben. Dieses Skript:
1. Suchte via RegExp-Parsing nach konfigurierten Werten und setzte sie vor dem Commit auf `UNCONFIGURED` (Werkseinstellungen) zurück.
2. Zwang den lokalen LLM-Agenten (!), als Türsteher alle veränderten Dateien auf potenziell kritische Firmengeheimnisse oder Leaks zu untersuchen und den Bash-Push hart zu blockieren, falls etwas gefunden wurde.

Dieses lokale Skript war so mächtig, dass wir entschieden haben: **Das muss ein eigenständiger, plattform-agnostischer Open Source Agent/Workflow werden.**

## 🎯 Zielsetzung für den neuen Chat
Wir wollen dieses Konzept nun professionalisieren. Aus dem Quick-Fix soll ein offizieller **Agent Publish Workflow** (oder Publish Guard) werden, den Entwickler von Agent-First IDEs reibungslos in ihre eigenen Projekte klinken können.

### Core-Features, die übernommen werden müssen:
* **Auto-Sanitization:** Intelligentes Zurücksetzen von Agenten-Konfigurationen in Markdown-Dateien vor dem Push.
* **Agent-Driven DLP:** Ein Pre-Commit-Check, bei dem der LLM-Agent aktiv nach Data Leaks (IPs, Keys, Namen) in den geänderten Dateien scannt und Alarm schlägt.
* **Automated Changelogging (Bonus):** (Optional) Die Synchronisation und Übersetzung von Changelogs (z.B. von `.de.md` zu `.md`) vor dem Push, wie wir es ebenfalls im Skill-Engineer etabliert haben.

---
*Dieser Kontext kann direkt dem neuen Engineer-Agenten als Modus B (Vorarbeit) übergeben werden, um mit der Architektur-Planung der neuen `SKILL.md` zu starten.*
