# aws-self-hosted

## Introduction

> ## Documentation Index
> Fetch the complete documentation index at: https://docs.langchain.com/llms.txt
> Use this file to discover all available pages before exploring further.

# Self-hosted LangSmith on AWS

When running LangSmith on [Amazon Web Services (AWS)](https://aws.amazon.com/), [self-hosted](/langsmith/self-hosted) mode deploys a complete LangSmith platform with observability functionality.

This page provides:

* [Initial setup steps](#initial-setup) for deploying to EKS, configuring managed services, and setting up authentication.
* [AWS-specific architecture patterns](#reference-architecture) and reference diagrams.
* [Service recommendations](#compute-options) and best practices.
* [AWS Well-Architected best practices](#aws-well-architected-best-practices) for operational excellence, security, and reliability.

  LangChain provides Terraform modules specifically for AWS to help provision infrastructure for LangSmith. These modules can quickly set up EKS clusters, RDS, ElastiCache, S3, and networking resources.

  View the [AWS Terraform modules](https://github.com/langchain-ai/terraform/tree/main/modules/aws) for documentation and examples.

## Initial setup

<Step title="Deploy to Kubernetes">
    Follow the [Kubernetes installation guide](/langsmith/kubernetes). LangSmith is tested on Amazon Elastic Kubernetes Service (EKS).

    **EKS-specific notes:**

    * Ensure the EBS CSI Driver is installed for persistent storage
    * Use the `ebs.csi.aws.com` storage class provisioner
  

  <Step title="Configure external services">
    For production deployments, connect to AWS managed services:

    <CardGroup cols={2}>
      <Card title="Amazon S3" icon="database" href="/langsmith/self-host-blob-storage#amazon-s3">
        Store trace data in S3
      

      <Card title="Amazon RDS" icon="database" href="/langsmith/self-host-external-postgres#amazon-rds">
        PostgreSQL database
      

      <Card title="Amazon ElastiCache" icon="cpu" href="/langsmith/self-host-external-redis#amazon-elasticache">
        Redis or Valkey for caching
      

      <Card title="ClickHouse Cloud" icon="chart-line" href="/langsmith/self-host-external-clickhouse">
        Analytics database
      
    
  

  <Step title="Set up authentication">
    Use [IAM Roles for Service Accounts (IRSA)](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html) to authenticate LangSmith pods to AWS services without static credentials.

    **Key pages:**

    * [S3 IRSA configuration](/langsmith/self-host-blob-storage#amazon-s3)
    * [RDS IAM authentication](/langsmith/self-host-external-postgres#iam-authentication)
    * [ElastiCache IAM authentication](/langsmith/self-host-external-redis#iam-authentication)
  

After completing these initial setup steps, you can review the complete AWS architecture and best practices below.

## Reference architecture

We recommend leveraging AWS's managed services to provide a scalable, secure, and resilient platform. The following architecture applies to both self-hosted and hybrid and aligns with the [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/):

<img src="https://mintcdn.com/langchain-5e9cc07a/MMsbRrh5gYIlD_3t/langsmith/images/aws-architecture-self-hosted.png?fit=max&auto=format&n=MMsbRrh5gYIlD_3t&q=85&s=c2ae668eb790588e05a86aaca8e8fc76" alt="Architecture diagram showing AWS relations to LangSmith services" width="2198" height="1498" data-path="langsmith/images/aws-architecture-self-hosted.png" />

* <Icon icon="globe" /> **Ingress & networking**: Requests enter via [Amazon Application Load Balancer (ALB)](https://aws.amazon.com/elasticloadbalancing/application-load-balancer/) within your [VPC](https://aws.amazon.com/vpc/), secured using [AWS WAF](https://aws.amazon.com/waf/) and [IAM](https://aws.amazon.com/iam/)-based authentication.

* <Icon icon="cube" /> **Frontend & backend services:** Containers run on [Amazon EKS](https://aws.amazon.com/eks/), orchestrated behind the ALB. routes requests to other services within the cluster as necessary.

* <Icon icon="database" /> **Storage & databases:**
  * [Amazon RDS for PostgreSQL](https://aws.amazon.com/rds/postgresql/) or [Aurora](https://aws.amazon.com/rds/aurora/): metadata, projects, users, and short-term and long-term memory for deployed agents. LangSmith supports PostgreSQL version 14 or higher.
  * [Amazon ElastiCache](https://aws.amazon.com/elasticache/) (Redis or Valkey): caching and job queues. ElastiCache can be in single-instance or cluster mode. LangSmith requires Redis OSS version 5 or higher, or Valkey 8.
  * ClickHouse + [Amazon EBS](https://aws.amazon.com/ebs/): analytics and trace storage.
    * We recommend using an [externally managed ClickHouse solution](/langsmith/self-host-external-clickhouse) unless security or compliance reasons
      prevent you from doing so.
    * ClickHouse is not required for hybrid deployments.
  * [Amazon S3](https://aws.amazon.com/s3/): object storage for trace artifacts and telemetry.

* <Icon icon="sparkles" /> **LLM integration:** Optionally proxy requests to [Amazon Bedrock](https://aws.amazon.com/bedrock/) or [Amazon SageMaker](https://aws.amazon.com/sagemaker/) for LLM inference.

* <Icon icon="chart-line" /> **Monitoring & observability:** Integrate with [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)

## Compute options

LangSmith supports multiple compute options depending on your requirements:

| Compute option                             | Description                               | Suitable for                         |
| ------------------------------------------ | ----------------------------------------- | ------------------------------------ |
| **Elastic Kubernetes Service (preferred)** | Advanced scaling and multi-tenant support | Large enterprises                    |
| **EC2-based**                              | Full control, BYO-infra                   | Regulated or air-gapped environments |

## Security and compliance

LangSmith can be configured for:

* [PrivateLink](https://aws.amazon.com/privatelink/)-only access (no public internet exposure, besides egress necessary for billing).
* [KMS](https://aws.amazon.com/kms/)-based encryption keys for S3, RDS, and EBS.
* Audit logging to [CloudWatch](https://aws.amazon.com/cloudwatch/) and [AWS CloudTrail](https://aws.amazon.com/cloudtrail/).

Customers can deploy in [GovCloud](https://aws.amazon.com/govcloud-us/), ISO, or HIPAA regions as needed.

