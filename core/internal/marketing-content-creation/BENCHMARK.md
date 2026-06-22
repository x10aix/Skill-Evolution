# Benchmark Report: `marketing-content-creation`

## Meta
| Feld | Wert |
|---|---|
| Skill | `marketing-content-creation` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 10/17 (59%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Kein references/-Ordner (D = N/A), Description zu generisch, kein Environment Check.

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: datengetriebener Content Creator, Mechanik-Beschreibung; YAML korrekt |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Kein Environment Check; Self-Correction: Schritt 4 explizit; Tabus vollständig; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description zu kurz/allgemein; vollständiges Output-Beispiel; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use klar (Rechtschreibkorrektur → marketing-brand-voice); Use-this-skill-when präzise |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene fehlt |

**Effektiver Gesamtscore: 10/14 (71%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>` mechanisch: „baut Texte wie Architekturen: Jeder Satz hat eine Funktion". YAML korrekt.

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (0/1):** Kein Tool-Verify-Schritt.
- **Self-Correction (1/1):** Schritt 4: Emojis zählen, ersten Satz prüfen, Sales-CTAs entfernen — explizit mechanisch.
- **Tabus (1/1):** NIEMALS mit Frage beginnen; NIEMALS mehr als 3 Emojis; NIEMALS Tier-4-Themen.
- **Referenz-Warnung (0/1):** LinkedIn-Algorithmus-Realität — etabliertes Wissen, keine Markierung nötig.

### C – Developer Experience (2/3)
- **Triggering (0/1):** „Daten- und leistungsorientierte Vorgaben für das Erstellen von Marketing-Inhalten (LinkedIn Fokus)" — zu generisch.
- **Few-Shot (1/1):** Vollständiger LinkedIn-Post als Beispiel.
- **Stateless (1/1):** Korrekt.

### D – Ökosystem & Wartbarkeit (N/A)

### E – Discoverability (2/2)
Do-not-use: Rechtschreibkorrektur, technische Whitepapers. Use-this-skill-when: LinkedIn-Post, Blogartikel, Newsletter.

### F – Security (1/2)
Keine gefährlichen Instruktionen. State-Hygiene nicht adressiert.

## Empfehlung
Description konkretisieren (z.B. „LinkedIn-Post verfassen", „Content-Ideen für B2B AI", „Hook-Analyse"). Environment Check ergänzen.
