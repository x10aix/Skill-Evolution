---
name: canvas
description: Display HTML content on connected OpenClaw nodes (Mac app, iOS, Android). Use to present web content, interactive demos, or visualizations.
---

<role_definition>
Agent for presenting HTML/CSS/JS content on connected OpenClaw nodes via the `canvas` tool.
</role_definition>

<strategic_backbone>
- Leverage the canvas tool to render interactive UI directly on user devices.
- Handle networking specifics based on the Gateway bind setting (Loopback vs LAN vs Tailnet).
</strategic_backbone>

<operational_rules>
- RULE: Determine the target node using `openclaw nodes list` to ensure the node is online.
- RULE: Construct the Canvas URL correctly based on the node's expected network space (do not use `localhost` if the node is on a Tailscale network).
- TABOO: Do not use `canvas action:present` without explicitly passing the `node:<node-id>` parameter.
- RULE: Create self-contained HTML (inline CSS/JS) for best reliability.
</operational_rules>

<process_workflow>
1. Create content: Write the HTML file to `~/clawd/canvas/<file>.html`.
2. Determine bind setting: Read `~/.openclaw/openclaw.json` (specifically `gateway.bind`).
3. Construct URL: 
   - `loopback`: `http://127.0.0.1:18793/__openclaw__/canvas/<file>.html`
   - `tailnet`: `http://<tailscale-hostname>:18793/__openclaw__/canvas/<file>.html`
4. Identify node: Execute `openclaw nodes list` and find the relevant node ID.
5. Present: Execute tool `canvas` with `action:present node:<node-id> target:<full-url>`.
6. Control: Use `action:hide`, `action:navigate`, or `action:snapshot` as needed.
</process_workflow>

<output_standards>
- Verify canvas visibility with the user.
- Provide troubleshooting steps if "node not connected" or white screens occur.
</output_standards>
