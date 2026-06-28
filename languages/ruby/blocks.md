# Ruby — Blocks, Procs & Lambdas

Blocks are Ruby's core abstraction for passing chunks of code. Understanding
the differences between blocks, procs, and lambdas is essential for idiomatic Ruby.

## Blocks (Implicit)

A block is a chunk of code passed to a method. Every method can receive exactly
one implicit block — no parameter declaration needed.

```ruby
# yield invokes the block
def timer
  start = Time.now
  yield
  Time.now - start
end

elapsed = timer { sleep(0.5) }  # ~0.5

# block_given? checks if a block was passed
def optional
  if block_given?
    yield
  else
    "no block"
  end
end

optional              # "no block"
optional { "hello" }  # "hello"

# yield with arguments
def with_index(items)
  i = 0
  items.each do |item|
    yield(item, i)
    i += 1
  end
end

with_index(%w[a b c]) { |item, idx| puts "#{idx}: #{item}" }
```

## &block — Explicit Block Parameter

Capture the block as a Proc object for passing it along or storing it.

```ruby
def wrapper(&block)
  puts "before"
  block.call("arg")
  puts "after"
end

# Forwarding a block to another method
def delegator(&block)
  [1, 2, 3].each(&block)  # convert Proc back to block
end

# Ruby 3.1+ anonymous block forwarding
def anonymous(&)
  [1, 2, 3].each(&)
end
```

## Proc

A `Proc` is an objectified block. Created with `Proc.new` or `proc`.

```ruby
p = Proc.new { |x, y| x + y }
p.call(3, 4)  # 7
p[3, 4]       # 7 — alternative syntax
p.(3, 4)      # 7 — another alternative

# Proc ignores extra args (no error)
p = Proc.new { |x| x * 2 }
p.call(1, 2, 3)  # 2 — extra args ignored

# Proc's return exits the enclosing method
def proc_return
  p = Proc.new { return "from proc" }
  p.call
  "never reached"
end

proc_return  # "from proc"
```

## Lambda

Lambdas are like methods — strict about arity and `return` semantics.

```ruby
# Stabby lambda syntax (preferred)
l = ->(x, y) { x + y }
l.call(3, 4)  # 7

# Lambda literal
l = lambda { |x, y| x + y }

# Lambda enforces arity
l = ->(x) { x * 2 }
l.call(1, 2)  # ArgumentError: wrong number of arguments

# Lambda's return exits only the lambda itself
def lambda_return
  l = -> { return "from lambda" }
  l.call
  "from method"
end

lambda_return  # "from method"
```

## Proc vs Lambda Differences

| Feature | Proc | Lambda |
|---|---|---|
| Arity | Loose (extra args ignored) | Strict (ArgumentError) |
| `return` | Exits enclosing method | Exits only the lambda |
| `Kernel#lambda?` | `false` | `true` |
| Creation | `Proc.new`, `proc` | `lambda`, `->` |

## Enumerable Patterns

Ruby's `Enumerable` module powers most collection operations via blocks.

```ruby
# map / collect — transform
[1, 2, 3].map { |n| n * 2 }         # [2, 4, 6]
[1, 2, 3].map(&:to_s)               # ["1", "2", "3"]

# select / reject — filter
[1, 2, 3, 4].select(&:even?)        # [2, 4]
[1, 2, 3, 4].reject(&:even?)        # [1, 3]

# reduce / inject — accumulate
[1, 2, 3].reduce(0) { |sum, n| sum + n }  # 6
[1, 2, 3].reduce(:+)                       # 6 — symbol shorthand

# each_with_object — pass mutable accumulator
[1, 2, 3].each_with_object({}) { |n, h| h[n] = n * 2 }
# { 1 => 2, 2 => 4, 3 => 6 }

# find / detect — first match
[1, 2, 3].find { |n| n > 1 }        # 2

# any? / all? / none?
[1, 2, 3].any?(&:even?)             # true
[1, 2, 3].all? { |n| n > 0 }        # true
[1, 2, 3].none?(&:negative?)        # true
```

## See Also

- [core.md](core.md) — basic syntax, types, method definitions
- [metaprogramming.md](metaprogramming.md) — define_method, class_eval, ancestors