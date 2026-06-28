# TypeScript — Types & Interfaces

## type vs interface

| Feature | `type` | `interface` |
|---|---|---|
| Object shapes | ✓ | ✓ |
| Unions / Intersections | ✓ | ✗ |
| Primitives / Tuples | ✓ | ✗ |
| Declaration merging | ✗ | ✓ |
| extends / implements | ✓ (via `&`) | ✓ (via `extends`) |

```ts
// Use type for: unions, primitives, tuples, mapped types
type ID = string | number;
type Point = [number, number];
type StringMap = Record<string, string>;

// Use interface for: object shapes (especially public APIs)
interface User { name: string; age: number }
```

## Union & Intersection

```ts
// Union (|) — either type
type Status = "active" | "inactive" | "pending";
type Result = Success | Error;

// Discriminated union
type ApiResult = 
    | { status: "ok"; data: User }
    | { status: "error"; message: string };

// Intersection (&) — both types
type Admin = User & { permissions: string[] };
type Named = { name: string };
type Aged = { age: number };
type Person = Named & Aged; // { name: string; age: number }
```

## Mapped Types

```ts
// Make all properties optional
type Partial<T> = { [K in keyof T]?: T[K] };

// Make all properties readonly
type Readonly<T> = { readonly [K in keyof T]: T[K] };

// Pick specific keys
type Pick<T, K extends keyof T> = { [P in K]: T[P] };

// Remap keys
type Getters<T> = { [K in keyof T as `get${Capitalize<string & K>}`]: () => T[K] };

// Conditional in mapped types
type Nullable<T> = { [K in keyof T]: T[K] | null };

// Remove modifiers
type Mutable<T> = { -readonly [K in keyof T]: T[K] };
type Required<T> = { [K in keyof T]-?: T[K] };
```

## Conditional Types

```ts
// Basic conditional
type IsString<T> = T extends string ? true : false;

// Distributive conditional (T is a union)
type ToArray<T> = T extends unknown ? T[] : never;
// ToArray<string | number> = string[] | number[]

// infer — extract type from another type
type Unwrap<T> = T extends Promise<infer U> ? U : T;
type Return<T> = T extends (...args: any[]) => infer R ? R : never;

// Recursive conditional
type DeepReadonly<T> = {
    readonly [K in keyof T]: T[K] extends object ? DeepReadonly<T[K]> : T[K];
};
```

## Template Literal Types

```ts
type EventName = `on${Capitalize<string>}`; // "onClick" | "onChange" | ...
type CSSProp = `--${string}`;
type Locale = `${string}-${string}`; // "en-US", "zh-CN"

// Combining with mapped types
type PropEvent<T> = {
    [K in keyof T & string as `on${Capitalize<K>}Change`]: (val: T[K]) => void;
};
```

## Utility Types Reference

```ts
Partial<T>          // all properties optional
Required<T>         // all properties required
Readonly<T>         // all properties readonly
Pick<T, K>          // subset of keys
Omit<T, K>          // all keys except K
Record<K, V>        // object with keys K and values V
Exclude<T, U>       // T members not in U
Extract<T, U>       // T members in U
NonNullable<T>      // exclude null and undefined
ReturnType<T>       // return type of function
Parameters<T>       // tuple of parameter types
Awaited<T>          // unwrap Promise (TS 4.5+)
InstanceType<T>     // instance type of constructor
```

## See Also

- [core.md](core.md) — type annotations, narrowing, assertions
- [generics.md](generics.md) — generic functions, constraints
- [decorators.md](decorators.md) — decorators, reflect-metadata