# JavaScript Functions — Alternatives

## Higher-Order Functions vs Traditional Loops

JavaScript provides powerful array methods that act as higher-order functions (taking functions as arguments).

```js
// Alternative: Using reduce instead of a loop
function sum(...nums) { 
  return nums.reduce((a, b) => a + b, 0); 
}

// Core: Traditional for...of loop
function sumLoop(...nums) {
  let total = 0;
  for (const n of nums) total += n;
  return total;
}
```

Why use `.reduce()`? It's more functional and expressive, though slightly less performant in highly critical tight loops compared to a traditional `for` loop.

## Debounce vs Throttle

When controlling the execution rate of a function (like a scroll event handler):

```js
// Debounce (trailing edge - waits until activity stops)
function debounce(fn, ms) {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => fn(...args), ms);
  };
}

// Throttle (leading edge - fires immediately, then ignores for Ms)
function throttle(fn, ms) {
  let last = 0;
  return (...args) => {
    const now = Date.now();
    if (now - last >= ms) { last = now; fn(...args); }
  };
}
```
