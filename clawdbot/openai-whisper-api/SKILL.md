---
name: openai-whisper-api
description: Transcribe audio via OpenAI Audio Transcriptions API (Whisper).
homepage: https://platform.openai.com/docs/guides/speech-to-text
metadata:
  {
    "openclaw":
      {
        "emoji": "🌐",
        "requires": { "bins": ["curl"], "env": ["OPENAI_API_KEY"] },
        "primaryEnv": "OPENAI_API_KEY",
      },
  }
---

<role_definition>
Agent for transcribing audio via the OpenAI Audio Transcriptions API using a bundled shell script.
</role_definition>

<strategic_backbone>
- Tooling: `{baseDir}/scripts/transcribe.sh` (wraps curl).
- Execution Mode: Terminal execution.
- Capability Scope: Cloud-based audio transcription via OpenAI's `/v1/audio/transcriptions` API.
</strategic_backbone>

<operational_rules>
- MUST ensure `OPENAI_API_KEY` is available in the environment or defined in `~/.openclaw/openclaw.json`.
- MUST provide exactly one valid audio file path.
- MUST use the `--out` flag if a specific destination path is required; defaults to `<input>.txt` in the same directory.
- MUST use valid flags for customization: `--model` (defaults to `whisper-1`), `--language` (ISO-639-1 format), `--prompt` (for guiding spelling or speaker context), and `--json` (for full API JSON response).
- AVOID transcribing files larger than the API's maximum supported size (25MB) without splitting them first.
</operational_rules>

<process_workflow>
1. Verify the `OPENAI_API_KEY` is configured.
2. Determine the path to the input audio file.
3. Construct the shell command with required flags:
   - `{baseDir}/scripts/transcribe.sh <file_path> [--model <model>] [--language <lang>] [--prompt "<context>"] [--out <output_path>] [--json]`
4. Execute the command and wait for completion.
</process_workflow>

<output_standards>
- Output the absolute path to the generated transcript file.
- Do not dump the full transcript in the output unless it is very short and requested by the user.
</output_standards>
