# list-deployments

## Introduction

> ## Documentation Index
> Fetch the complete documentation index at: https://docs.langchain.com/llms.txt
> Use this file to discover all available pages before exploring further.

# List Deployments

> List all deployments.

## OpenAPI

````yaml https://api.host.langchain.com/openapi.json get /v2/deployments
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
  /v2/deployments:
    get:
      tags:
        - Deployments (v2)
      summary: List Deployments
      description: List all deployments.
      operationId: list_deployments_v2_deployments_get
      parameters:
        - name: limit
          in: query
          required: false
          schema:
            type: integer
            maximum: 100
            minimum: 1
            description: Maximum number of resources to return.
            default: 20
            title: Limit
          description: Maximum number of resources to return.
        - name: offset
          in: query
          required: false
          schema:
            type: integer
            minimum: 0
            description: >-
              Pagination offset. Pass this value to subsequent requests to fetch
              the next page of resources.
            default: 0
            title: Offset
          description: >-
            Pagination offset. Pass this value to subsequent requests to fetch
            the next page of resources.
        - name: name_contains
          in: query
          required: false
          schema:
            anyOf:
              - type: string
              - type: 'null'
            description: Name of the deployment to filter by.
            title: Name Contains
          description: Name of the deployment to filter by.
        - name: status
          in: query
          required: false
          schema:
            anyOf:
              - type: string
              - type: 'null'
            description: '`status` of the deployment to filter by.'
            title: Status
          description: '`status` of the deployment to filter by.'
        - name: remote_reconciled
          in: query
          required: false
          schema:
            anyOf:
              - type: boolean
              - type: 'null'
            description: Flag to filter by remote reconciled deployments.
            title: Remote Reconciled
          description: Flag to filter by remote reconciled deployments.
        - name: tag_value_ids
          in: query
          required: false
          schema:
            anyOf:
              - type: string
              - type: 'null'
            description: >-
              Comma separated list of tag value IDs of the deployment to filter
              by.
            title: Tag Value Ids
          description: >-
            Comma separated list of tag value IDs of the deployment to filter
            by.
        - name: image_version
          in: query
          required: false
          schema:
            anyOf:
              - type: string
              - type: 'null'
            description: Image version to filter by.
            title: Image Version
          description: Image version to filter by.
        - name: deployment_type
          in: query
          required: false
          schema:
            anyOf:
              - type: string
                enum:
                  - dev_free
                  - dev
                  - prod
              - type: 'null'
            description: Deployment type to filter by.
            title: Deployment Type
          description: Deployment type to filter by.
        - name: deployment_ids
          in: query
          required: false
          schema:
            anyOf:
              - type: string
              - type: 'null'
            description: Comma separated list of deployment IDs to filter by.
            title: Deployment Ids
          description: Comma separated list of deployment IDs to filter by.
      responses:
        '200':
          description: Successful Response
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/DeploymentsList'
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
    DeploymentsList:
      properties:
        resources:
          items:
            $ref: '#/components/schemas/Deployment'
          type: array
          title: Resources
        offset:
          type: integer
          title: Offset
          description: >-
            Pagination offset. Pass this value to subsequent requests to fetch

## OpenAPI (part 3)

the next page.
      type: object
      required:
        - resources
        - offset
      title: DeploymentsList
    HTTPValidationError:
      properties:
        detail:
          items:
            $ref: '#/components/schemas/ValidationError'
          type: array
          title: Detail
      type: object
      title: HTTPValidationError
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
    ValidationError:
      properties:
        loc:
          items:
            anyOf:
              - type: string
              - type: integer

## OpenAPI (part 4)

type: array
          title: Location
        msg:
          type: string
          title: Message
        type:
          type: string
          title: Error Type
      type: object
      required:
        - loc
        - msg
        - type
      title: ValidationError
    SourceConfig:
      properties:
        integration_id:
          anyOf:
            - type: string
              format: uuid
            - type: 'null'
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
            - $ref: '#/components/schemas/ResourceSpec-Output'
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
      title: SourceConfig
      description: Source configuration.
    SourceRevisionConfig:
      properties:
        repo_ref:
          anyOf:
            - type: string

## OpenAPI (part 5)

