# x10aix.tech — CI-Richtlinien für Google Docs (Corporate Identity)

Dieses Dokument enthält die verbindlichen visuellen Richtlinien für die Formatierung von Google Docs Dokumenten nach x10aix.tech Corporate Identity.

> **Quelle:** Abgeleitet aus dem x10aix.tech Design System (`x10aix-design-system/references/visual-design.md`) und der Brand Voice (`marketing-brand-voice`).

---

## 1. Typografie (Google Docs Schriften)

| Element | Schrift | Größe | Stil | Farbe |
|---------|---------|-------|------|-------|
| H1 (Dokumenttitel) | **Inter** | 28pt | Bold | `#1A1A1A` (oder `#e8a030` für Executive Decks) |
| H2 (Abschnittsüberschrift) | **Inter** | 20pt | Semi-Bold | `#2A2A2A` |
| H3 (Unterabschnitt) | **Inter** | 16pt | Bold | `#3A3A3C` |
| Fließtext | **Roboto** | 11pt | Regular | `#333333` |
| Zitat / Callout | **Roboto** | 11pt | Italic | `#555555` |
| Code / Terminal-Stil | **Roboto Mono** | 10pt | Regular | `#1A1A1A` |
| Fußzeile | **Roboto** | 9pt | Regular | `#777777` |

> **Hinweis:** Google Docs unterstützt keine DOS-Fonts (VT323, Perfect DOS). Inter + Roboto sind die nächstliegenden professionellen Alternativen im Docs-Kontext.

---

## 2. Farb-System (HEX-Codes)

| Token | Hex-Wert | Verwendungszweck in Docs |
|-------|----------|--------------------------|
| Primärhintergrund | `#FFFFFF` | Normaler Seiteninhalt |
| Akzentfarbe Bernstein | `#e8a030` | Überschriften in Decks, Callout-Rahmen |
| Akzentfarbe Cyan | `#00bcd4` | Sekundäre Hervorhebungen, Datenpunkte |
| Tabellenköpfe Hintergrund | `#1A1A1A` | Dunkle Tabellen-Header (Executive Decks) |
| Tabellenköpfe Text | `#FFFFFF` | Text in dunklen Tabellenköpfen |
| Tabellen-Zebrastreifen | `#F4F4F4` | Jede zweite Tabellenzeile |
| Tabellen-Rahmen | `#3A3A3C` | Tabellenbegrenzungen |
| Divider / Linie | `#CCCCCC` | Horizontale Trennlinien |

---

## 3. Seitenformat

- **Format:** DIN A4 (21 × 29,7 cm)
- **Ränder:** Oben/Unten: 2,5 cm | Links/Rechts: 2,0 cm
- **Zeilenabstand:** 1,15 (Standard) oder 1,5 für Executive-Reports
- **Seitennummerierung:** Unten rechts, Schrift Roboto 9pt `#777777`

---

## 4. Tabellengestaltung

```
Standard-Tabelle:
- Header-Zeile: Hintergrund #1A1A1A, Schrift weiß, Bold, Roboto 11pt
- Datenspalten: Alternierend Weiß und #F4F4F4
- Rahmen: 1pt solid #3A3A3C (alle Seiten)
- Kein border-radius (eckig)

Executive One-Pager-Tabelle:
- Header-Zeile: Hintergrund #e8a030 (Bernstein), Schrift #1A1A1A, Bold
- Datenspalten: Weiß, Roboto Regular 10pt
```

---

## 5. Elementspezifische Regeln

| Element | Regel |
|---------|-------|
| Aufzählungszeichen | `▸` (Unicode) statt Standard-Bullet. Alternativ: Standard wenn nicht verfügbar. |
| Nummerierung | Arabische Ziffern, Roboto Bold 11pt |
| Hervorhebung (Bold) | Sparsam — maximal 2-3 Begriffe pro Absatz |
| Unterstriche | NIEMALS für Hervorhebung, nur für echte Hyperlinks |
| Emojis | NIEMALS in formalen Dokumenten (Executive-Reports, Proposals, Angebote) |
| Logos | Immer oben links, mit 0,5 cm Mindestabstand zum Text |

---

## 6. Extrapolation bei undefinierten Elementen

Wenn ein Element nicht explizit definiert ist:
1. Nutze die nächste definierte Hierarchie-Ebene als Grundlage
2. Orientiere dich an der x10aix.tech-Webseiten-Ästhetik: Industrial, klar, eckig, substanzhaltig
3. Vermeide softe, abgerundete oder "moderne SaaS"-Ästhetik
4. Protokolliere im Report: welche Extrapolation du vorgenommen hast

---

*Quelle: x10aix.tech Design System | Letzte Aktualisierung: 2026-06-22 | docs-ci-restyler Skill*
