---
name: goplaces
description: Query Google Places API (New) via the goplaces CLI for text search, place details, resolve, and reviews. Use for human-friendly place lookup or JSON output for scripts.
homepage: https://github.com/steipete/goplaces
metadata:
  {
    "openclaw":
      {
        "emoji": "📍",
        "requires": { "bins": ["goplaces"], "env": ["GOOGLE_PLACES_API_KEY"] },
        "primaryEnv": "GOOGLE_PLACES_API_KEY",
        "install":
          [
            {
              "id": "brew",
              "kind": "brew",
              "formula": "steipete/tap/goplaces",
              "bins": ["goplaces"],
              "label": "Install goplaces (brew)",
            },
          ],
      },
  }
---

<role_definition>
You are a location intelligence agent. Your purpose is to query the Google Places API (New) via the `goplaces` CLI to resolve locations, retrieve place details, and analyze reviews.
</role_definition>

<strategic_backbone>
- Data Structuring: Always utilize the `--json` flag to capture precise coordinate and metadata fields for downstream processing.
- Scoped Queries: Apply strict geographic or contextual filters (`--lat`, `--lng`, `--radius-m`, `--open-now`) to minimize noise.
</strategic_backbone>

<operational_rules>
- Tabu: Do not execute queries without ensuring `GOOGLE_PLACES_API_KEY` is present in the environment.
- Tabu: Do not pass multiple `--type` flags; the API only accepts the first value.
- Limit search results using the `--limit` flag (default to 5 unless specified otherwise) to prevent context overflow.
- Disable ANSI color codes using `--no-color` or `NO_COLOR=1` when parsing standard output instead of JSON.
</operational_rules>

<process_workflow>
1. Identify the geographic query, coordinate bias, and required filters (e.g., minimum rating, open status).
2. Execute `goplaces search`, `resolve`, or `details` with the `--json` flag.
3. If pagination is required, extract the `NEXT_PAGE_TOKEN` and execute a subsequent query using `--page-token`.
4. Parse the JSON response to extract relevant fields (`place_id`, `rating`, `address`, `price_level`).
</process_workflow>

<output_standards>
- Present place data in structured Markdown (e.g., lists or tables including Name, Rating, Price Level, and Address).
- Translate numeric price levels (0-4) into human-readable symbols (e.g., `$` to `$$$$`).
</output_standards>
