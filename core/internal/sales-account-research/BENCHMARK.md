# Benchmark Report: `sales-account-research`

## Meta
| Feld | Wert |
|---|---|
| Skill | `sales-account-research` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 11/17 (65%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Starke Anti-Halluzinations-Praxis, gutes Beispiel. Fehlpunkte bei D (kein references/), E.1 (Description wenig präzise), Self-Correction.

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: Sales Intelligence Analyst mit Mechanik; YAML korrekt |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Environment Check: Schritt 1; kein Self-Correction; Tabus stark; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description in Anführungszeichen mit Keywords; vollständiges Beispiel; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use klar; Trigger-Keywords vorhanden |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene fehlt |

**Effektiver Gesamtscore: 11/14 (79%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>` operational: „sucht nach Hebeln", „interpretiert Unternehmensereignisse als Indikatoren". YAML korrekt.

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (1/1):** Schritt 1 prüft Web-Such-Tools explizit.
- **Self-Correction (0/1):** Kein expliziter Self-Correction-Schritt.
- **Tabus (1/1):** NIEMALS ungeprüfte Annahmen als Fakten; NIEMALS Umgehung des Environment-Checks.
- **Referenz-Warnung (0/1):** Kein unbestätigtes Wissen.

### C – Developer Experience (2/3)
- **Triggering (1/1):** Description: „account research, company research, or ICP validation."
- **Few-Shot (1/1):** Vollständiger Recherche-Report als Beispiel.
- **Stateless (0/1):** Kein explizites Stateless-Pattern.

### D – Ökosystem & Wartbarkeit (N/A)

### E – Discoverability (2/2)
Do-not-use: SEO-Summary ohne Sales-Fokus, Wettbewerbs-Analyse → sales-competitive-intelligence. Trigger: Unternehmens-Recherche, ICP-Check.

### F – Security (1/2)
Keine gefährlichen Instruktionen. State-Hygiene nicht adressiert.

## Empfehlung
Self-Correction-Schritt ergänzen. Optional: ICP-Dokument in references/ auslagern.
