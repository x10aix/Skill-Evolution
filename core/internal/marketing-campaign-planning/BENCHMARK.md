# Benchmark Report: `marketing-campaign-planning`

## Meta
| Feld | Wert |
|---|---|
| Skill | `marketing-campaign-planning` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 10/17 (59%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Kein references/-Ordner (D = N/A), Description zu kurz für Zero-Shot-Triggering, Security nicht adressiert.

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: datengetriebener Kampagnenstratege mit mechanischer Beschreibung; YAML korrekt |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Environment Check vorhanden (Schritt 0); Self-Correction: Schritt 4 explizit; Tabus vorhanden; keine unbestätigten Referenzen — fehlt: Referenz-Warnung-Punkt |
| C | Developer Experience | 2 | 3 | ⚠️ | Description zu kurz/allgemein; Beispielausgabe vollständig; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use klar; Use-this-skill-when präzise |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene fehlt |

**Effektiver Gesamtscore: 10/14 (71%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>`: „übersetzt Kampagnenziele in messbare, kanalspezifische Workflows" — reine Mechanik. YAML korrekt.

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (1/1):** Schritt 0 prüft Input-Vollständigkeit und fragt bei fehlendem Segment nach.
- **Self-Correction (1/1):** Schritt 4 (Edge Case Self-Correction) explizit: Fehlen harte Metriken?
- **Tabus (1/1):** NIEMALS LinkedIn für harte Conversions; NIEMALS Massen-Lead-Generierung.
- **Referenz-Warnung (0/1):** Keine unbestätigten Referenzen — korrekt. Kein Verbesserungsbedarf, aber kein Punkt gewonnen.

_Korrektur: B = 3/4. Effektiver Score: 11/14 (79%)._

### C – Developer Experience (2/3)
- **Triggering (0/1):** „Planung und Durchführung effektiver Kampagnen mit Fokus auf DACH-Mittelstand-Entscheider" — zu allgemein; keine konkreten Trigger-Keywords wie „Kampagne planen", „Content-Kalender", „Kanalstrategie".
- **Few-Shot (1/1):** Vollständige 5-teilige Kampagnenplanung als Beispiel.
- **Stateless (1/1):** Korrekt.

### D – Ökosystem & Wartbarkeit (N/A)
Kein references/-Ordner.

### E – Discoverability (2/2)
Use-this-skill-when: neue Kampagne, Sounding Board Gespräche, Zielgruppen-Messaging, Kanal-Auswahl. Do-not-use: einzelne Posts, B2C-Funnel.

### F – Security (1/2)
Keine gefährlichen Instruktionen. State-Hygiene nicht adressiert.

## Empfehlung
Description um Trigger-Keywords erweitern. Optional: references/ mit Segment-Profilen und KPI-Definitionen anlegen.
