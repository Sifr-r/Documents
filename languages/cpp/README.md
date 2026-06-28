# C++ — Index

Modern C++ (17/20/23) reference. Covers the STL, memory management, templates, and RAII.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core Syntax | [core.md](core.md) | Types, control flow, `std::optional`, `std::variant`, `std::format` |
| Memory Management | [memory.md](memory.md) | Smart pointers, RAII, Rule of 5, move semantics |
| STL Containers & Algorithms | [stl.md](stl.md) | `vector`, `map`, iterators, `sort`, `find_if`, `std::span` |
| Templates | [templates.md](templates.md) | Function/class templates, concepts, variadic, fold expressions |

## Quick Reference

```cpp
#include <format>
#include <memory>
#include <optional>
#include <variant>
#include <vector>
#include <algorithm>

// ── Smart pointers ─────────────────────────────────────────────
auto   u = std::make_unique<Widget>();
auto   s = std::make_shared<Widget>();
auto   w = std::weak_ptr(s);          // non-owning reference

// ── auto & range-for ───────────────────────────────────────────
auto  it = vec.begin();               // iterator type deduction
std::vector<int> v = {1, 2, 3};
for (auto& x : v) x *= 2;            // mutate in place

// ── Structured bindings (C++17) ────────────────────────────────
auto  [key, val] = *map.find(k);      // unpack pair/tuple
auto& [a, b]    = pair;

// ── std::optional (C++17) ──────────────────────────────────────
std::optional<int> maybe = find(42);
if (maybe) { int val = *maybe; }
int val = maybe.value_or(-1);

// ── std::variant (C++17) ───────────────────────────────────────
std::variant<int, double, std::string> v = 3.14;
std::visit([](auto&& arg) { /* ... */ }, v);

// ── Lambda ─────────────────────────────────────────────────────
auto fn = [&](int x) { return x + n; };  // capture by reference
auto it = std::find_if(v.begin(), v.end(),
           [](int x) { return x > 5; });

// ── std::format (C++20) ────────────────────────────────────────
std::string msg = std::format("{} + {} = {}", 2, 3, 2 + 3);
```

## See Also

- [C++ Core Guidelines](https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines)
- [cppreference.com](https://en.cppreference.com/)