# TypeORM

Object-Relational Mapping (ORM) framework supporting TypeScript and JavaScript for SQL databases.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Core concepts, API reference, and key usage patterns |
| Documentation | [docs/](docs/) | Full documentation set indexed from upstream package |

## Quick Reference

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

## See Also

- [TypeORM Official Documentation](https://neuledge.com)
