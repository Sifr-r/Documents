# Rust — Traits & Generics

## Trait Definition

```rust
trait Summary {
    fn summarize(&self) -> String;

    // Default implementation
    fn summarize_default(&self) -> String {
        String::from("(Read more...)")
    }
}

impl Summary for Article {
    fn summarize(&self) -> String {
        format!("{}, by {}", self.headline, self.author)
    }
}
```

**Orphan rule**: You can implement a trait for a type only if the trait OR the
type is defined in your crate. This prevents conflicts.

## Trait Bounds

```rust
// Generic with trait bound
fn notify<T: Summary>(item: &T) {
    println!("{}", item.summarize());
}

// impl Trait syntax (sugar for above)
fn notify(item: &impl Summary) {
    println!("{}", item.summarize());
}

// Multiple bounds
fn process<T: Summary + Clone>(item: &T) { }
fn process(item: &(impl Summary + Clone)) { }

// where clause (cleaner for complex bounds)
fn complex<T, U>(t: &T, u: &U) -> String
where
    T: Summary + Clone,
    U: Clone + std::fmt::Debug,
{
    format!("{:?} {}", u, t.summarize())
}
```

## Derivable Traits

```rust
#[derive(Debug, Clone, PartialEq, Eq, PartialOrd, Ord, Hash)]
struct Point { x: i32, y: i32 }

// Debug    — {:?} formatting
// Clone    — explicit .clone()
// Copy     — implicit bitwise copy (stack-only types)
// PartialEq — == and !=
// Eq       — full equivalence (no partial)
// Hash     — hashable for HashMap keys
// Default  — Default::default()
```

## Associated Types

```rust
trait Iterator {
    type Item;
    fn next(&mut self) -> Option<Self::Item>;
}

impl Iterator for Counter {
    type Item = u32;
    fn next(&mut self) -> Option<u32> { ... }
}

// Using in generics
fn collect_into_vec<I>(iter: I) -> Vec<I::Item>
where
    I: Iterator,
{
    iter.collect()
}
```

Associated types group one implementation per type. Use generics (`trait Foo<T>`)
when you want multiple implementations for the same type.

## Trait Objects (Dynamic Dispatch)

```rust
// Static dispatch (monomorphization — zero cost, code bloat)
fn static_dispatch(item: &impl Summary) { }
fn static_gen<T: Summary>(item: &T) { }

// Dynamic dispatch (vtable — pointer indirection, smaller binary)
fn dynamic_dispatch(item: &dyn Summary) { }

// Trait objects require object-safe traits:
// - No Self: Sized requirement
// - All methods must not use Self in return/args (except receiver)
// Good: fn method(&self) -> String
// Bad:  fn method(&self) -> Self        // not object-safe
// Bad:  fn new() -> Self where Self: Sized // Sized is ok if method is sized

// Common use: heterogeneous collections
let items: Vec<Box<dyn Summary>> = vec![
    Box::new(Article { ... }),
    Box::new(Tweet { ... }),
];
```

## Common Std Traits

```rust
// Display — user-facing output (required by println!("{}"))
impl std::fmt::Display for Point {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        write!(f, "({}, {})", self.x, self.y)
    }
}

// From / Into — conversions
impl From<u32> for UserId {
    fn from(id: u32) -> Self { UserId(id) }
}
let id: UserId = 42.into();

// TryFrom — fallible
impl TryFrom<i32> for Positive {
    type Error = &'static str;
    fn try_from(n: i32) -> Result<Self, Self::Error> {
        if n > 0 { Ok(Positive(n)) } else { Err("must be positive") }
    }
}

// Default
#[derive(Default)]
struct Config {
    timeout: u64,  // 0
    retries: u32,  // 0
}
let config = Config { retries: 3, ..Default::default() };
```

## Extension Traits

Add methods to types you don't own (the decorator pattern, Rust-style).

```rust
trait StringExt {
    fn is_blank(&self) -> bool;
}

impl StringExt for str {
    fn is_blank(&self) -> bool {
        self.trim().is_empty()
    }
}

"  hello  ".is_blank(); // false
"   ".is_blank();       // true
```

## See Also

- [core.md](core.md) — structs, enums
- [ownership.md](ownership.md) — lifetime bounds in traits
- [patterns.md](patterns.md) — newtype pattern, trait-based patterns
