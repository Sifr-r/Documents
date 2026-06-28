# Elixir

BEAM language for scalable, fault-tolerant systems. Built on Erlang/OTP.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Pattern matching, immutability, pipe operator, modules |
| [otp.md](otp.md) | GenServer, Supervisor, Application, Task |
| [processes.md](processes.md) | spawn, send/receive, Agent, ETS |

## Quick Reference

```elixir
# Pattern matching
{:ok, value} = {:ok, 42}
[head | tail] = [1, 2, 3]

# Pipe operator
result = input
|> String.trim()
|> String.downcase()
|> String.split()

# Modules
defmodule Math do
  def add(a, b), do: a + b
  defp subtract(a, b), do: a - b  # private
end

# Structs
defmodule User do
  defstruct [:name, :age]
end
alice = %User{name: "Alice", age: 30}

# Guards
def sign(n) when n > 0, do: :positive
def sign(0), do: :zero
def sign(n) when n < 0, do: :negative
```