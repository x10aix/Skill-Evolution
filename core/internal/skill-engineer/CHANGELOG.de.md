# Changelog: Skill-Engineer

Dieses Dokument verfolgt den strukturierten Versionsverlauf des Skill-Engineers basierend auf den Commits, seitdem die Entwicklung über Agent-First IDEs (insbesondere Antigravity) skaliert wurde.

---

### [Latest] May 21, 2026
**Version 4.41 — „Ecosystem & Fairness" Update**

* `tbd` - **feat**: **Stateful Ecosystem Pruning** — Ecosystem Mapping ist nun optional und blockiert externe Importe nicht mehr.
* `tbd` - **feat**: **Fairness & Credits (Modus C)** — Bei der Überprüfung oder Bearbeitung externer Skills bietet der Agent proaktiv an, einen `## Origin / Credits`-Block anzuhängen, um Originalautoren fair zu verlinken, ohne dies zwingend zu fordern.

---

### Mai 13, 2026
**Version 4.4 — „Agent Economy 2026" Update**

* `tbd` - **feat**: **Stateful Ecosystem Pruning** — Der Skill-Engineer liest in Phase 0 nun nicht mehr stur alle Dateien, sondern prüft (stateful via `.skill-config.json`) die `ECOSYSTEM.md` Map. Das verhindert Token-Bloat und Context-Inflation (Pruning).
* `tbd` - **feat**: **Skill-Mapper Auslagerung** — Die rekursive Mapping-Logik (ehemals Modus M) wurde aus Performance-Gründen (Separation of Concerns) in einen separaten `skill-mapper` Agenten ausgelagert.
* `tbd` - **feat**: **Conflict-Router** — Erkennt der Engineer einen Überlappungs-Konflikt, schlägt er proaktiv die Generierung eines "Router-Skills" vor, anstatt nur zu warnen.
* `tbd` - **feat**: **Toxic Inputs & TSD** — In Phase 3 (TSD) wird nun explizit das Entwerfen von "Toxic Inputs" (z.B. überlange Strings, Race Conditions) für Edge-Case-Tests gefordert.
* `tbd` - **feat**: **Dialektische Validierung (Red Teaming)** — Phase 2.5 eingeführt: Der Agent muss seinen eigenen Skill-Entwurf im "Adversarial Build" Modus selbst angreifen (Logikfehler, Statelessness-Checks, IDE-Constraints).


### [Latest] April 29, 2026
**Version 4.3 — „Stateless Architecture" Update**

* `tbd` - **feat**: **Stateless Design** — Vollständiger Wechsel von Inline-Konfigurationen (`<!-- CONFIGURATION_START -->`) zu einer strikt lokalen `.skill-config.json`. Verhindert Git-Konflikte bei Updates und trennt Skill-Logik vom User-State.
* `tbd` - **feat**: N/A

---

### [Latest] April 20, 2026
**Version 4.2 — „Model-Agnostic Prompting" Update**

* `tbd` - **feat**: N/A
* `tbd` - **feat**: N/A
* `tbd` - **feat**: N/A
* `tbd` - **docs**: N/A

---

### April 16, 2026
**Version 4.1 — „Ecosystem-Mapper" Update**

* `tbd` - **feat**: N/A
* `tbd` - **docs**: N/A

---

### April 13, 2026
**Version 4.0 — „Ecosystem-Aware" Update**

Sieben praxisbasierte Verbesserungen, abgeleitet aus realen Beobachtungen während der Erstellung des `google-ads-manager` Skills. Der Skill-Engineer versteht jetzt Skill-Ökosysteme, nicht nur einzelne Skills.

* `5e5ffdc` - **feat**: N/A
* `5e5ffdc` - **feat**: N/A
* `5e5ffdc` - **feat**: N/A
* `5e5ffdc` - **feat**: N/A
* `5e5ffdc` - **feat**: N/A
* `5e5ffdc` - **feat**: N/A
* `5e5ffdc` - **docs**: N/A
* `5e5ffdc` - **feat**: N/A

---

### März 27, 2026
**Commits: N/A
* `tbd` - **feat**: N/A

**Commits: N/A
* `212a6f3` - **feat**: N/A
* `212a6f3` - **feat**: N/A

---

### März 26, 2026
**Commits: N/A
* `dcab64d` - **docs**: N/A
* `b992a06` - **docs**: N/A

---

### März 25, 2026
**Commits: N/A
* `66969d6` - **docs**: N/A
* `49d8fd2` - **Initial commit**: N/A
* `2ff6b3c` - **docs**: N/A
