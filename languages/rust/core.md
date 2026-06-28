# Rust — Core Syntax & Types

## Scalar Types

| Type | Range / Description |
|---|---|
| `i8`, `i16`, `i32`, `i64`, `i128`, `isize` | Signed integers |
| `u8`, `u16`, `u32`, `u64`, `u128`, `usize` | Unsigned integers |
| `f32`, `f64` | IEEE 754 floats |
| `bool` | `true`, `false` |
| `char` | 4-byte Unicode scalar value |

```rust
let x: i32 = 42;
let y = 42u8;           // type suffix
let z = 1_000_000;      // readable literal
let hex = 0xff;
let binary = 0b1111_0000;
let byte = b'A';        // u8 only
```

## Compound Types

```rust
// Tuple
let tup: (i32, f64, char) = (42, 3.14, 'π');
let (x, y, z) = tup;    // destructure
let first = tup.0;      // dot access

// Array (fixed size, stack allocated)
let arr: [i32; 5] = [1, 2, 3, 4, 5];
let zeros = [0; 100];   // [0, 0, ..., 0] (100 elements)
let first = arr[0];

// Slice (view into array/vec)
let slice: &[i32] = &arr[1..4];

// Vector (growable, heap allocated)
let mut v: Vec<i32> = Vec::new();
v.push(1);
v.extend([2, 3].iter());
let v = vec![1, 2, 3];  // macro
```

## Strings

```rust
// &str — immutable string slice (borrowed)
let s: &str = "hello";

// String — owned, heap-allocated, mutable
let mut s = String::from("hello");
s.push_str(" world");
s.push('!');

// Formatting
let msg = format!("{} {}", "hello", "world");

// Common methods
s.len();          // byte length (not char count)
s.is_empty();
s.contains("ell");
s.replace("hello", "hi");
s.split_whitespace();
```

## Enums

```rust
enum WebEvent {
    PageLoad,
    KeyPress(char),
    Click { x: i64, y: i64 },
}

// Option<T> — no null in Rust
let some: Option<i32> = Some(42);
let none: Option<i32> = None;

// Result<T, E> — for error handling
let ok: Result<i32, String> = Ok(42);
let err: Result<i32, String> = Err("failed".into());
```

## Pattern Matching

```rust
match value {
    Some(x) => println!("got {}", x),
    None => println!("nothing"),
}

// if let — single pattern
if let Some(x) = value {
    println!("{}", x);
}

// while let — loop while pattern matches
while let Some(x) = iter.next() {
    process(x);
}

// let else — assign or return (1.65+)
let Some(x) = value else {
    return Err("missing value");
};
// x is bound here
```

## Error Handling

```rust
// ? operator — propagate error
fn read_file(path: &str) -> Result<String, io::Error> {
    let mut file = File::open(path)?;     // return Err if fails
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;  // return Err if fails
    Ok(contents)
}

// Combinators
let val = result.unwrap_or(default);
let val = result.unwrap_or_else(|e| fallback(e));
let val = result.expect("should have value");

// map / and_then
let len = result.map(|s| s.len());
let deep = result.and_then(|s| parse(s));
```

## Structs

```rust
// Named fields
struct User {
    name: String,
    age: u8,
    active: bool,
}

let user = User {
    name: "Ada".into(),
    age: 30,
    active: true,
};

// Tuple struct
struct Color(u8, u8, u8);
let red = Color(255, 0, 0);

// Unit struct
struct AlwaysEqual;

// Struct update syntax
let user2 = User {
    name: "Bob".into(),
    ..user  // copy remaining fields
};
// Note: user.age is copied (u8 is Copy) — user remains usable
// If active were String, user could no longer be used
```

## Control Flow

```rust
// if is an expression
let n = if condition { 5 } else { 6 };

// loop (infinite, break with value)
let result = loop {
    if done { break 42; }
};

// for (iterator)
for i in 0..5 { }            // 0..5 (exclusive)
for i in 0..=5 { }           // 0..=5 (inclusive)
for item in items.iter() { }
for (i, item) in items.iter().enumerate() { }
```

## See Also

- [ownership.md](ownership.md) — why String moves but i32 copies
- [traits.md](traits.md) — generics and trait bounds
- [patterns.md](patterns.md) — common struct/enum patterns
