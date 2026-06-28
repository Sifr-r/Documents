# Ruby — Core Syntax & Types

Everything in Ruby is an object — even `nil`, `true`, and integers are instances
of classes with methods.

## Basic Types

| Type | Class | Example |
|---|---|---|
| Integer | `Integer` | `42`, `-7`, `0xFF` |
| Float | `Float` | `3.14`, `1.5e-3` |
| String | `String` | `"hello"`, `'world'` |
| Symbol | `Symbol` | `:name`, `:"multi-word"` |
| Array | `Array` | `[1, 2, 3]`, `%w[a b c]` |
| Hash | `Hash` | `{ key: "value" }`, `{ "a" => 1 }` |
| Range | `Range` | `1..10`, `1...10` (exclusive) |
| Boolean | `TrueClass` / `FalseClass` | `true`, `false` |
| Nil | `NilClass` | `nil` |

```ruby
42.class           # Integer
nil.class          # NilClass
true.class         # TrueClass
:symbol.class      # Symbol

# Symbols vs Strings
:symbol.object_id == :symbol.object_id  # true — same object
"string".object_id == "string".object_id # false — different objects
```

## Variables

```ruby
local       = "local variable"
@instance   = "instance variable (per object)"
@@class     = "class variable (shared in hierarchy)"
$global     = "global variable"
CONSTANT    = "constants (warning on reassign)"
```

Constants start with uppercase. Ruby warns but does not prevent reassignment.

```ruby
MY_CONST = 42
MY_CONST = 99  # warning: already initialized constant
```

## Methods

```ruby
# Default parameters
def greet(name = "World")
  "Hello, #{name}!"
end

# Keyword arguments
def create_user(name:, age: 18, admin: false)
  { name: name, age: age, admin: admin }
end

create_user(name: "Ada", admin: true)

# Splat operator — gather remaining args
def log(level, *messages)
  messages.each { |msg| puts "[#{level}] #{msg}" }
end

log("INFO", "started", "processing", "done")

# Double splat — gather keyword args
def config(**options)
  options
end

config(host: "localhost", port: 3000)

# Implicit return — last expression is returned
def add(a, b)
  a + b  # no `return` needed
end

# Predicate and bang methods (convention)
[].empty?       # predicate — returns boolean
"hello".upcase! # bang — mutates receiver (or nil if no change)
```

## Control Flow

```ruby
# if / unless
if x > 0
  "positive"
elsif x < 0
  "negative"
else
  "zero"
end

# Modifier form (postfix)
puts "positive" if x > 0
puts "error" unless valid

# unless — opposite of if
unless user.nil?
  user.name
end

# case / when
case value
when 1, 2
  "one or two"
when 3..10
  "between 3 and 10"
when String
  "a string: #{value}"
when /^[A-Z]+$/
  "uppercase letters"
else
  "something else"
end

# Loops
[1, 2, 3].each { |n| puts n }        # preferred

for n in [1, 2, 3]                    # rarely used
  puts n
end

while x > 0
  x -= 1
end

until x == 0                          # opposite of while
  x -= 1
end

loop do                              # infinite loop
  break if condition
end
```

## Blocks, Procs, Lambdas

```ruby
# Block — implicit
def twice
  yield
  yield
end

twice { puts "hello" }

# Block with block_given?
def maybe
  yield if block_given?
end

# Explicit &block parameter
def with_block(&block)
  block.call("arg")
end

# Proc — created with Proc.new or proc
p = Proc.new { |x| x * 2 }
p.call(5)  # 10

# Lambda — strict arity, return from lambda
l = ->(x) { x * 2 }
l.call(5)  # 10
l = lambda { |x| x * 2 }  # alternative syntax

# Symbol-to-proc shorthand
["a", "b", "c"].map(&:upcase)  # ["A", "B", "C"]
```

## String Interpolation

```ruby
name = "Ada"
"Hello, #{name}"           # "Hello, Ada"
'Hello, #{name}'           # "Hello, \#{name}" — no interpolation

# Heredoc
sql = <<~SQL
  SELECT * FROM users
  WHERE name = #{name}
SQL
```

## See Also

- [blocks.md](blocks.md) — blocks, procs, lambdas, Enumerable in depth
- [metaprogramming.md](metaprogramming.md) — define_method, method_missing, eval