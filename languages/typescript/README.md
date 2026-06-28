# TypeScript

TypeScript (5.x) reference. Covers the type system, generics, decorators, and TS-specific patterns. Assumes JavaScript knowledge (see `languages/javascript/`).

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Type annotations, narrowing, enums, assertions |
| [types.md](types.md) | Type vs interface, unions, mapped types, utility types |
| [generics.md](generics.md) | Generic functions, constraints, conditional types |
| [decorators.md](decorators.md) | Decorators, reflect-metadata, common patterns |

## Quick Reference

```ts
// Type vs Interface
type Point = { x: number; y: number };
interface User { name: string; age: number }

// Generic
function first<T>(arr: T[]): T | undefined { return arr[0]; }

// Const assertion
const colors = ["red", "green"] as const;

// Satisfies
const config = { host: "localhost" } satisfies Record<string, string>;

// Utility types
type PartialUser = Partial<User>;
type UserName = Pick<User, "name">;
type WithoutAge = Omit<User, "age">;
type Lookup = Record<string, User>;

// Template literal types
type EventName = `on${Capitalize<string>}`;
```