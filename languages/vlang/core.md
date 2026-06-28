# V — Core Syntax

## Variables

```v
// Immutable (default)
x := 42
name := "Alice"

// Mutable
mut count := 0
count = 1
count++

// Constant
const pi = 3.14159

// Multiple assignment
mut a, mut b := 1, 2
a, b = b, a  // swap
```

## Primitive Types

| Type | Description |
|---|---|
| `int` | 32-bit signed integer |
| `i64` | 64-bit signed integer |
| `i8`, `i16` | 8-bit, 16-bit signed |
| `u8`, `u16`, `u32`, `u64` | Unsigned integers |
| `f32`, `f64` | 32-bit, 64-bit floats |
| `bool` | `true` / `false` |
| `string` | Immutable UTF-8 string |
| `rune` | Unicode code point |
| `[]T` | Dynamic array |
| `map[K]V` | Hash map |
| `chan T` | Channel for concurrency |

```v
n     := 42          // int
big   := i64(1e18)   // i64
f     := 3.14        // f64
s     := "hello"     // string
b     := true        // bool
arr   := [1, 2, 3]   // []int
m     := map[string]int{}  // map[string]int
```

## Arrays and Maps

```v
// Arrays
mut nums := [1, 2, 3]
nums << 4              // append
nums << [5, 6]         // append multiple
first := nums[0]
len := nums.len

// Array literal with range
squares := [for i in 0..5 { i * i }]  // [0, 1, 4, 9, 16]

// Filter
evens := nums.filter(it % 2 == 0)

// Map
mut ages := map[string]int{}
ages["Alice"] = 30
ages["Bob"] = 25
age := ages["Alice"] or { 0 }

// Map iteration
for key, val in ages {
    println("$key: $val")
}
```

## Functions

```v
// Basic function
fn add(a int, b int) int {
    return a + b
}

// Multiple return values
fn divmod(a int, b int) (int, int) {
    return a / b, a % b
}

// Default and named parameters
fn greet(name string, greeting string = "Hello") string {
    return "$greeting, $name!"
}
greet("Alice")                    // "Hello, Alice!"
greet(name: "Bob", greeting: "Hi") // "Hi, Bob!"

// Anonymous function
double := fn(x int) int { return x * 2 }
println(double(21))  // 42

// Higher-order function
fn apply(f fn(int) int, x int) int {
    return f(x)
}

// Pipe operator
fn square(x int) int { return x * x }
result := 5 |> square()  // 25
```

## Control Flow

```v
// if / else if / else
if x > 0 {
    println("positive")
} else if x < 0 {
    println("negative")
} else {
    println("zero")
}

// if as expression
sign := if x > 0 { "pos" } else if x < 0 { "neg" } else { "zero" }

// for loop variants
for i := 0; i < 10; i++ { }   // C-style
for i in 0..10 { }             // range [0, 10)
for item in arr { }            // iterate array
for i, item in arr { }         // with index
for { break }                  // infinite loop

// match (exhaustive)
match color {
    .red   { println("red") }
    .green { println("green") }
    .blue  { println("blue") }
}

// match with value binding
match val {
    int    { println("int: $val") }
    string { println("str: $val") }
    else   { println("other") }
}
```

## Sum Types

```v
// Sum type declaration
type Expr = IntLit | BinOp | UnaryOp

struct IntLit {
    value int
}

struct BinOp {
    op    string
    left  Expr
    right Expr
}

struct UnaryOp {
    op      string
    operand Expr
}

// Match on sum type
fn eval(e Expr) int {
    return match e {
        IntLit  { e.value }
        BinOp   { eval(e.left) + eval(e.right) }  // simplified
        UnaryOp { -eval(e.operand) }
    }
}
```

## Option Types

```v
// Function returning option
fn find_user(id int) ?string {
    if id < 0 { return none }
    return users[id]
}

// Unwrap with or {}
name := find_user(1) or { "unknown" }

// Propagate with ?
fn get_user_name(id int) ?string {
    name := find_user(id)?   // returns none if find_user returns none
    return name
}

// Check with if
if name := find_user(1) {
    println(name)
}
```

## Structs and Methods

```v
struct Point {
    x f64
    y f64
}

// Mutable struct
struct Counter {
mut:
    count int
}

// Constructor-like function
fn new_point(x f64, y f64) Point {
    return Point{x, y}
}

// Methods
fn (p Point) distance() f64 {
    return math.sqrt(p.x * p.x + p.y * p.y)
}

// Mutable method
fn (mut c Counter) increment() {
    c.count++
}

mut ctr := Counter{}
ctr.increment()

// Embedding (composition)
struct Widget {
    id    int
    label string
}

struct Button {
    Widget           // embedded
    on_click fn()
}
```

## Interfaces

```v
interface Printable {
    to_string() string
}

struct User {
    name string
}

fn (u User) to_string() string {
    return "User($u.name)"
}

fn print_it(p Printable) {
    println(p.to_string())
}

print_it(User{"Alice"})  // User(Alice)
```

## Generics

```v
// Generic function
fn min<T>(a T, b T) T {
    if a < b { return a }
    return b
}

// Generic struct
struct Pair<T> {
    first  T
    second T
}

fn (p Pair<T>) swap() Pair<T> {
    return Pair{T}{p.second, p.first}
}

// Generic with constraint
fn sort<T>(mut arr []T) where T < T {
    // ...
}
```

## Concurrency

```v
// Spawn a goroutine
spawn fn() {
    println("running concurrently")
} ()

// Channels
mut ch := chan int{cap: 10}

// Send
spawn fn(mut c chan int) {
    c <- 42
    c.close()
}(mut ch)

// Receive
val := <-ch

// Select (multiplex channels)
select {
    500 * time.millisecond {
        println("timeout")
    }
    val := <-ch {
        println("got: $val")
    }
}

// Wait group
mut wg := sync.new_waitgroup()
wg.add(3)
for i in 0..3 {
    spawn fn(mut w sync.WaitGroup, id int) {
        defer { w.done() }
        println("worker $id")
    }(mut wg, i)
}
wg.wait()

// Mutex
mut mtx := sync.new_mutex()
mtx.lock()
defer { mtx.unlock() }
```

## Modules and Imports

```v
// Module declaration (in .v file)
module mymodule

// Export public function
pub fn helper() string {
    return "hello"
}

// Import modules
import os
import json
import mymodule

// Use
path := os.executable()
data := json.encode(my_struct)
result := mymodule.helper()

// Attributes
@[deprecated: "use new_fn instead"]
fn old_fn() {}

@[if debug]
fn debug_only() {
    println("debug mode")
}
```

## See Also

- [README.md](README.md) — overview and quick reference
