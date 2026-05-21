# Visuelles Design & UI/UX Tokens (x10aix.tech)

Dieses Dokument definiert das strikte visuelle Design-Regelwerk für x10aix.tech. Es basiert auf einer 1990er DOS PC Game / Retro-futuristischen Industrie-Ästhetik (Wing Commander).

## 1. Die fundamentalen Design-Regeln

- **KEINE abgerundeten Ecken:** `border-radius: 0;` ist absolutes Gesetz. Jedes UI-Element ist scharf und blockhaft (Terminal-Ästhetik).
- **KEIN Anti-Aliasing (wo möglich):** Kanten sollen pixelig sein. Nutze `image-rendering: pixelated;` oder `image-rendering: crisp-edges;` auf Bildern.
- **Tiefe durch Schatten:** Elemente wirken durch dicke Rahmen (`4px solid`) und starke innere und äußere Schatten (Glow/Inset), nicht durch Flächen.
- **Animierte Details:** UI wirkt lebendig durch Glitch-Animationen oder langsame, blinkende Status-LEDs (z.B. ein langsames, 3-Sekunden Fade-In/Out für ein `ONLINE` Label).

## 2. Farb-System (Design Tokens)

Der Hintergrund ist warm und tief (Tiefbraun), NICHT rein schwarz oder kalt-grau.

| Token | Hex-Wert | Bedeutung / Einsatzort |
|---|---|---|
| `--bg-base` | `#2a2420` | Primärer Page-Hintergrund (Warmes Tiefbraun) |
| `--bg-deep` | `#1a1612` | Tieferer Hintergrund (z.B. für Header-Overlays) |
| `--bg-panel` | `#2d2520` | Oberfläche für Cards / Container |
| `--bg-sunken` | `#221e1a` | Eingesunkene Flächen (z.B. Inputs) |
| `--text-primary` | `#d4c5a9` | Haupt-Textfarbe (helles Beige/Sand) |
| `--text-secondary` | `#c4b59a` | Sekundär-Text |
| `--border-primary` | `#6b5d4f` | Standard-Rahmen (4px) |

### Das EEEE-Framework (Semantische Akzentfarben)
Diese Farben leuchten auf dem dunklen Hintergrund als "LEDs".

| Phase | Farbe | Hex-Wert | Einsatzort |
|---|---|---|---|
| **ENABLE** | Bernstein (Amber) | `#e8a030` | Primärer Akzent, Call-to-Action Buttons, Fokus |
| **ESTABLISH** | Cyan | `#00bcd4` | Sekundärer Akzent, Daten, Technologie-Elemente |
| **EXECUTE** | Phosphor-Grün | `#5fd35f` | Status-Indikatoren (`● ONLINE`), Erfolgsmeldungen |
| **EVOLVE** | Blau | `#6b8db8` | Kontinuierliche Prozesse, Expansion |

*Hinweis für Fehler:* Fehler oder "SECURED" Indikatoren nutzen ein rotes `#d35f5f`.

## 3. Typografie

- **Primär-Font:** `VT323` (Monospace, pixelig). Muss als Haupt-Schriftart für Überschriften und UI-Elemente verwendet werden.
- **Fallback / Lesbarkeit:** `Perfect DOS VGA 437` oder `IBM Plex Mono`. Wird eingesetzt, wenn Fließtexte in VT323 zu schwer lesbar wären (Accessibility).
- **Keine Kantenglättung:** Die Pixellierung ist gewollt.

## 4. Layout, Rahmen & Hover-States

- **Cards/Container:** `border: 3px solid #5a4d3f; background: #2d2520;`
- **Terminal Panels:** `border: 4px solid #6b5d4f;` plus ein tiefer Inset-Shadow (`inset 0 0 10px rgba(0,0,0,0.8)`).
- **Akzente:** Oft wird eine farbige Akzentlinie (`border-left: 4px solid var(--amber)`) genutzt, um Wichtigkeit zu markieren.
- **Hover:** Elemente springen nicht auf (kein Bounce/Spring). Bei Hover: `translateY(-2px)`, Rahmenfarbe wechselt zur Akzentfarbe, und ein leichter "Glow" Box-Shadow (`0 0 15px rgba(232, 160, 48, 0.3)` für Bernstein) entsteht.
- **Transparenz:** Spärlich eingesetzt, oft kombiniert mit Backdrop-Filter (`backdrop-filter: blur(4px)` für Navigations-Overlays).

## 5. Iconografie & Bilder

- **Regel:** KEINE standardmäßigen, cleanen SVG-Icon-Fonts (wie FontAwesome oder moderne SaaS-Icons).
- **Standard:** Nutze stattdessen rein CSS-basierte farbige Quadrate (wie "LEDs") oder Unicode-Zeichen (`▶`, `▸`, `●`, `→`, `//`, `[ ]`, `>`).
- **Ausnahme für Echte Icons:** Wenn grafische Icons zwingend notwendig sind, MÜSSEN sie den Retro-Pixellook aufgreifen (z.B. phosphor-grüne oder bernsteinfarbene Pixel-Art, dicke Pixelrahmen, keine sanften Kurven).
- **Bilder:** Sollen einen "Scanline-Overlay"-Effekt oder CRT-Monitor-Artefakte haben. Keine sterilen Stock-Fotos.
