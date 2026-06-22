# Benchmark Report: `google-ads-manager`

## Meta
| Feld | Wert |
|---|---|
| Skill | `google-ads-manager` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 16/17 (94%)

> [!NOTE]
> **Verdict: 🟢 PASS** — Hervorragend strukturierter Skill mit vollständiger Cross-Skill-Delegation, explizitem Self-Correction-Workflow und vollständiger references/-Suite. Minimalabzug bei Security (State-Hygiene formal nicht dokumentiert).

## Flags

_Keine kritischen Flags._

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 3 | 3 | ✅ | XML-Tags vollständig; Persona beschreibt ausschließlich Mechanik; YAML-Frontmatter mit Multiline-Description korrekt |
| B | Anti-Halluzination & Faktentreue | 4 | 4 | ✅ | Environment Check: Schritt 2 (Kontext laden) erzwingt references/ vor jeder Aktion; Self-Correction: Workflow E explizit als Pflicht-Checkliste; Tabus: NIEMALS Smart Bidding ohne Datenbasis, NIEMALS Anzeigentexte selbst schreiben; keine unbestätigten Referenzen |
| C | Developer Experience | 3 | 3 | ✅ | Description präzise mit Trigger-Keywords und expliziten Nicht-Triggern; vollständiges Output-Beispiel (Neue Ad-Gruppe); Stateless korrekt |
| D | Ökosystem & Wartbarkeit | 3 | 3 | ✅ | Delegation an ad-expert und brand-guidelines mit Briefing-Format; 8 references/-Dateien mit klaren Themen; scripts/-Verzeichnis vorhanden |
| E | Discoverability | 2 | 2 | ✅ | Trigger-Keywords direkt in YAML-Description; Do-not-use klar: nur Texterstellung → ad-expert, SEO → andere |
| F | Security | 1 | 2 | ⚠️ | Keine gefährlichen Instruktionen; State-Hygiene: `.gitignore`-Hinweis vorhanden in Directory (.gitignore-Datei), aber nicht explizit im SKILL.md-Workflow dokumentiert |

## Findings

### A – Architektonische Reinheit (3/3)
XML-Tags vollständig und korrekt verwendet. `<role_definition>` enthält ausschließlich Handlungsdirektiven: „sagt 'Pausiere Keyword X, weil CPA €47 bei Ziel €25'". YAML-Frontmatter mit Multiline-Description korrekt. Keine hardcodierten absoluten Pfade.

### B – Anti-Halluzination & Faktentreue (4/4)
- **Environment Check (1/1):** Jeder Workflow erzwingt als ersten Schritt das Laden der relevanten references/-Dateien.
- **Self-Correction (1/1):** Workflow E ist eine Pflicht-Checkliste vor jeder finalen Ausgabe (5 Punkte, explizit als Pflicht markiert).
- **Tabus (1/1):** NIEMALS Smart Bidding ohne Datenbasis; NIEMALS Keywords ohne Landingpage; NIEMALS Anzeigentexte selbst schreiben — alle mit Begründung.
- **Referenz-Warnung (1/1):** Keine unbestätigten Referenzen; Google Ads Best Practices = etabliert und dokumentiert.

### C – Developer Experience (3/3)
YAML-Description enthält explizite Trigger-Keywords und Nicht-Trigger-Bedingungen (direkt im Frontmatter). Vollständiges Ad-Gruppen-Beispiel mit Keywords, Bidding, Delegation-Briefing. Stateless korrekt.

### D – Ökosystem & Wartbarkeit (3/3)
- **Cross-Skill-Delegation (1/1):** Explizite Delegation an `ad-expert` (mit vollständigem Briefing-Format) und `brand-guidelines` (mit Kontext).
- **Reference-Schnitt (1/1):** 8 references/-Dateien, thematisch geschnitten; scripts/-Verzeichnis für Search-Term-Analyse.
- **Update-Fähigkeit (1/1):** `campaign-structure.md` und `keyword-lists.md` sind dynamische Inventar-Dateien — Workflow schreibt explizit deren Aktualisierung vor.

### E – Discoverability (2/2)
YAML-Description enthält direkte Trigger-Keywords: „Google Ads Kampagne erstellen", „Keywords recherchieren" etc. sowie explizite Nicht-Trigger-Bedingungen.

### F – Security (1/2)
Keine gefährlichen Instruktionen. `.gitignore`-Datei im Verzeichnis vorhanden, aber kein expliziter SKILL.md-Workflow-Hinweis auf `.skill-config.json` → `.gitignore`.

## Empfehlung
Minimalfixes: State-Hygiene-Hinweis in `<operational_rules>` ergänzen (`.gitignore`-Pflicht für `.skill-config.json`). Ansonsten publish-ready.
