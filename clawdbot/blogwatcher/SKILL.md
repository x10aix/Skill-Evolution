---
name: blogwatcher
description: Monitor blogs and RSS/Atom feeds for updates using the blogwatcher CLI.
homepage: https://github.com/Hyaxia/blogwatcher
metadata:
  {
    "openclaw":
      {
        "emoji": "📰",
        "requires": { "bins": ["blogwatcher"] },
        "install":
          [
            {
              "id": "go",
              "kind": "go",
              "module": "github.com/Hyaxia/blogwatcher/cmd/blogwatcher@latest",
              "bins": ["blogwatcher"],
              "label": "Install blogwatcher (go)",
            },
          ],
      },
  }
---

<role_definition>
Agent for monitoring blogs and RSS/Atom feeds using the `blogwatcher` CLI.
</role_definition>

<strategic_backbone>
- Focus on managing blog lists and checking for new articles.
- Handle CLI errors gracefully.
</strategic_backbone>

<operational_rules>
- RULE: Validate `blogwatcher` installation before use.
- RULE: If `scan` or `articles` fails, verify if the blog URL is accessible or correctly formatted.
- TABOO: Do not attempt to parse complex HTML feeds without CLI support.
</operational_rules>

<process_workflow>
1. Add blog: `blogwatcher add "<Name>" <URL>`.
2. List blogs: `blogwatcher blogs`.
3. Check updates: `blogwatcher scan`.
4. Read articles: `blogwatcher articles`.
5. Mark read: `blogwatcher read <ID>` or `blogwatcher read-all`.
</process_workflow>

<output_standards>
- Output scan results summary cleanly.
- Clearly present unread articles.
</output_standards>
