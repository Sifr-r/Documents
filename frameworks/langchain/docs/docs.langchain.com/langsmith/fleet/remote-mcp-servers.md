# remote-mcp-servers

## Introduction

> ## Documentation Index
> Fetch the complete documentation index at: https://docs.langchain.com/llms.txt
> Use this file to discover all available pages before exploring further.

# Remote MCP servers

> Connect Fleet to popular remote MCP servers

You can connect LangSmith Fleet to remote MCP servers to extend your agents with additional tools and integrations. This page covers how to add custom MCP servers and provides configuration details for popular remote servers.

An [MCP (Model Context Protocol) server](https://modelcontextprotocol.io/docs/getting-started/intro) exposes tools that an agent can call at runtime.

A remote MCP server:

* Runs outside of LangSmith (usually over HTTPS).
* Owns its own authentication and authorization.
* Acts as a bridge between your agent and an external system.

LangSmith Fleet doesn't execute these tools itself, it forwards requests to the MCP server and returns the results to the agent.

### How it works

* Fleet discovers tools from remote MCP servers via the standard MCP protocol.
* Headers configured in your workspace are automatically attached when fetching tools or calling them. Headers are key-value pairs sent with every HTTP request to your MCP server. They're commonly used for authentication (like API keys or bearer tokens), but can also provide configuration information, content types, or custom metadata.
* Tools from remote servers are available alongside built-in tools in Fleet.

**Runtime**: Fleet automatically connects to your MCP server and uses its tools.

```mermaid theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
sequenceDiagram
    participant Agent as Fleet
    participant MCP as Remote MCP Server

    Agent->>MCP: Discover available tools<br/>(with configured headers)
    MCP-->>Agent: Return tool list

    Note over Agent,MCP: Later, when agent needs a tool...

    Agent->>MCP: Call tool<br/>(with configured headers)
    MCP-->>Agent: Return result
```

## Add a remote MCP server

You can add MCP servers directly from your agent or from workspace settings.

  Adding MCP servers requires the **MCP Server Create** permission. Workspace admins can grant this permission to users from workspace settings.

### Add to a specific agent

To add a remote MCP server to a specific agent:

  <Step title="Open the agent editor">
    Open your agent in the [Fleet](https://smith.langchain.com/agents?utm_source=docs\&utm_medium=cta\&utm_campaign=langsmith-signup\&utm_content=langsmith-fleet-remote-mcp-servers) inbox. Next to the agent name, click the <Icon icon="pencil" /> **Edit Agent** icon.
  

  <Step title="Add the MCP server">
    In the **Toolbox** section, click **MCP**. Enter the server name and URL, then configure authentication (see [authentication types](#authentication-types)).
  

  <Step title="Save your agent">
    Click **Save changes**. Fleet will discover available tools from your MCP server and make them available in this agent.
  

### Add to all agents in the workspace

To add a remote MCP server to all agents in the workspace:

  <Tab title="From Fleet > Integrations">
    
      <Step title="Navigate to Fleet > Integrations">
        In the LangSmith UI, navigate to the [**Fleet** > **Integrations**](https://smith.langchain.com/agents/tools) tab.
      

      <Step title="Add the server">
        1. Click **+ Custom MCP** at the bottom of the left sidebar.
        2. Add a **Name** for the MCP server.
        3. Add the MCP **URL** (e.g., `https://api.example.com/mcp`)
        4. Select the **Authentication** type. See [Authentication types](#authentication-types) for more details.
      

      <Step title="Save the server">
        Click **Save server**. Fleet will automatically discover available tools from your MCP server and make them available in your agents. The configured headers are applied to both tool discovery requests and tool execution requests.
      
    
  

  <Tab title="From workspace settings">
    
      <Step title="Navigate to MCP server settings">
        In the LangSmith UI, navigate to the [Settings > MCP servers](https://smith.langchain.com/settings/workspaces/mcp-servers) tab.
      

      <Step title="Add the server">
        Click **Add server** and enter the server name and URL, then configure authentication (see [authentication types](#authentication-types)).
      

      <Step title="Save the server">
        Click **Save server**. Fleet will automatically discover available tools from your MCP server and make them available in your agents. The configured headers are applied to both tool discovery requests and tool execution requests.
      
    
  

### Authentication types

Select an authentication type based on the server's requirements:

* **Headers**: Add key-value pairs sent with every request. The most common pattern is using an Authorization bearer token:

  * **Key**: `Authorization`
  * **Value**: `Bearer API_KEY`

  
    You can add multiple headers if your MCP server requires additional authentication or configuration parameters. Each header key-value pair is sent with every request to the server.

## Add a remote MCP server (part 2)

* **OAuth 2.1 (Auto)**: Select this for servers that support OAuth via dynamic client registration. You'll be prompted to log in with your account for that service.

* **OAuth 2.1 (Manual)**: Select this for servers that support OAuth, but require specifying the client ID/secret beforehand. OAuth providers used in this flow must have **PKCE** enabled.

## Update your MCP server URL

Changing the URL of a custom MCP server will break any agents that use tools from that server.

Fleet stores tool references by MCP server URL. If you update the URL of a custom MCP server, existing agents will fail when attempting to call those tools because the stored URL no longer matches.

To update an MCP server URL:

1. Update your MCP server URL in the workspace settings.
2. For each agent using tools from that server:
   * Remove the affected tools from the agent configuration.
   * Re-add the tools (they will now reference the new URL).
3. Test the agent to confirm tools work correctly.

