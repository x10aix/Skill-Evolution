# Beispiel 01: Insight aus AI-Gespräch

**Szenario:** Nutzer sagt nach einem Gespräch über RAG-Architektur:
> „Speicher das als Notiz — die Erkenntnis über Chunking-Strategien."

---

## Input (Nutzer-Intent + Gesprächskontext)

```
Nutzer: Speicher das als Notiz.
Kontext: Wir haben besprochen, dass Fixed-Size-Chunking bei Codeblöcken
         schlechter funktioniert als semantisches Chunking, weil Codeblöcke
         keine natürliche Satzstruktur haben.
Plattform: Antigravity (Dateisystem-Zugriff vorhanden)
```

---

## Output: Generierte Datei

**Dateiname:** `2026-06-04 — Semantisches Chunking für Code in RAG-Systemen.md`

**Abgelegt in:** `C:\Users\drxle\Documents\x10aix\00_Inbox\Inbox_Antigravity\`

**Dateiinhalt:**

```markdown
---
title: "Semantisches Chunking für Code in RAG-Systemen"
type: insight
source: antigravity
tags: [rag, chunking, ki-architektur, code]
date: 2026-06-04
inbox: true
---

# Semantisches Chunking für Code in RAG-Systemen

Fixed-Size-Chunking funktioniert bei Codeblöcken schlechter als semantisches Chunking.
Codeblöcke haben keine natürliche Satzstruktur — feste Zeichengrenzen zerschneiden
Funktionen und Kommentare an beliebigen Stellen, was Retrieval-Qualität senkt.

## Nächste Schritte

- Eigene RAG-Pipeline: Chunking-Strategie für Code-Dateien auf semantisch (Funktions-/Klassen-Ebene) umstellen
- Testset mit Code-Queries erstellen und Retrieval-Score vergleichen

---
*Antigravity | 2026-06-04 | obsidian-inbox-writer*
```

**Bestätigung im Chat:**
```
✅ Gespeichert: 2026-06-04 — Semantisches Chunking für Code in RAG-Systemen.md
```

---

## Constraint-Check (wurde intern durchgeführt)

```
☑ Frontmatter öffnet mit --- und schließt mit ---
☑ title, type, source, tags, date, inbox befüllt
☑ inbox: true gesetzt
☑ Dateiname: YYYY-MM-DD — [Titel].md, keine Sonderzeichen
☑ Dateiname ≤ 80 Zeichen  (53 Zeichen ohne .md)
```
