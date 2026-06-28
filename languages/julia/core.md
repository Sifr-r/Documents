# Julia — Core Syntax

## Basic Types

| Type | Description |
|---|---|
| `Int8`, `Int16`, `Int32`, `Int64`, `Int128` | Signed integers |
| `UInt8`, `UInt16`, `UInt32`, `UInt64`, `UInt128` | Unsigned integers |
| `Float16`, `Float32`, `Float64` | IEEE 754 floats |
| `Bool` | `true` / `false` |
| `Char` | Single Unicode character |
| `String` | UTF-8 encoded text |
| `Array{T,N}` | N-dimensional array |
| `Tuple` | Fixed-size heterogeneous collection |
| `NamedTuple` | Tuple with named fields |
| `Dict{K,V}` | Hash map |

```julia
x::Int64 = 42
pi::Float64 = 3.14159
name::String = "Ada"
c::Char = 'π'

# Type promotion
1 + 1.5    # Int + Float64 → Float64
```

## Functions and Type Annotations

```julia
# Full form
function add(x::Number, y::Number)::Number
    return x + y
end

# Short form
square(x) = x^2

# Parametric methods with where
function first_element(x::AbstractArray{T}) where T
    return x[1]
end

# Multiple dispatch — different methods per type
process(x::Int) = x * 2
process(x::String) = uppercase(x)
process(x::Array) = length(x)

# Default and keyword arguments
function greet(name="World"; greeting="Hello")
    "$greeting, $name!"
end
greet("Ada", greeting="Hi")
```

## Multiple Dispatch

The runtime selects the most specific method matching the argument types.

```julia
collide(a::Asteroid, b::Asteroid) = "rock hits rock"
collide(a::Asteroid, b::Spaceship) = "asteroid hits ship"
collide(a::Spaceship, b::Spaceship) = "ship hits ship"

# Julia picks the right method based on runtime types
collide(obj1, obj2)
```

## Abstract and Concrete Types

```julia
# Abstract type — cannot be instantiated
abstract type Shape end

# Concrete subtypes
struct Circle <: Shape
    radius::Float64
end

struct Rectangle <: Shape
    width::Float64
    height::Float64
end

# Method on abstract type (dispatched for all subtypes)
area(s::Shape) = error("area not implemented for $(typeof(s))")
area(c::Circle) = π * c.radius^2
area(r::Rectangle) = r.width * r.height
```

## Structs and Mutable Structs

```julia
# Immutable (default, preferred)
struct Point
    x::Float64
    y::Float64
end

# Mutable
mutable struct Counter
    count::Int
end
c = Counter(0)
c.count += 1

# Parametric struct
struct Pair{T}
    first::T
    second::T
end
```

## Broadcasting (Dot Syntax)

```julia
# Apply function element-wise
sin.([0, π/2, π])       # → [0.0, 1.0, 0.0]

# Operator broadcasting
[1, 2, 3] .* 2           # → [2, 4, 6]
[1, 2, 3] .+ [10, 20, 30] # → [11, 22, 33]

# Chained broadcasting fuses (no intermediate arrays)
y = sin.(cos.(x))        # single loop
```

## Arrays and Comprehensions

```julia
# Array creation
a = [1, 2, 3]                  # Vector{Int64}
m = [1 2; 3 4]                 # Matrix{Int64}
z = zeros(Float64, 3, 3)      # 3×3 zero matrix
o = ones(5)                    # vector of ones
r = collect(1:0.5:5)          # range → array

# Comprehensions
squares = [x^2 for x in 1:10]
evens = [x for x in 1:20 if x % 2 == 0]
matrix = [i + j for i in 1:3, j in 1:3]

# Generator expressions (lazy, no array allocated)
total = sum(x^2 for x in 1:100)
```

## Pipe Operator

```julia
# Chain transformations left-to-right
result = 1:10 |> collect |> x -> filter(isodd, x) |> sum

# With functions
"hello world" |> uppercase |> println

# Equivalent to:
result = sum(filter(isodd, collect(1:10)))
```

## Macros and Metaprogramming

```julia
# Built-in macros
@time sqrt(1e6)          # measure execution time
@show x + y              # print expression and value
@assert x > 0 "x must be positive"

# Quote block — build expressions
expr = :(1 + 2)
eval(expr)  # → 3

# Define a macro
macro sayhello(name)
    return :(println("Hello, ", $name))
end
@sayhello "Ada"  # prints: Hello, Ada
```

## Modules and Packages

```julia
module MyModule
    export greet

    function greet(name)
        println("Hello, $name")
    end

    # Internal function (not exported)
    function helper()
        # ...
    end
end

# Using modules
using MyModule          # import exported names
import MyModule: greet  # import specific name
using Pkg
Pkg.add("DataFrames")   # install package
```

## See Also

- [README.md](README.md) — overview and quick reference
