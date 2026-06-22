# Benchmark Report: `marketing-performance-analytics`

## Meta
| Feld | Wert |
|---|---|
| Skill | `marketing-performance-analytics` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 10/17 (59%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Kein references/-Ordner (D = N/A), kein Environment Check, Description zu generisch, Security minimal.

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: „nüchterner Datenanalyst" mit Mechanik; YAML korrekt |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Kein Environment Check; Self-Correction: Schritt 4 explizit (deskriptiv→mechanisch); Tabus vorhanden; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description zu generisch; Beispielausgabe vollständig; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use klar; Use-this-skill-when mit 4 konkreten Szenarien |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene nicht adressiert |

**Effektiver Gesamtscore: 10/14 (71%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>`: „Datenanalyst, lässt sich nicht von Eitelkeits-Metriken blenden" — operativ. YAML korrekt.

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (0/1):** Kein Tool-Verify. Schritt 0 prüft nur bereitgestellte Daten.
- **Self-Correction (1/1):** Schritt 4: „Ist die Analyse zu deskriptiv? Wandle in mechanische Begründung um."
- **Tabus (1/1):** NIEMALS Vanity-Metriken feiern; MUSS konkrete Handlungsempfehlungen ausgeben.
- **Referenz-Warnung (0/1):** Kein unbestätigtes Wissen.

### C – Developer Experience (2/3)
- **Triggering (0/1):** „Evaluierung der Content-Performance und KPI-Tracking, fokussiert auf LinkedIn" — zu generisch.
- **Few-Shot (1/1):** Vollständiger 5-teiliger Report als Beispiel.
- **Stateless (1/1):** Korrekt.

### D – Ökosystem & Wartbarkeit (N/A)

### E – Discoverability (2/2)
Four konkrete Trigger-Szenarien. Do-not-use: Brand Voice, Website-Code-Analysen.

### F – Security (1/2)
Keine gefährlichen Instruktionen. State-Hygiene nicht adressiert.

## Empfehlung
Description präzisieren: „LinkedIn Performance analysieren", „Zero-Engagement Trigger", „Content-Auswertung". Environment Check ergänzen.
