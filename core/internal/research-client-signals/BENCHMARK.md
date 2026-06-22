# Benchmark Report: `research-client-signals`

## Meta
| Feld | Wert |
|---|---|
| Skill | `research-client-signals` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 11/17 (65%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Starke Anti-Halluzinations-Praxis mit konkreten Tabus und Environment Check. Fehlpunkte bei D (kein references/), E.1 (Description wenig präzise), Security (State-Hygiene).

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: Account-Research-Analyst mit konkreten Suchdirektiven; YAML korrekt |
| B | Anti-Halluzination & Faktentreue | 3 | 4 | ⚠️ | Environment Check: Schritt 1; Self-Correction: Schritt 4 (Edge Case: zu groß/klein?); Tabus mit starken Beispielen; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description in Anführungszeichen präziser als viele; vollständiges Output-Beispiel; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use klar (generische Zusammenfassung → anderer Skill, Outreach → sales-draft-outreach); Trigger präzise |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene nicht adressiert |

**Effektiver Gesamtscore: 11/14 (79%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>` operational: „systematisch nach konkreten Kauf-Indikatoren durchsucht" — keine Floskeln. YAML korrekt.

### B – Anti-Halluzination & Faktentreue (3/4)
- **Environment Check (1/1):** Schritt 1 verifiziert explizit Web-Search-Tool-Verfügbarkeit.
- **Self-Correction (1/1):** Schritt 4 prüft Edge Cases (zu groß/klein → als 'Weak Fit' markieren).
- **Tabus (1/1):** NIEMALS generische Buzzwords als Signal werten — mit konkreten Gegenbeispielen.
- **Referenz-Warnung (0/1):** Kein unbestätigtes Wissen — korrekt, aber kein Punkt gewonnen.

### C – Developer Experience (2/3)
- **Triggering (1/1):** Description in Anführungszeichen mit konkreten Trigger-Keywords: „account signals", „buying signals", „ICP fit".
- **Few-Shot (1/1):** Vollständiger 5-Punkte-Report als Beispiel.
- **Stateless (0/1):** Skill impliziert Web-Zugriff ohne explizite Stateless-Deklaration — kein explizites Stateless/Stateful-Pattern deklariert.

### D – Ökosystem & Wartbarkeit (N/A)

### E – Discoverability (2/2)
Trigger: account signals, buying signals, target company research, ICP fit. Do-not-use: generische Zusammenfassung, Outreach → sales-draft-outreach.

### F – Security (1/2)
Keine gefährlichen Instruktionen. State-Hygiene nicht adressiert.

## Empfehlung
Stateless-Deklaration explizit ergänzen. Optional: ICP-Definition in references/ auslagern.
