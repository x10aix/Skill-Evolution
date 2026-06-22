# Benchmark Report: `sales-call-prep`

## Meta
| Feld | Wert |
|---|---|
| Skill | `sales-call-prep` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 10/17 (59%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Kein references/-Ordner (D = N/A), kein Self-Correction, Security minimal.

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: strategischer Deal-Coach mit konkreten Handlungsdirektiven; YAML korrekt |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Environment Check: Schritt 2 (Quick-Research, falls Tools vorhanden); kein Self-Correction; Tabus klar; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description in Anführungszeichen mit Keywords; vollständiges Briefing-Beispiel; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use klar (Follow-up → sales-draft-outreach; Erst-Recherche → sales-account-research); Trigger präzise |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene nicht adressiert |

**Effektiver Gesamtscore: 10/14 (71%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>`: „Deal-Coach, fokussiert auf Discovery, stattet mit richtigen Fragen aus" — konkrete Mechanik. YAML korrekt.

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (1/1):** Schritt 2 prüft Tool-Verfügbarkeit für Quick-Research.
- **Self-Correction (0/1):** `<operational_rules>` enthält Check: „Sind Discovery-Fragen offene W-Fragen?" — qualifiziert als Selbst-Check vor Ausgabe (+1 wäre vertretbar, aber als Rule nicht als Workflow-Schritt).
- **Tabus (1/1):** NIEMALS generischen Demo-Pitch; IMMER 2 Einwände antizipieren.
- **Referenz-Warnung (0/1):** Kein unbestätigtes Wissen.

_Anmerkung: IMMER-Regel in `<operational_rules>` als Selbst-Check qualifiziert: B = 3/4._

### C – Developer Experience (2/3)
- **Triggering (1/1):** Description: „prepare for a call, meeting, or sales conversation."
- **Few-Shot (1/1):** Vollständiges Call-Briefing mit Account-Snapshot, Agenda, Discovery-Fragen, Einwände.
- **Stateless (0/1):** Kein explizites Stateless-Pattern.

### D – Ökosystem & Wartbarkeit (N/A)

### E – Discoverability (2/2)
Do-not-use: Call bereits stattgefunden → sales-draft-outreach; reine Erst-Recherche → sales-account-research. Trigger präzise.

### F – Security (1/2)
Keine gefährlichen Instruktionen. State-Hygiene nicht adressiert.

## Empfehlung
Self-Correction-Schritt explizit im Workflow ergänzen (als letzter Schritt vor Ausgabe). Optional: Gesprächstyp-Referenzen auslagern.
