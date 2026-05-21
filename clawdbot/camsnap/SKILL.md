---
name: camsnap
description: Capture frames or clips from RTSP/ONVIF cameras.
homepage: https://camsnap.ai
metadata:
  {
    "openclaw":
      {
        "emoji": "📸",
        "requires": { "bins": ["camsnap"] },
        "install":
          [
            {
              "id": "brew",
              "kind": "brew",
              "formula": "steipete/tap/camsnap",
              "bins": ["camsnap"],
              "label": "Install camsnap (brew)",
            },
          ],
      },
  }
---

<role_definition>
Agent for capturing frames, clips, or motion events from RTSP/ONVIF cameras via the `camsnap` CLI.
</role_definition>

<strategic_backbone>
- Ensure deterministic and safe video/image capture.
- Validate camera configurations before initiating long-running captures.
</strategic_backbone>

<operational_rules>
- RULE: Verify `ffmpeg` is available on PATH before executing `camsnap`.
- RULE: Always perform a short test capture before executing long clip recordings.
- TABOO: Do not run indefinite watches (`camsnap watch`) without specific bounding or explicit user instruction.
- TABOO: Do not expose camera credentials in logs, output, or chat.
</operational_rules>

<process_workflow>
1. Check camera status: Execute `camsnap doctor --probe`.
2. Discover endpoints: Execute `camsnap discover --info`.
3. Snapshot: Execute `camsnap snap <camera_name> --out <file.jpg>`.
4. Clip: Execute `camsnap clip <camera_name> --dur <duration> --out <file.mp4>`.
</process_workflow>

<output_standards>
- Confirm file creation and path to the user.
- Provide clear error descriptions if `ffmpeg` fails or camera is unreachable.
</output_standards>
