# C++ — STL Containers & Algorithms

## Container Overview

| Container | Backing | Key Property | Use When |
|-----------|---------|-------------|----------|
| `std::vector<T>` | Dynamic array | O(1) random access, amortized O(1) push_back | Default choice |
| `std::deque<T>` | Chunked array | O(1) push_front + push_back | Double-ended queue |
| `std::list<T>` | Doubly linked list | O(1) insert/erase anywhere | Frequent mid-sequence mutations |
| `std::set<K>` | Red-black tree | O(log n) sorted unique keys | Ordered unique keys |
| `std::map<K,V>` | Red-black tree | O(log n) sorted key-value | Ordered dictionary |
| `std::unordered_map<K,V>` | Hash table | O(1) average lookup | Fast key-value lookup |
| `std::array<T,N>` | Stack array | Compile-time size, no heap | Fixed-size known at compile time |
| `std::span<T>` | View (C++20) | Non-owning contiguous range | Pass array/vector without copying |

## Common Operations

```cpp
std::vector<int> v = {1, 2, 3};

// ── Add ────────────────────────────────────────────────────────
v.push_back(4);                               // copy
v.emplace_back(5);                            // construct in place
v.insert(v.begin() + 1, 99);                  // insert at position

// ── Remove ─────────────────────────────────────────────────────
v.pop_back();                                 // remove last
v.erase(v.begin());                           // erase by iterator
v.erase(v.begin(), v.begin() + 2);            // erase range
std::erase(v, 3);                             // C++20: erase all 3s

// ── Access ─────────────────────────────────────────────────────
v[0]; v.at(0);                                // at() bounds-checks
v.front(); v.back();                          // first/last element
v.data();                                     // raw pointer to data

// ── Map ────────────────────────────────────────────────────────
std::map<std::string, int> m;
m["key"] = 42;                                // insert or overwrite
m.insert({"k", 1});                           // insert, no overwrite
m.insert_or_assign("k", 2);                   // C++17: insert or overwrite
m.contains("key");                            // C++20
if (auto it = m.find("key"); it != m.end()) {
    it->second = 99;                          // found
}
m.erase("key");
```

## Iterators

```cpp
std::vector<int> v = {1, 2, 3, 4, 5};

auto b = v.begin();                            // forward iterator
auto e = v.end();                              // one past the end
auto rb = v.rbegin();                          // reverse iterator
auto re = v.rend();

// Iterator categories
auto it = v.cbegin();                          // const iterator
auto rit = v.crbegin();                        // const reverse

// Non-member (C++11)
auto b2 = std::begin(v);
auto e2 = std::end(v);

// std::span (C++20) — non-owning view
std::span<int> sp = v;                         // bounds-checked view
std::span<int> sub = sp.subspan(1, 3);         // subrange
sp.size(); sp[0];                              // familiar API
for (auto& x : sp) { /* ... */ }
```

## Algorithms

```cpp
#include <algorithm>
#include <numeric>
#include <vector>

std::vector<int> v = {5, 2, 8, 1, 4, 8, 3};

// ── Sorting ────────────────────────────────────────────────────
std::sort(v.begin(), v.end());                 // ascending
std::sort(v.begin(), v.end(), std::greater{}); // descending
std::stable_sort(v.begin(), v.end());          // preserves equal order
std::ranges::sort(v);                          // C++20 ranges

// ── Finding ────────────────────────────────────────────────────
auto it = std::find(v.begin(), v.end(), 8);
auto it2 = std::find_if(v.begin(), v.end(),
            [](int x) { return x > 3; });
auto it3 = std::find_if_not(v.begin(), v.end(),
            [](int x) { return x > 0; });

// ── Transform ──────────────────────────────────────────────────
std::vector<int> out(v.size());
std::transform(v.begin(), v.end(), out.begin(),
               [](int x) { return x * 2; });

// ── Accumulate (reduce) ────────────────────────────────────────
int sum = std::accumulate(v.begin(), v.end(), 0);
int prod = std::accumulate(v.begin(), v.end(), 1,
            std::multiplies{});
int reduced = std::reduce(v.begin(), v.end());  // C++17 parallel-friendly

// ── Remove / Erase ─────────────────────────────────────────────
auto new_end = std::remove_if(v.begin(), v.end(),
                [](int x) { return x % 2 == 0; });
v.erase(new_end, v.end());                     // erase-remove idiom

// C++20: single-step
std::erase_if(v, [](int x) { return x % 2 == 0; });

// ── Partition ──────────────────────────────────────────────────
auto pivot = std::partition(v.begin(), v.end(),
              [](int x) { return x < 5; });
// elements < 5 come first, order not preserved

// ── Other ──────────────────────────────────────────────────────
std::any_of(v.begin(), v.end(), [](int x) { return x > 10; });
std::all_of(v.begin(), v.end(), [](int x) { return x > 0; });
std::count_if(v.begin(), v.end(), [](int x) { return x > 3; });
std::min_element(v.begin(), v.end());
std::max_element(v.begin(), v.end());
std::clamp(val, 0, 100);                       // C++17
std::rotate(v.begin(), v.begin() + 2, v.end());
std::reverse(v.begin(), v.end());
std::unique(v.begin(), v.end());               // adjacent duplicates
std::binary_search(v.begin(), v.end(), 42);    // must be sorted
auto [lo, hi] = std::equal_range(v.begin(), v.end(), 8); // C++17
```

## Lambda with Algorithms

```cpp
// Capture for context
int threshold = 3;
auto it = std::find_if(v.begin(), v.end(),
    [threshold](int x) { return x > threshold; });

// Mutable lambda
std::generate(v.begin(), v.end(),
    [n = 0]() mutable { return n++; });

// Generic lambda (C++14)
std::for_each(v.begin(), v.end(),
    [](auto&& x) { std::cout << x << ' '; });
```

## See Also

- [core.md](core.md) — `std::vector`, `std::map`, `std::array` basics
- [memory.md](memory.md) — Smart pointers, move semantics
- [templates.md](templates.md) — Generic programming underpinning the STL