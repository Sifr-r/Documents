# Julia

High-performance dynamic language for scientific computing and data science.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Types, multiple dispatch, arrays, broadcasting |

## Quick Reference

```julia
# Multiple dispatch
function process(x::Int)
    return x * 2
end
function process(x::String)
    return uppercase(x)
end

# Broadcasting
result = sin.(collect(0:0.1:2π))

# Comprehensions
squares = [x^2 for x in 1:10 if x % 2 == 0]

# Pipe operator
result = 1:10 |> collect |> x -> filter(isodd, x) |> sum

# Type annotations
function add(x::T, y::T) where T
    return x + y
end

# Structs
struct Point
    x::Float64
    y::Float64
end
```