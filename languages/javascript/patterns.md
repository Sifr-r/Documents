# JavaScript — Common Patterns

## Destructuring

```js
// Object
const { name, age: years, address: { city } = {}, ...rest } = user;

// Array
const [first, second, ...rest] = arr;
const [a = 1, b = 2] = [5]; // a=5, b=2 (defaults)
const [, , third] = arr;     // skip elements

// Swap
[a, b] = [b, a];

// Function parameters
function draw({ x = 0, y = 0, color = 'black' } = {}) { }
```

## Optional Chaining (`?.`)

Returns `undefined` if the left side is `null`/`undefined`, instead of throwing.

```js
obj?.prop;       // undefined if obj is null/undefined
obj?.[key];      // computed property
obj.method?.();  // method call — undefined if method doesn't exist
arr?.[0];        // array element

// Common patterns
const city = user?.address?.city ?? 'Unknown';
const first = users?.[0]?.name;

// DO NOT overuse — only when null/undefined is expected
// BAD:  const len = arr?.length;  // arrays are never null in well-typed code
```

## Nullish Coalescing (`??`)

Returns right side only if left is `null` or `undefined` (not other falsy values).

```js
const count = input ?? 0;      // 0 is valid, so use ?? not ||
const name = null ?? "anon";   // "anon"
const num = 0 ?? 42;           // 0 (not 42 — unlike ||)

// Combining with optional chaining
const title = config?.theme?.dark ?? 'system';
```

## Spread & Rest

```js
// Spread — expand iterable
const merged = { ...defaults, ...overrides };
const arr1 = [1, 2];
const arr2 = [3, 4];
const combined = [...arr1, ...arr2]; // [1, 2, 3, 4]
const clone = { ...original };

// Rest — gather remaining
const { a, ...others } = obj;
const [head, ...tail] = arr;
function fn(first, ...rest) { }
```

## Template Literals

```js
const msg = `Hello ${name}, you have ${count} messages`;

// Tagged templates
function sql(strings, ...values) {
  return strings.reduce((acc, str, i) =>
    acc + str + (i < values.length ? escape(values[i]) : ''), '');
}
const query = sql`SELECT * FROM users WHERE id = ${userId}`;

// String.raw — no escape processing
String.raw`C:\Users\name`; // C:\Users\name
```

## Error Handling Patterns

```js
// Try/catch with error cause (ES2022)
try {
  await fetchData();
} catch (err) {
  throw new Error('Failed to fetch', { cause: err });
}

// AggregateError (Promise.any rejection)
try {
  await Promise.any(promises);
} catch (err) {
  for (const e of err.errors) { }
}

// Custom errors
class ValidationError extends Error {
  constructor(message, field) {
    super(message);
    this.name = 'ValidationError';
    this.field = field;
  }
}
```

## Iteration Helpers (ES2025+)

```js
// Iterator helper methods
const result = [1, 2, 3, 4, 5]
  .values()
  .filter(n => n % 2 === 0)
  .map(n => n * 2)
  .take(2)
  .toArray(); // [4, 8]
```

## See Also

- [core.md](core.md) — fundamental syntax
- [functions/README.md](functions/README.md) — higher-order function patterns
- [async/README.md](async/README.md) — async patterns
