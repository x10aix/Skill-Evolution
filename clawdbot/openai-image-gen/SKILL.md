---
name: openai-image-gen
description: Batch-generate images via OpenAI Images API. Random prompt sampler + `index.html` gallery.
homepage: https://platform.openai.com/docs/api-reference/images
metadata:
  {
    "openclaw":
      {
        "emoji": "🎨",
        "requires": { "bins": ["python3"], "env": ["OPENAI_API_KEY"] },
        "primaryEnv": "OPENAI_API_KEY",
        "install":
          [
            {
              "id": "python-brew",
              "kind": "brew",
              "formula": "python",
              "bins": ["python3"],
              "label": "Install Python (brew)",
            },
          ],
      },
  }
---

<role_definition>
Agent for batch-generating structured image prompts and rendering them via the OpenAI Images API using a bundled Python script.
</role_definition>

<strategic_backbone>
- Tooling: `python3 {baseDir}/scripts/gen.py`
- Execution Mode: Background terminal execution.
- Capability Scope: Single and batch image generation using DALL-E 2, DALL-E 3, and GPT image models.
</strategic_backbone>

<operational_rules>
- MUST ensure `OPENAI_API_KEY` is set in the environment.
- MUST set a high execution timeout (e.g., 300 seconds) when invoking this script via execution tools to prevent premature termination.
- MUST restrict `count` to exactly 1 when using `dall-e-3`.
- MUST use valid `size` arguments depending on the model:
  - GPT image models: `1024x1024`, `1536x1024`, `1024x1536`, `auto`.
  - dall-e-3: `1024x1024`, `1792x1024`, `1024x1792`.
  - dall-e-2: `256x256`, `512x512`, `1024x1024`.
- MUST use valid `quality` arguments:
  - GPT image models: `auto`, `high`, `medium`, `low`.
  - dall-e-3: `hd`, `standard`.
  - dall-e-2: `standard`.
- MUST use valid `--style` arguments (`vivid` or `natural`) ONLY for `dall-e-3`.
- MUST use `--output-format` (`png`, `jpeg`, `webp`) and `--background` (`transparent`, `opaque`, `auto`) ONLY for GPT image models.
</operational_rules>

<process_workflow>
1. Determine the target model, prompt(s), count, size, quality, and any model-specific parameters based on user request.
2. Construct the execution command, e.g.:
   - `python3 {baseDir}/scripts/gen.py --prompt "<prompt>" --count <n> --model <model> --size <size> --quality <quality> [--out-dir <path>]`
3. Execute the script with an increased timeout (e.g., 300s).
4. Wait for completion and locate the generated output directory (typically matching `openai-image-gen-*`).
</process_workflow>

<output_standards>
- Provide the path to the generated images and the `index.html` gallery.
- Do not attempt to describe the generated images; let the user open the gallery or image files directly.
</output_standards>
