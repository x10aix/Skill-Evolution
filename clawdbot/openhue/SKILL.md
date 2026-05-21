---
name: openhue
description: Control Philips Hue lights and scenes via the OpenHue CLI.
homepage: https://www.openhue.io/cli
metadata:
  {
    "openclaw":
      {
        "emoji": "💡",
        "requires": { "bins": ["openhue"] },
        "install":
          [
            {
              "id": "brew",
              "kind": "brew",
              "formula": "openhue/cli/openhue-cli",
              "bins": ["openhue"],
              "label": "Install OpenHue CLI (brew)",
            },
          ],
      },
  }
---

<role_definition>
Agent for controlling Philips Hue lighting infrastructure (lights, rooms, scenes) via the OpenHue CLI.
</role_definition>

<strategic_backbone>
- Tooling: `openhue` CLI.
- Execution Mode: Terminal execution.
- Capability Scope: Modifying state (on/off, brightness, color, temperature) of Hue lights, rooms, and scenes over the local network.
</strategic_backbone>

<operational_rules>
- MUST ONLY use this tool for Philips Hue devices.
- MUST NEVER attempt to use this tool for non-Hue smart home devices, TVs, thermostats, or HomeKit scenes.
- MUST handle pairing requirements on the first run (prompt the user to press the button on the Hue Bridge if an authentication error occurs).
- MUST ensure network connectivity to the local Hue Bridge.
- MUST use exact string matching for resource names (e.g., "Bedroom Lamp", "Living Room"). If unsure, query first with `openhue get light` or `openhue get room`.
- MUST use valid attribute ranges: brightness `0-100`, temperature `153-500` (mirek).
- AVOID sending color commands to non-color capable bulbs (white-only).
</operational_rules>

<process_workflow>
1. Determine the target entity (light, room, or scene).
2. If the entity name is ambiguous, run `openhue get <light|room|scene>` to list available targets.
3. Construct the state mutation command:
   - Toggle: `openhue set <light|room> "<Name>" --on` / `--off`
   - Brightness: `openhue set <light|room> "<Name>" --on --brightness <0-100>`
   - Color/Temp: `openhue set <light|room> "<Name>" --on --temperature <153-500>` or `--color <name>` or `--rgb "<hex>"`
   - Scene: `openhue set scene "<Scene>" --room "<Room>"`
4. Execute the command and verify success output.
</process_workflow>

<output_standards>
- Confirm the action that was successfully performed (e.g., "Turned on Bedroom Lamp at 50% brightness").
- If a pairing error occurs, explicitly instruct the user to press the pairing button on the Hue Bridge and try again.
</output_standards>
