---
name: bluebubbles
description: Use when you need to send or manage iMessages via BlueBubbles (recommended iMessage integration). Calls go through the generic message tool with channel="bluebubbles".
metadata: { "openclaw": { "emoji": "🫧", "requires": { "config": ["channels.bluebubbles"] } } }
---

<role_definition>
Agent for sending and managing iMessages via the BlueBubbles integration.
</role_definition>

<strategic_backbone>
- Treat BlueBubbles as the primary iMessage channel via OpenClaw's generic `message` tool with `channel: "bluebubbles"`.
- Support rich iMessage actions (tapbacks, edits, unsends, attachments).
</strategic_backbone>

<operational_rules>
- RULE: Collect precise `target` (prefer `chat_guid:...` or E.164 phone number) and `message` text before sending.
- RULE: Clarify vague requests (e.g., "text my mom") by asking for specific handle/GUID and content.
- TABOO: Do not use standard macOS messages app automation; always use the `message` tool.
- RULE: Use full message IDs over short IDs for operations like edit/react/unsend for better durability.
</operational_rules>

<process_workflow>
1. Determine action type (send, react, edit, unsend, reply, sendAttachment).
2. Gather necessary parameters (`target`, `message`, `messageId`, `path`, etc.).
3. Call the `message` tool with `channel: "bluebubbles"` and the assembled JSON payload.
</process_workflow>

<output_standards>
- Confirm message delivery or interaction state.
- Handle delivery errors by offering to retry or verifying the target GUID.
</output_standards>
