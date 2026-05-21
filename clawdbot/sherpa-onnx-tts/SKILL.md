---
name: sherpa-onnx-tts
description: Local text-to-speech via sherpa-onnx (offline, no cloud)
metadata:
  {
    "openclaw":
      {
        "emoji": "🔉",
        "os": ["darwin", "linux", "win32"],
        "requires": { "env": ["SHERPA_ONNX_RUNTIME_DIR", "SHERPA_ONNX_MODEL_DIR"] },
        "install":
          [
            {
              "id": "download-runtime-macos",
              "kind": "download",
              "os": ["darwin"],
              "url": "https://github.com/k2-fsa/sherpa-onnx/releases/download/v1.12.23/sherpa-onnx-v1.12.23-osx-universal2-shared.tar.bz2",
              "archive": "tar.bz2",
              "extract": true,
              "stripComponents": 1,
              "targetDir": "runtime",
              "label": "Download sherpa-onnx runtime (macOS)",
            },
            {
              "id": "download-runtime-linux-x64",
              "kind": "download",
              "os": ["linux"],
              "url": "https://github.com/k2-fsa/sherpa-onnx/releases/download/v1.12.23/sherpa-onnx-v1.12.23-linux-x64-shared.tar.bz2",
              "archive": "tar.bz2",
              "extract": true,
              "stripComponents": 1,
              "targetDir": "runtime",
              "label": "Download sherpa-onnx runtime (Linux x64)",
            },
            {
              "id": "download-runtime-win-x64",
              "kind": "download",
              "os": ["win32"],
              "url": "https://github.com/k2-fsa/sherpa-onnx/releases/download/v1.12.23/sherpa-onnx-v1.12.23-win-x64-shared.tar.bz2",
              "archive": "tar.bz2",
              "extract": true,
              "stripComponents": 1,
              "targetDir": "runtime",
              "label": "Download sherpa-onnx runtime (Windows x64)",
            },
            {
              "id": "download-model-lessac",
              "kind": "download",
              "url": "https://github.com/k2-fsa/sherpa-onnx/releases/download/tts-models/vits-piper-en_US-lessac-high.tar.bz2",
              "archive": "tar.bz2",
              "extract": true,
              "targetDir": "models",
              "label": "Download Piper en_US lessac (high)",
            },
          ],
      },
  }
---

<role_definition>
You are an offline TTS agent utilizing `sherpa-onnx` to generate audio without cloud dependencies.
</role_definition>

<strategic_backbone>
You execute the local `sherpa-onnx-tts` binary, leveraging pre-downloaded runtime and model directories to synthesize WAV files from text.
</strategic_backbone>

<operational_rules>
- MUST ensure `SHERPA_ONNX_RUNTIME_DIR` and `SHERPA_ONNX_MODEL_DIR` are set in the environment.
- MUST use the exact binary path from `{baseDir}/bin/sherpa-onnx-tts` (or via `node` on Windows).
- ALWAYS specify an output file using `-o <path.wav>`.
- If the model directory contains multiple `.onnx` files, MUST specify the exact file using `--model-file`.
</operational_rules>

<process_workflow>
1. **Verify**: Check environment variables for runtime and model paths.
2. **Execute**: Run `{baseDir}/bin/sherpa-onnx-tts -o <output.wav> "<Text>"`.
3. **Deliver**: Return the path of the generated `.wav` file to the user.
</process_workflow>

<output_standards>
- Confirm successful generation and provide the path to the resulting audio file.
</output_standards>
