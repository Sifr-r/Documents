# patch-deployment

## Introduction

> ## Documentation Index
> Fetch the complete documentation index at: https://docs.langchain.com/llms.txt
> Use this file to discover all available pages before exploring further.

# Patch Deployment

> Patch a deployment by ID.

## OpenAPI

````yaml https://api.host.langchain.com/openapi.json patch /v2/deployments/{deployment_id}
openapi: 3.1.0
info:
  title: LangSmith Deployment Control Plane API
  description: >
    The LangSmith Deployment Control Plane API is used to programmatically
    create and manage

    Agent Server deployments. For example, the APIs can be orchestrated to

    create custom CI/CD workflows.

    ## Host

    https://api.host.langchain.com

    ## Authentication

    To authenticate with the LangSmith Deployment Control Plane API, set the
    `X-Api-Key` header

    to a valid [LangSmith API
    key](https://docs.langchain.com/langsmith/create-account-api-key#create-an-api-key).

    ## Versioning

    Each endpoint path is prefixed with a version (e.g. `v1`, `v2`).

    ## Quick Start

    1. Call `POST /v2/deployments` to create a new Deployment. The response body
    contains the Deployment ID (`id`) and the ID of the latest (and first)
    revision (`latest_revision_id`).

    1. Call `GET /v2/deployments/{deployment_id}` to retrieve the Deployment.
    Set `deployment_id` in the URL to the value of Deployment ID (`id`).

    1. Poll for revision `status` until `status` is `DEPLOYED` by calling `GET
    /v2/deployments/{deployment_id}/revisions/{latest_revision_id}`.

## OpenAPI (part 2)

1. Call `PATCH /v2/deployments/{deployment_id}` to update the deployment.
  version: 0.1.0
servers: []
security: []
paths:
  /v2/deployments/{deployment_id}:
    patch:
      tags:
        - Deployments (v2)
      summary: Patch Deployment
      description: Patch a deployment by ID.
      operationId: patch_deployment_v2_deployments__deployment_id__patch
      parameters:
        - name: deployment_id
          in: path
          required: true
          schema:
            type: string
            format: uuid
            title: Deployment ID
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/DeploymentPatchRequest'
      responses:
        '200':
          description: Successful Response
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Deployment'
        '400':
          description: Bad Request
          content:
            application/json:
              example:
                detail: Error description.
        '404':
          description: Not Found
          content:
            application/json:
              example:
                detail: Deployment ID {deployment_id} not found.
        '422':
          description: Validation Error
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/HTTPValidationError'
      security:
        - API Key: []
        - Tenant ID: []
        - Bearer Auth: []
components:
  schemas:
    DeploymentPatchRequest:
      properties:
        revision_source:
          anyOf:
            - type: string
              enum:
                - github
                - internal_docker
                - internal_source
            - type: 'null'
          title: Revision Source
          description: >-
            Override the source for this revision. If omitted, falls back to
            deployment's default source.
        source_config:
          anyOf:
            - $ref: '#/components/schemas/SourceConfigRequest'
            - type: 'null'
        source_revision_config:
          anyOf:
            - $ref: '#/components/schemas/SourceRevisionConfigRequest'
            - type: 'null'
        secrets:
          anyOf:
            - items:
                $ref: '#/components/schemas/Secret'
              type: array
            - type: 'null'
          title: Secrets
        secret_references:
          anyOf:
            - items:
                $ref: '#/components/schemas/SecretReference'
              type: array
            - type: 'null'
          title: Secret References
          description: >-
            List of Kubernetes Secret references.<br><br>Only applicable for
            `external_docker` source.
      type: object
      title: DeploymentPatchRequest
      description: >-
        Request body for patching a deployment.<br>

        <br>

## OpenAPI (part 3)

Patching a deployment may trigger a new revision depending on the
        provided `source` configurations.
    Deployment:
      properties:
        name:
          type: string
          title: Name
          description: >-
            Name of the deployment.<br><br>A LangSmith tracing project with the
            same name will also automatically be created. This cannot be changed
            once the deployment is created.
        source:
          type: string
          enum:
            - github
            - external_docker
            - internal_docker
            - internal_source
            - internal_template
          title: Source
          description: >-
            Deploy from a GitHub repository (`github`), an external Docker image
            (`external_docker`), a CLI-pushed image (`internal_docker`),
            uploaded source (`internal_source`), or a prebuilt LangChain
            template (`internal_template`).<br><br>Deploying from GitHub,
            internal Docker, internal source, or a template is only available
            for Cloud SaaS deployments. Deploying from an external Docker image
            is only available for self-hosted deployments. This cannot be
            changed once the deployment is created.
        source_config:
          $ref: '#/components/schemas/SourceConfig'
        source_revision_config:
          $ref: '#/components/schemas/SourceRevisionConfig'
        secrets:
          items:
            $ref: '#/components/schemas/Secret'
          type: array
          title: Secrets
        secret_references:
          anyOf:
            - items:
                $ref: '#/components/schemas/SecretReference'
              type: array
            - type: 'null'
          title: Secret References
          description: >-
            List of Kubernetes Secret references.<br><br>Only applicable for
            `external_docker` source.
        id:
          type: string
          format: uuid
          title: ID
          description: The ID of the deployment.<br><br>This is a read-only field.
        tenant_id:
          type: string
          format: uuid
          title: Tenant ID
          description: >-
            The ID of the tenant that owns the deployment.<br><br>This is a
            read-only field.
        created_at:
          type: string
          format: date-time
          title: Created At
          description: >-
            The creation time of the deployment.<br><br>This is a read-only
            field.
        updated_at:
          type: string
          format: date-time
          title: Updated At
          description: >-
            The last update time of the deployment.<br><br>This is a read-only
            field.
        status:
          type: string
          enum:
            - AWAITING_DATABASE
            - READY
            - UNUSED
            - AWAITING_DELETE
            - UNKNOWN
          title: Status
          description: The status of the deployment.<br><br>This is a read-only field.
        latest_revision_id:
          anyOf:
            - type: string
              format: uuid
            - type: 'null'
          title: Latest Revision ID
          description: >-
            The ID of the latest revision of the deployment.<br><br>This is a
            read-only field.
        active_revision_id:
          anyOf:
            - type: string
              format: uuid
            - type: 'null'
          title: Active Revision ID
          description: >-
            The ID of the current (actively deployed) revision of the
            deployment.<br><br>This is a read-only field.
        image_version:
          anyOf:
            - type: string
            - type: 'null'
          title: Image Version
          description: Image version of the deployment.
      type: object
      required:
        - name
        - source
        - source_config
        - source_revision_config
        - secrets
        - id
        - tenant_id
        - created_at
        - updated_at
        - status
        - latest_revision_id
        - active_revision_id
      title: Deployment
      description: Deployment resource.
    HTTPValidationError:
      properties:
        detail:
          items:
            $ref: '#/components/schemas/ValidationError'
          type: array
          title: Detail
      type: object
      title: HTTPValidationError
    SourceConfigRequest:
      properties:
        integration_id:
          anyOf:
            - type: string
              format: uuid
            - type: 'null'

## OpenAPI (part 4)

title: Integration ID
          description: >-
            The ID of the integration used for the deployment.<br><br>Retrieve
            this value from the `GET /v1/integrations/github/install` endpoint.
            This cannot be changed (`PATCH`) once the deployment is created.
            Only applicable for `github` source.
        repo_url:
          anyOf:
            - type: string
            - type: 'null'
          title: Repository URL
          description: >-
            The URL of the git repository used for the deployment.<br><br>This
            cannot be changed (`PATCH`) once the deployment is created. Only
            applicable for `github` source.
        deployment_type:
          anyOf:
            - type: string
              enum:
                - dev_free
                - dev
                - prod
            - type: 'null'
          title: Deployment Type
          description: >-
            The type of deployment to create.<br><br>See [Deployment
            Types](https://langchain-ai.github.io/langgraph/concepts/langgraph_control_plane/#deployment-types)
            for more details. This cannot be changed (`PATCH`) once the
            deployment is created. Only applicable for `github` source.
        build_on_push:
          anyOf:
            - type: boolean
            - type: 'null'
          title: Build On Push
          description: >-
            Whether to build a new revision for the deployment on push to the
            `source_revision_config.repo_ref` (e.g. git branch).<br><br>Cannot
            be enabled when `source_revision_config.repo_ref` specifies a tag
            (starts with `refs/tags/`). Tags are immutable and cannot trigger
            automatic builds on push.<br><br>Only applicable for `github`
            source.
        custom_url:
          anyOf:
            - type: string
            - type: 'null'
          title: Custom URL
          description: >-
            The custom URL of the deployment.<br><br>This field can only be set
            for `external_docker` source deployments. However, it will be set
            automatically for `github` source deployments (read only).
        resource_spec:
          anyOf:
            - $ref: '#/components/schemas/ResourceSpec-Input'
            - type: 'null'
        listener_id:
          anyOf:
            - type: string
              format: uuid
            - type: 'null'
          title: Listener ID
          description: >-
            The ID of the listener used for the deployment.<br><br>Retrieve this
            value from the `GET /v2/listeners` endpoint. This cannot be changed
            (`PATCH`) once the deployment is created. Only applicable for
            `external_docker` source.
        listener_config:
          anyOf:
            - $ref: '#/components/schemas/ListenerConfig'
            - type: 'null'
        install_command:
          anyOf:
            - type: string
            - type: 'null'
          title: Install Command
          description: >-
            The custom install command to run for your deployment. This only
            applies to JS deployments. This command will be run from the root of
            your repository - NOT where your langgraph.json file lives (unless
            these are the same place). If not provided, we will autodetect the
            command based on the presence of yarn/npm/etc. files.
        build_command:
          anyOf:
            - type: string
            - type: 'null'
          title: Build Command
          description: >-
            The custom build command to run for your deployment. This only
            applies to JS deployments. This command will be run from where your
            langgraph.json file lives. This is helpful for using shared
            workspaces in your deployments, without having to provide a
            postinstall command or something similar in your package.json.
      type: object
      title: SourceConfigRequest
      description: >-
        Fields for a deployment that are specific to the `source`, but do not
        require a new revision when modified or cannot be modified.<br>

