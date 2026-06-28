# JavaScript — Functions

## Declaration Forms

```js
// Function declaration (hoisted)
function add(a, b) { return a + b; }

// Function expression (not hoisted)
const add = function(a, b) { return a + b; };

// Arrow function (not hoisted, no own `this`, no `arguments`)
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

```js
// Common pitfall — losing `this`
class Timer {
  constructor() {
    this.seconds = 0;
  }
  start() {
    setInterval(function() {
      this.seconds++; // BUG: `this` is global/undefined
    }, 1000);
  }
}
// Fixes:
// 1. Arrow:  setInterval(() => { this.seconds++; }, 1000);
// 2. Bind:   setInterval(function() { this.seconds++; }.bind(this), 1000);
```

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

```js
function* range(start, end) {
  for (let i = start; i < end; i++) {
    yield i;
  }
}

for (const n of range(0, 5)) {
  console.log(n); // 0, 1, 2, 3, 4
}

const gen = range(0, 3);
gen.next(); // { value: 0, done: false }
gen.next(); // { value: 1, done: false }
gen.next(); // { value: 2, done: false }
gen.next(); // { value: undefined, done: true }

// Async generators
async function* asyncGen() {
  for (const url of urls) {
    yield await fetch(url).then(r => r.json());
  }
}

for await (const data of asyncGen()) { }
```

## Higher-Order Functions

```js
// Once — ensure function runs only once
function once(fn) {
  let called = false, result;
  return (...args) => {
    if (!called) { called = true; result = fn(...args); }
    return result;
  };
}

// Memoize
function memoize(fn) {
  const cache = new Map();
  return (arg) => {
    if (cache.has(arg)) return cache.get(arg);
    const result = fn(arg);
    cache.set(arg, result);
    return result;
  };
}

// Debounce (trailing edge)
function debounce(fn, ms) {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => fn(...args), ms);
  };
}

// Throttle (leading edge)
function throttle(fn, ms) {
  let last = 0;
  return (...args) => {
    const now = Date.now();
    if (now - last >= ms) { last = now; fn(...args); }
  };
}
```

## See Also

- [core.md](core.md) — syntax, types
- [async.md](async.md) — async functions, Promises
- [patterns.md](patterns.md) — destructuring, spread, optional chaining
