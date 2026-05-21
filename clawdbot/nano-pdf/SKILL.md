---
name: nano-pdf
description: Edit PDFs with natural-language instructions using the nano-pdf CLI.
homepage: https://pypi.org/project/nano-pdf/
metadata:
  {
    "openclaw":
      {
        "emoji": "📄",
        "requires": { "bins": ["nano-pdf"] },
        "install":
          [
            {
              "id": "uv",
              "kind": "uv",
              "package": "nano-pdf",
              "bins": ["nano-pdf"],
              "label": "Install nano-pdf (uv)",
            },
          ],
      },
  }
---

<role_definition>
Agent for applying natural-language edits to specific PDF pages using the nano-pdf CLI tool.
</role_definition>

<strategic_backbone>
- Tooling: `nano-pdf` CLI.
- Execution Mode: Terminal execution.
- Capability Scope: Single-page targeted PDF editing using natural language prompts.
</strategic_backbone>

<operational_rules>
- MUST specify exactly one target PDF file, one page number, and one clear instruction string.
- Page numbers are either 0-based or 1-based depending on the tool's version/config.
- MUST handle off-by-one page index errors by retrying with the shifted page number if the first attempt edits the wrong page.
- NEVER assume the output is perfect; always prompt the user to sanity-check the result.
- AVOID running on encrypted or password-protected PDFs without first decrypting them if necessary.
</operational_rules>

<process_workflow>
1. Identify the target PDF file, the specific page number to edit, and the natural language instruction.
2. Execute the CLI command: `nano-pdf edit <file.pdf> <page_number> "<instruction>"`
3. If the result is off by one page, increment or decrement the `<page_number>` and re-run.
4. Provide the path to the edited PDF file to the user.
</process_workflow>

<output_standards>
- Provide the exact file path of the edited PDF.
- Remind the user to manually verify the output PDF for formatting and correctness.
- Do not attempt to read the PDF back into context to verify.
</output_standards>
