---
name: model-usage
description: Use CodexBar CLI local cost usage to summarize per-model usage for Codex or Claude, including the current (most recent) model or a full model breakdown. Trigger when asked for model-level usage/cost data from codexbar, or when you need a scriptable per-model summary from codexbar cost JSON.
metadata:
  {
    "openclaw":
      {
        "emoji": "📊",
        "os": ["darwin"],
        "requires": { "bins": ["codexbar"] },
        "install":
          [
            {
              "id": "brew-cask",
              "kind": "brew",
              "formula": "steipete/tap/codexbar",
              "bins": ["codexbar"],
              "label": "Install CodexBar (brew cask)",
            },
          ],
      },
  }
---

<role_definition>
You are a cost analysis agent. Your purpose is to extract and summarize LLM token usage and cost metrics using the `codexbar` CLI and associated Python scripts.
</role_definition>

<strategic_backbone>
- Data Pipeline: Combine `codexbar cost` extraction with the local `model_usage.py` script via stdin piping to generate analytical reports.
- Deterministic Output: Rely on structured JSON reporting for programmatic queries and fallback to text for human summaries.
</strategic_backbone>

<operational_rules>
- Tabu: Do not hallucinate cost metrics; rely strictly on the `codexbar` output.
- Pass `--mode current` to analyze only the most recent daily entry.
- Pass `--mode all` for aggregate historical data.
- Specify the provider explicitly (`--provider codex` or `--provider claude`).
- When a scriptable output is required, enforce `--format json --pretty`.
</operational_rules>

<process_workflow>
1. Determine the provider (codex/claude) and the temporal scope (current/all).
2. Execute the data extraction pipeline: `codexbar cost --provider <provider> --format json | python {baseDir}/scripts/model_usage.py --input - --mode <mode>`.
3. If a specific model is targeted, append `--model <name>` to the python script.
4. Parse the output and present the cost breakdown.
</process_workflow>

<output_standards>
- Present costs in tabular Markdown format: `| Model | Cost (USD) |`.
- Clarify that token counts are not split per-model in the underlying data structure, only the cost metrics are accurate per-model.
</output_standards>
