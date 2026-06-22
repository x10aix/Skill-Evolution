# Benchmark Report: `research-competitor-ads`

## Meta
| Feld | Wert |
|---|---|
| Skill | `research-competitor-ads` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 10/17 (59%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Kein references/-Ordner (D = N/A), kein Self-Correction-Schritt, Security minimal.

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: forensischer Marketing-Analyst mit Mechanik-Beschreibung; YAML korrekt |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Environment Check vorhanden (Schritt 1); kein Self-Correction; Tabus klar; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description in Anführungszeichen mit Keywords; vollständiges Output-Beispiel; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use klar (Firmenprofil → sales-account-research, neue Ad ohne Referenz); Trigger präzise |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene nicht adressiert |

**Effektiver Gesamtscore: 10/14 (71%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>`: „extrahierst die zugrundeliegenden Hooks, Zielgruppen-Ansprache und CTA" — operativ. YAML korrekt.

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (1/1):** Schritt 1 prüft ob Post-Texte im Prompt vorliegen oder Tools benötigt werden.
- **Self-Correction (0/1):** Kein expliziter Self-Correction-Schritt.
- **Tabus (1/1):** NIEMALS ohne Konter-Strategie abschließen; NIEMALS generische Kritik.
- **Referenz-Warnung (0/1):** Kein unbestätigtes Wissen.

### C – Developer Experience (2/3)
- **Triggering (1/1):** Description: „Analyze competitor ads... Triggers when asked to analyze competitor marketing, ads, or positioning."
- **Few-Shot (1/1):** Vollständiger 4-teiliger Report als Beispiel.
- **Stateless (0/1):** Kein explizites Stateless-Pattern.

### D – Ökosystem & Wartbarkeit (N/A)

### E – Discoverability (2/2)
Do-not-use: Firmenprofil → sales-account-research, neue Ad ohne Referenz. Trigger: competitor marketing, ads, positioning.

### F – Security (1/2)
Keine gefährlichen Instruktionen. State-Hygiene nicht adressiert.

## Empfehlung
Self-Correction-Schritt ergänzen (z.B. „Prüfe: Ist die Konter-Strategie für DACH-Mittelstand spezifisch genug?"). Stateless-Pattern explizit deklarieren.
