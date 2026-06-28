# Zig — Core Syntax

## Primitive Types

| Type | Description |
|---|---|
| `i8`..`i128` | Signed integers (8 to 128 bit) |
| `u8`..`u128` | Unsigned integers (8 to 128 bit) |
| `isize`, `usize` | Pointer-sized signed/unsigned |
| `f16`, `f32`, `f64`, `f80`, `f128` | IEEE 754 floats |
| `bool` | `true` / `false` |
| `void` | No value (for function returns) |
| `noreturn` | Function never returns (e.g. `unreachable`) |
| `type` | The type of types |
| `anyerror` | Any error from any error set |
| `anytype` | Compile-time generic parameter |

```zig
const x: i32 = 42;
const pi: f64 = 3.14159;
const ok: bool = true;
```

## Variables

```zig
const x: i32 = 42;         // immutable (preferred)
var y: i32 = 0;            // mutable
var z: i32 = undefined;    // uninitialized, must be written before read
```

## Functions

```zig
fn add(a: i32, b: i32) i32 {
    return a + b;
}

// Return type inferred
fn double(x: i32) @TypeOf(x) {
    return x * 2;
}

// Public function
pub fn main() void {
    const result = add(1, 2);
}
```

## Control Flow

```zig
// if — is an expression
const max = if (a > b) a else b;

// while
var i: usize = 0;
while (i < 10) : (i += 1) {
    // body
}

// for (range and slices)
for (0..10) |i| {
    // i is 0..9
}
for (slice) |item| {
    // iterate elements
}
for (slice, 0..) |item, idx| {
    // iterate with index
}

// switch — exhaustive, no fallthrough
const val: u8 = 3;
const msg = switch (val) {
    0 => "zero",
    1...9 => "small",
    else => "other",
};
```

## Error Unions and Error Sets

```zig
// Error set
const MyError = error{
    NotFound,
    InvalidInput,
};

// Error union type: may be an error or a value
fn parseNumber(s: []const u8) MyError!u32 {
    if (s.len == 0) return error.NotFound;
    return std.fmt.parseInt(u32, s, 10) catch return error.InvalidInput;
}

// Handling errors
const result = parseNumber("42") catch |err| switch (err) {
    error.NotFound => 0,
    error.InvalidInput => 0,
};

// try — shorthand for catch |err| return err
const val = try parseNumber("42");

// if with error union
if (parseNumber("42")) |val| {
    // val is u32
} else |err| {
    // err is MyError
}
```

## Optionals

```zig
var maybe: ?i32 = null;
maybe = 42;

// Unwrap
if (maybe) |val| {
    // val is i32 = 42
}

// orelse — provide default
const x = maybe orelse 0;

// .? — force unwrap (panics if null)
const y = maybe.?;
```

## Comptime

```zig
// Compile-time known value
const len = comptime blk: {
    break :blk 10 * 2;
};

// Compile-time function execution
fn factorial(comptime n: usize) usize {
    var result: usize = 1;
    var i: usize = 1;
    while (i <= n) : (i += 1) {
        result *= i;
    }
    return result;
}
const fact5 = comptime factorial(5); // 120, computed at compile time

// Generic functions via comptime types
fn makeArray(comptime T: type, comptime size: usize) [size]T {
    var arr: [size]T = undefined;
    for (&arr, 0..) |*item, i| {
        item.* = @as(T, @intCast(i));
    }
    return arr;
}
```

## Structs, Enums, Unions

```zig
// Struct
const Vec2 = struct {
    x: f64,
    y: f64,

    pub fn length(self: Vec2) f64 {
        return @sqrt(self.x * self.x + self.y * self.y);
    }
};

// Enum
const Color = enum {
    red,
    green,
    blue,
};

// Tagged union
const Value = union(enum) {
    int: i64,
    float: f64,
    boolean: bool,
};

// Packed struct (bit-level layout)
const Flags = packed struct {
    read: bool,
    write: bool,
    execute: bool,
};
```

## Pointers and Slices

```zig
// Single-item pointer
var x: i32 = 42;
const ptr: *i32 = &x;
ptr.* = 100; // x is now 100

// Const pointer
const cptr: *const i32 = &x;

// Slice (pointer to unknown-length array)
const arr = [_]i32{ 1, 2, 3, 4, 5 };
const slice: []const i32 = arr[1..4]; // [2, 3, 4]
const full: []const i32 = &arr;       // whole array as slice
```

## Allocators

```zig
const std = @import("std");

pub fn main() !void {
    // General purpose allocator (debug-friendly)
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.debug.assert(gpa.deinit() == .ok);
    const allocator = gpa.allocator();

    // Arena allocator (free all at once)
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const arena_alloc = arena.allocator();

    // Allocate and free
    const slice = try allocator.alloc(u8, 100);
    defer allocator.free(slice);

    // Create and destroy
    const ptr = try allocator.create(i32);
    defer allocator.destroy(ptr);
}
```

## defer and errdefer

```zig
fn processFile(path: []const u8, allocator: std.mem.Allocator) ![]u8 {
    const file = try std.fs.cwd().openFile(path, .{});
    defer file.close(); // always runs when function exits

    const buf = try allocator.alloc(u8, 1024);
    errdefer allocator.free(buf); // runs only if function returns error

    // If we succeed, caller owns buf
    return buf;
}
```

- `defer` — executes at scope exit (LIFO order), always
- `errdefer` — executes at scope exit only on error return

## See Also

- [README.md](README.md) — overview and quick reference