- type: 'null'
          title: Repo Ref
          description: >-
            The git ref of the repository used for the
            deployment.<br><br>Supports:<br>- **Branches**: Specify just the
            branch name (e.g., `main`, `develop`)<br>- **Tags**: Specify the
            full ref path (e.g., `refs/tags/v1.0.0`)<br><br>When using a tag,
            `source_config.build_on_push` must be set to `false` since tags are
            immutable.<br><br>When updating a deployment (`PATCH`), setting this
            field to a non-null value will trigger creation of a new revision.
            Only applicable for `github` source.
        langgraph_config_path:
          anyOf:
            - type: string
            - type: 'null'
          title: LangGraph Configuration Path
          description: >-
            The path to the LangGraph configuration file (`langgraph.json`) used
            for the deployment.<br><br>Required on create for buildable sources
            (`github`, `internal_source`). Must be `null` for all other
            sources.<br><br>When updating a deployment (`PATCH`), setting this
            field to a non-null value will trigger creation of a new revision.
        image_uri:
          anyOf:
            - type: string
            - type: 'null'
          title: Image URI
          description: >-
            The URI of the Docker image used for the deployment.<br><br>When
            updating a deployment (`PATCH`), setting this field to a non-null
            value will trigger creation of a new revision. Applicable for
            `external_docker` source.
        source_tarball_path:
          anyOf:
            - type: string
            - type: 'null'
          title: Source Tarball Path
          description: >-
            The object path of the uploaded source tarball.<br><br>Must be an
            object path obtained from the `POST
            /deployments/{deployment_id}/upload-url` endpoint. Arbitrary paths
            are not accepted.<br><br>When updating a deployment (`PATCH`),
            setting this field to a non-null value will trigger creation of a
            new revision. Only applicable for `internal_source` source.
        repo_commit_sha:
          anyOf:
            - type: string
            - type: 'null'
          title: Repo commit SHA
          description: >-
            The commit SHA of the git repository used for the
            deployment.<br><br>This is a read-only field. Only applicable for
            `github` source.
      type: object
      title: SourceRevisionConfig
      description: >-
        Source revision configuration.<br>

## OpenAPI (part 7)

