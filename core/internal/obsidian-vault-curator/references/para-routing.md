# PARA-Routing — Entscheidungsbaum

> Konsultiere diese Datei in Schritt 2 des obsidian-vault-curator Workflows,
> um den korrekten Vault-Ordner für jede Note zu bestimmen.

## Entscheidungslogik

```mermaid
graph TD
    START["Neue Note: Was ist der Inhalt?"]

    START -->|"Hat eine Deadline / ist ein aktives Vorhaben"| PROJ
    START -->|"Dauerhaft laufende Verantwortung ohne Deadline"| AREA
    START -->|"Allgemeines Wissen / Referenz / Ressource"| RES
    START -->|"Abgeschlossenes Projekt / inaktiv"| ARC
    START -->|"System-Konfiguration / Template / Skript"| SYS
    START -->|"Unklar / mehrere Kategorien passen"| INBOX

    PROJ["10_Projects\n(hat Deadline)"]
    PROJ --> PROJ_SUB{"Unterordner?"}
    PROJ_SUB -->|"AEA Architektur"| P1["10_Projects\AEA Architektur\"]
    PROJ_SUB -->|"GraphRAG"| P2["10_Projects\GraphRAG Versicherungsrecht\"]
    PROJ_SUB -->|"Multi Agent"| P3["10_Projects\Multi Agent Organisation\"]
    PROJ_SUB -->|"Second Brain"| P4["10_Projects\Second Brain\"]
    PROJ_SUB -->|"Neues Projekt"| P5["10_Projects\[Neuer Ordner]\"]

    AREA["20_Areas\n(läuft dauerhaft)"]
    AREA --> AREA_SUB{"Bereich?"}
    AREA_SUB -->|"Personal / Team"| A1["20_Areas\HR\"]
    AREA_SUB -->|"Dienstleistungen / Angebote"| A2["20_Areas\Services\"]

    RES["30_Resources\n(Wissen & Referenz)"]
    RES --> RES_SUB{"Thema?"}
    RES_SUB -->|"x10aix Corporate Identity"| R1["30_Resources\Corporate Identity\"]
    RES_SUB -->|"Erkenntnisse / Studien"| R2["30_Resources\Insights\"]
    RES_SUB -->|"Know-how / Konzepte"| R3["30_Resources\Knowledge\"]
    RES_SUB -->|"Methoden / Frameworks"| R4["30_Resources\Methods\"]
    RES_SUB -->|"Skill-Entwicklung"| R5["30_Resources\Skill-Engineer\"]
    RES_SUB -->|"Tools & Software"| R6["30_Resources\Tools\"]
    RES_SUB -->|"Arbeitsabläufe"| R7["30_Resources\Workflow\"]
    R3 --> R3_SUB{"Wissensbereich?"}
    R3_SUB -->|"Lokale Antigravity-Projekte"| R3A["30_Resources\Knowledge\Antigravity\"]
    R3_SUB -->|"Google Drive Dokumente"| R3B["30_Resources\Knowledge\GoogleDrive\"]
    R3_SUB -->|"GitHub Repositories"| R3C["30_Resources\Knowledge\GitHub\"]
    R3_SUB -->|"KI in Unternehmen"| R3D["30_Resources\Knowledge\KI in Unternehmen Deep Researches 2025\"]
    R3_SUB -->|"Sonstiges Wissen"| R3E["30_Resources\Knowledge\[Neuer Unterordner]\"]

    ARC["40_Archives\n(abgeschlossen / inaktiv)"]

    SYS["99_System\n(Maschinenraum)"]

    INBOX["00_Inbox\Inbox_Antigravity\n(Fallback — zur manuellen Einordnung)"]
```

## Schnell-Referenz Tabelle

| Kriterium | Ordner | Beispiele |
|:---|:---|:---|
| Hat Deadline, aktives Vorhaben | `10_Projects\` | Website Relaunch, Q2 Kampagne |
| Dauerhaft, kein Ende absehbar | `20_Areas\` | HR-Prozesse, Serviceangebote |
| Antigravity Code-Projekt | `30_Resources\Knowledge\Antigravity\` | AG — AEA.md |
| GitHub Repository | `30_Resources\Knowledge\GitHub\` | GH — Skill-Evolution.md |
| Google Drive Dokument | `30_Resources\Knowledge\GoogleDrive\` | Spiegel von G:\ |
| Methode / Framework | `30_Resources\Methods\` | PARA-Methode, EEEE-Zyklus |
| Tool / Software | `30_Resources\Tools\` | Obsidian, NotebookLM |
| Erkenntnisse / Deep Research | `30_Resources\Insights\` | McKinsey KI-Report |
| AI-Chat-Export | `00_Inbox\Inbox_Antigravity\AI-Chats\` | ChatGPT Chat vom 2026-06-01 |
| Abgeschlossenes Projekt | `40_Archives\` | Altes Projekt ohne Aktivität |
| Skript / Template / SOP | `99_System\` | Obsidian SOP, GEM-Bauplan |
| Kategorie unklar | `00_Inbox\Inbox_Antigravity\` | Immer sicher |

## Konfidenz-Schwellenwert

Schreibe nur dann direkt in einen Nicht-Inbox-Ordner, wenn die Konfidenz ≥ 80% ist.
Unterhalb von 80%: Fallback auf `00_Inbox\Inbox_Antigravity\` mit Begründung.

**Konfidenz-Schätzhilfe:**
- Eindeutiger Typ (Code-Projekt, GitHub, AI-Chat) → 95%
- Thema klar, aber 2 Ordner möglich → 60% → Inbox
- Inhalt mehrdeutig oder neues Themengebiet → 40% → Inbox
