# TypeScript — Generics

## Generic Functions

```ts
function identity<T>(value: T): T { return value; }
function first<T>(arr: T[]): T | undefined { return arr[0]; }

// Arrow function generic
const identity = <T>(value: T): T => value;

// Multiple type parameters
function pair<T, U>(a: T, b: U): [T, U] { return [a, b]; }

// Inference
const s = identity("hello"); // T = string (inferred)
const n = identity<number>(42); // explicit
```

## Generic Constraints

```ts
// extends constraint
function getLength<T extends { length: number }>(item: T): number {
    return item.length;
}
getLength("hello"); // OK
getLength([1, 2, 3]); // OK
// getLength(42); // Error

// keyof constraint
function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
    return obj[key];
}

// Default type parameter
function createMap<K, V = string>(): Map<K, V> {
    return new Map();
}
```

## Generic Interfaces & Types

```ts
interface Repository<T> {
    getById(id: string): T;
    getAll(): T[];
    create(item: T): T;
}

// Generic type alias
type Result<T, E = Error> = 
    | { success: true; data: T }
    | { success: false; error: E };

// Generic with default
type Nullable<T> = T | null;
type Container<T = string> = { value: T };
```

## Conditional Types with Generics

```ts
// Conditional type narrowing
type IsArray<T> = T extends any[] ? T : never;

// Extract function return type
type ReturnType<T> = T extends (...args: any[]) => infer R ? R : never;

// Filter union members
type StringKeys<T> = {
    [K in keyof T]: T[K] extends string ? K : never;
}[keyof T];

// Usage: type UserStringKeys = StringKeys<User>; // "name"

// Recursive type
type DeepPartial<T> = {
    [K in keyof T]?: T[K] extends object ? DeepPartial<T[K]> : T[K];
};

// Infer tuple elements
type First<T extends any[]> = T extends [infer F, ...any[]] ? F : never;
type Rest<T extends any[]> = T extends [any, ...infer R] ? R : never;
```

## Variadic Tuple Types (TS 4+)

```ts
// Concat tuples
type Concat<T extends any[], U extends any[]> = [...T, ...U];

// Labeled tuple elements
type Result = [data: string, error?: Error];

// Generic with variadic tuples
type Prepend<T, Arr extends any[]> = [T, ...Arr];
```

## Common Patterns

```ts
// Builder pattern
class Builder<T extends Record<string, unknown> = {}> {
    private data: T = {} as T;
    set<K extends string, V>(key: K, value: V): Builder<T & Record<K, V>> {
        (this.data as any)[key] = value;
        return this as any;
    }
    build(): T { return this.data; }
}

// Fluent API with generic chain
type Chain<T> = {
    map<U>(fn: (x: T) => U): Chain<U>;
    value(): T;
};

// Type-safe event emitter
type EventMap = { click: [x: number, y: number]; keydown: [key: string] };
function on<E extends keyof EventMap>(event: E, handler: (...args: EventMap[E]) => void) {}
```

## See Also

- [types.md](types.md) — mapped types, conditional types, utility types
- [core.md](core.md) — type annotations, narrowing