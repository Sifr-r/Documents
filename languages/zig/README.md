# Zig

Systems programming language with comptime, no hidden allocations, and C interop.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, comptime, error handling, allocators |

## Quick Reference

```zig
// Immutable by default
const x: i32 = 42;
var y: i32 = 0;

// Comptime
const doubled = comptime blk: {
    break :blk x * 2;
};

// Error handling
fn divide(a: f64, b: f64) !f64 {
    if (b == 0) return error.DivisionByZero;
    return a / b;
}

// Try/catch
const result = divide(10, 2) catch 0;
if (divide(10, 0)) |val| { } else |err| { }

// Defer
fn readFile(path: []const u8) ![]u8 {
    const file = try std.fs.cwd().openFile(path, .{});
    defer file.close();
    return file.readToEndAlloc(allocator, 1024 * 1024);
}
```