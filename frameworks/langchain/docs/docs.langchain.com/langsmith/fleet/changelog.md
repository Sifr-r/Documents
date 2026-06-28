# changelog

## Introduction

> ## Documentation Index
> Fetch the complete documentation index at: https://docs.langchain.com/llms.txt
> Use this file to discover all available pages before exploring further.

# LangSmith Fleet changelog

> Weekly updates to LangSmith Fleet

Weekly updates to [LangSmith Fleet](/langsmith/fleet).

<Callout icon="rss" color="#4F46E5" iconType="regular">
  **Subscribe**: This changelog includes an [RSS feed](https://docs.langchain.com/langsmith/fleet-changelog/rss.xml) that can integrate with [Slack](https://slack.com/help/articles/218688467-Add-RSS-feeds-to-Slack), [email](https://zapier.com/apps/email/integrations/rss/1441/send-new-rss-feed-entries-via-email), Discord bots like [Readybot](https://readybot.io/) or [RSS Feeds to Discord Bot](https://rss.app/en/bots/rssfeeds-discord-bot), and other subscription tools.

<Update label="June 1-5, 2026" rss={{ title: "2026-06-01 - LangSmith Fleet update" }}>

## New features

* [Skills](/langsmith/fleet/skills) load faster: the skills list fetches lightweight metadata first and loads file contents only when you open a skill.
  * The agent creation menu adds a [Templates](/langsmith/fleet/templates) entry.
  * The [remote MCP](/langsmith/fleet/remote-mcp-servers) authorization screen now shows the connecting application's name, logo, and homepage, terms, and privacy links instead of its raw client ID.
  * [Slack integration](/langsmith/fleet/slack-app) available in AWS and APAC regions.

## Fixes

* [Scheduled (cron) execution](/langsmith/fleet/schedules) is restored for enterprise Fleet agents.
  * Long-running agent runs and agent-builder generations are no longer cut off after 60 seconds.
  * The Gmail read-emails [tool](/langsmith/fleet/tools) now returns results when you search sent mail with an `in:sent` query.
  * Scrolling is improved for long toolbox, skill, and sub-agent lists in the agent editor, and webhook dialogs now scroll within the viewport.

***

<div className="source-links">
  <Callout icon="terminal-2">
    [Connect these docs](/use-these-docs) to Claude, VSCode, and more via MCP for real-time answers.
  

  <Callout icon="edit">
    [Edit this page on GitHub](https://github.com/langchain-ai/docs/edit/main/src/langsmith/fleet/changelog.mdx) or [file an issue](https://github.com/langchain-ai/docs/issues/new/choose).
  
</div>

