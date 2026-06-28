# C++ — Memory Management

## Stack vs Heap

| | Stack | Heap |
|---|-------|------|
| Allocation | Automatic, compiler-managed | Manual or via smart pointers |
| Lifetime | Scope-bound | Explicit, until `delete` or smart pointer dies |
| Speed | Fast (pointer bump) | Slower (allocator overhead) |
| Size | Limited (MB) | Large (GB) |

```cpp
int  stack_val = 42;                    // stack
int* heap_val  = new int{42};           // heap — raw, avoid
delete heap_val;                        // manual cleanup
```

## Smart Pointers

### `unique_ptr` — Exclusive Ownership

```cpp
#include <memory>

auto p = std::make_unique<Widget>(arg1, arg2);  // preferred
std::unique_ptr<Widget> p2(new Widget);          // less safe

p->method();                                     // dereference
auto raw = p.get();                              // raw pointer (no transfer)

auto p3 = std::move(p);                          // transfer ownership
// p is now nullptr

// Custom deleter
auto p4 = std::unique_ptr<FILE, decltype(&fclose)>{
    fopen("f.txt", "r"), fclose
};
```

### `shared_ptr` — Shared Ownership

```cpp
auto s1 = std::make_shared<Widget>();            // one allocation
std::shared_ptr<Widget> s2 = s1;                 // ref count = 2
auto s3 = s1;                                    // ref count = 3

s1.use_count();                                  // 3
s1.reset();                                      // release this reference

// Aliasing — points to member, keeps parent alive
auto s4 = std::shared_ptr<int>(s2, &s2->member);
```

### `weak_ptr` — Non-Owning Reference

```cpp
std::weak_ptr<Widget> w = s2;

if (auto locked = w.lock()) {                    // promotes to shared_ptr
    locked->method();                            // safe to use
} else {
    // object already destroyed
}

w.expired();                                     // true if destroyed
w.use_count();                                   // shared count (0 if expired)
```

## `make_unique` / `make_shared`

```cpp
auto u = std::make_unique<Widget>(1, "two");     // C++14
auto s = std::make_shared<Widget>(1, "two");     // single allocation for control block + object

// Avoid:
std::shared_ptr<Widget> bad(new Widget);          // two allocations, exception-unsafe
```

## RAII (Resource Acquisition Is Initialization)

Resources are acquired in constructors and released in destructors. No manual cleanup needed.

```cpp
class File {
    FILE* handle_;
public:
    explicit File(const char* path) : handle_{fopen(path, "r")} {
        if (!handle_) throw std::runtime_error("open failed");
    }
    ~File() { if (handle_) fclose(handle_); }

    File(const File&) = delete;             // no copy
    File(File&& other) noexcept             // move
        : handle_{std::exchange(other.handle_, nullptr)} {}
    File& operator=(File&& other) noexcept {
        if (this != &other) {
            if (handle_) fclose(handle_);
            handle_ = std::exchange(other.handle_, nullptr);
        }
        return *this;
    }
};
```

## Rule of 5

If you define any of these, define all 5:

```cpp
class Buffer {
    char* data_;
    size_t size_;
public:
    // 1. Destructor
    ~Buffer() { delete[] data_; }

    // 2. Copy constructor
    Buffer(const Buffer& other)
        : data_{new char[other.size_]}, size_{other.size_} {
        std::copy(other.data_, other.data_ + size_, data_);
    }

    // 3. Copy assignment
    Buffer& operator=(const Buffer& other) {
        if (this != &other) {
            delete[] data_;
            size_ = other.size_;
            data_ = new char[size_];
            std::copy(other.data_, other.data_ + size_, data_);
        }
        return *this;
    }

    // 4. Move constructor
    Buffer(Buffer&& other) noexcept
        : data_{std::exchange(other.data_, nullptr)},
          size_{std::exchange(other.size_, 0)} {}

    // 5. Move assignment
    Buffer& operator=(Buffer&& other) noexcept {
        if (this != &other) {
            delete[] data_;
            data_ = std::exchange(other.data_, nullptr);
            size_ = std::exchange(other.size_, 0);
        }
        return *this;
    }
};
```

## Move Semantics & `std::move`

```cpp
std::string s1 = "hello";
std::string s2 = std::move(s1);           // s1 moved-from, valid but unspecified
std::string s3 = std::move(s2);           // cheap pointer swap, no allocation

// Move in return — RVO is better, don't std::move return values
std::string make() {
    std::string result = "built";
    return result;                        // RVO — no copy, no move
    // return std::move(result);          // WRONG — prevents RVO
}
```

## Resource Management Patterns

```cpp
// Scope guard idiom
class ScopeGuard {
    std::function<void()> cleanup_;
public:
    explicit ScopeGuard(std::function<void()> f) : cleanup_{std::move(f)} {}
    ~ScopeGuard() { cleanup_(); }
};

// RAII lock
class Lock {
    std::mutex& mtx_;
public:
    explicit Lock(std::mutex& m) : mtx_{m} { mtx_.lock(); }
    ~Lock() { mtx_.unlock(); }
};
```

## See Also

- [core.md](core.md) — Type system, exception handling
- [stl.md](stl.md) — Containers, algorithms
- [templates.md](templates.md) — `if constexpr`, template metaprogramming