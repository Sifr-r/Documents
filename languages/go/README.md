# Go

Modern Go (1.21+) reference. Covers idiomatic patterns with goroutines, channels,
interfaces, and the standard library.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, slices, maps, error handling |
| [concurrency.md](concurrency.md) | Goroutines, channels, select, sync primitives |
| [interfaces.md](interfaces.md) | Interface definitions, type assertions, generics |
| [patterns.md](patterns.md) | Functional options, context, middlewares, table tests |

## Quick Reference

```go
// Variables
var x int = 42
y := 42          // short declaration

// Error handling
if val, err := doThing(); err != nil {
    return fmt.Errorf("failed: %w", err)
}

// Goroutine
go func() {
    // concurrent work
}()

// Channel
ch := make(chan string, 10)  // buffered
ch <- "hello"
msg := <-ch

// Select
select {
case msg := <-ch:
    handle(msg)
case <-time.After(5 * time.Second):
    log.Println("timeout")
}

// Interface
type Reader interface {
    Read(p []byte) (n int, err error)
}

// Generics (1.18+)
func Map[T any, U any](slice []T, fn func(T) U) []U {
    result := make([]U, len(slice))
    for i, v := range slice {
        result[i] = fn(v)
    }
    return result
}
```
