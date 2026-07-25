# TypeORM — Core Guide

## Overview

Object-Relational Mapping (ORM) framework supporting TypeScript and JavaScript for SQL databases.

## Key Patterns & Usage

### Entity Definition (`User.ts`)
```typescript
import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class User {
    @PrimaryGeneratedColumn()
    id!: number;

    @Column()
    name!: string;
}
```

## Index of Available Documentation Files

All detailed guide files can be found under the [`docs/`](docs/) directory:

- [`docs/README.md`](docs/docs/README.md)
- [`docs/blog/2024-10-01-future-of-typeorm/index.md`](docs/docs/blog/2024-10-01-future-of-typeorm/index.md)
- [`docs/docs/data-source/1-data-source.md`](docs/docs/docs/data-source/1-data-source.md)
- [`docs/docs/data-source/2-data-source-options.md`](docs/docs/docs/data-source/2-data-source-options.md)
- [`docs/docs/data-source/3-multiple-data-sources.md`](docs/docs/docs/data-source/3-multiple-data-sources.md)
- [`docs/docs/data-source/4-data-source-api.md`](docs/docs/docs/data-source/4-data-source-api.md)
- [`docs/docs/data-source/5-null-and-undefined-handling.md`](docs/docs/docs/data-source/5-null-and-undefined-handling.md)
- [`docs/docs/drivers/google-spanner.md`](docs/docs/docs/drivers/google-spanner.md)
- [`docs/docs/drivers/microsoft-sqlserver.md`](docs/docs/docs/drivers/microsoft-sqlserver.md)
- [`docs/docs/drivers/mongodb.md`](docs/docs/docs/drivers/mongodb.md)
- [`docs/docs/drivers/mysql.md`](docs/docs/docs/drivers/mysql.md)
- [`docs/docs/drivers/oracle.md`](docs/docs/docs/drivers/oracle.md)
- [`docs/docs/drivers/postgres.md`](docs/docs/docs/drivers/postgres.md)
- [`docs/docs/drivers/sap.md`](docs/docs/docs/drivers/sap.md)
- [`docs/docs/drivers/sqlite.md`](docs/docs/docs/drivers/sqlite.md)
- [`docs/docs/entity/1-entities.md`](docs/docs/docs/entity/1-entities.md)
- [`docs/docs/entity/2-embedded-entities.md`](docs/docs/docs/entity/2-embedded-entities.md)
- [`docs/docs/entity/3-entity-inheritance.md`](docs/docs/docs/entity/3-entity-inheritance.md)
- [`docs/docs/entity/4-tree-entities.md`](docs/docs/docs/entity/4-tree-entities.md)
- [`docs/docs/entity/5-view-entities.md`](docs/docs/docs/entity/5-view-entities.md)
- ... and 57 more files under `docs/`
