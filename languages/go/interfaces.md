# Go — Interfaces & Generics

## Interface Basics

Interfaces are implicitly satisfied (structural typing, no `implements` keyword).

```go
type Writer interface {
    Write(p []byte) (n int, err error)
}

type FileWriter struct{}

func (fw FileWriter) Write(p []byte) (int, error) {
    // implementation
    return len(p), nil
}

// FileWriter automatically satisfies Writer — no declaration needed
var w Writer = FileWriter{}
```

## Common Stdlib Interfaces

```go
// io.Reader — the most common interface
type Reader interface {
    Read(p []byte) (n int, err error)
}

// io.Writer
type Writer interface {
    Write(p []byte) (n int, err error)
}

// io.Closer
type Closer interface {
    Close() error
}

// Composing: ReadWriter = Reader + Writer
type ReadWriter interface {
    Reader
    Writer
}

// fmt.Stringer — like __str__ / Display
type Stringer interface {
    String() string
}

// error
type error interface {
    Error() string
}

// sort.Interface
type Interface interface {
    Len() int
    Less(i, j int) bool
    Swap(i, j int)
}
```

## Type Assertions & Switches

```go
// Type assertion
var w Writer = FileWriter{}
fw, ok := w.(FileWriter)  // ok=false if wrong type
fw := w.(FileWriter)      // panic if wrong type

// Type switch
switch v := x.(type) {
case int:
    fmt.Println("int:", v)
case string:
    fmt.Println("string:", v)
case Writer:
    v.Write([]byte("hello"))
default:
    fmt.Printf("unknown: %T\n", v)
}
```

## The Empty Interface

`any` (Go 1.18+, alias for `interface{}`) accepts any value.

```go
var x any = 42
x = "hello"
x = []int{1, 2, 3}

// Type assertion required to use the value
if s, ok := x.(string); ok {
    fmt.Println(s)
}
```

## Generics (Go 1.18+)

```go
// Generic function
func Map[T any, U any](slice []T, fn func(T) U) []U {
    result := make([]U, len(slice))
    for i, v := range slice {
        result[i] = fn(v)
    }
    return result
}

squares := Map([]int{1, 2, 3}, func(n int) int { return n * n })

// Generic type
type Stack[T any] struct {
    items []T
}

func (s *Stack[T]) Push(item T) {
    s.items = append(s.items, item)
}

func (s *Stack[T]) Pop() (T, bool) {
    if len(s.items) == 0 {
        var zero T
        return zero, false
    }
    item := s.items[len(s.items)-1]
    s.items = s.items[:len(s.items)-1]
    return item, true
}

stack := Stack[int]{}
stack.Push(42)

// Type constraints
type Number interface {
    int | int64 | float64
}

func Sum[T Number](nums []T) T {
    var total T
    for _, n := range nums {
        total += n
    }
    return total
}

// constraints.Ordered in the standard library (cmp package, Go 1.21+)
// cmp.Ordered — <, >, <=, >=
```

## Interface Best Practices

Go proverb: **"The bigger the interface, the weaker the abstraction."**

```go
// GOOD — small, focused interfaces
type Reader interface {
    Read(p []byte) (n int, err error)
}

// BAD — large, unfocused interface
type DataStore interface {
    GetUser(id string) (*User, error)
    SaveUser(u *User) error
    DeleteUser(id string) error
    ListUsers() ([]*User, error)
    // ...
}

// Accept interfaces, return structs
func Process(r io.Reader) (*Result, error) {
    // Can accept *os.File, bytes.Buffer, strings.Reader, etc.
}

// Return concrete types
func NewProcessor() *Processor {
    return &Processor{}
}
```

## See Also

- [core.md](core.md) — structs, methods
- [concurrency.md](concurrency.md) — channels as interfaces
- [patterns.md](patterns.md) — functional options pattern
