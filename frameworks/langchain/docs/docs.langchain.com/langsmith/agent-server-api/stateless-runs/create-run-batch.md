# create-run-batch

## Introduction

> ## Documentation Index
> Fetch the complete documentation index at: https://docs.langchain.com/llms.txt
> Use this file to discover all available pages before exploring further.

# Create Run Batch

> Create a batch of runs and return immediately.

## OpenAPI

````yaml /langsmith/agent-server-openapi.json post /runs/batch
openapi: 3.1.0
info:
  title: LangSmith Deployment
  version: 0.1.0
servers: []
security: []
tags:
  - name: Assistants
    description: An assistant is a configured instance of a graph.
  - name: Threads
    description: A thread contains the accumulated outputs of a group of runs.
  - name: Thread Runs
    description: >-
      A run is an invocation of a graph / assistant on a thread. It updates the
      state of the thread.
  - name: Stateless Runs
    description: >-
      A run is an invocation of a graph / assistant, with no state or memory
      persistence.
  - name: Crons
    description: >-
      A cron is a periodic run that recurs on a given schedule. The repeats can
      be isolated, or share state in a thread
  - name: Store
    description: >-
      Store is an API for managing persistent key-value store (long-term memory)
      that is available from any thread.
  - name: A2A
    description: >-
      Agent-to-Agent Protocol related endpoints for exposing assistants as
      A2A-compliant agents.
  - name: MCP
    description: >-
      Model Context Protocol related endpoints for exposing an agent as an MCP
      server.
  - name: System
    description: System endpoints for health checks, metrics, and server information.
  - name: Streaming
    description: >-
      Thread-centric streaming endpoints. Provides a structured command/event
      surface over SSE+HTTP; WebSocket is also supported at
      `/threads/{thread_id}/stream/events` (not documented here — OpenAPI 3.1
      does not describe WebSocket).
paths:
  /runs/batch:
    post:
      tags:
        - Stateless Runs
      summary: Create Run Batch
      description: Create a batch of runs and return immediately.
      operationId: run_batch_stateless_runs_post
      requestBody:
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/RunBatchCreate'
        required: true
      responses:
        '200':
          description: Success
          content:
            application/json:
              schema: {}
        '404':
          description: Not Found
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        '409':
          description: Conflict
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
        '422':
          description: Validation Error
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorResponse'
components:
  schemas:
    RunBatchCreate:
      type: array
      items:
        $ref: '#/components/schemas/RunCreateStateless'
      minItems: 1
      title: RunBatchCreate
      description: Payload for creating a batch of runs.
    ErrorResponse:
      type: object
      required:
        - detail
      properties:
        detail:
          type: string
          description: Human-readable error message
      title: ErrorResponse
      description: Error response returned from the server
    RunCreateStateless:
      properties:
        assistant_id:
          anyOf:
            - type: string
              format: uuid
              title: Assistant Id
            - type: string
              title: Graph Id
          description: >-
            The assistant ID or graph name to run. If using graph name, will
            default to first assistant created from that graph.
        input:
          anyOf:
            - type: object
            - type: array
            - type: string
            - type: number
            - type: boolean
            - type: 'null'
          title: Input
          description: The input to the graph.
        command:
          anyOf:
            - $ref: '#/components/schemas/Command'
            - type: 'null'
          title: Input
          description: The input to the graph.
        metadata:
          type: object
          title: Metadata
          description: Metadata to assign to the run.
        config:
          properties:
            tags:
              items:
                type: string
              type: array
              title: Tags
            recursion_limit:
              type: integer
              title: Recursion Limit
            configurable:
              type: object
              title: Configurable
          type: object
          title: Config
          description: The configuration for the assistant.

## OpenAPI (part 2)

context:
          type: object
          title: Context
          description: Static context added to the assistant.
        webhook:
          type: string
          maxLength: 65536
          minLength: 1
          format: uri-reference
          title: Webhook
          description: Webhook to call after LangGraph API call is done.
        stream_mode:
          anyOf:
            - items:
                type: string
                enum:
                  - values
                  - messages
                  - messages-tuple
                  - tasks
                  - checkpoints
                  - updates
                  - events
                  - debug
                  - custom
              type: array
            - type: string
              enum:
                - values
                - messages
                - messages-tuple
                - tasks
                - checkpoints
                - updates
                - events
                - debug
                - custom
          title: Stream Mode
          description: The stream mode(s) to use.
          default:
            - values
        feedback_keys:
          items:
            type: string
          type: array
          title: Feedback Keys
          description: >-
            Generate pre-signed URLs for assigning feedback keys to the run.

