# C++ — Core Syntax

## Fundamental Types

| Type | Size (typical) | Range | Literal |
|------|---------------|-------|---------|
| `bool` | 1 byte | `true` / `false` | `true` |
| `char` | 1 byte | -128..127 or 0..255 | `'a'` |
| `int` | 4 bytes | ±2.1×10⁹ | `42` |
| `long long` | 8 bytes | ±9.2×10¹⁸ | `42LL` |
| `float` | 4 bytes | ~7 digits | `3.14f` |
| `double` | 8 bytes | ~15 digits | `3.14` |
| `size_t` | 8 bytes (64-bit) | unsigned | — |
| `std::string` | heap-allocated | dynamic | `"hello"s` |

```cpp
#include <cstdint>
int32_t   a = 0;          // fixed-width integer
uint64_t  b = 1ULL;
```

## Type Deduction: `auto` & `decltype`

```cpp
auto  x = 42;             // int
auto  y = 3.14;           // double
auto& z = vec[0];         // reference to element
const auto& cr = vec;     // const reference

decltype(x)  w = 10;      // int — type of x
decltype(auto) fn() {     // preserves ref-ness
    return vec[0];        // returns reference
}
```

## Compile-Time: `constexpr` & `consteval` (C++20)

```cpp
constexpr int square(int n) { return n * n; }
constexpr int val = square(10);   // evaluated at compile time

consteval int compile_only(int n) { return n * n; }
// int r = compile_only(runtime_val);  // error — must be constexpr
```

## Control Flow

```cpp
// if-init (C++17)
if (auto it = map.find(key); it != map.end()) {
    use(it->second);
} else {
    // it still in scope
}

// switch with init (C++17)
switch (auto val = get_status(); val) {
    case Status::Ok:    break;
    case Status::Error: break;
    default:            break;
}

// range-for
for (const auto& item : container) { /* ... */ }
```

## Structured Bindings (C++17)

```cpp
auto [x, y] = std::pair{1, 2.0};           // pair
auto [it, ok] = map.insert({k, v});         // iterator + bool
auto& [key, val] = *map.find(k);            // reference to pair

struct Point { int x; int y; };
auto [px, py] = Point{3, 4};               // struct members
```

## `std::string`, `std::string_view`, `std::format`

```cpp
std::string s = "hello";
s += " world";
s.substr(0, 5);                              // "hello"
s.find("wo");                                // 6

std::string_view sv = s;                     // non-owning view
sv = "literal";                              // no allocation
sv.remove_prefix(1);                         // skips first char

// std::format (C++20)
#include <format>
std::string msg = std::format("{} + {} = {}", 2, 3, 5);
std::string hex = std::format("{:#x}", 255); // "0xff"
```

## `std::optional`, `std::variant`, `std::any`

```cpp
// optional (C++17) — value or nothing
std::optional<int> maybe = find(42);
if (maybe) { int val = *maybe; }
int val = maybe.value_or(-1);

// variant (C++17) — type-safe union
std::variant<int, double, std::string> v = 3.14;
std::visit([](auto&& arg) { std::cout << arg; }, v);
if (std::holds_alternative<double>(v)) { /* ... */ }

// any (C++17) — type-erased value
std::any a = 42;
a = std::string("hi");
int val = std::any_cast<int>(a);             // throws if wrong type
```

## Common Containers: Basic Ops

```cpp
// vector — dynamic array
std::vector<int> v = {1, 2, 3};
v.push_back(4);            // copy
v.emplace_back(5);         // construct in place
v.pop_back();              // remove last
v.size(); v.capacity(); v.reserve(100);

// array — fixed-size (stack)
std::array<int, 3> a = {1, 2, 3};
a[0]; a.size(); a.fill(0);

// map — ordered key-value
std::map<std::string, int> m;
m["key"] = 42;
m.insert({"k", 1});
m.contains("key");         // C++20

// unordered_map — hash-based
std::unordered_map<std::string, int> um;
um["k"] = 1;
```

## Exception Handling

```cpp
void may_throw() {
    throw std::runtime_error("oops");
}

try {
    may_throw();
} catch (const std::runtime_error& e) {
    std::cerr << e.what();
} catch (...) {
    throw;                 // rethrow
}

// noexcept — guarantees no exception
void safe() noexcept { /* ... */ }
static_assert(noexcept(safe()));             // true
```

## See Also

- [memory.md](memory.md) — Smart pointers, RAII, move semantics
- [stl.md](stl.md) — Containers, iterators, algorithms
- [templates.md](templates.md) — Templates, concepts, variadic