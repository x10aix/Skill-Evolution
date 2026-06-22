# Benchmark Report: `research-performance-hooks`

## Meta
| Feld | Wert |
|---|---|
| Skill | `research-performance-hooks` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 10/17 (59%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Kein references/-Ordner (D = N/A), Self-Correction nur implizit, Security minimal.

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: algorithmischer Content-Analyst mit Mechanik; YAML korrekt |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Kein expliziter Environment Check; Self-Correction: Schritt 5 (Audience Check) qualifiziert; Tabus klar; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description in Anführungszeichen mit Keywords; vollständiges Output-Beispiel; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use klar; Trigger-Keywords vorhanden |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene nicht adressiert |

**Effektiver Gesamtscore: 10/14 (71%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>`: „betrachtet B2B-Content als Kombination aus psychologischen Auslösern und Informationsarchitektur" — reine Mechanik. YAML korrekt.

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (0/1):** Schritt 1 nennt Web-Tools nur als Bedingung, prüft sie aber nicht explizit.
- **Self-Correction (1/1):** Schritt 5 (Audience & Relevance Check): „Kommt das Engagement von echten Entscheidern oder der Bubble?" — qualifizierter Self-Correction-Schritt.
- **Tabus (1/1):** NIEMALS technische Deep-Dives ohne Business-Kontext als relevant werten; IMMER prüfen ob Hook echte GF ansprechen würde.
- **Referenz-Warnung (0/1):** Kein unbestätigtes Wissen.

### C – Developer Experience (2/3)
- **Triggering (1/1):** Description: „Triggers on requests to analyze LinkedIn posts, hooks, or high-engagement content."
- **Few-Shot (1/1):** Vollständiger 4-teiliger Report als Beispiel.
- **Stateless (0/1):** Kein explizites Stateless-Pattern.

### D – Ökosystem & Wartbarkeit (N/A)

### E – Discoverability (2/2)
Do-not-use: Post von Grund auf schreiben → Content Creation Skill. Trigger: why post performed well, high-converting content structures.

### F – Security (1/2)
Keine gefährlichen Instruktionen. State-Hygiene nicht adressiert.

## Empfehlung
Environment Check explizit in Schritt 1 ergänzen. Optional: references/ mit Hook-Bibliothek anlegen.
