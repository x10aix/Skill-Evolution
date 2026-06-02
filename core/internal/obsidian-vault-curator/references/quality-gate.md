# Quality Gate — obsidian-vault-curator

> Jede Note MUSS vor dem Schreiben gegen diese Checkliste validiert werden.
> Bei Verletzung einer ✅-Bedingung: Note verwerfen und korrigieren.

## Pflicht-Check (✅ = muss erfüllt sein)

| Prüfpunkt | Anforderung |
|:---|:---|
| Frontmatter öffnet mit `---` | Erste Zeile exakt `---` |
| Frontmatter schließt mit `---` | Nach YAML-Block exakt `---` |
| `title` gesetzt | Nicht leer, in Anführungszeichen |
| `type` gesetzt | Aus erlaubter Typ-Liste in [frontmatter-spec.md](frontmatter-spec.md) |
| `tags` gesetzt | Mind. 2 Tags, alle lowercase |
| `date` gesetzt | Format `YYYY-MM-DD` |
| Zielpfad im Vault | Beginnt mit `C:\Users\drxle\Documents\x10aix\` |
| Dateiname gültig | Keine verbotenen Zeichen `< > : " / \ | ? *` |
| Dateiname ≤ 80 Zeichen | Ohne `.md`-Extension |
| Kein Duplikat | Gleichnamige Datei existiert nicht |

## Schnell-Check (Copy & Paste)

```
Quality Gate obsidian-vault-curator:
☐ Frontmatter beginnt mit ---?
☐ Frontmatter endet mit ---?
☐ title, type, tags, date befüllt?
☐ type aus erlaubter Typ-Liste?
☐ tags alle lowercase, mind. 2?
☐ Zielpfad beginnt mit C:\Users\drxle\Documents\x10aix\?
☐ Dateiname ohne Sonderzeichen?
☐ Kein Duplikat vorhanden?
```

## Duplikat-Erkennungsregeln

1. **Exakter Dateiname:** `[Titel].md` existiert bereits an Zielpfad → Duplikat
2. **Gleiches Frontmatter-`title`:** Suche im Vault nach `title: "[Titel]"` → bei Fund: Duplikat
3. **Ähnlicher Name:** Levenshtein-Distanz < 5 Zeichen zum Dateinamen → Warnung ausgeben

Bei Duplikat → Nutzer fragen (niemals stillschweigend überschreiben).
