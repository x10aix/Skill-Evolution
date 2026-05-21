# Search-Term-Analyse — Wöchentlicher Workflow

> Dieser Workflow wird wöchentlich durchgeführt.
> Ziel: Irrelevanten Traffic blockieren, wertvolle neue Keywords entdecken.

## Wann durchführen?

- **Frequenz:** Wöchentlich (idealerweise Montag für die vergangene Woche)
- **Mindest-Datenbasis:** Erst sinnvoll ab >50 Klicks/Woche pro Kampagne
- **Priorität:** Hoch — dies ist die wichtigste operative Aufgabe im laufenden Betrieb

## Schritt-für-Schritt-Workflow

### Schritt 1: Daten exportieren
- Google Ads → Kampagne auswählen → "Suchanfragen" (Search Terms)
- Zeitraum: Letzte 7 Tage
- Sortieren nach: Impressions (absteigend)

### Schritt 2: Intent-Klassifizierung

Klassifiziere jeden Suchbegriff in eine der 5 Kategorien:

| Kategorie | Aktion | Beispiel |
|:---|:---|:---|
| 🟢 **High Intent** | Behalten, ggf. als Exact Match Keyword hinzufügen | "ki beratung für geschäftsführer" |
| 🟡 **Medium Intent** | Beobachten, nach 2 Wochen erneut prüfen | "ki unternehmen berater" |
| 🔴 **Kein Intent** | Sofort als Negativkeyword blockieren | "ki kurs online kostenlos" |
| 🟠 **Falsche Zielgruppe** | Als Negativkeyword blockieren | "ki praktikum wien" |
| 🔵 **Neues Thema** | Potenzielle neue Ad-Gruppe evaluieren | "ki für buchhaltung" |

### Schritt 3: Negativkeyword-Entscheidung

Für jeden 🔴 und 🟠 Suchbegriff:

```
Entscheidungsbaum:
│
├── Ist der gesamte Begriff irrelevant?
│   └── JA → Als Phrase Match Negativkeyword hinzufügen
│       Beispiel: "ki kurs online kostenlos" → Negative: "kurs"
│
├── Ist nur ein Wort im Begriff das Problem?
│   └── JA → Nur das einzelne Wort als Broad Match Negative
│       Beispiel: "ki praktikum wien" → Negative: praktikum
│
└── Ist der Begriff branchenspezifisch irrelevant?
    └── JA → Auf Kampagnen-Level blockieren (nicht global)
        Beispiel: "ki marketing automation" → Nur in Kampagne 4 blockieren
```

### Schritt 4: Keyword-Harvesting

Für jeden 🟢 Suchbegriff mit ≥3 Klicks und positiver CTR:

1. Prüfe, ob der Suchbegriff bereits als Keyword existiert → Wenn ja, Gebot ggf. erhöhen.
2. Prüfe, ob eine passende Ad-Gruppe existiert → Wenn ja, als Keyword hinzufügen.
3. Wenn kein passendes Keyword/AG existiert → Auf die Liste "Potenzielle neue Keywords" setzen.

### Schritt 5: Dokumentation

Nach Abschluss der Analyse:
1. Neue Negativkeywords in [Negativkeywords](../references/negative-keywords.md) eintragen (mit Datum).
2. Neue Keywords in [Keyword-Listen](../references/keyword-lists.md) eintragen.
3. Kurzes Wochenprotokoll erstellen:

```
## Search-Term-Report KW [XX] / [DATUM]

### Zusammenfassung
- Analysierte Suchbegriffe: [N]
- Neue Negativkeywords hinzugefügt: [N]
- Neue Keywords entdeckt: [N]
- Auffälligkeiten: [Freitext]

### Neue Negativkeywords
| Begriff | Ebene | Begründung |
|---|---|---|
| [keyword] | Global/Kampagne X | [Grund] |

### Potenzielle neue Keywords
| Begriff | Vorgeschlagene AG | Klicks | CTR |
|---|---|---|---|
| [keyword] | [AG] | [N] | [%] |
```

## Warnsignale im Search-Term-Report

| Signal | Diagnose | Maßnahme |
|:---|:---|:---|
| >50% Suchbegriffe ohne Intent | Keywords zu breit (Broad Match?) | Match Types verschärfen |
| Viele Suchbegriffe mit "kostenlos" | Negativkeyword-Liste unvollständig | Kategorie "Selbstlerner" erweitern |
| Suchbegriffe in falscher Sprache | Geo-Targeting oder Sprachsetting falsch | Kampagnen-Einstellungen prüfen |
| Viele Klicks, keine Conversions | Landingpage-Problem oder falscher Intent | Quality Score + LP-Experience checken |
| Ein Suchbegriff dominiert >40% Spend | Über-Konzentration, Risiko | Ggf. eigene Ad-Gruppe dafür erstellen |
