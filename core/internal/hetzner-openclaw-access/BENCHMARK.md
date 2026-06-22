# Benchmark Report: `hetzner-openclaw-access`

## Meta
| Feld | Wert |
|---|---|
| Skill | `hetzner-openclaw-access` |
| Evaluiert am | 2026-06-22 |
| Evaluator | skill-benchmarker |
| Input-Level | B |
| Effektives Maximum | 17 |

## Gesamtscore: 9/17 (53%)

> [!CAUTION]
> **Verdict: 🟡 CONDITIONAL** — Hardcodierter absoluter Windows-Pfad (`C:\Users\drxle\AppData\Local\Temp\`) in Workflow B, Schritt 2 — A.3-Verlust und potenzielle Security-Lücke. Kein Self-Correction-Schritt. Kein references/-Ordner.

## Flags

| Flag | Dimension | Befund |
|---|---|---|
| ⚠️ WARNING | A – Architektur | Hardcodierter absoluter Pfad `C:\Users\drxle\AppData\Local\Temp\` in Schritt Workflow B, Schritt 2 (SCP-Befehl) |
| ⚠️ WARNING | D – Ökosystem | Kein references/-Ordner → D gesamt N/A |

## Scoring-Detail

| Dim | Kategorie | Score | Max | Status | Befund |
|---|---|---|---|---|---|
| A | Architektonische Reinheit | 2 | 3 | ⚠️ | XML-Tags vollständig; Persona mechanisch; YAML-Frontmatter korrekt; -1 für hardcodierten absoluten Pfad |
| B | Anti-Halluzination & Faktentreue | 2 | 4 | ⚠️ | Environment Check (Schritt 0): vollständig, prüft `.skill-config.json`; kein Self-Correction-Schritt; Tabus klar; keine unbestätigten Referenzen |
| C | Developer Experience | 2 | 3 | ⚠️ | Description zu allgemein für Zero-Shot-Triggering; Beispiel-Ausgabe vorhanden; Stateful korrekt mit `.skill-config.json` |
| D | Ökosystem & Wartbarkeit | N/A | 0 | — | Kein references/-Ordner |
| E | Discoverability | 2 | 2 | ✅ | Trigger-Phrasen explizit (/sync-clawdi, Clawdi, Server); Do-not-use: lokale Dateisystem-Operationen |
| F | Security | 1 | 2 | ⚠️ | `.skill-config.json`-Verweis vorhanden (NIEMALS hardcoded); State-Hygiene: kein gitignore-Hinweis im SKILL.md explizit |

**Effektiver Gesamtscore: 9/14 (64%)** bei reduziertem Maximum.

## Findings

### A – Architektonische Reinheit (2/3)
XML-Tags vollständig. Persona: „headless, asynchron, strikt skriptbasiert" — reine Mechanik. YAML korrekt. **Kritisch:** In Workflow B, Schritt 2 ist ein hardcodierter absoluter Windows-Pfad `C:\Users\drxle\AppData\Local\Temp\clawdi_requests.md` eingebettet — verletzt Plattform-Agnostik.

### B – Anti-Halluzination & Faktentreue (2/4)
- **Environment Check (1/1):** Schritt 0 prüft `.skill-config.json` auf Vollständigkeit aller drei Werte.
- **Self-Correction (0/1):** Kein expliziter Selbstprüfungsschritt.
- **Tabus (1/1):** NIEMALS interaktive Terminal-Sitzungen; NIEMALS Root-Rechte; NIEMALS hardcoded IPs/Keys.
- **Referenz-Warnung (0/1):** OpenClaw/Clawdi ist eine proprietäre/interne Plattform — nicht mit `<!-- UNBESTÄTIGT -->` markiert, obwohl externe Nutzer dies nicht verifizieren können.

### C – Developer Experience (2/3)
- **Triggering (0/1):** Description sehr allgemein: „Anweisungen für den asynchronen SSH-Zugriff" — keine Keywords wie `/sync-clawdi`, `Task Queue`, `Hetzner`.
- **Few-Shot (1/1):** Beispielausgabe für Workflow A vorhanden.
- **Stateful (1/1):** `.skill-config.json`-Logik korrekt umgesetzt.

### D – Ökosystem & Wartbarkeit (N/A)
Kein references/-Ordner.

### E – Discoverability (2/2)
Use-this-skill-when: `/sync-clawdi`, Clawdi, Server — präzise. Do-not-use: lokale Operationen ohne Hetzner-Bezug.

### F – Security (1/2)
NIEMALS hardcoded Keys im Skill — korrekt (+1). Kein expliziter gitignore-Hinweis für `.skill-config.json` im Workflow. Der hardcodierte absolute Pfad im SCP-Befehl ist ein Portabilitätsrisiko.

## Empfehlung
1. Hardcodierten Pfad `C:\Users\drxle\AppData\Local\Temp\` durch eine Variable aus `.skill-config.json` (z.B. `LOCAL_TEMP_PATH`) ersetzen.
2. Description um Trigger-Keywords erweitern: `/sync-clawdi`, `Hetzner SSH`, `Clawdi Task Queue`.
3. gitignore-Hinweis für `.skill-config.json` explizit in `<operational_rules>` ergänzen.
