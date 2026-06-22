# Benchmark Report: `marketing-brand-voice`

## Meta
| Feld | Wert |
|---|---|
| Skill | `marketing-brand-voice` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 13/17 (76%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Sehr starker Skill mit explizitem Self-Correction-Schritt und vollständiger Tabu-Liste. Fehlpunkte nur bei references/ (nicht vorhanden) und Security (State-Hygiene).

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: „Brand Voice Editor" mit klarer Mechanik (nicht hipper Werbetexter); YAML-Multiline-Description korrekt |
| B | Anti-Halluzination & Faktentreue | 3 | 4 | ⚠️ | Environment Check vorhanden (Schritt 0); Self-Correction: Schritt 4 explizit; Tabus: vollständig mit Verbotsliste; keine unbestätigten Referenzen |
| C | Developer Experience | 3 | 3 | ✅ | Description sehr präzise mit Trigger-Keywords und expliziten Nicht-Triggern; vollständiges Input→Output-Beispiel; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Trigger und Nicht-Trigger in YAML-Description und im Body vollständig |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene nicht adressiert |

**Effektiver Gesamtscore: 13/14 (93%)** bei reduziertem Maximum — sehr stark.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>` enthält reine Mechanik: „liest Texte aus der Perspektive eines pragmatischen Entscheiders". YAML-Multiline-Description korrekt. Verbotsliste mit konkreten Ersetzungen ist strukturierte Mechanik.

### B – Anti-Halluzination & Faktentreue (3/4)
- **Environment Check (1/1):** Schritt 0 bestätigt explizit, dass der Text für x10aix/DACH ist.
- **Self-Correction (1/1):** Schritt 4 (Edge Case Self-Correction) ist explizit und mechanisch: Prüfe eigenen Rewrite auf Hype-Vokabular vor Ausgabe.
- **Tabus (1/1):** Verbotene Begriffe mit Ersetzungen vollständig dokumentiert.
- **Referenz-Warnung (0/1):** Kein unbestätigtes Wissen — aber kein expliziter Mechanismus für neue Verbotslisten-Einträge.

### C – Developer Experience (3/3)
Description sehr präzise mit konkreten Trigger-Keywords (LinkedIn-Post, E-Mail, Proposal, Brand Voice, Tonalität) und expliziten Nicht-Triggern. Vollständiges Input→Output-Beispiel. Stateless korrekt.

### D – Ökosystem & Wartbarkeit (N/A)
Kein references/-Ordner vorhanden. Die Verbotsliste könnte sinnvollerweise ausgelagert werden.

### E – Discoverability (2/2)
Trigger in YAML-Description und Use-this-skill-when vollständig. Do-not-use: technische Doku, interne Notizen, andere Marken, Code.

### F – Security (1/2)
Keine gefährlichen Instruktionen. Kein State, keine Config-Datei → State-Hygiene formal 0/1.

## Empfehlung
Für PASS: State-Hygiene-Satz in `<operational_rules>` ergänzen (auch wenn kein aktiver State besteht). Optional: Verbotsliste in references/brand-vocabulary.md auslagern für D-Punkte.
