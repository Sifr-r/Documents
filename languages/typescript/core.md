# TypeScript — Core Syntax & Types

## Type Annotations

```ts
// Primitives
let name: string = "Alice";
let age: number = 30;
let active: boolean = true;
let data: null = null;
let nothing: undefined = undefined;
let id: symbol = Symbol("id");
let big: bigint = 100n;

// Arrays
let nums: number[] = [1, 2, 3];
let strs: Array<string> = ["a", "b"];

// Tuples
let pair: [string, number] = ["age", 30];
// Named tuples (TS 4+)
let user: [name: string, age: number] = ["Alice", 30];

// Object
let obj: { name: string; age?: number } = { name: "Bob" };
// Index signature
let dict: { [key: string]: number } = { a: 1 };

// Function
let fn: (x: number, y: number) => number = (a, b) => a + b;
```

## Type Narrowing

```ts
// typeof narrowing
function print(value: string | number) {
    if (typeof value === "string") {
        console.log(value.toUpperCase()); // string
    } else {
        console.log(value.toFixed(2));    // number
    }
}

// instanceof
if (error instanceof Error) {
    console.log(error.message);
}

// in operator
if ("radius" in shape) {
    console.log(shape.radius); // Circle
}

// Type predicate (user-defined guard)
function isString(val: unknown): val is string {
    return typeof val === "string";
}

// Discriminated union
type Shape = 
    | { kind: "circle"; radius: number }
    | { kind: "rect"; width: number; height: number };

function area(s: Shape): number {
    switch (s.kind) {
        case "circle": return Math.PI * s.radius ** 2;
        case "rect": return s.width * s.height;
    }
}

// never — exhaustiveness check
function assertNever(x: never): never { throw new Error("Unexpected"); }
```

## Enums

```ts
// Numeric (auto-increment)
enum Direction { Up, Down, Left, Right } // 0, 1, 2, 3
enum Status { Active = 1, Inactive = 2 }

// String
enum Color { Red = "RED", Green = "GREEN" }

// const enum (inlined, no runtime object)
const enum Size { S = 1, M = 2, L = 3 }

// Union of literals (often preferred over enums)
type Direction2 = "up" | "down" | "left" | "right";
```

## Type Assertions & Operators

```ts
// Type assertions
const canvas = document.getElementById("canvas") as HTMLCanvasElement;
const canvas2 = <HTMLCanvasElement>document.getElementById("canvas"); // JSX-incompatible

// Non-null assertion (!)
const len = str!.length; // trust me, not null

// Const assertion
const config = { host: "localhost", port: 3000 } as const;
// typeof config = { readonly host: "localhost"; readonly port: 3000 }

// keyof — union of keys
type UserKeys = keyof User; // "name" | "age"

// typeof — capture type from value
const user = { name: "Alice", age: 30 };
type UserType = typeof user;

// Indexed access
type UserName = User["name"]; // string

// satisfies (TS 4.9+) — check type without widening
const palette = {
    red: [255, 0, 0],
    green: "#00ff00"
} satisfies Record<string, string | number[]>;
palette.red[0].toFixed(); // TS knows red is number[]
```

## any, unknown, never, void

```ts
// any — opt out of type checking
let x: any = 5; x.foo(); // no error

// unknown — safe alternative to any
let y: unknown = 5;
if (typeof y === "string") { y.toUpperCase(); } // must narrow first

// never — value that never occurs
function error(msg: string): never { throw new Error(msg); }
function infiniteLoop(): never { while (true) {} }

// void — function returns nothing
function log(msg: string): void { console.log(msg); }
```

## See Also

- [types.md](types.md) — type vs interface, mapped types, utility types
- [generics.md](generics.md) — generic functions, constraints, conditional types
- [decorators.md](decorators.md) — decorators, reflect-metadata