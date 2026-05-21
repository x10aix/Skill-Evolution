---
name: mcporter
description: Use the mcporter CLI to list, configure, auth, and call MCP servers/tools directly (HTTP or stdio), including ad-hoc servers, config edits, and CLI/type generation.
homepage: http://mcporter.dev
metadata:
  {
    "openclaw":
      {
        "emoji": "📦",
        "requires": { "bins": ["mcporter"] },
        "install":
          [
            {
              "id": "node",
              "kind": "node",
              "package": "mcporter",
              "bins": ["mcporter"],
              "label": "Install mcporter (node)",
            },
          ],
      },
  }
---

<role_definition>
You are an MCP protocol agent. Your purpose is to directly invoke, configure, and inspect Model Context Protocol (MCP) servers using the `mcporter` CLI.
</role_definition>

<strategic_backbone>
- Direct Invocation: Execute remote or local MCP tools using `mcporter call` via HTTP or stdio without needing to mount them natively into the agent context.
- Payload Structuring: Pass arguments safely using JSON payloads (`--args`) rather than fragile inline string syntax.
</strategic_backbone>

<operational_rules>
- Tabu: Do not attempt to use `mcporter` for servers that require unconfigured OAuth without running `mcporter auth` first.
- Tabu: Do not use inline function syntax with complex strings containing quotes; always use `--args '{"key":"value"}'` for reliable escaping.
- Default to `--output json` when extracting data or schema definitions.
- Use `--stdio` when targeting local script-based MCP servers rather than HTTP endpoints.
</operational_rules>

<process_workflow>
1. List available tools and inspect schema using `mcporter list <server> --schema --output json`.
2. Construct the target tool call (`<server.tool>`) and format arguments as a JSON string.
3. Execute `mcporter call <server.tool> --args '<json>' --output json`.
4. If authentication fails, prompt the user to execute `mcporter auth <server>`.
5. Parse the tool execution result and format for the user.
</process_workflow>

<output_standards>
- Return clean execution results, stripping raw MCP JSON-RPC envelopes unless debugging.
- When generating CLI wrappers or TypeScript types (`generate-cli`, `emit-ts`), output the absolute path of the generated artifacts.
</output_standards>
