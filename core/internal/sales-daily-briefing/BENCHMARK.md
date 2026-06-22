# Benchmark Report: `sales-daily-briefing`

## Meta
| Feld | Wert |
|---|---|
| Skill | `sales-daily-briefing` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 9/17 (53%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Kein references/-Ordner (D = N/A), kein Environment Check, kein expliziter Self-Correction-Schritt, Security minimal.

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: analytischer Pipeline-Manager; YAML korrekt |
| B | Anti-Halluzination & Faktentreue | 1 | 4 | ⚠️ | Kein Environment Check; kein Self-Correction; Tabus vorhanden; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description mit Trigger-Keywords; vollständiges Briefing-Beispiel; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use klar; Trigger: Tages-Briefing, Daily, Sales Prioritäten |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene fehlt |

**Effektiver Gesamtscore: 9/14 (64%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>`: „filtert unstrukturierte Termine... militärisch präzise und knapp" — klare Mechanik. YAML korrekt.

### B – Anti-Halluzination & Faktentreue (1/4)
- **Environment Check (0/1):** Kein Tool-Verify. Der Skill nimmt Nutzer-Input entgegen ohne Prüfung.
- **Self-Correction (0/1):** Kein expliziter Self-Correction-Schritt.
- **Tabus (1/1):** NIEMALS selbstständig Kalender scrapen; NIEMALS Kaffeepausen als Top-Priorität.
- **Referenz-Warnung (0/1):** Kein unbestätigtes Wissen.

### C – Developer Experience (2/3)
- **Triggering (1/1):** Description: „Tages-Briefing, Daily, Was steht heute an, Sales Prioritäten."
- **Few-Shot (1/1):** Vollständiges Briefing-Beispiel.
- **Stateless (0/1):** Kein explizites Stateless-Pattern.

### D – Ökosystem & Wartbarkeit (N/A)

### E – Discoverability (2/2)
Trigger: Tages-Briefing, Daily, Sales Prioritäten. Do-not-use: Kalender-Events eintragen, Einzel-Deal-Analyse.

### F – Security (1/2)
Keine gefährlichen Instruktionen. State-Hygiene nicht adressiert.

## Empfehlung
Self-Correction-Schritt ergänzen (z.B. Schritt 5: Sind alle Top-3-Prioritäten messbar und umsetzbar?). Stateless-Pattern explizit deklarieren.
