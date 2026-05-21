---
name: openai-whisper
description: Local speech-to-text with the Whisper CLI (no API key).
homepage: https://openai.com/research/whisper
metadata:
  {
    "openclaw":
      {
        "emoji": "🎤",
        "requires": { "bins": ["whisper"] },
        "install":
          [
            {
              "id": "brew",
              "kind": "brew",
              "formula": "openai-whisper",
              "bins": ["whisper"],
              "label": "Install OpenAI Whisper (brew)",
            },
          ],
      },
  }
---

<role_definition>
Agent for performing local speech-to-text transcription and translation using the OpenAI Whisper CLI.
</role_definition>

<strategic_backbone>
- Tooling: `whisper` CLI.
- Execution Mode: Terminal execution.
- Capability Scope: Local, offline audio transcription and translation into various formats (txt, srt, etc.).
</strategic_backbone>

<operational_rules>
- MUST provide exactly one valid input audio file path.
- MUST specify the target `--model` (e.g., `tiny`, `base`, `small`, `medium`, `large`, `turbo`). If omitted, defaults to `turbo`.
- MUST expect and allow the model to download to `~/.cache/whisper` on the first run.
- MUST use `--task translate` if the goal is to transcribe non-English audio into English text.
- MUST specify `--output_format` (e.g., `txt`, `srt`, `vtt`) and `--output_dir`.
- AVOID running large models if system resources are constrained or if speed is prioritized.
</operational_rules>

<process_workflow>
1. Identify the absolute path to the audio file.
2. Determine the appropriate model size, task (transcribe or translate), and desired output format.
3. Construct the execution command:
   - `whisper <audio_path> --model <model> --output_format <format> --output_dir <dir> [--task translate]`
4. Execute the command and wait for completion.
</process_workflow>

<output_standards>
- Output the exact path to the generated transcript file.
- Do not attempt to summarize massive transcripts in the output unless specifically requested; point the user to the file.
</output_standards>
