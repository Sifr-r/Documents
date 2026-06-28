# Ruby — Metaprogramming

Ruby's metaprogramming allows defining methods, intercepting calls, and
modifying classes at runtime. Power comes with responsibility — use sparingly.

## define_method

Define methods dynamically at runtime.

```ruby
class User
  %i[name email role].each do |attr|
    define_method(attr) do
      instance_variable_get("@#{attr}")
    end

    define_method("#{attr}=") do |value|
      instance_variable_set("@#{attr}", value)
    end
  end
end

user = User.new
user.name = "Ada"
user.name  # "Ada"
```

## method_missing & respond_to_missing?

Intercept calls to undefined methods. Always override `respond_to_missing?`
together with `method_missing`.

```ruby
class Config
  def initialize(data)
    @data = data
  end

  def method_missing(name, *args)
    key = name.to_s
    if @data.key?(key)
      @data[key]
    elsif key.end_with?("=") && @data.key?(key.chomp("="))
      @data[key.chomp("=")] = args.first
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    @data.key?(name.to_s) || super
  end
end

config = Config.new("host" => "localhost")
config.host        # "localhost"
config.respond_to?(:host)  # true
```

## send & public_send

Invoke methods by name dynamically.

```ruby
method_name = :upcase
"hello".send(method_name)       # "HELLO" — calls private methods too
"hello".public_send(method_name) # "HELLO" — only public methods

# Use cases
attributes = { name: "Ada", age: 30 }
user = User.new
attributes.each { |k, v| user.public_send("#{k}=", v) }

# Prefer public_send over send unless you explicitly need private access
```

## class_eval & instance_eval

Evaluate code in the context of a class or an instance.

```ruby
# class_eval — opens a class (like re-opening)
String.class_eval do
  def shout
    upcase + "!"
  end
end

"hello".shout  # "HELLO!"

# instance_eval — evaluate in context of a single object
str = "hello"
str.instance_eval do
  puts upcase      # self is the string
  puts self.class  # String
end

# class_eval with string (less common)
String.class_eval 'def whisper; downcase + "..."; end'
```

## include, extend, prepend

Three ways to mix modules into classes. Each changes the method resolution order.

```ruby
module Loggable
  def log(msg)
    puts "[#{self.class}] #{msg}"
  end
end

# include — adds module methods as instance methods
class Service
  include Loggable
end

Service.new.log("hello")  # instance method

# extend — adds module methods as class methods
class Service
  extend Loggable
end

Service.log("hello")  # class method

# prepend — inserts module before the class in the ancestor chain
# (module methods override class methods)
module Wrapper
  def run
    puts "before"
    super   # calls the original method
    puts "after"
  end
end

class Worker
  prepend Wrapper

  def run
    puts "work"
  end
end

Worker.new.run
# before
# work
# after
```

## Ancestors Chain

`ancestors` reveals the method lookup order.

```ruby
module A; end
module B; end

class Parent
  include A
end

class Child < Parent
  include B
end

Child.ancestors
# [Child, B, Parent, A, Object, Kernel, BasicObject]

# prepend changes the order
module C; end
Child.prepend(C)
Child.ancestors
# [C, Child, B, Parent, A, Object, Kernel, BasicObject]
```

The lookup order is: receiver's class → prepended modules → class → included
modules → superclass (repeat). `super` walks up this chain.

## self Context

`self` changes meaning depending on where you are.

```ruby
# Top-level: main
self          # main

# Inside a class definition
class Example
  self        # Example (the class)

  def instance_method
    self      # the instance
  end

  def self.class_method
    self      # Example (the class)
  end
end
```

## See Also

- [core.md](core.md) — basic syntax, types, method definitions
- [blocks.md](blocks.md) — blocks, procs, lambdas, Enumerable patterns