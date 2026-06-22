# Benchmark Report: `brand-guidelines`

## Meta
| Feld | Wert |
|---|---|
| Skill | `brand-guidelines` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 12/17 (71%)

> [!NOTE]
> **Verdict: 🟡 CONDITIONAL** — Starke Architektur und gute DX; fehlt Self-Correction-Schritt explizit, D.3 (Update-Fähigkeit) nicht adressiert.

## Flags

_Keine kritischen Flags._

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona mechanisch (kein Adjektiv ohne Verhalten); YAML-Frontmatter korrekt, keine hardcodierten Pfade |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Environment Check: Schritt 1 verlangt Dateipfad-Prüfung; kein expliziter Self-Correction-Schritt (Schritt 4 ist Veto-Prüfung — qualifiziert; aber nicht als `<self_audit>`-Tag); Tabus: NIEMALS klar; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description wenig präzise (generisch: „Wendet als Brand Guardian"); vollständiges Beispiel in `<output_standards>`; Stateless korrekt |
| D | Ökosystem & Wartbarkeit | 2 | 3 | ⚠️ | Cross-Skill: keine explizite Delegation; references/ vorhanden mit 3 sinnvollen Dateien; D.3 Update-Fähigkeit: references enthalten Inhalte, aber kein Aktualisierungsdatum/Status-Tracking |
| E | Discoverability | 2 | 2 | ✅ | Do-not-use vorhanden; Use-this-skill-when präzise genug für Brand Guardian-Kontext |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene nicht thematisiert (Skill speichert keinen State) |

## Findings

### A – Architektonische Reinheit (3/3)
Alle XML-Tags vorhanden. `<role_definition>` enthält reine Mechanik: „mechanisch gegen ein Set von drei statischen Referenz-Dokumenten prüfen". YAML-Frontmatter korrekt. Relative Pfade in Verlinkungen (keine hardcodierten absoluten Pfade).

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (1/1):** `<operational_rules>` verlangt als ERSTEN Schritt die Existenz-Prüfung der drei Parameter-Dateien.
- **Self-Correction (1/1):** Schritt 4 (Veto-Prüfung) ist als explizites internes Selbstprüfungsgate konzipiert — zählt als Self-Correction.
- **Tabus (1/1):** NIEMALS Content ausliefern ohne internen Abgleich.
- **Referenz-Warnung (0/1):** Keine unbestätigten Referenzen vorhanden — korrekt, aber kein expliziter Mechanismus für künftige Ergänzungen.

_Korrektur: Score 3/4 (nicht 2/4)._

### C – Developer Experience (2/3)
- **Triggering (0/1):** Description „Wendet als Brand Guardian die Corporate Identity..." ist zu allgemein — fehlen Trigger-Wörter wie „Brand Check", „Marken-Konformität", „Corporate Design".
- **Few-Shot (1/1):** Brand Guardian Check-Beispiel in `<output_standards>` vollständig.
- **Stateless (1/1):** Korrekt.

### D – Ökosystem & Wartbarkeit (2/3)
- **Cross-Skill-Delegation (0/1):** Kein expliziter Delegations-Mechanismus an andere Skills.
- **Reference-Schnitt (1/1):** references/ mit 3 thematisch sinnvollen Dateien vorhanden.
- **Update-Fähigkeit (1/1):** Die references-Dateien haben inhaltliche Pflegeregeln (brand-voice, corporate-design, corporate-identity) — qualifiziert mit Einschränkung (kein Aktualisierungsdatum sichtbar).

### E – Discoverability (2/2)
Use-this-skill-when klar: Texte/Designs/Content-Strategien für die Marke. Do-not-use: abstrakter Code ohne UI/Copy, markenunabhängige Unterhaltungen.

### F – Security (1/2)
Keine gefährlichen Instruktionen. Keine Config-Datei/Secrets → State-Hygiene formal 0/1.

## Empfehlung
Description um konkrete Trigger-Keywords erweitern (Brand Check, CI-Prüfung, Corporate Design anwenden). Aktualisierungsdaten und Status-Tracking in references/-Dateien ergänzen für D.3.

> [!NOTE]
> Scoring-Korrektur: B = 3/4 (Veto-Schritt qualifiziert als Self-Correction). Effektiver Gesamtscore: **13/17 (76%)** → bleibt CONDITIONAL (Grenze liegt bei 14/17 für PASS).
