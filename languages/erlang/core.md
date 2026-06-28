# Erlang — Core Syntax

## Data Types

| Type | Example | Description |
|---|---|---|
| Atom | `hello`, `'Hello World'` | Named constants |
| Integer | `42`, `$A` (65) | Arbitrary precision |
| Float | `3.14`, `1.0e-10` | IEEE 64-bit |
| List | `[1, 2, 3]`, `[H\|T]` | Linked list |
| Tuple | `{ok, Value}` | Fixed-size container |
| Binary | `<<"hello">>`, `<<1,2,3>>` | Byte sequence |
| Map | `#{key => value}` | Key-value store |
| Pid | `<0.42.0>` | Process identifier |
| Reference | `#Ref<...>` | Unique identifier |
| Fun | `fun(X) -> X end` | Anonymous function |

```erlang
% Atoms
ok.
error.
'Multi Word Atom'.

% Numbers
42.           % integer
$A.           % character code (65)
3.14.         % float
2#1010.       % binary (10)
16#ff.        % hex (255)
```

## Pattern Matching

The `=` operator is a match, not assignment. It binds unbound variables and verifies structure.

```erlang
% Simple binding
X = 42.
{A, B} = {1, 2}.          % A=1, B=2
[Head | Tail] = [1, 2, 3]. % Head=1, Tail=[2,3]

% Nested patterns
{ok, {Name, Age}} = {ok, {"Alice", 30}}.

% Underscore — wildcard (matches anything, no binding)
{ok, _} = {ok, anything}.

% Pin operator (^) — match against bound variable
X = 42.
{X, ^X} = {42, 42}.       % ok
% {X, ^X} = {42, 99}.     % ** exception: no match
```

## Guards

```erlang
% Function clause guards
classify(N) when is_integer(N), N > 0 -> positive;
classify(N) when is_integer(N), N < 0 -> negative;
classify(0) -> zero.

% Guard expressions: is_atom/1, is_binary/1, is_integer/1,
% is_list/1, is_map/1, is_number/1, is_pid/1, is_tuple/1,
% element/2, hd/1, tl/1, length/1, map_size/1, tuple_size/1

% if expression (guards only, no pattern matching)
if
    X > 0 -> positive;
    X < 0 -> negative;
    true  -> zero   % 'true' acts as else
end.

% case expression (patterns + guards)
case {X, Y} of
    {A, B} when A > B -> greater;
    {A, A}            -> equal;
    _                 -> less
end.
```

## Functions and Recursion

```erlang
-module(math_funcs).
-export([factorial/1, fib/1]).

% Factorial (tail recursive)
factorial(N) -> factorial(N, 1).
factorial(0, Acc) -> Acc;
factorial(N, Acc) when N > 0 -> factorial(N - 1, N * Acc).

% Fibonacci
fib(0) -> 0;
fib(1) -> 1;
fib(N) when N > 1 -> fib(N - 1) + fib(N - 2).

% Tail-recursive fib with accumulator
fib_tail(N) -> fib_tail(N, 0, 1).
fib_tail(0, A, _) -> A;
fib_tail(N, A, B) when N > 0 -> fib_tail(N - 1, B, A + B).

% Anonymous functions
Double = fun(X) -> X * 2 end.
Double(21).  % 42

% Higher-order
lists:map(fun(X) -> X * 2 end, [1, 2, 3]).  % [2, 4, 6]
lists:filter(fun(X) -> X rem 2 == 0 end, [1, 2, 3, 4]).  % [2, 4]
```

## List Comprehensions

```erlang
% Basic
[X * 2 || X <- [1, 2, 3, 4, 5]].
% [2, 4, 6, 8, 10]

% With filter
[X || X <- [1, 2, 3, 4, 5], X rem 2 == 0].
% [2, 4]

% Multiple generators
[{X, Y} || X <- [1, 2], Y <- [a, b]].
% [{1,a}, {1,b}, {2,a}, {2,b}]

% QuickSort
qsort([]) -> [];
qsort([Pivot | Rest]) ->
    qsort([X || X <- Rest, X < Pivot])
    ++ [Pivot] ++
    qsort([X || X <- Rest, X >= Pivot]).
```

## Binary Pattern Matching

```erlang
% Construction
<<A, B, C>> = <<1, 2, 3>>.
<<Name:32/binary, Age:8>> = Data.

% Pattern matching with size specifiers
<<X:16/big, Y:16/little>> = Bin.
<<Str:3/binary, _/binary>> = <<"Hello World">>.  % Str = <<"Hel">>

% Type specifiers: integer, float, binary, utf8, utf16
<<F:64/float>> = <<3.14:64/float>>.
<<Char/utf8, Rest/binary>> = <<"Hello">>.

% Binary comprehension
<< <<(X * 2)>> || X <- [1, 2, 3] >>.
% <<2, 4, 6>>
```

## Records

Defined at compile time with `-record`.

```erlang
-record(user, {
    name :: string(),
    age  :: non_neg_integer(),
    email = "" :: string()
}).

% Create
User = #user{name = "Alice", age = 30}.

% Access
User#user.name.     % "Alice"
User#user.age.      % 30

% Update (creates new record)
User2 = User#user{age = 31}.

% Pattern matching
#user{name = Name, age = Age} = User.
```

## Maps

```erlang
% Create
M = #{name => "Alice", age => 30}.

% Access
maps:get(name, M).         % "Alice"
#{name := Name} = M.       % Name = "Alice" (pattern match)

% Update / add
M2 = M#{age => 31}.                   % update existing
M3 = M#{email => "alice@example.com"}. % add new key (=>)

% Remove
M4 = maps:remove(email, M3).

% Map operations
maps:keys(M).     % [age, name]
maps:values(M).   % [30, "Alice"]
maps:map(fun(K, V) -> ... end, M).
maps:filter(fun(K, V) -> ... end, M).
```

## See Also

- [otp.md](otp.md) — gen_server, supervisor, application behaviours
- [concurrency.md](concurrency.md) — spawn, send/receive, links, monitors
