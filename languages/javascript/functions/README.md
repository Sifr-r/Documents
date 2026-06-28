# JavaScript — Functions

## Declaration Forms

```js
// Function declaration (hoisted)
function add(a, b) { return a + b; }

// Function expression (not hoisted)
const add = function(a, b) { return a + b; };

// Arrow function (not hoisted, no own `this`, no `arguments`)
// See fringe-cases.md for `this` binding issues
const add = (a, b) => a + b;
const identity = x => x;                // single param, no parens needed
const returnObj = () => ({ key: 1 });   // wrap object in parens
```

## Parameters

```js
// Default values
function greet(name = "World") { return `Hello ${name}`; }

// Rest parameter (gathers remaining args into array)
function sum(...nums) { return nums.reduce((a, b) => a + b, 0); }
sum(1, 2, 3); // 6

// Destructuring parameters
function process({ name, age = 0 }) { return `${name}: ${age}`; }
process({ name: "Ada" }); // "Ada: 0"
```

## `this` Binding

| Call Style | `this` Value |
|---|---|
| `obj.method()` | `obj` |
| `fn()` (non-strict) | `window` / `globalThis` |
| `fn()` (strict) | `undefined` |
| `fn.call(ctx)`, `fn.apply(ctx)` | `ctx` |
| `fn.bind(ctx)()` | `ctx` |
| `new fn()` | New instance |
| Arrow `() => {}` | Lexical (enclosing scope's `this`) |
| DOM event handler | The element |

[See fringe-cases.md for common pitfalls regarding `this`](fringe-cases.md)

## Closures

A function retains access to its lexical scope even when executed outside it.

```js
function createCounter(start = 0) {
  let count = start;
  return {
    increment: () => ++count,
    decrement: () => --count,
    get: () => count,
  };
}

const c = createCounter(5);
c.increment(); // 6
c.get();       // 6
```

Common use cases: data privacy (no `private` needed), factory functions, partial application, module pattern.

## Generators

[Generators often interact with async workflows. See async/README.md](../async/README.md)

```js
function* range(start, end) {
  for (let i = start; i < end; i++) {
    yield i;
  }
}

for (const n of range(0, 5)) {
  console.log(n); // 0, 1, 2, 3, 4
}
```

## Related

- [fringe-cases.md](fringe-cases.md) — Arrow functions `this` binding, closure stale state
- [alternatives.md](alternatives.md) — Higher-order functions vs loops
- [cross-reference.md](cross-reference.md) — JS vs Python Functions

## See Also
- [../core.md](../core.md) — syntax, types
- [../patterns.md](../patterns.md) — destructuring, spread, optional chaining
