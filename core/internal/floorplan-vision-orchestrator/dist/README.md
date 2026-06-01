# Floorplan Vision Orchestrator

Dieser Skill analysiert hochgeladene Grundrisse für Immobilienmakler, berechnet die Wohnnutzfläche nach lokalen Standards (z.B. WoFlV), erstellt Exposé-Rohtexte und generiert einen extrem präzisen (halluzinationsfreien) "Node-Logic" Prompt für Bild-KIs (wie DALL-E oder Midjourney).

## Struktur
- `SKILL.md`: Der Antigravity Master-Skill (im `skill-engineer` XML-Format).
- `references/area-calculation-rules.md`: Lokale Flächenberechnungsregeln (Standard: Österreichische WoFlV).
- `examples/prompt_out.md`: Ein Few-Shot Beispiel für den erwarteten Ziel-Prompt.
- `platform-exports/`: Vorgefertigte Anweisungen für externe Systeme (ChatGPT Custom GPTs, Microsoft Copilot Studio, Google Gemini Gems).

## Plattform-Nutzung
Der Master-Skill ist primär für die Nutzung in einer Agenten-Umgebung (wie Antigravity oder Claude Code) gedacht. Für isolierte Umgebungen (Chatbots) sollten die bereitgestellten Exporte im Ordner `platform-exports/` genutzt werden, da diese die Limits der jeweiligen Plattformen berücksichtigen.
