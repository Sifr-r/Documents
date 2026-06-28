# V

Simple, fast, safe compiled language with C-like syntax, immutable defaults, and built-in concurrency.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, sum types, structs, generics, concurrency, modules |

## Quick Reference

```v
// Immutable by default
x := 42
mut y := 0
y = 10

// Sum types
type Expr = IntLit | BinOp

// Option types
fn find(key string) ?string {
    return none
}
val := find("k") or { "default" }

// Pipe operator
fn double(x int) int { return x * 2 }
result := 21 |> double()  // 42

// Concurrency
mut ch := chan int{cap: 1}
spawn fn() { ch <- 42 } ()
val := <-ch

// Generics
fn map<T, U>(arr []T, f fn(T) U) []U {
    mut result := []U{}
    for item in arr {
        result << f(item)
    }
    return result
}

// Attributes
@[deprecated: "use new_fn"]
fn old_fn() {}
```
