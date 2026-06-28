# JavaScript Functions — Fringe Cases

## Losing `this` in Callbacks

When passing a method as a callback, it loses its object binding.

```js
class Timer {
  constructor() {
    this.seconds = 0;
  }
  start() {
    setInterval(function() {
      this.seconds++; // BUG: `this` is global/undefined, not the Timer
    }, 1000);
  }
}
```

**Solution:** Use an arrow function or `.bind()`.
```js
// 1. Arrow function (inherits lexical `this`)
setInterval(() => { this.seconds++; }, 1000);

// 2. Bind
setInterval(function() { this.seconds++; }.bind(this), 1000);
```

## Default Parameter Evaluation Timing

Unlike Python, JavaScript evaluates default parameters at **call time**, not definition time. This means default objects or arrays are safe to use.

```js
// Safe in JS: A new array is created every time the function is called without args
function addToArray(val, arr = []) {
  arr.push(val);
  return arr;
}
```
[See Python's fringe cases for how this differs in Python](../../python/functions/fringe-cases.md)
