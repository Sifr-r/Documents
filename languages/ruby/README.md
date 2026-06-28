# Ruby

Modern Ruby (3.2+) reference. Covers syntax, blocks, metaprogramming,
and Rails-adjacent patterns.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, variables, methods, control flow, blocks |
| [blocks.md](blocks.md) | Blocks, procs, lambdas, Enumerable patterns |
| [metaprogramming.md](metaprogramming.md) | define_method, method_missing, eval, ancestors |

## Quick Reference

```ruby
# Safe navigation (&.)
user&.address&.city

# Hash merging
defaults = { host: "localhost", port: 3000 }
config = { **defaults, port: 8080 }

# Block
[1, 2, 3].each { |n| puts n }
[1, 2, 3].map { |n| n * 2 }

# Yield
def wrapper
  puts "before"
  yield if block_given?
  puts "after"
end

# Enumerable methods
%w[a b c].map(&:upcase)            # ["A", "B", "C"]
[1, 2, 3, 4].select(&:even?)       # [2, 4]
[1, 2, 3].reduce(0) { |sum, n| sum + n }  # 6

# Pattern matching (Ruby 3.0+)
case [0, 1]
in [0, x]
  puts x  # 1
in [_, _] => arr
  puts arr
end
```