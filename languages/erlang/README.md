# Erlang

Concurrent, fault-tolerant language for telecom-grade systems. Runs on BEAM.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Pattern matching, recursion, list comprehensions, guards |
| [otp.md](otp.md) | gen_server, supervisor, application behaviours |
| [concurrency.md](concurrency.md) | spawn, send/receive, processes, links, monitors |

## Quick Reference

```erlang
% Pattern matching
{X, Y} = {1, 2}.
[Head | Tail] = [1, 2, 3].

% Functions
fact(0) -> 1;
fact(N) when N > 0 -> N * fact(N - 1).

% List comprehension
Squares = [X * X || X <- [1, 2, 3, 4, 5], X rem 2 == 0].

% Processes
Pid = spawn(fun() -> receive
    {From, Msg} -> From ! {self(), ok}
end end).
Pid ! {self(), hello}.

% Records
-record(user, {name, age}).
User = #user{name = "Alice", age = 30}.
```