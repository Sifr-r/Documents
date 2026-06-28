# generate-api-key

## Introduction

> ## Documentation Index
> Fetch the complete documentation index at: https://docs.langchain.com/llms.txt
> Use this file to discover all available pages before exploring further.

# Generate Api Key

> Generate an api key for the user

## OpenAPI

````yaml /langsmith/langsmith-platform-openapi.json post /api/v1/api-key
openapi: 3.1.0
info:
  title: LangSmith
  description: >+
    The LangSmith API is used to programmatically create and manage LangSmith
    resources.

    ## Host

    https://api.smith.langchain.com

    ## Authentication

    To authenticate with the LangSmith API, set the `X-Api-Key` header

    to a valid [LangSmith API
    key](https://docs.langchain.com/langsmith/create-account-api-key#create-an-api-key).

## OpenAPI (part 2)

version: 0.1.0
servers:
  - url: /
security: []
tags:
  - name: run
    x-group: Tracing
  - name: runs
    x-group: Tracing
  - name: sessions
    x-group: Tracing
  - name: tracer-sessions
    x-group: Tracing
  - name: datasets
    x-group: Datasets
  - name: examples
    x-group: Datasets
  - name: evaluators
    x-group: Evaluation
  - name: experiment-view-overrides
    x-group: Evaluation
  - name: experiments
    x-group: Evaluation
  - name: annotation-queues
    x-group: Feedback & Annotation
  - name: annotation_queues
    x-group: Feedback & Annotation
  - name: feedback
    x-group: Feedback & Annotation
  - name: feedback-configs
    x-group: Feedback & Annotation
  - name: alert_rules
    x-group: Monitoring
  - name: bulk-exports
    x-group: Monitoring
  - name: charts
    x-group: Monitoring
  - name: commits
    x-group: Prompts & Playground
  - name: directories
    x-group: Prompts & Playground
  - name: hub_environments
    x-group: Prompts & Playground
  - name: playground-settings
    x-group: Prompts & Playground
  - name: prompt-webhooks
    x-group: Prompts & Playground
  - name: prompts
    x-group: Prompts & Playground
  - name: tag-transitions
    x-group: Prompts & Playground
  - name: comments
    x-group: Prompt Hub
  - name: likes
    x-group: Prompt Hub
  - name: optimization-jobs
    x-group: Prompt Hub
  - name: ownerships
    x-group: Prompt Hub
  - name: repos
    x-group: Prompt Hub
  - name: settings
    x-group: Prompt Hub
  - name: tags
    x-group: Prompt Hub
  - name: integrations
    x-group: Integrations & Tools
  - name: mcp
    x-group: Integrations & Tools
  - name: mcp_vendors
    x-group: Integrations & Tools
  - name: oauth
    x-group: Integrations & Tools
  - name: tools
    x-group: Integrations & Tools
  - name: gateway-policies
    x-group: LLM Gateway
  - name: sandboxes
    x-group: Sandboxes
  - name: issues
    x-group: Issues
  - name: issues-agent
    x-group: Issues
  - name: Organizations
    x-group: Administration
  - name: SCIM Tokens
    x-group: Administration
  - name: TTL Settings
    x-group: Administration
  - name: access_policies
    x-group: Administration
  - name: api-key
    x-group: Administration
  - name: audit-logs
    x-group: Administration
  - name: auth
    x-group: Administration
  - name: aws_marketplace
    x-group: Administration
  - name: data_planes
    x-group: Administration
  - name: me
    x-group: Administration
  - name: orgs
    x-group: Administration
  - name: service-accounts
    x-group: Administration
  - name: tenant
    x-group: Administration
  - name: ttl-settings
    x-group: Administration
  - name: usage-limits
    x-group: Administration
  - name: workspaces
    x-group: Administration
  - name: ace
    x-group: System
  - name: backfills
    x-group: System
  - name: features
    x-group: System
  - name: info
    x-group: System
  - name: model-price-map
    x-group: System
  - name: public
    x-group: System
  - name: agents
    x-hidden: true
  - name: beacon
    x-hidden: true
  - name: engine-trial
  - name: fleet
  - name: fleet auth
    x-hidden: true
  - name: fleet credentials
    x-hidden: true
  - name: fleet github-app
    x-hidden: true
  - name: fleet integrations
    x-hidden: true
  - name: fleet mcp
    x-hidden: true
  - name: fleet threads
    x-hidden: true
  - name: fleet trigger-templates
    x-hidden: true
  - name: fleet triggers
    x-hidden: true
  - name: fleet usage
    x-hidden: true
  - name: fleet_webhooks
    x-hidden: true
  - name: health
  - name: internal
    x-hidden: true
  - name: metrics
    x-hidden: true
  - name: nps
    x-hidden: true
  - name: sandboxes-internal
    x-hidden: true
  - name: skills
    x-hidden: true
paths:
  /api/v1/api-key:
    post:
      tags:
        - api-key
      summary: Generate Api Key
      description: Generate an api key for the user
      operationId: generate_api_key_api_v1_api_key_post
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/APIKeyCreateRequest'
              default:
                description: Default API key
                read_only: false
      responses:
        '200':
          description: Successful Response
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/APIKeyCreateResponse'
        '422':
          description: Validation Error
          content:
            application/json:
              schema:

## OpenAPI (part 3)

$ref: '#/components/schemas/HTTPValidationError'
      security:
        - API Key: []
        - Tenant ID: []
        - Bearer Auth: []
components:
  schemas:
    APIKeyCreateRequest:
      properties:
        description:
          type: string
          title: Description
          default: Default API key
        read_only:
          type: boolean
          title: Read Only
          default: false
          deprecated: true
        expires_at:
          anyOf:
            - type: string
              format: date-time
            - type: 'null'
          title: Expires At
        workspaces:
          anyOf:
            - items:
                type: string
                format: uuid
              type: array
            - type: 'null'
          title: Workspaces
        role_id:
          anyOf:
            - type: string
              format: uuid
            - type: 'null'
          title: Role Id
        org_role_id:
          anyOf:
            - type: string
              format: uuid
            - type: 'null'
          title: Org Role Id
        default_workspace_id:
          anyOf:
            - type: string
              format: uuid
            - type: 'null'
          title: Default Workspace Id
      type: object
      title: APIKeyCreateRequest
      description: >-
        API key POST schema.

