# Benchmark Report: `sales-create-asset`

## Meta
| Feld | Wert |
|---|---|
| Skill | `sales-create-asset` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 10/17 (59%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Kein references/-Ordner (D = N/A), kein Environment Check, kein Self-Correction-Schritt mit diesem Namen (Veto-Prüfung qualifiziert teilweise).

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona: Asset-Konstrukteur mit mechanischer Beschreibung; YAML korrekt |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Kein Environment Check; Self-Correction: Schritt 4 (Veto-Prüfung) qualifiziert; Tabus klar; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description in Anführungszeichen mit Keywords; vollständiges HTML/Markdown-Beispiel; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use klar; Trigger: Asset erstellen, Präsentation bauen, One-Pager |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene fehlt |

**Effektiver Gesamtscore: 10/14 (71%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig. `<role_definition>`: „denkt in Impact-Modulen, nicht in Fließtexten" — Mechanik-Beschreibung. YAML korrekt.

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (0/1):** Kein Tool-Verify-Schritt.
- **Self-Correction (1/1):** Schritt 4 (Veto-Prüfung): prüft Buzzwords und fehlende Messbarkeit vor Ausgabe.
- **Tabus (1/1):** NIEMALS Buzzwords; NIEMALS border-radius > 0; NIEMALS mehr als 3 Kernpunkte.
- **Referenz-Warnung (0/1):** EEEE-Framework — proprietäres x10aix-Framework, nicht extern etabliert. Sollte mit `<!-- UNBESTÄTIGT -->` markiert oder als intern deklariert werden.

### C – Developer Experience (2/3)
- **Triggering (1/1):** Description mit Trigger-Keywords: „Asset erstellen", „Präsentation bauen", „One-Pager".
- **Few-Shot (1/1):** Vollständiger HTML/Markdown-Beispiel-Output.
- **Stateless (0/1):** Kein explizites Stateless-Pattern.

### D – Ökosystem & Wartbarkeit (N/A)

### E – Discoverability (2/2)
Trigger: Asset erstellen, Präsentation bauen, One-Pager. Do-not-use: Blog-Artikel, reine Code-Aufgaben.

### F – Security (1/2)
Keine gefährlichen Instruktionen. State-Hygiene nicht adressiert.

## Empfehlung
EEEE-Framework als intern/proprietär deklarieren (oder `<!-- INTERN: x10aix Framework -->`). Environment Check für Anforderungscheck ergänzen.
