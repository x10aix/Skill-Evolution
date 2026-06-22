# Compliance-Checklist — Google Ads

> Jeder Output des google-ads-manager Skills MUSS gegen diese Checklist validiert werden.
> Dies ist der letzte Schritt vor der Freigabe.

## 1. RSA-Zeichenlimits (Responsive Search Ads)

| Element | Max. Zeichen | Anzahl pro RSA | Hinweis |
|:---|:---|:---|:---|
| **Headline** | 30 Zeichen | 3–15 Stück | Leerzeichen zählen mit |
| **Description** | 90 Zeichen | 2–4 Stück | Leerzeichen zählen mit |
| **Display Path 1** | 15 Zeichen | 1 | Optional, aber empfohlen |
| **Display Path 2** | 15 Zeichen | 1 | Optional |
| **Final URL** | 2.048 Zeichen | 1 | Muss funktionieren |

### RSA Best Practices
- Mindestens **10 Headlines** bereitstellen (Google empfiehlt 15 für optimale Kombination).
- Mindestens **3 Descriptions** bereitstellen (Google empfiehlt 4).
- Headlines müssen **eigenständig funktionieren** — jede Headline kann mit jeder anderen kombiniert werden.
- **Nicht pinnen**, es sei denn für rechtliche Pflichtangaben.

## 2. Textinhalte — Verbotene Elemente

| Verboten | Beispiel | Regel |
|:---|:---|:---|
| ❌ Emojis | 🚀, ✅, 🎯 | Generell verboten in Google Ads |
| ❌ Excessive Großbuchstaben | "JETZT BUCHEN" | Einzelne Wörter in Caps sind OK, ganze Phrasen nicht |
| ❌ Excessive Satzzeichen | "Jetzt buchen!!!" | Max. 1 Ausrufezeichen pro Ad, kein ! in Headlines |
| ❌ Wiederholung | "Beste Beratung beste Beratung" | Keine redundanten Phrasen |
| ❌ Irreführende Claims | "100% Garantie auf ROI" | Keine unbeweisbaren Versprechen |
| ❌ Superlative ohne Beweis | "Der beste KI-Berater" | Nur mit verifiziertem Drittanbieter-Nachweis |
| ❌ Markenrechtsverletzung | "Besser als McKinsey" | Keine Wettbewerber-Namen in Ads |
| ❌ Click-Bait | "Sie werden nicht glauben..." | Keine irreführenden Teaser |

## 3. Landingpage-Compliance

| Prüfpunkt | Anforderung |
|:---|:---|
| **Impressum** | Muss auf der Landingpage verlinkt sein (DSGVO/TMG) |
| **Datenschutzerklärung** | Muss auf der Landingpage verlinkt sein |
| **SSL/HTTPS** | Landingpage MUSS über HTTPS erreichbar sein |
| **Mobile-Responsive** | Landingpage MUSS auf Mobile funktionieren |
| **Ladezeit** | Ziel: < 3 Sekunden (beeinflusst Quality Score) |
| **Message Match** | H1 der Landingpage ≈ Headline der Anzeige |
| **Kein Popup** | Keine störenden Popups beim Laden (Google-Policy) |
| **Klare Navigation** | Nutzer muss Conversion-Aktion (CTA) sofort finden |

## 4. Account-Level-Compliance

| Prüfpunkt | Anforderung |
|:---|:---|
| **Conversion-Tracking** | Muss aktiv und verifiziert sein vor Kampagnen-Launch |
| **Enhanced Conversions** | Empfohlen für besseres Tracking |
| **Google Tag Manager** | Auf allen Landingpages installiert |
| **Ads Policy Center** | Keine offenen Policy-Verstöße im Account |

## 5. B2B-spezifische Regeln (x10aix.tech)

| Prüfpunkt | Anforderung |
|:---|:---|
| **Anrede** | Formelles "Sie" in allen Anzeigen und Landingpages |
| **Brand Voice** | Pragmatisch, direkt, keine Buzzwords (siehe `brand-guidelines` Skill) |
| **Nicht versprechen** | Keine konkreten Zeitangaben ("In 24h Ergebnis") ohne Basis |
| **CTA-Klarheit** | User muss wissen, was nach dem Klick passiert ("15-Min. Gespräch buchen") |

## Schnell-Check (Copy & Paste für jeden Output)

```
Compliance-Check:
☐ Alle Headlines ≤ 30 Zeichen?
☐ Alle Descriptions ≤ 90 Zeichen?
☐ Keine Emojis, keine excessive Caps/Punctuation?
☐ Keine unbeweisbaren Superlative?
☐ Kein Ausrufezeichen in Headlines?
☐ Message Match: Ad ↔ Landingpage?
☐ Landingpage: HTTPS, Impressum, Datenschutz, Mobile?
☐ Conversion-Tracking aktiv?
☐ Brand Voice eingehalten (formelles "Sie", keine Buzzwords)?
```
