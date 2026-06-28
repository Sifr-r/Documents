# Go — Core Syntax & Types

## Basic Types

| Type | Size | Description |
|---|---|---|
| `bool` | 1 byte | `true` / `false` |
| `int`, `int8`, `int16`, `int32`, `int64` | varies | Signed integers |
| `uint`, `uint8` (`byte`), `uint16`, `uint32`, `uint64` | varies | Unsigned |
| `float32`, `float64` | 4 / 8 bytes | IEEE 754 |
| `complex64`, `complex128` | 8 / 16 bytes | Complex numbers |
| `string` | — | UTF-8, immutable |
| `rune` | 4 bytes | Unicode code point (alias for `int32`) |

```go
var (
    a int = 42
    b     = 3.14   // float64 inferred
    c     = "hello" // string inferred
)

// Short declaration (only inside functions)
x := 42
name := "Ada"
```

## Slices

A slice is a view into an underlying array. It has length and capacity.

```go
// Creation
s := make([]int, 5)       // length 5, cap 5, zeroed
s := make([]int, 0, 10)   // length 0, cap 10
s := []int{1, 2, 3}       // literal

// Append
s = append(s, 4, 5)
s = append(s, other...)

// Slice operations
s[1:3]   // elements 1, 2
s[:3]    // first 3
s[1:]    // from index 1
len(s)   // length
cap(s)   // capacity

// Copy
dst := make([]int, len(src))
copy(dst, src)

// Clear (1.21+)
clear(s) // zeroes all elements, length unchanged
```

## Maps

```go
// Creation
m := make(map[string]int)
m := map[string]int{"a": 1, "b": 2}

// Operations
m["key"] = 42
delete(m, "key")

// Comma-ok pattern
val, ok := m["key"]
if !ok {
    // key not present
}

// Iteration (order is random!)
for key, value := range m {
    fmt.Println(key, value)
}
```

## Structs

```go
type User struct {
    Name  string
    Age   int
    Email string
}

// Literal
u := User{Name: "Ada", Age: 30}
u := User{"Ada", 30, ""} // positional (fragile)

// Embedded (composition, not inheritance)
type Admin struct {
    User       // embedded — Admin has User fields directly
    Permissions []string
}

admin := Admin{User: User{Name: "Admin"}, Permissions: []string{"read"}}
fmt.Println(admin.Name) // promoted field
```

## Error Handling

Go uses explicit error returns. No exceptions.

```go
// Return error as last value
func readFile(path string) ([]byte, error) {
    data, err := os.ReadFile(path)
    if err != nil {
        return nil, fmt.Errorf("reading %s: %w", path, err)
    }
    return data, nil
}

// Error wrapping (1.13+)
if errors.Is(err, os.ErrNotExist) {
    // handle not found
}
var pathErr *os.PathError
if errors.As(err, &pathErr) {
    // handle path error
}

// Custom error
type ValidationError struct {
    Field string
    Value any
}
func (e *ValidationError) Error() string {
    return fmt.Sprintf("invalid %s: %v", e.Field, e.Value)
}
```

## Control Flow

```go
// if with short statement
if val, err := doWork(); err != nil {
    return err
} else {
    use(val)
}

// switch (no fallthrough by default)
switch day {
case "Mon", "Tue", "Wed", "Thu", "Fri":
    fmt.Println("weekday")
case "Sat", "Sun":
    fmt.Println("weekend")
default:
    fmt.Println("unknown")
}

// switch without expression (clean if/else chains)
switch {
case hour < 12:
    fmt.Println("morning")
case hour < 18:
    fmt.Println("afternoon")
default:
    fmt.Println("evening")
}

// for is the only loop
for i := 0; i < 10; i++ { }
for condition { }  // while
for { }            // infinite

// range
for i, v := range slice { }  // index, value
for k, v := range m { }      // key, value
for _, v := range slice { }  // value only (blank identifier)
```

## Defer

Defers run in LIFO order when the function returns.

```go
func process(path string) error {
    f, err := os.Open(path)
    if err != nil {
        return err
    }
    defer f.Close() // runs when process returns

    // defer arguments evaluated immediately, call deferred
    defer fmt.Println("done") // prints at end
    return nil
}
```

## Pointers

```go
x := 42
p := &x        // pointer to x
*p = 21        // dereference — x is now 21

// No pointer arithmetic (safe)
// Function arguments are pass-by-value
func modify(p *int) {
    *p = 100
}
modify(&x) // x is now 100
```

## See Also

- [interfaces.md](interfaces.md) — interface types and generics
- [concurrency.md](concurrency.md) — goroutines and channels
- [patterns.md](patterns.md) — common idioms
