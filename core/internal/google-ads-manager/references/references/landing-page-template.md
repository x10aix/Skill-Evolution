# Landing-Page-Vorlage — x10aix.tech Retro-DOS-Stil

> Alle Google Ads Landingpages folgen dieser Vorlage.
> Design-Basis: Existierende c-level-assessment Landingpage.
> Brand-Prüfung: Vor jeder Erstellung den `brand-guidelines` Skill aktivieren.

## Design-Regeln

| Regel | Detail |
|:---|:---|
| **Keine Navigation** | Keine Header-Links, kein Menü. Einziger Fokus: Conversion |
| **Brand-konform** | Retro-DOS-Stil, Monospace-Font, Terminal-Ästhetik |
| **Farbpalette** | BG: `#0d1117` / `#050505`, Akzent: Orangegold `#FF8C42`, Cyan: `#00CED1`, Grün (CTA): `#2ea043` |
| **Typografie** | Monospace-Fonts: `'IBM Plex Mono'`, `'Courier New'`, `monospace` |
| **CTA-Wiederholung** | Primärer CTA oben + unten, alternativer CTA (Assessment) als Micro-Conversion |
| **Mobile-First** | Unter 2s Ladezeit, responsive Monospace-Layout |
| **Anrede** | Formelles **"Sie"** (Website/Landing Page Kanal-Regel) |
| **Message Match** | H1 der Landingpage ≈ Headline der zugehörigen Ad |
| **Kein Buzzword** | Strikte Brand-Voice Einhaltung |

## Seitenstruktur

```
┌─────────────────────────────────────────────────┐
│  // SYSTEM-STATUS: [THEMEN-SPEZIFISCH]          │  ← Terminal Header
├─────────────────────────────────────────────────┤
│                                                  │
│  [H1] Intent-spezifische Headline               │  ← Muss zum Ad-Text passen
│  [Sub] Konkreter Business-Benefit                │
│                                                  │
│  [CTA] ▸ 15-Min. Gespräch buchen               │  ← Primärer CTA Above-the-Fold
│                                                  │
├─────────────────────────────────────────────────┤
│  3 Pain-Points / Challenges                      │  ← Retro-Panel-Design
│  (Adressiert typische Probleme des Segments)     │
├─────────────────────────────────────────────────┤
│  // LÖSUNG: Was x10aix.tech liefert              │
│  - Konkreter Deliverable 1                       │
│  - Konkreter Deliverable 2                       │
│  - Impact-Beispiel mit Zahl                      │
├─────────────────────────────────────────────────┤
│  Social Proof / Qualifikation                    │  ← Erfahrungswerte, Referenzen
├─────────────────────────────────────────────────┤
│  // NÄCHSTER SCHRITT                             │
│  [CTA] ▸ 15-Min. Gespräch buchen — Kein Pitch  │  ← Sekundärer CTA
│  [ALT] ▸ Oder: AI-Assessment starten            │  ← Alternative Micro-Conversion
├─────────────────────────────────────────────────┤
│  Impressum | Datenschutz     x10aix.tech         │  ← Minimaler Footer
└─────────────────────────────────────────────────┘
```

## Dynamische H1 per URL-Parameter (Optional)

Für Kampagne 2 (4 Pain-Point-basierte Ad-Gruppen) kann eine einzige Landingpage mit dynamischer H1 verwendet werden:

```javascript
// URL-Parameter → H1-Mapping
const h1Map = {
  'paralyse':  'Sie wissen, dass KI wichtig ist. Aber wo anfangen?',
  'roi':       'KI-Investition oder Risiko? Ehrliche Antworten.',
  'knowhow':   'Kein KI-Team? So starten Sie trotzdem.',
  'skepsis':   'KI-Beratung ohne Hintergedanken.',
  'default':   'AI-Enablement für den DACH-Mittelstand.'
};

// Aufruf: /landingpage/?ag=paralyse
```

## Landingpage-Übersicht

| # | Pfad | Ad-Gruppe | H1-Entwurf | Status |
|---|:---|:---|:---|:---|
| 0 | `c-level-assessment/` | (Bestand) | Data & AI Readiness. Ohne Hype. | ✅ Live |
| 1 | `ki-strategie-beratung/` | 2.1 | Ihre KI-Strategie. Validiert in 4 Wochen. | ⏳ |
| 2 | `ki-roi/` | 2.2 | KI-Investition oder Risiko? Ehrliche Antworten. | ⏳ |
| 3 | `ki-berater-mittelstand/` | 2.3 | AI-Enablement für den DACH-Mittelstand. | ⏳ |
| 4 | `ai-sounding-board/` | 2.4 | Ihr AI Sounding Board. Neutral. Ergebnisoffen. | ⏳ |
| 5 | `wissensautomatisierung/` | 3.1 | Unternehmenswissen. Automatisiert nutzbar. | 🔲 |
| 6 | `dokumentenautomatisierung/` | 3.2 | Dokumenten-Workflows. 60% schneller. | 🔲 |
| 7 | `rag-system/` | 3.3 | RAG-Systeme für Ihr Unternehmenswissen. | 🔲 |
| 8 | `ki-integration/` | 4.1 | KI in Ihre IT-Landschaft. Nahtlos integriert. | 🔲 |
| 9 | `ki-prozessautomatisierung/` | 4.2 | Prozesse automatisieren. ROI in unter 3 Monaten. | 🔲 |

## Technische Anforderungen (jede LP)

- [ ] GTM-Container eingebunden
- [ ] Conversion-Events konfiguriert (siehe [Conversion-Tracking](conversion-tracking.md))
- [ ] HTTPS aktiv
- [ ] PageSpeed > 90 (Lighthouse)
- [ ] Impressum + Datenschutz im Footer verlinkt
- [ ] Open Graph Tags für Social Sharing
- [ ] Canonical URL gesetzt
