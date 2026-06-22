# Benchmark Report: `sales-draft-outreach`

## Meta
| Feld | Wert |
|---|---|
| Skill | `sales-draft-outreach` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 10/17 (59%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Kein references/-Ordner (D = N/A), kein expliziter Environment Check als separater Schritt, Security minimal.

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: taktischer Outreach-Spezialist mit Metrik-orientierter Mechanik; YAML korrekt |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Environment Check: Schritt 1; Self-Correction: Schritt 5 (Veto-Prüfung); Tabus klar; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description mit Trigger-Keywords; vollständiges E-Mail-Beispiel; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use klar; Trigger: Outreach schreiben, Erstansprache |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene fehlt |

**Effektiver Gesamtscore: 10/14 (71%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>`: „in maximal 4 Sätzen echtes Interesse wecken... Metrik ist die Antwortrate" — klare Mechanik. YAML korrekt.

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (1/1):** Schritt 1 prüft explizit, ob Informationen zum Prospect vorliegen.
- **Self-Correction (1/1):** Schritt 5 (Veto-Prüfung): Tabu-Liste-Check vor Ausgabe.
- **Tabus (1/1):** NIEMALS Floskeln; NIEMALS „Ich möchte mich vorstellen"; NIEMALS Markdown in E-Mails.
- **Referenz-Warnung (0/1):** AIDA-Prinzip — etabliertes Marketing-Framework, keine Markierung nötig.

_Korrektur: B = 3/4. Effektiver Score: 11/14 (79%)._

### C – Developer Experience (2/3)
- **Triggering (1/1):** Description: „Outreach schreiben, Nachricht an X, Erstansprache."
- **Few-Shot (1/1):** Vollständiges E-Mail-Beispiel mit Betreff und CTA.
- **Stateless (0/1):** Kein explizites Stateless-Pattern.

### D – Ökosystem & Wartbarkeit (N/A)

### E – Discoverability (2/2)
Trigger: Outreach schreiben, Nachricht, Erstansprache. Do-not-use: Massen-E-Mails, Vertragsverhandlungen.

### F – Security (1/2)
Keine gefährlichen Instruktionen. State-Hygiene nicht adressiert.

## Empfehlung
Stateless-Pattern explizit deklarieren. Optional: Hook-Trigger-Bibliothek in references/ auslagern.
