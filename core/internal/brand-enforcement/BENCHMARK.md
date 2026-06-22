# Benchmark Report: `brand-enforcement`

## Meta
| Feld | Wert |
|---|---|
| Skill | `brand-enforcement` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 9/17 (53%)

> [!WARNING]
> **Verdict: 🟡 CONDITIONAL** — Kein Environment Check (obwohl Dependency-Loading kritisch), kein Self-Correction-Schritt, kein references/-Ordner (D = N/A), Security nicht adressiert.

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |
| ⚠️ WARNING | F – Security | State-Hygiene nicht adressiert (1/2) |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona beschreibt Mechanik; YAML-Frontmatter mit `requires:` Feld korrekt |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Environment Check im Workflow vorhanden (Schritt 1: Referenzdateien laden, bricht bei Fehlen ab); Self-Correction fehlt; Tabus: NIEMALS-Regeln klar; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description wenig präzise (nur allgemein „Überwachung der Brand Voice"); Inline-Beispiel vorhanden (Änderungsprotokoll-Tabelle); Stateless korrekt |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein eigener references/-Ordner — referenziert sibling brand-guidelines/references, aber eigener Ordner fehlt |
| E | Discoverability | 1 | 2 | ⚠️ | Do-not-use vorhanden; Trigger-Keywords in Description unzureichend (keine konkreten Keywords wie „Brand Audit", „Text prüfen") |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene nicht thematisiert |

**Effektiver Gesamtscore: 9/14 (64%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (3/3)
Alle XML-Tags vorhanden. `requires: brand-guidelines` im YAML-Frontmatter korrekt deklariert. Persona: „Compliance-Prüfer" mit mechanischer Aufgabenbeschreibung (Abgleich gegen Richtlinien, nicht emotional argumentieren).

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (1/1):** Schritt 1 verlangt explizit das Laden der Referenzdateien und bricht bei Unerreichbarkeit ab.
- **Self-Correction (0/1):** Kein expliziter Self-Audit-Schritt vor finaler Ausgabe.
- **Tabus (1/1):** NIEMALS Texte durchwinken mit verbotenen Wörtern; NIEMALS Ansprache eigenständig ändern ohne Guideline-Deckung.
- **Referenz-Warnung (0/1):** Keine unbestätigten Referenzen, aber auch kein Hinweis auf das Fehlen solcher → formal 0 (kein Kommentar nötig, aber auch keine Markierung).

### C – Developer Experience (2/3)
- **Triggering (0/1):** Description „Überwachung der Brand Voice und strikte Einhaltung des Brand-Protokolls" ist zu allgemein — keine konkreten Trigger-Keywords.
- **Few-Shot (1/1):** `<output_standards>` zeigt vollständige Ausgabe mit Änderungsprotokoll-Tabelle.
- **Stateless (1/1):** Korrekt — kein Setup nötig.

### D – Ökosystem & Wartbarkeit (N/A)
Kein eigener references/-Ordner. Der Skill referenziert `../brand-guidelines/references/` via relative Pfade — korrekte Dependency-Deklaration, aber D-Dimension nicht evaluierbar.

### E – Discoverability (1/2)
- **Trigger-Präzision (0/1):** Description fehlen konkrete Trigger-Keywords wie „Brand Audit", „Text korrigieren", „Compliance-Check".
- **Decoy-Resistenz (1/1):** Do-not-use klar: „Neuer Content von Grund auf" → anderen Skill.

### F – Security (1/2)
Keine gefährlichen Instruktionen (+1). State-Hygiene nicht adressiert (0/1).

## Empfehlung
1. Description um konkrete Trigger-Keywords erweitern (z.B. „Brand Audit", „Text prüfen", „Compliance Check", „korrigiere diesen Entwurf").
2. Self-Correction-Schritt nach Report-Phase ergänzen.
3. Optional: eigenes references/-Verzeichnis für D-Punkte.
