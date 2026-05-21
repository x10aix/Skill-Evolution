---
name: nano-banana-pro
description: Generate or edit images via Gemini 3 Pro Image (Nano Banana Pro).
homepage: https://ai.google.dev/
metadata:
  {
    "openclaw":
      {
        "emoji": "🍌",
        "requires": { "bins": ["uv"], "env": ["GEMINI_API_KEY"] },
        "primaryEnv": "GEMINI_API_KEY",
        "install":
          [
            {
              "id": "uv-brew",
              "kind": "brew",
              "formula": "uv",
              "bins": ["uv"],
              "label": "Install uv (brew)",
            },
          ],
      },
  }
---

<role_definition>
Agent for generating and editing images via the Gemini 3 Pro Image (Nano Banana Pro) script.
</role_definition>

<strategic_backbone>
- Tooling: Bundled script `uv run {baseDir}/scripts/generate_image.py`.
- Execution Mode: Terminal execution via uv.
- Capability Scope: Single image generation, single image editing, multi-image composition (up to 14 images).
</strategic_backbone>

<operational_rules>
- NEVER read the generated image back into context. Report the saved path only.
- MUST use timestamps in filenames formatted exactly as `yyyy-mm-dd-hh-mm-ss-name.png`.
- ALLOWED resolutions: `1K` (default), `2K`, `4K`.
- ALLOWED aspect ratios: `1:1`, `2:3`, `3:2`, `3:4`, `4:3`, `4:5`, `5:4`, `9:16`, `16:9`, `21:9`.
- MUST use `--aspect-ratio` / `-a` flag for specific layout constraints (e.g., avatars, profile pics, consistent batch generation). If omitted, the model picks freely.
- REQUIRED API Key: Ensure `GEMINI_API_KEY` is set in the environment or in `~/.openclaw/openclaw.json` (`skills."nano-banana-pro".apiKey` / `skills."nano-banana-pro".env.GEMINI_API_KEY`).
</operational_rules>

<process_workflow>
1. Determine the operation type (generate, edit, or multi-image).
2. Construct the file name using the required timestamp format `yyyy-mm-dd-hh-mm-ss-name.png`.
3. Construct the command:
   - Generate: `uv run {baseDir}/scripts/generate_image.py --prompt "<prompt>" --filename "<filename>" [--resolution <res>] [--aspect-ratio <ratio>]`
   - Edit (single image): `uv run {baseDir}/scripts/generate_image.py --prompt "<prompt>" --filename "<filename>" -i "<input_path>" [--resolution <res>]`
   - Multi-image composition (up to 14): `uv run {baseDir}/scripts/generate_image.py --prompt "<prompt>" --filename "<filename>" -i "<img1>" -i "<img2>" ...`
4. Execute the command and capture the output.
5. Identify the `MEDIA:` line in the script output for OpenClaw to auto-attach.
</process_workflow>

<output_standards>
- Return ONLY the absolute path of the generated image.
- DO NOT describe the generated image.
- Ensure the `MEDIA:` line is printed if the script outputs it.
</output_standards>
