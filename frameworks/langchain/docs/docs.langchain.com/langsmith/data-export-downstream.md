# data-export-downstream

## Introduction

> ## Documentation Index
> Fetch the complete documentation index at: https://docs.langchain.com/llms.txt
> Use this file to discover all available pages before exploring further.

# Import exported data

> Import LangSmith bulk-exported Parquet data into BigQuery, Snowflake, Redshift, Clickhouse, or DuckDB.

Importing data from S3 and Parquet format is commonly supported by the majority of analytical systems. See below for documentation links:

## Clickhouse

You can directly query data in S3 / Parquet format in Clickhouse. As an example, if using GCS, you can query the data as follows:

```sql theme={"theme":{"light":"catppuccin-latte","dark":"catppuccin-mocha"}}
SELECT count(distinct id) FROM s3('https://storage.googleapis.com/<bucket>/<prefix>/export_id=<export_id>/**',
 'access_key_id', 'access_secret', 'Parquet')
```

See [Clickhouse S3 Integration Documentation](https://clickhouse.com/docs/en/engines/table-engines/integrations/s3) for more information.

