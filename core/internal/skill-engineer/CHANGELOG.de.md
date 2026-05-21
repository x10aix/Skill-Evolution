# Changelog: Skill-Engineer

Dieses Dokument verfolgt den strukturierten Versionsverlauf des Skill-Engineers basierend auf den Commits, seitdem die Entwicklung Ã¼ber Agent-First IDEs (insbesondere Antigravity) skaliert wurde.

---

### [Latest] May 13, 2026
**Version 4.4 â€” â€žAgent Economy 2026" Update**

* `tbd` - **feat**: **Stateful Ecosystem Pruning** â€” Der Skill-Engineer liest in Phase 0 nun nicht mehr stur alle Dateien, sondern prÃ¼ft (stateful via `.skill-config.json`) die `ECOSYSTEM.md` Map. Das verhindert Token-Bloat und Context-Inflation (Pruning). Ecosystem Mapping ist nun optional und blockiert externe Importe nicht.
* `tbd` - **feat**: **Fairness & Credits (Modus C)** â€” Bei der ÃœberprÃ¼fung oder Bearbeitung externer Skills bietet der Agent proaktiv an, einen `## Origin / Credits`-Block anzuhÃ¤ngen, um Originalautoren fair zu verlinken, ohne dies zwingend zu fordern.
* `tbd` - **feat**: **Skill-Mapper Auslagerung** â€” Die rekursive Mapping-Logik (ehemals Modus M) wurde aus Performance-GrÃ¼nden (Separation of Concerns) in einen separaten `skill-mapper` Agenten ausgelagert.
* `tbd` - **feat**: **Conflict-Router** â€” Erkennt der Engineer einen Ãœberlappungs-Konflikt, schlÃ¤gt er proaktiv die Generierung eines "Router-Skills" vor, anstatt nur zu warnen.
* `tbd` - **feat**: **Toxic Inputs & TSD** â€” In Phase 3 (TSD) wird nun explizit das Entwerfen von "Toxic Inputs" (z.B. Ã¼berlange Strings, Race Conditions) fÃ¼r Edge-Case-Tests gefordert.
* `tbd` - **feat**: **Dialektische Validierung (Red Teaming)** â€” Phase 2.5 eingefÃ¼hrt: Der Agent muss seinen eigenen Skill-Entwurf im "Adversarial Build" Modus selbst angreifen (Logikfehler, Statelessness-Checks, IDE-Constraints).


### [Latest] April 29, 2026
**Version 4.3 â€” â€žStateless Architecture" Update**

* `tbd` - **feat**: **Stateless Design** â€” VollstÃ¤ndiger Wechsel von Inline-Konfigurationen (`<!-- CONFIGURATION_START -->`) zu einer strikt lokalen `.skill-config.json`. Verhindert Git-Konflikte bei Updates und trennt Skill-Logik vom User-State.
* `tbd` - **feat**: N/A

---

### [Latest] April 20, 2026
**Version 4.2 â€” â€žModel-Agnostic Prompting" Update**

* `tbd` - **feat**: N/A
* `tbd` - **feat**: N/A
* `tbd` - **feat**: N/A
* `tbd` - **docs**: N/A

---

### April 16, 2026
**Version 4.1 â€” â€žEcosystem-Mapper" Update**

* `tbd` - **feat**: N/A
* `tbd` - **docs**: N/A

---

### April 13, 2026
**Version 4.0 â€” â€žEcosystem-Aware" Update**

Sieben praxisbasierte Verbesserungen, abgeleitet aus realen Beobachtungen wÃ¤hrend der Erstellung des `google-ads-manager` Skills. Der Skill-Engineer versteht jetzt Skill-Ã–kosysteme, nicht nur einzelne Skills.

* `5e5ffdc` - **feat**: N/A
* `5e5ffdc` - **feat**: N/A
* `5e5ffdc` - **feat**: N/A
* `5e5ffdc` - **feat**: N/A
* `5e5ffdc` - **feat**: N/A
* `5e5ffdc` - **feat**: N/A
* `5e5ffdc` - **docs**: N/A
* `5e5ffdc` - **feat**: N/A

---

### MÃ¤rz 27, 2026
**Commits: N/A
* `tbd` - **feat**: N/A

**Commits: N/A
* `212a6f3` - **feat**: N/A
* `212a6f3` - **feat**: N/A

---

### MÃ¤rz 26, 2026
**Commits: N/A
* `dcab64d` - **docs**: N/A
* `b992a06` - **docs**: N/A

---

### MÃ¤rz 25, 2026
**Commits: N/A
* `66969d6` - **docs**: N/A
* `49d8fd2` - **Initial commit**: N/A
* `2ff6b3c` - **docs**: N/A
