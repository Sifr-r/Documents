# C++ — Templates

## Function Templates

```cpp
template<typename T>
T max(T a, T b) {
    return a > b ? a : b;
}

auto m = max(3, 5);              // T = int, deduced
auto n = max<int>(3.0, 5.0);     // explicit T = int
auto d = max(3.14, 2.71);        // T = double, deduced
```

## Class Templates

```cpp
template<typename T, size_t N>
class Array {
    T data_[N];
public:
    constexpr size_t size() const { return N; }
    T& operator[](size_t i) { return data_[i]; }
};

Array<int, 5> arr;               // int[5] on the stack

// Member template
template<typename U>
Array(const Array<U, N>& other) {
    for (size_t i = 0; i < N; ++i) data_[i] = other[i];
}
```

## Template Argument Deduction

```cpp
// CTAD — Class Template Argument Deduction (C++17)
std::vector v = {1, 2, 3};       // vector<int>
std::pair p = {1, 3.14};         // pair<int, double>
std::lock_guard lk(mtx);         // lock_guard<std::mutex>

// Deduction guides (user-defined)
template<typename T>
struct Wrapper {
    Wrapper(T) {}
};
// implicit: Wrapper w(42) → Wrapper<int>
```

## Concepts (C++20)

Concepts constrain template parameters with compile-time predicates.

```cpp
#include <concepts>

// Syntax 1: requires clause
template<typename T>
    requires std::integral<T>
T gcd(T a, T b) {
    return b == 0 ? a : gcd(b, a % b);
}

// Syntax 2: named concept
template<std::integral T>
T add(T a, T b) { return a + b; }

// Syntax 3: trailing requires
template<typename T>
T inc(T a) requires std::integral<T> { return a + 1; }

// Custom concept
template<typename T>
concept Addable = requires(T a, T b) {
    { a + b } -> std::convertible_to<T>;
};

template<Addable T>
T sum(T a, T b) { return a + b; }

// Multiple constraints
template<typename T>
    requires std::integral<T> && std::totally_ordered<T>
T clamp(T val, T lo, T hi) {
    return val < lo ? lo : val > hi ? hi : val;
}
```

## Variadic Templates

```cpp
// Parameter pack
template<typename... Args>
void print(Args... args) {
    (std::cout << ... << args);     // fold expression (C++17)
}

// Recursive unpacking
template<typename T>
T sum(T t) { return t; }

template<typename T, typename... Rest>
T sum(T first, Rest... rest) {
    return first + sum(rest...);
}

auto total = sum(1, 2, 3, 4, 5);   // 15

// sizeof... — count pack elements
template<typename... Args>
constexpr size_t count() { return sizeof...(Args); }
```

## Fold Expressions (C++17)

```cpp
template<typename... Args>
auto sum_all(Args... args) {
    return (... + args);            // unary left fold: (((a + b) + c) + d)
}

template<typename... Args>
auto sum_init(Args... args) {
    return (args + ... + 0);        // binary fold: start with 0
}

// Operators: + - * / % ^ & | = < << >> += && || , .* ->*

template<typename... Args>
bool all_true(Args... args) {
    return (... && args);
}

template<typename... Args>
void println(Args... args) {
    (std::cout << ... << args) << '\n';
}
```

## SFINAE & `std::enable_if`

Substitution Failure Is Not An Error — remove overloads from consideration when substitution fails.

```cpp
// enable_if — conditionally enable overload
template<typename T>
std::enable_if_t<std::is_integral_v<T>, T>    // C++14 _t, _v helpers
floor_div(T a, T b) {
    return a / b;
}

// Pre-C++20: often replaced by concepts in new code
// Useful for conditional member functions
template<typename T>
class Container {
    T data_;
public:
    template<typename U = T>
    auto sort() -> std::enable_if_t<std::is_same_v<U, std::string>, void> {
        // only available when T is string
    }
};
```

## `if constexpr` (C++17)

Compile-time branching — the discarded branch is never instantiated.

```cpp
template<typename T>
auto get_value(T t) {
    if constexpr (std::is_pointer_v<T>) {
        return *t;                              // pointer path
    } else if constexpr (std::is_integral_v<T>) {
        return t;                               // integral path
    } else {
        static_assert(sizeof(T) == 0, "unsupported type for get_value");
    }
}

// Recursive template with if constexpr
template<typename T, typename... Rest>
auto sum(T first, Rest... rest) {
    if constexpr (sizeof...(rest) == 0)
        return first;
    else
        return first + sum(rest...);
}
```

## See Also

- [core.md](core.md) — `constexpr`, `consteval`, type system
- [stl.md](stl.md) — STL built on templates, `std::find_if`, `std::transform`
- [memory.md](memory.md) — `std::unique_ptr`, `std::shared_ptr` (template classes)