Secrets are accessible as environment variables in the deployment's
        container. In addition to user-defined secrets, Agent Server supports
        [pre-defined environment
        variables](https://langchain-ai.github.io/langgraph/cloud/reference/env_var/)
        that can be configured to augment the functionality of a deployment.
        When updating a deployment (`PATCH`), setting this field to a non-null
        value will trigger creation of a new revision.
    SecretReference:
      properties:
        name:
          type: string
          title: Name
          description: Name of the environment variable to populate.
        secret_name:
          type: string
          title: Secret Name
          description: >-
            Name of the Kubernetes Secret that already exists in the same
            namespace as the deployment.
        secret_key:
          type: string
          title: Secret Key
          description: >-
            Key within the Kubernetes Secret whose value should be populated to
            the environment variable.
      type: object
      required:
        - name
        - secret_name
        - secret_key
      title: SecretReference
      description: >-
        Reference to an existing Kubernetes Secret to populate an environment
        variable.
    ResourceSpec-Output:
      properties:
        min_scale:
          anyOf:
            - type: integer
            - type: 'null'
          title: Min Scale
          description: The minimum scale (number of replicas) of the deployment.
        max_scale:
          anyOf:
            - type: integer
            - type: 'null'
          title: Max Scale
          description: The maximum scale (number of replicas) of the deployment.
        cpu:
          anyOf:
            - type: number
              maximum: 8
              minimum: 0.1
            - type: 'null'
          title: CPU
          description: >-
            CPU request in cores for a single replica of the deployment.
            Supports fractional values (e.g. 0.5 for 500m). Values are rounded
            to 1 decimal place. If cpu_limit is not set, limit defaults to 2x
            this value.
          examples:
            - 0.1
            - 0.5
            - 1
            - 2
            - 4
        cpu_limit:
          anyOf:
            - type: number
              maximum: 16
              minimum: 0.1
            - type: 'null'
          title: CPU Limit
          description: >-
            CPU limit in cores for a single replica of the deployment. Supports
            fractional values (e.g. 0.5 for 500m). Values are rounded to 1
            decimal place. If not set, defaults to 2x cpu.
          examples:
            - 0.2
            - 1
            - 2
            - 4
            - 8
            - 16
        memory_mb:
          anyOf:
            - type: integer
            - type: 'null'
          title: Memory (MB)
          description: >-
            Memory request (MB) of a single replica of the deployment. If
            memory_limit_mb is not set, limit defaults to 2x this value.
        memory_limit_mb:
          anyOf:
            - type: integer
            - type: 'null'
          title: Memory Limit (MB)
          description: >-
            Memory limit (MB) of a single replica of the deployment. If not set,
            defaults to 2x memory_mb.
        queue_min_scale:
          anyOf:
            - type: integer
            - type: 'null'
          title: Queue Min Scale
          description: >-
            The minimum scale (number of replicas) of the queue deployment. If
            not provided, defaults to the same value as `min_scale`.
        queue_max_scale:
          anyOf:
            - type: integer
            - type: 'null'
          title: Queue Max Scale
          description: >-
            The maximum scale (number of replicas) of the queue deployment. If
            not provided, defaults to the same value as `max_scale`.
        queue_cpu:
          anyOf:
            - type: number
              maximum: 8
              minimum: 0.1
            - type: 'null'
          title: Queue CPU
          description: >-
            CPU request in cores for a single replica of the queue deployment.
            Supports fractional values (e.g. 0.5 for 500m). Values are rounded
            to 1 decimal place. If not provided, defaults to the same value as
            `cpu`. If queue_cpu_limit is not set, limit defaults to 2x this
            value.
          examples:
            - 0.1

## OpenAPI (part 8)

- 0.5
            - 1
            - 2
        queue_cpu_limit:
          anyOf:
            - type: number
              maximum: 16
              minimum: 0.1
            - type: 'null'
          title: Queue CPU Limit
          description: >-
            CPU limit in cores for a single replica of the queue deployment.
            Supports fractional values (e.g. 0.5 for 500m). Values are rounded
            to 1 decimal place. If not set, defaults to 2x queue_cpu.
          examples:
            - 0.2
            - 1
            - 2
            - 4
            - 8
        queue_memory_mb:
          anyOf:
            - type: integer
            - type: 'null'
          title: Queue Memory (MB)
          description: >-
            Memory request (MB) of a single replica of the queue deployment. If
            not provided, defaults to the same value as `memory_mb`. If
            queue_memory_limit_mb is not set, limit defaults to 2x this value.
        queue_memory_limit_mb:
          anyOf:
            - type: integer
            - type: 'null'
          title: Queue Memory Limit (MB)
          description: >-
            Memory limit (MB) of a single replica of the queue deployment. If
            not set, defaults to 2x queue_memory_mb.
        orchestrator_cpu:
          anyOf:
            - type: number
            - type: 'null'
          title: Orchestrator CPU
          description: do not use
        orchestrator_cpu_limit:
          anyOf:
            - type: number
            - type: 'null'
          title: Orchestrator CPU Limit
          description: do not use
        orchestrator_memory_mb:
          anyOf:
            - type: integer
            - type: 'null'
          title: Orchestrator Memory (MB)
          description: do not use
        orchestrator_memory_limit_mb:
          anyOf:
            - type: integer
            - type: 'null'
          title: Orchestrator Memory Limit (MB)
          description: do not use
        orchestrator_min_scale:
          anyOf:
            - type: integer
            - type: 'null'
          title: Orchestrator Min Scale
          description: do not use
        orchestrator_max_scale:
          anyOf:
            - type: integer
            - type: 'null'
          title: Orchestrator Max Scale
          description: do not use
        executor_cpu:
          anyOf:
            - type: number
            - type: 'null'
          title: Executor CPU
          description: do not use
        executor_cpu_limit:
          anyOf:
            - type: number
            - type: 'null'
          title: Executor CPU Limit
          description: do not use
        executor_memory_mb:
          anyOf:
            - type: integer
            - type: 'null'
          title: Executor Memory (MB)
          description: do not use
        executor_memory_limit_mb:
          anyOf:
            - type: integer
            - type: 'null'
          title: Executor Memory Limit (MB)
          description: do not use
        redis_cpu:
          anyOf:
            - type: number
              maximum: 8
              minimum: 0.1
            - type: 'null'
          title: Redis CPU
          description: >-
            CPU request in cores for the Redis deployment. Supports fractional
            values (e.g. 0.5 for 500m). Values are rounded to 1 decimal place.
            If redis_cpu_limit is not set, limit defaults to 2x this value.
          examples:
            - 0.1
            - 0.5
            - 1
            - 2
        redis_cpu_limit:
          anyOf:
            - type: number
              maximum: 16
              minimum: 0.1
            - type: 'null'
          title: Redis CPU Limit
          description: >-
            CPU limit in cores for the Redis deployment. Supports fractional
            values (e.g. 0.5 for 500m). Values are rounded to 1 decimal place.
            If not set, defaults to 2x redis_cpu.
          examples:
            - 0.2
            - 1
            - 2
            - 4
            - 8
        redis_memory_mb:
          anyOf:
            - type: integer
            - type: 'null'
          title: Redis Memory Mb
          description: >-
            Memory request (MB) of the Redis deployment. If
            redis_memory_limit_mb is not set, limit defaults to this value.
        redis_memory_limit_mb:
          anyOf:
            - type: integer
            - type: 'null'
          title: Redis Memory Limit (MB)
          description: >-
            Memory limit (MB) of the Redis deployment. If not set, defaults to

## OpenAPI (part 9)

redis_memory_mb.
        labels:
          anyOf:
            - additionalProperties:
                type: string
              type: object
            - type: 'null'
          title: Labels
          description: Additional labels to apply to resources created for the deployment.
        annotations:
          anyOf:
            - additionalProperties:
                type: string
              type: object
            - type: 'null'
          title: Annotations
          description: >-
            Additional annotations to apply to resources created for the
            deployment.
        service_account_name:
          anyOf:
            - type: string
            - type: 'null'
          title: Service Account Name
          description: >-
            The name of the service account to use for the
            deployment.<br><br>This must already exist in the Kubernetes
            namespace where the deployment will be deployed to.
        image_pull_secrets:
          anyOf:
            - items:
                $ref: '#/components/schemas/LocalObjectReference'
              type: array
            - type: 'null'
          title: Image Pull Secrets
          description: >-
            List of references to secrets in the same namespace to use for
            pulling container images. Each entry is a LocalObjectReference to a
            Secret of type kubernetes.io/dockerconfigjson.
        volumes:
          anyOf:
            - items:
                $ref: '#/components/schemas/Volume'
              type: array
            - type: 'null'
          title: Volumes
          description: >-
            List of volumes that can be mounted by containers belonging to the
            pod. Reference the kubernetes documentation for more details on how
            to configure volumes.
        volume_mounts:
          anyOf:
            - items:
                $ref: '#/components/schemas/VolumeMount'
              type: array
            - type: 'null'
          title: Volume Mounts
          description: >-
            Pod volumes to mount into the container's filesystem. Reference the
            kubernetes documentation for more details on how to configure volume
            mounts.
        init_containers:
          anyOf:
            - items:
                $ref: '#/components/schemas/Container'
              type: array
            - type: 'null'
          title: Init Containers
          description: >-
            List of initialization containers belonging to the pod. Init
            containers are set as initContainers in the pod spec and run to
            completion before the main application container starts.
        sidecars:
          anyOf:
            - items:
                $ref: '#/components/schemas/Container'
              type: array
            - type: 'null'
          title: Sidecars
          description: >-
            List of sidecar containers that run alongside the main application
            container. These will be added to the pod spec as additional
            containers.
        db_cpu:
          anyOf:
            - type: number
            - type: 'null'
          title: Database CPU
          description: >-
            CPU request of the Postgres database deployment. If db_cpu_limit is
            not set, limit defaults to 2x this value.
        db_cpu_limit:
          anyOf:
            - type: number
            - type: 'null'
          title: Database CPU Limit
          description: >-
            CPU limit of the Postgres database deployment. If not set, defaults
            to 2x db_cpu.
        db_memory_mb:
          anyOf:
            - type: integer
            - type: 'null'
          title: Database Memory (MB)
          description: >-
            Memory request (MB) of the Postgres database deployment. If
            db_memory_limit_mb is not set, limit defaults to 2x this value.
        db_memory_limit_mb:
          anyOf:
            - type: integer
            - type: 'null'
          title: Database Memory Limit (MB)
          description: >-
            Memory limit (MB) of the Postgres database deployment. If not set,
            defaults to 2x db_memory_mb.
        db_storage_gi:
          anyOf:
            - type: integer
            - type: 'null'
          title: Database Storage (GiB)
          description: Storage (GiB) of the Postgres database deployment.
        db_max_connections:
          anyOf:
            - type: integer
            - type: 'null'
          title: Database Max Connections

## OpenAPI (part 10)

description: Maximum number of connections allowed to the Postgres database.
      type: object
      title: ResourceSpec
      description: >-
        Resource specification for the deployment.<br>

