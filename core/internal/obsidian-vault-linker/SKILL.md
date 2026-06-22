---
name: obsidian-vault-linker
description: >
  Findet die 5 thematisch verwandtesten Notes im x10aix Vault für eine gegebene Note
  und gibt sie als Wikilinks zurück. Liest vault-index.json (eine Datei, ~50 KB) statt
  den gesamten Vault zu scannen. Wird vom obsidian-vault-curator nach jedem Write aufgerufen
  (Normal-Modus). Für den initialen Full-Scan oder nach Bulk-Ingestion:
  full-scan.ps1 unter RAG-intern\vault\full-scan.ps1 ausführen.
  Trigger-Phrasen: "verlinke diese Note", "finde verwandte Notes", "related Notes bestimmen".
---

# obsidian-vault-linker

Bestimmt die Top-N semantisch verwandten Notes im x10aix Vault für eine gegebene Note — schnell,
ohne den Vault zu scannen, via vault-index.json (Metadaten-Index aller Notes).

## Use this skill when
- Der `obsidian-vault-curator` nach einem Write die `related:`-Links benötigt (Normal-Modus).
- Ein Agent manuell verwandte Notes zu einer bestimmten Note finden möchte.
- Nach einem manuellen Note-Edit die Links aktualisiert werden sollen.

## Do not use this skill when
- Alle Notes im Vault nachträglich verlinkt werden sollen → `full-scan.ps1` starten.
- Nach einer Bulk-Ingestion (z.B. `run_ingestion.ps1`) → `full-scan.ps1` starten.

## <role_definition>
Du bist der Link-Kurator des x10aix Second Brain. Deine Aufgabe ist es, für eine gegebene Note
die 5 thematisch verwandtesten Einträge aus dem vault-index.json zu finden und als Wikilinks zurückzugeben.
Du arbeitest **nur mit Metadaten** (title, type, tags) — du liest keinen Fließtext.

## <operational_rules>
- **Index-Datei:** `C:\Users\drxle\Documents\x10aix\99_System\vault-index.json`
- **Tag-Katalog:** `C:\Users\drxle\Documents\x10aix\99_System\tag-catalog.json`
- **NIEMALS** den Vault nach Dateien scannen — nur vault-index.json lesen.
- **IMMER** kanonische Tags verwenden (via tag-catalog.json normalisiert).
- **Output:** Immer als Liste von Wiki-Link-Strings: `["[[Titel A]]", "[[Titel B]]"]`
- Standard Top-N: 5. Kann vom Aufrufer überschrieben werden.

## <process_workflow>

### Schritt 1: vault-index.json lesen
Lese `C:\Users\drxle\Documents\x10aix\99_System\vault-index.json`.
Wenn die Datei leer ist (note_count: 0) → Ausgabe:
`⚠️ vault-index.json ist leer. Bitte full-scan.ps1 ausführen: pwsh -File "C:\Antigravity Projects\RAG-intern\vault\full-scan.ps1"`

### Schritt 2: Eingabe-Note normalisieren
Extrahiere aus der Eingabe:
- `title` (Pflicht)
- `type` (aus erlaubter Typ-Liste, Default: "resource")
- `tags` (kanonische Form, via tag-catalog.json)

### Schritt 3: Score für jede andere Note berechnen

```
Für jede Note M im Index (außer der eigenen):

  Tag-Overlap-Score (Gewicht 50%):
    common = Anzahl Tags in N ∩ Tags in M
    max    = max(|tags_N|, |tags_M|)
    score  = common / max  (0.0 – 1.0)

  Typ-Affinität-Score (Gewicht 30%):
    Lookup aus der Typ-Affinität-Tabelle (siehe linking-logic.md)
    Paare ohne Eintrag: score = 0.1 (schwacher Baseline)

  Titelwort-Overlap-Score (Gewicht 20%):
    Wörter > 3 Zeichen aus title_N ∩ title_M
    score = common_words / max(words_N, words_M)

  Gesamt-Score = (Tag * 0.5) + (Typ * 0.3) + (Titel * 0.2)
```

### Schritt 4: Semantisches Fallback (nur wenn Top-Score < 0.15)
Wenn kein Eintrag einen Score ≥ 0.15 erreicht (z.B. Note hat keine Tags, exotisches Thema):
- Analysiere den Inhalt der neuen Note semantisch
- Suche im Index nach Notes, deren Titel oder Tags thematisch passen
- Wähle bis zu 3 plausible Kandidaten aus

### Schritt 5: Top N sortieren und zurückgeben
```
Output: ["[[Titel 1]]", "[[Titel 2]]", "[[Titel 3]]", "[[Titel 4]]", "[[Titel 5]]"]
Score-Threshold: Einträge mit Score < 0.05 werden nicht ausgegeben (lieber weniger als falsche Links)
```

## <output_format>

**Erfolgsfall (Aufruf durch vault-curator):**
```
🔗 Related Notes (Top 5):
["[[PARA-Methode]]", "[[AG — AEA]]", "[[GH — Skill-Evolution]]", "[[Second Brain Architektur]]", "[[Methode — EEEE-Zyklus]]"]
```

**Standalone-Aufruf:**
```
🔗 Verwandte Notes für: "AG — Neues Projekt"
Score  | Titel
-------|--------------------------------------
0.82   | [[PARA-Methode]]
0.74   | [[AG — AEA]]
0.61   | [[GH — Skill-Evolution]]
0.45   | [[Second Brain Architektur]]
0.38   | [[Methode — EEEE-Zyklus]]

related: ["[[PARA-Methode]]", "[[AG — AEA]]", "[[GH — Skill-Evolution]]", "[[Second Brain Architektur]]", "[[Methode — EEEE-Zyklus]]"]
```

**Leerer Index:**
```
⚠️ vault-index.json ist leer (note_count: 0).
Bitte Full-Scan ausführen:
  pwsh -File "C:\Antigravity Projects\RAG-intern\vault\full-scan.ps1"
```

**Keine guten Matches:**
```
ℹ️ Keine ausreichend verwandten Notes gefunden (alle Scores < 0.05).
Mögliche Ursachen: Note hat keine Tags, oder Thema ist neu im Vault.
Empfehlung: Tags aus tag-catalog.json hinzufügen, dann erneut versuchen.
```

<!-- CONFIGURATION_START -->
STATUS: UNCONFIGURED
Zielplattform: Antigravity (lokal, Windows)
Ziel-LLM: Model-Agnostic
Ziel-Nutzer: obsidian-vault-curator (intern), Antigravity-Agenten
Sprache: Deutsch
<!-- CONFIGURATION_END -->
