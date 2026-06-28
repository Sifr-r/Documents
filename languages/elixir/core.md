# Elixir — Core Syntax

## Pattern Matching

The `=` operator is the match operator. It binds variables on the left to values on the right.

```elixir
# Variable binding
x = 42
{a, b} = {1, 2}
[head | tail] = [1, 2, 3]  # head = 1, tail = [2, 3]

# Pin operator — match against existing value
^x = 42   # ok
^x = 99   # ** (MatchError)

# Underscore ignores values
{_status, result} = {:ok, 42}
```

## Immutability

All data in Elixir is immutable. Operations return new values.

```elixir
list = [1, 2, 3]
new_list = [0 | list]  # [0, 1, 2, 3]
# list is still [1, 2, 3]

map = %{a: 1}
new_map = %{map | a: 2}  # %{a: 2}
# map is still %{a: 1}
```

## Basic Types

| Type | Example | Notes |
|---|---|---|
| Atom | `:ok`, `:error`, `true` | Constant name, stored as-is |
| Integer | `42`, `0xFF`, `0b1010` | Arbitrary precision |
| Float | `3.14`, `1.0e-10` | 64-bit IEEE 754 |
| Boolean | `true`, `false` | Atoms under the hood |
| String | `"hello"` | UTF-8 encoded binary |
| List | `[1, 2, 3]` | Linked list, O(n) access |
| Tuple | `{1, :ok}` | Fixed size, O(1) access |
| Map | `%{key: "val"}` | Key-value, any key type |
| Binary | `<<1, 2, 3>>` | Raw bytes / bitstrings |

```elixir
# Strings are binaries
is_binary("hello")  # true
byte_size("café")   # 5 (UTF-8)
String.length("café")  # 4 (codepoints)

# Lists — prepend is O(1), append is O(n)
[1] ++ [2, 3]      # [1, 2, 3]
[1, 2, 3] -- [2]   # [1, 3]

# Keyword lists — list of 2-tuples with atom keys
[name: "Ada", age: 30]  # same as [{:name, "Ada"}, {:age, 30}]

# Maps
user = %{name: "Ada", age: 30}
user.name           # "Ada"
user[:name]         # "Ada"
Map.get(user, :name)  # "Ada"
%{user | age: 31}   # update — returns new map
```

## Pipe Operator

Passes the result of the left expression as the first argument to the right.

```elixir
# Without pipe
Enum.sort(Enum.filter(Enum.map([1, 2, 3, 4], &(&1 * 2)), &(&1 > 4)))

# With pipe — reads top to bottom
[1, 2, 3, 4]
|> Enum.map(&(&1 * 2))
|> Enum.filter(&(&1 > 4))
|> Enum.sort()
# [6, 8]
```

## Modules and Functions

```elixir
defmodule Math do
  # Public function
  def add(a, b), do: a + b

  # Multi-clause function
  def factorial(0), do: 1
  def factorial(n) when is_integer(n) and n > 0 do
    n * factorial(n - 1)
  end

  # Private function
  defp secret, do: 42

  # Default arguments
  def greet(name, greeting \\ "Hello") do
    "#{greeting}, #{name}!"
  end
end

Math.add(1, 2)        # 3
Math.factorial(5)      # 120
Math.greet("Ada")      # "Hello, Ada!"
```

## Guards

```elixir
def classify(n) when is_integer(n) and n > 0, do: :positive
def classify(n) when is_integer(n) and n < 0, do: :negative
def classify(0), do: :zero

# Common guard functions:
# is_integer/1, is_float/1, is_number/1, is_atom/1
# is_binary/1, is_list/1, is_map/1, is_tuple/1
# is_nil/1, is_boolean/1, is_function/1
```

## Control Flow

```elixir
# if / else
if x > 0, do: :positive, else: :non_positive

# cond — multiple conditions (like else-if chain)
cond do
  x > 0 -> :positive
  x < 0 -> :negative
  true  -> :zero
end

# case — pattern matching with guards
case {:ok, 42} do
  {:ok, val} when val > 0 -> {:positive, val}
  {:ok, _}                -> :ok_zero
  {:error, reason}        -> {:failed, reason}
end

# with — chain pattern matches, short-circuits on mismatch
with {:ok, file} <- File.open("data.txt"),
     {:ok, body} <- IO.read(file, :all),
     File.close(file) do
  body
else
  {:error, reason} -> {:failed, reason}
  _                -> :unexpected
end
```

## Anonymous Functions

```elixir
add = fn a, b -> a + b end
add.(1, 2)  # 3 — note the dot for invocation

# Shorthand with &
double = &(&1 * 2)
double.(5)  # 10

# Capture named function
fun = &Enum.map/2
fun.([1, 2], &(&1 + 1))  # [2, 3]
```

## Structs and Protocols

```elixir
# Struct — defined inside a module
defmodule User do
  defstruct name: "", age: 0

  # Structs enforce keys at compile time
  def adult?(%User{age: age}), do: age >= 18
end

user = %User{name: "Ada", age: 30}
user.name  # "Ada"
%{user | age: 31}  # update

# Protocol — polymorphism across types
defprotocol Size do
  def size(data)
end

defimpl Size, for: BitString do
  def size(s), do: byte_size(s)
end

defimpl Size, for: Map do
  def size(m), do: map_size(m)
end

Size.size("hello")  # 5
Size.size(%{a: 1})  # 1
```

## See Also

- [otp.md](otp.md) — GenServer, Supervisor, Application behaviours
- [processes.md](processes.md) — spawn, send/receive, ETS
