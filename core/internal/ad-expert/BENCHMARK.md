# Benchmark Report: `ad-expert`

## Meta
| Feld | Wert |
|---|---|
| Skill | `ad-expert` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 11/17 (65%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Guter Kern, aber kein Self-Correction-Schritt, keine references/-Dimension und kein gitignore-Hinweis.

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner vorhanden → D gesamt N/A → reduziertes Maximum effektiv 14 |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vorhanden (`<role_definition>`, `<strategic_backbone>`, `<operational_rules>`, `<process_workflow>`, `<output_standards>`); Persona beschreibt Mechanik (aktive Verben, max. 15 Wörter); YAML-Frontmatter korrekt, keine hardcodierten Pfade |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Environment Check: nicht vorhanden (kein Tool-Verify-Schritt); Self-Correction: fehlt explizit; Tabus: vorhanden (NIEMALS-Regeln in `<operational_rules>`); Referenz-Warnung: Cialdini korrekt mit `<!-- UNBESTÄTIGT -->` markiert → +1 |
| C | Developer Experience | 3 | 3 | ✅ | Description löst präzise auf LinkedIn/Google/Meta Ad-Copy aus; `<output_standards>` enthält vollständiges Input→Output-Beispiel (Zielgruppen-Resonanz-Check + Varianten A/B); Stateless korrekt – kein Setup nötig |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner vorhanden. D wird nicht bewertet; effektives Maximum reduziert auf 14 |
| E | Discoverability | 2 | 2 | ✅ | Description nennt konkrete Trigger (LinkedIn, Google, Meta, Paid Social, SEM, Leadgenerierung); `Do not use this skill when` klar formuliert (organische Posts, SEO-Texte) |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen vorhanden (+1); kein Hinweis auf `.gitignore` / `.skill-config.json` – State-Hygiene nicht thematisiert (Skill speichert keinen State, aber Punkt fehlt formal) |

**Effektiver Gesamtscore: 11/14 (79%)** bei reduziertem Maximum (kein references/).

## Findings

### A – Architektonische Reinheit (3/3)
Alle fünf Haupt-Sektionen nutzen native XML-Tags. Die `<role_definition>` enthält ausschließlich Mechanik-Beschreibungen: „max. 15 Wörter", „aktive Verben", „belegbare Fakten". Keine Adjektiv-Floskeln. YAML-Frontmatter mit `name` und `description` korrekt, plattformagnositisch.

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (0/1):** Kein Schritt verifiziert Tool-Verfügbarkeit vor der Ausführung.
- **Self-Correction (0/1):** Der `<process_workflow>` hat keinen expliziten Selbstprüfungsschritt vor der finalen Ausgabe. Der Resonanz-Check in Schritt 2 ist inhaltlich, aber kein Anti-Halluzinations-Gate.
- **Tabus (1/1):** NIEMALS Sätze >15 Wörter; NIEMALS generische Phrasen → klar und mit Begründung.
- **Referenz-Warnung (1/1):** `<!-- UNBESTÄTIGT: Cialdini-Prinzipien -->` korrekt gesetzt.

### C – Developer Experience (3/3)
Die description ist aktionsorientiert und auf die richtigen Trigger kalibriert. Das `<output_standards>`-Beispiel zeigt vollständigen Resonanz-Check plus zwei vollständige Ad-Varianten mit Visual-Vorschlag — hochwertiges Few-Shot-Beispiel. Stateless korrekt.

### D – Ökosystem & Wartbarkeit (N/A)
Kein references/-Ordner. Dimension wird nicht bewertet.

### E – Discoverability (2/2)
Trigger-Keywords präzise: LinkedIn/Google/Meta + Paid Social + SEM. Nicht-Trigger: organische Posts, SEO-Texte. Vollständige Decoy-Resistenz.

### F – Security (1/2)
Keine gefährlichen Instruktionen. Der Skill speichert keinen State und benötigt keine API-Keys — State-Hygiene-Punkt formal nicht erfüllt, da kein entsprechender Hinweis vorhanden.

## Empfehlung
1. Self-Correction-Schritt in `<process_workflow>` einbauen (z.B. Schritt 4: Prüfe, ob jede Variante ≤15-Wörter-Regel einhält).
2. Environment Check für Tool-Verfügbarkeit ergänzen (auch wenn minimal bei reinen Text-Skills).
3. Falls references/ geplant: Plattform-Spezifikationen auslagern für D-Punkte.
