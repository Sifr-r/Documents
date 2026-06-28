# JavaScript — Core Syntax & Types

## Primitive Types

| Type | Example | `typeof` |
|---|---|---|
| `string` | `"hello"`, `'world'`, `` `templ` `` | `"string"` |
| `number` | `42`, `3.14`, `NaN`, `Infinity` | `"number"` |
| `bigint` | `9007199254740991n` | `"bigint"` |
| `boolean` | `true`, `false` | `"boolean"` |
| `undefined` | `let x;` | `"undefined"` |
| `null` | `let x = null;` | `"object"` (legacy bug) |
| `symbol` | `Symbol('id')` | `"symbol"` |

```js
typeof null === "object"; // historical bug, not fixable
Number.isNaN(NaN);        // true — use this, not global isNaN()
Number.isFinite(1 / 0);   // false
Object.is(-0, +0);        // false — stricter than ===
Object.is(NaN, NaN);      // true
```

## Variable Declarations

| Keyword | Scope | Hoisted | Reassignable | Redeclarable |
|---|---|---|---|---|
| `var` | Function | Yes (`undefined`) | Yes | Yes |
| `let` | Block `{}` | Yes (TDZ) | Yes | No |
| `const` | Block `{}` | Yes (TDZ) | No | No |

**TDZ (Temporal Dead Zone):** `let`/`const` are hoisted but uninitialized — accessing before declaration throws `ReferenceError`.

```js
console.log(x); // undefined (var hoisted)
var x = 1;

console.log(y); // ReferenceError (TDZ)
let y = 2;
```

## Type Coercion & Equality

| Operator | Coerces? | When to Use |
|---|---|---|
| `==` / `!=` | Yes (Abstract) | Almost never |
| `===` / `!==` | No (Strict) | Always prefer this |

```js
0 == "0";        // true  — coerced
0 === "0";       // false — strict
null == undefined; // true  — special case
null === undefined; // false
```

## Falsy Values

Only 8 values are falsy: `false`, `0`, `-0`, `0n`, `""`, `null`, `undefined`, `NaN`.
Everything else (including `[]`, `{}`, `"0"`, `"false"`) is truthy.

```js
const value = input || "default";     // falsy → default
const value = input ?? "default";     // only null/undefined → default
```

## Control Flow

```js
// for...of (iterables: arrays, strings, Map, Set, generators)
for (const item of iterable) { }

// for...in (enumerable keys — avoid on arrays)
for (const key in obj) { if (Object.hasOwn(obj, key)) { } }

// Switch is strict (===)
switch (x) {
  case 1: break;
  default:
}

// try/catch — error binding is optional since ES2019
try { risky(); } catch { fallback(); }
```

## Objects

```js
// Property shorthand
const name = "Ada";
const obj = { name }; // { name: "Ada" }

// Computed keys
const key = "dynamic";
const obj = { [key]: "value" };

// Methods shorthand
const obj = {
  greet() { return "hi"; }
};

// Object methods
Object.keys(obj);       // own enumerable string keys
Object.values(obj);     // own enumerable values
Object.entries(obj);    // [[key, val], ...]
Object.hasOwn(obj, k);  // safe hasOwnProperty (ES2022)
Object.freeze(obj);     // shallow immutable
```

## Arrays

```js
const arr = [1, 2, 3];

// Mutating
arr.push(4);              // append → length
arr.pop();                // remove last → element
arr.unshift(0);           // prepend → length
arr.shift();              // remove first → element
arr.splice(1, 1, 'x');   // remove/insert at index

// Non-mutating (return new)
const copy = [...arr];
const mapped = arr.map(x => x * 2);
const filtered = arr.filter(x => x > 1);
const found = arr.find(x => x === 2);
const idx = arr.findIndex(x => x === 2);
const has = arr.includes(2);
const reduced = arr.reduce((acc, x) => acc + x, 0);

// Flat (ES2019)
[1, [2, [3]]].flat(2); // [1, 2, 3]
[1, 2, 3].flatMap(x => [x, x * 2]);
```

## Maps & Sets

```js
const map = new Map();
map.set("key", "value");
map.get("key");       // "value"
map.has("key");       // true
map.delete("key");
map.size;

// Iteration
for (const [k, v] of map) { }
[...map.keys()];
[...map.values()];

const set = new Set([1, 2, 2, 3]); // {1, 2, 3}
set.add(4);
set.has(2);
set.delete(2);
set.size;
```

## See Also

- [functions.md](functions.md) — function declarations, arrows, closures
- [async.md](async.md) — Promises, async/await
- [modules.md](modules.md) — ESM and CommonJS
