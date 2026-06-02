# Linking Logic — obsidian-vault-linker

> Referenz für den Matching-Algorithmus im Normal-Modus.
> Der Full-Scan (`full-scan.ps1`) verwendet dieselbe Logik in PowerShell.

## Score-Formel

```
Gesamt-Score(N, M) = (TagOverlap * 0.5) + (TypAffinität * 0.3) + (TitelOverlap * 0.2)
```

**Threshold:** Scores < 0.05 → nicht ausgeben (kein falscher Link besser als ein schlechter)
**Semantisches Fallback:** Wenn Top-Score < 0.15 → LLM-basiertes inhaltliches Matching

---

## Typ-Affinität Lookup-Tabelle

| Quell-Typ \ Ziel-Typ | project-index | project-note | area-note | resource | github-repo | insight | method | tool-note | ai-chat | sop | template |
|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **project-index** | 1.0 | 0.8 | 0.3 | 0.2 | 0.4 | 0.3 | 0.2 | 0.1 | 0.1 | 0.2 | 0.1 |
| **project-note** | 0.8 | 1.0 | 0.3 | 0.2 | 0.3 | 0.3 | 0.2 | 0.1 | 0.1 | 0.2 | 0.1 |
| **area-note** | 0.3 | 0.3 | 1.0 | 0.4 | 0.2 | 0.4 | 0.3 | 0.2 | 0.1 | 0.4 | 0.2 |
| **resource** | 0.2 | 0.2 | 0.4 | 1.0 | 0.5 | 0.7 | 0.6 | 0.5 | 0.2 | 0.3 | 0.2 |
| **github-repo** | 0.4 | 0.3 | 0.2 | 0.5 | 1.0 | 0.3 | 0.3 | 0.3 | 0.1 | 0.2 | 0.1 |
| **insight** | 0.3 | 0.3 | 0.4 | 0.7 | 0.3 | 1.0 | 0.5 | 0.3 | 0.3 | 0.2 | 0.1 |
| **method** | 0.2 | 0.2 | 0.3 | 0.6 | 0.3 | 0.5 | 1.0 | 0.3 | 0.1 | 0.7 | 0.5 |
| **tool-note** | 0.1 | 0.1 | 0.2 | 0.5 | 0.3 | 0.3 | 0.3 | 1.0 | 0.1 | 0.2 | 0.2 |
| **ai-chat** | 0.1 | 0.1 | 0.1 | 0.4 | 0.1 | 0.5 | 0.1 | 0.1 | 0.3 | 0.1 | 0.1 |
| **sop** | 0.2 | 0.2 | 0.4 | 0.3 | 0.2 | 0.2 | 0.7 | 0.2 | 0.1 | 1.0 | 0.6 |
| **template** | 0.1 | 0.1 | 0.2 | 0.2 | 0.1 | 0.1 | 0.5 | 0.2 | 0.1 | 0.6 | 1.0 |

*Nicht aufgeführte Typ-Paare: Score = 0.1 (schwacher Baseline)*

---

## Tag-Overlap Berechnung

```
TagOverlap(N, M) = |tags_N ∩ tags_M| / max(|tags_N|, |tags_M|)
```

**Beispiel:**
- Note N: tags = [ki, strategie, antigravity]  → |tags_N| = 3
- Note M: tags = [ki, marketing, antigravity]   → |tags_M| = 3
- Gemeinsam: {ki, antigravity}                  → |∩| = 2
- Score = 2 / max(3,3) = 2/3 ≈ **0.67**

**Randfälle:**
- Eine oder beide Notes haben keine Tags: TagOverlap = 0 → Fallback auf Typ + Titel
- Tags nicht normalisiert (Alias statt kanonischer Form): Score-Verlust → curator muss vorher normalisieren

---

## Titelwort-Overlap Berechnung

```
Tokenisierung: title.split(non-word-chars) → Wörter mit Länge > 3, lowercase
TitelOverlap(N, M) = |words_N ∩ words_M| / max(|words_N|, |words_M|)
```

**Ignorierte Wörter (Stopwords):** "und", "oder", "eine", "einen", "mit", "von", "für", "the", "and", "for"

**Beispiel:**
- Note N: "AG — AEA Architektur Review"   → words = [architektur, review]
- Note M: "AEA System Architektur Plan"   → words = [system, architektur, plan]
- Gemeinsam: {architektur}                → Score = 1/3 ≈ **0.33**

---

## Semantisches Fallback

Greift wenn: Alle Scores < 0.15 (typisch bei Notes ohne Tags oder komplett neuem Thema).

**Vorgehen:**
1. Lese die ersten 500 Zeichen des Fließtexts der neuen Note
2. Extrahiere 3–5 Schlüsselbegriffe
3. Suche im vault-index.json nach Notes mit diesen Begriffen in title oder tags
4. Wähle bis zu 3 Kandidaten aus (auch mit niedrigem Score besser als gar nichts)
5. Markiere die Links im Output als `(semantisch)` zur Transparenz

---

## Full-Scan Äquivalenz

`full-scan.ps1` implementiert exakt dieselbe Formel in PowerShell — ohne LLM, ohne Fallback.
Der Fallback entfällt im Full-Scan: Notes ohne gute Matches bekommen schlicht kein `related:`-Feld.
