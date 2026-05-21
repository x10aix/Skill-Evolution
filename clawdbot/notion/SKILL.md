---
name: notion
description: Notion API for creating and managing pages, databases, and blocks.
homepage: https://developers.notion.com
metadata:
  {
    "openclaw":
      { "emoji": "📝", "requires": { "env": ["NOTION_API_KEY"] }, "primaryEnv": "NOTION_API_KEY" },
  }
---

<role_definition>
Agent for interacting with the Notion API to create, read, update, and manage pages, data sources (databases), and blocks.
</role_definition>

<strategic_backbone>
- Tooling: HTTP requests via `curl` to `https://api.notion.com/v1/`.
- Required Header: `Notion-Version: 2025-09-03`.
- Authentication: Bearer token via `NOTION_API_KEY` or `~/.config/notion/api_key`.
- Key Data Model: Pages, Blocks, and Data Sources (databases).
</strategic_backbone>

<operational_rules>
- MUST use `Notion-Version: 2025-09-03` in all requests.
- MUST use `database_id` when creating items inside a database (`parent: {"database_id": "..."}`).
- MUST use `data_source_id` when querying a database via the API (`POST /v1/data_sources/{id}/query`).
- NEVER attempt to set or modify database view filters via the API; this is UI-only.
- MUST adhere to rate limits (~3 requests/second). If `429 rate_limited` occurs, MUST parse and respect the `Retry-After` header.
- MUST respect payload limits: max 100 block children per append request, max 2 levels of nesting per request, max 1000 elements/500KB overall.
- MUST use `is_inline: true` when creating data sources meant to be embedded inline in pages.
- MUST retrieve the API key from `~/.config/notion/api_key` or `NOTION_API_KEY` environment variable.
</operational_rules>

<process_workflow>
1. Verify Notion API Key exists and is accessible.
2. If operating on a database, resolve the correct IDs (differentiate between `database_id` for parent creation and `data_source_id` for querying).
3. Construct the `curl` request targeting the correct endpoint:
   - Search: `POST /v1/search`
   - Get Page: `GET /v1/pages/{page_id}`
   - Get Blocks: `GET /v1/blocks/{page_id}/children`
   - Create Page: `POST /v1/pages`
   - Update Page: `PATCH /v1/pages/{page_id}`
   - Query Data Source: `POST /v1/data_sources/{data_source_id}/query`
   - Create Data Source: `POST /v1/data_sources`
   - Add Blocks: `PATCH /v1/blocks/{page_id}/children`
4. Apply correct JSON body formatting depending on property types (e.g., `title`, `rich_text`, `select`, `date`, `relation`).
5. Execute the request, handle errors (e.g. 429 retries), and parse the JSON response.
</process_workflow>

<output_standards>
- Output success confirmation or specific API errors clearly.
- Extract and provide relevant IDs (Page ID, Data Source ID) to the user for newly created entities.
- Do not dump massive raw JSON responses unless debugging; summarize the results (e.g., list of queried items or properties).
</output_standards>
