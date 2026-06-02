# obsidian-vault-linker

**Version:** 1.0 — Initial Release (2026-06-02)

🇬🇧 [Read in English](README.md)

> ⚠️ **Plattform-Hinweis:** Interner Skill für den x10aix Vault (Windows, lokales Dateisystem). Abhängigkeit: `99_System/vault-index.json` — erst `full-scan.ps1` ausführen wenn der Index leer ist.

---

## Was dieser Skill tut

Der `obsidian-vault-linker` findet die Top-N verwandtesten Notes für eine gegebene Note — indem er eine einzige vorberechnete Metadaten-Index-Datei (`vault-index.json`) liest, statt den gesamten Vault zu scannen. Das Ergebnis sind Obsidian Wiki-Links für das `related:`-Frontmatter-Feld.

Er wird vom `obsidian-vault-curator` nach jedem Write aufgerufen (Normal-Modus). Für nachträgliches Bulk-Verlinken (z.B. nach der initialen Ingestion von 473 Notes) wird stattdessen `full-scan.ps1` genutzt.

---

## Warum er existiert

Der naive Ansatz — bei jedem Write alle Notes scannen — wird mit wachsendem Vault teuer:
- 473 Notes heute → 1000+ morgen
- Jeder Scan liest hunderte Dateien → langsam, token-intensiv
- Qualität verschlechtert sich wenn Tags ohne Normalisierung driften

Die Lösung: Ein vorberechneter Index aus reinen Metadaten (title, type, tags, date), der vollständig in ein LLM-Kontextfenster passt (~50 KB für 500 Notes). Kombiniert mit dem Tag-Katalog (`tag-catalog.json`) bleibt die Matching-Qualität konsistent unabhängig von der Vault-Größe.

---

## Matching-Algorithmus

```
Score(N, M) = (Tag-Overlap × 0.5) + (Typ-Affinität × 0.3) + (Titel-Overlap × 0.2)
```

| Komponente | Gewicht | Methode |
|:---|:---:|:---|
| Tag-Overlap | 50% | Mengenschnitt kanonischer Tags |
| Typ-Affinität | 30% | Lookup-Tabelle (method↔method=1.0, etc.) |
| Titelwort-Overlap | 20% | Tokenisierter Wortschnitt (>3 Zeichen) |

Vollständiger Algorithmus: [linking-logic.md](references/linking-logic.md)

**Semantisches Fallback:** Wenn Top-Score < 0.15 (keine Tags oder völlig neues Thema), liest das LLM die ersten 500 Zeichen des Fließtexts und findet Kandidaten semantisch.

---

## Beziehung zu anderen Skills

```
[obsidian-vault-curator]
    │ ruft nach jedem Write auf
    ▼
[obsidian-vault-linker]   ← dieser Skill
    │ liest
    ▼
[vault-index.json]   99_System/vault-index.json

[full-scan.ps1]   RAG-intern/vault/full-scan.ps1
    │ baut/aktualisiert
    ▼
[vault-index.json]
    │ schreibt related: in alle bestehenden Notes
    ▼
[x10aix Vault]   C:\Users\drxle\Documents\x10aix\
```

---

## Full-Scan vs. Normal-Modus

| | Normal-Modus (dieser Skill) | Full-Scan (`full-scan.ps1`) |
|:---|:---|:---|
| **Auslöser** | Nach jedem curator-Write | Manuell / nach Bulk-Ingestion |
| **Engine** | LLM (mit semantischem Fallback) | Reines PowerShell (algorithmisch) |
| **Input** | Metadaten einer neuen Note | Alle Notes im Vault |
| **Output** | `related:` für die neue Note | `related:` für alle Notes ohne Feld |
| **Geschwindigkeit** | ~1–2s | ~30–60s für 500 Notes |
| **LLM nötig** | Ja (für Fallback) | Nein |

---

## Backlog

| Punkt | Priorität | Hinweis |
|:---|:---|:---|
| Geplanter Full-Scan via vault_health.ps1 | Niedrig | Auto-Refresh Index monatlich oder nach Bulk-Ingestion |
| Bidirektionales Linking | Niedrig | Wenn Note A Note B verlinkt, wird Note A auch zu Note B's related hinzugefügt |
