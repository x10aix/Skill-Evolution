# Benchmark Report: `sales-competitive-intelligence`

## Meta
| Feld | Wert |
|---|---|
| Skill | `sales-competitive-intelligence` |
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
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: PMM mit Kill-Zone-Fokus; YAML korrekt |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Environment Check: Schritt 1; kein Self-Correction; Tabus klar; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description mit Trigger-Keywords; vollständiges Battlecard-Beispiel; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use klar; Trigger präzise (Battlecard, Wettbewerber) |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene fehlt |

**Effektiver Gesamtscore: 10/14 (71%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>`: „konzentriert sich auf die Kill-Zone — die Bereiche, in denen x10aix einen klaren, unfairen Vorteil hat" — präzise Mechanik. YAML korrekt.

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (1/1):** Schritt 1 prüft, ob Daten geliefert werden oder Web-Tools nötig sind.
- **Self-Correction (0/1):** `<operational_rules>` enthält IMMER-Check: „Basiert der Vergleich auf x10aix-Positionierung?" — Rule, kein Workflow-Schritt.
- **Tabus (1/1):** NIEMALS über Wettbewerber lästern; IMMER Stärken objektiv anerkennen.
- **Referenz-Warnung (0/1):** Kein unbestätigtes Wissen.

### C – Developer Experience (2/3)
- **Triggering (1/1):** Description: „battlecard, competitor comparison, or competitive intelligence."
- **Few-Shot (1/1):** Vollständige McKinsey-Battlecard als Beispiel.
- **Stateless (0/1):** Kein explizites Stateless-Pattern.

### D – Ökosystem & Wartbarkeit (N/A)

### E – Discoverability (2/2)
Do-not-use: allgemeine Marktanalyse ohne spezifischen Wettbewerber. Trigger: Battlecard, Competitor Comparison.

### F – Security (1/2)
Keine gefährlichen Instruktionen. State-Hygiene nicht adressiert.

## Empfehlung
Self-Correction-Schritt als letzten Workflow-Schritt ergänzen. Wettbewerbs-Matrix könnte in references/ ausgelagert werden.
