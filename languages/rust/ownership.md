# Rust — Ownership & Borrowing

## Ownership Rules

1. Each value has exactly one **owner** at a time.
2. When the owner goes out of scope, the value is **dropped**.
3. Ownership can be **moved** (transferred) or **borrowed**.

```rust
{
    let s = String::from("hello"); // s owns the String
    // ... use s ...
} // s goes out of scope, String::drop called, memory freed
```

## Move Semantics

Assignment transfers ownership (moves) for non-`Copy` types.

```rust
let s1 = String::from("hello");
let s2 = s1;             // s1 moved — no longer usable
// println!("{}", s1);   // ERROR: value borrowed after move

let n1 = 42;
let n2 = n1;             // i32 is Copy — n1 still valid
println!("{}", n1);      // OK
```

`Copy` types (stack-only): integers, floats, bool, char, tuples of Copy types,
shared references (`&T`). `Clone` types require explicit `.clone()`.

```rust
let s1 = String::from("hello");
let s2 = s1.clone();     // explicit deep copy — s1 still valid
```

## Borrowing (References)

```rust
// Shared reference (&T) — read-only, many allowed
fn print_len(s: &String) -> usize {
    s.len()
}

let s = String::from("hello");
let len = print_len(&s);
println!("{}", s);  // s still owned here

// Mutable reference (&mut T) — exclusive, only one
fn append(s: &mut String) {
    s.push_str(" world");
}

let mut s = String::from("hello");
append(&mut s);

// CANNOT have both at the same time:
let r1 = &s;        // shared borrow
let r2 = &mut s;    // ERROR: cannot borrow `s` as mutable
                    //        because it is also borrowed as immutable
```

## Lifetimes

Lifetimes ensure references are always valid. Often elided, but explicit
when the compiler can't infer.

```rust
// Lifetime elision — 3 rules:
// 1. Each reference param gets its own lifetime
// 2. One input lifetime → assigned to output
// 3. &self/&mut self → assigned to output

// Explicit (when rules don't cover it)
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() { x } else { y }
}
// Return lifetime = intersection of x and y lifetimes

// Struct with lifetime
struct Excerpt<'a> {
    part: &'a str,  // references data that lives at least 'a
}

// Static lifetime — lives for entire program
let s: &'static str = "I live forever";
```

## Slices

Slices are references to contiguous sequences (no ownership).

```rust
let arr = [1, 2, 3, 4, 5];
let slice: &[i32] = &arr[1..4]; // [2, 3, 4]

let s = String::from("hello world");
let hello: &str = &s[0..5];    // "hello"
let world: &str = &s[6..11];   // "world"

// &str is just a slice: &[u8] + guarantee of valid UTF-8
```

## Common Patterns

```rust
// Take ownership explicitly
fn consume(s: String) { }   // takes ownership
fn borrow(s: &str) { }      // borrows — more flexible
// Prefer &str over &String in function signatures

// Cow — clone-on-write (when mutation might not happen)
use std::borrow::Cow;
fn process(input: &str) -> Cow<str> {
    if input.contains(' ') {
        Cow::Owned(input.replace(' ', "_"))
    } else {
        Cow::Borrowed(input)
    }
}

// Entry API — avoid double lookup
use std::collections::HashMap;
let mut map = HashMap::new();
map.entry("key")
   .and_modify(|v| *v += 1)
   .or_insert(1);
```

## See Also

- [core.md](core.md) — structs, enums, error handling
- [traits.md](traits.md) — trait bounds with lifetimes
- [concurrency.md](concurrency.md) — Send + Sync
