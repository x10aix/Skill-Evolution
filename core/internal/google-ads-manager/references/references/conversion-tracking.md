# Conversion-Tracking — Setup & Konfiguration

> Dieses Dokument definiert alle Conversion-Aktionen, ihre Werte und das technische Setup.

## Conversion-Aktionen

| # | Aktion | Priorität | Zugewiesener Wert | Tracking-Methode | Status |
|---|:---|:---|:---|:---|:---|
| 1 | **Sounding Board Gespräch gebucht** | Primär | €100 | Calendly-Buchung → GTM Event | ⏳ Setup |
| 2 | **AI-Readiness Assessment abgeschlossen** | Sekundär | €25 | Lead-Formular Submit → GTM Event | ⏳ Setup |
| 3 | **Kontaktformular abgesendet** | Sekundär | €20 | Formular Submit → GTM Event | ⏳ Setup |

## Technische Anforderungen

### Google Tag Manager (GTM)
- [ ] GTM-Container auf allen Landingpages installiert
- [ ] GTM-Container auf x10aix.tech Hauptseite installiert
- [ ] DataLayer-Events für Formular-Submits konfiguriert

### Google Ads Conversion Tag
- [ ] Google Ads Conversion-Tag im GTM konfiguriert
- [ ] Conversion-Linker-Tag aktiv
- [ ] Enhanced Conversions aktiviert (für bessere Attribution)

### Calendly-Integration
- [ ] Calendly-Buchungsbestätigung als Event tracken
- [ ] Option A: Calendly Redirect zu Thank-You-Page → PageView-Trigger
- [ ] Option B: Calendly Webhook → Server-Side Tracking

### Google Analytics 4 (GA4)
- [ ] GA4-Property mit Google Ads verknüpft
- [ ] GA4-Conversions in Google Ads importiert (für Cross-Channel-Attribution)

## Conversion-Wert-Logik

```
Warum unterschiedliche Werte?

Sounding Board (€100):
→ Direkter Sales-Touchpoint, höchste Conversion-Wahrscheinlichkeit zum Kunden.
→ Geschätzter Customer Lifetime Value × Abschlussrate ÷ Anzahl Gespräche.

Assessment (€25):
→ Micro-Conversion, qualifiziert den Lead, aber keine direkte Kaufentscheidung.
→ Wert = geschätzte Wahrscheinlichkeit, dass Assessment-Nutzer zum Gespräch konvertiert.

Kontaktformular (€20):
→ Niedrigste Qualifizierung, aber signalisiert echtes Interesse.
```

## Attributions-Modell

| Einstellung | Empfehlung |
|:---|:---|
| **Attributionsmodell** | Datengetrieben (wenn genug Daten) oder Positions-basiert |
| **Conversion-Fenster** | 30 Tage Click-Through / 1 Tag View-Through |
| **Zähl-Methode** | "Eine" pro Klick (für Lead-Gen, nicht E-Commerce) |

## Verifikation

Nach Setup, folgende Tests durchführen:
1. **Test-Conversion:** Selbst ein Assessment/Formular ausfüllen und prüfen, ob die Conversion in Google Ads erscheint (Verzögerung: bis zu 24h).
2. **Tag Assistant:** Google Tag Assistant im Browser nutzen, um zu verifizieren, dass alle Tags feuern.
3. **Echtzeit-Report:** GA4 Echtzeit-Bericht prüfen, ob Events ankommen.
4. **Cross-Check:** Nach 48h prüfen, ob Google Ads Conversions ≈ GA4 Conversions (kleine Abweichungen sind normal).
