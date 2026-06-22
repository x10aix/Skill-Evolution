# Benchmark Report: `marketing-competitive-analysis`

## Meta
| Feld | Wert |
|---|---|
| Skill | `marketing-competitive-analysis` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 11/17 (65%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Guter Skill mit klarer Struktur, explizitem Self-Correction, Anti-Halluzinations-Regel. Fehlpunkte bei D (kein references/), E.1 (Description zu generisch), F (State-Hygiene).

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: „knallharter Wettbewerbsanalyst" mit operativer Beschreibung; YAML korrekt |
| B | Anti-Halluzination & Faktentreue | 3 | 4 | ⚠️ | Kein Environment Check; Self-Correction: Schritt 4 explizit; Tabus vollständig; Anti-Halluzinations-Regel für Umsatzzahlen explizit |
| C | Developer Experience | 2 | 3 | ⚠️ | Description zu generisch; vollständiges Output-Beispiel; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use klar; Use-this-skill-when mit 4 konkreten Szenarien |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene nicht adressiert |

**Effektiver Gesamtscore: 11/14 (79%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>` operational: „liest zwischen den Zeilen von Marketing-Floskeln". YAML korrekt, keine hardcodierten Pfade.

### B – Anti-Halluzination & Faktentreue (3/4)
- **Environment Check (0/1):** Kein Tool-Verify-Schritt (Schritt 0 prüft nur Input-Informationen, keine Tools).
- **Self-Correction (1/1):** Schritt 4 explizit: Ist die Analyse zu wohlwollend oder generisch?
- **Tabus (1/1):** NIEMALS unbestätigte Annahmen über Umsätze/interne Zahlen halluzinieren; explizit mit Spekulationsmarkierung.
- **Referenz-Warnung (1/1):** Explizite Regel gegen Halluzination von Wettbewerber-Daten.

### C – Developer Experience (2/3)
- **Triggering (0/1):** „Identifikation und Analyse der relevanten KI-Marktteilnehmer im DACH-Mittelstand" — zu allgemein.
- **Few-Shot (1/1):** Vollständiges 5-teiliges Beispiel-Output.
- **Stateless (1/1):** Korrekt.

### D – Ökosystem & Wartbarkeit (N/A)

### E – Discoverability (2/2)
Vier konkrete Use-cases: Wettbewerber analysieren, Battlecards, Content-Gap, Positionierung schärfen. Do-not-use: technische KI-Modellanalyse, allgemeine Marktforschung.

### F – Security (1/2)
Keine gefährlichen Instruktionen. State-Hygiene nicht adressiert.

## Empfehlung
Description um spezifischere Trigger-Keywords erweitern (z.B. „Wettbewerber analysieren", „Battlecard erstellen", „Konkurrenz-Analyse"). Environment Check für Web-Tools ergänzen.
