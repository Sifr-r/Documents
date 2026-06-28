# F# — Core Syntax

## Let Bindings

```fsharp
// Immutable binding (default)
let x = 42
let name = "Alice"

// Typed binding
let pi : float = 3.14159

// Mutable binding
let mutable count = 0
count <- count + 1

// Reference cell
let r = ref 0
r := !r + 1

// Function binding
let add a b = a + b

// Local binding with let...in (expressions)
let double n =
    let twoN = n * 2
    twoN + 1

// Recursive function
let rec factorial n =
    if n <= 1 then 1
    else n * factorial (n - 1)

// Mutually recursive
let rec even n = if n = 0 then true else odd (n - 1)
and odd n = if n = 0 then false else even (n - 1)

// Top-level do binding
let () = printfn "Hello, world!"
```

## Primitive Types

| Type | Description |
|---|---|
| `int` | 32-bit signed integer |
| `int64` | 64-bit signed integer |
| `float` | 64-bit IEEE 754 float (`double`) |
| `float32` | 32-bit float |
| `decimal` | High-precision decimal |
| `string` | Immutable UTF-16 string |
| `char` | UTF-16 character |
| `bool` | `true` / `false` |
| `unit` | `()` — no meaningful value |
| `'a list` | Immutable singly-linked list |
| `'a array` | Mutable fixed-size array |
| `Map<'k, 'v>` | Immutable balanced tree map |
| `'a option` | `Some of 'a` / `None` |

```fsharp
let n   = 42              // int
let f   = 3.14            // float
let d   = 0.1M            // decimal
let s   = "hello"         // string
let c   = 'A'             // char
let b   = true            // bool
let u   = ()              // unit
let xs  = [1; 2; 3]      // int list
let arr = [|1; 2; 3|]    // int array
let m   = Map [("a", 1)] // Map<string, int>
let opt = Some 42         // int option
```

## Functions

```fsharp
// Named function
let greet name = sprintf "Hello, %s!" name

// With type annotations
let add (a: int) (b: int) : int = a + b

// Lambda (anonymous function)
let double = fun x -> x * 2
let doubled = [1; 2; 3] |> List.map (fun x -> x * 2)

// Partial application
let add5 = add 5
let ten = add5 5  // 10

// Currying: f a b is equivalent to (f a) b
let multiply x y = x * y
let times3 = multiply 3

// Tuple-style function
let addPair (a, b) = a + b
```

## Pipe Operator

```fsharp
// Single pipe |>
let sumOfSquares xs =
    xs
    |> List.map (fun x -> x * x)
    |> List.filter (fun x -> x > 10)
    |> List.sum

// Reverse pipe <|
let result = sprintf "value: %d" <| 42

// Composition >>
let processList = List.map (fun x -> x * 2) >> List.sum

// Composition <<
let processList2 = List.sum << List.map (fun x -> x * 2)
```

## Discriminated Unions

```fsharp
// Simple cases
type Color = Red | Green | Blue

// Cases with data
type Shape =
    | Circle of radius: float
    | Rectangle of width: float * height: float
    | Triangle of base_: float * height: float

let area shape =
    match shape with
    | Circle r -> Math.PI * r * r
    | Rectangle (w, h) -> w * h
    | Triangle (b, h) -> 0.5 * b * h

// Recursive union
type Tree<'a> =
    | Leaf
    | Node of value: 'a * left: Tree<'a> * right: Tree<'a>

// Single-case DU for wrappers
type EmailAddress = EmailAddress of string

// Methods on DUs
type Status =
    | Active
    | Inactive
    member this.DisplayName =
        match this with
        | Active -> "Active"
        | Inactive -> "Inactive"
```

## Record Types

```fsharp
type Person = {
    Name: string
    Age: int
    mutable Score: int   // mutable field
}

let alice = { Name = "Alice"; Age = 30; Score = 0 }

// Field access
let n = alice.Name

// Mutable update
alice.Score <- 100

// Copy-and-update expression
let older = { alice with Age = alice.Age + 1 }

// Pattern match on record
let describe { Name = name; Age = age } =
    sprintf "%s is %d years old" name age

// Record with members
type Vector2 = {
    X: float
    Y: float
} with
    member this.Length = sqrt (this.X ** 2 + this.Y ** 2)
    static member Zero = { X = 0.0; Y = 0.0 }
```

## Pattern Matching

```fsharp
// Basic match
let describe x =
    match x with
    | 0 -> "zero"
    | n when n > 0 -> "positive"
    | _ -> "negative"

// Match on option
let unwrapOr defaultVal opt =
    match opt with
    | Some v -> v
    | None   -> defaultVal

// Match on list
let rec sum xs =
    match xs with
    | []       -> 0
    | h :: tail -> h + sum tail

// Tuple match
let classify (x, y) =
    match x, y with
    | 0, 0     -> "origin"
    | 0, _     -> "y-axis"
    | _, 0     -> "x-axis"
    | _        -> "other"

// Or-pattern
let isWeekend day =
    match day with
    | "Saturday" | "Sunday" -> true
    | _ -> false

// Type test
let describe2 (x: obj) =
    match x with
    | :? string as s -> sprintf "string: %s" s
    | :? int as n    -> sprintf "int: %d" n
    | _              -> "unknown"
```

## Active Patterns

```fsharp
// Single-case active pattern
let (|Even|Odd|) n =
    if n % 2 = 0 then Even else Odd

let describe n =
    match n with
    | Even -> "even"
    | Odd  -> "odd"

// Multi-case active pattern
let (|Positive|Negative|Zero|) n =
    if n > 0 then Positive
    elif n < 0 then Negative
    else Zero

// Partial active pattern
let (|StartsWith|_|) (prefix: string) (s: string) =
    if s.StartsWith(prefix) then Some s else None

let classify (s: string) =
    match s with
    | StartsWith "http" -> "URL"
    | StartsWith "@"    -> "mention"
    | _                 -> "text"
```

## Computation Expressions

```fsharp
// async — asynchronous workflows
let fetchAsync url =
    async {
        use client = new HttpClient()
        let! response = client.GetStringAsync(url) |> Async.AwaitTask
        return response.Length
    }

// task — .NET Task interop (F# 6+)
let fetchTask url =
    task {
        use client = new HttpClient()
        let! response = client.GetStringAsync(url)
        return response.Length
    }

// seq — lazy sequences
let naturals =
    seq {
        let mutable n = 0
        while true do
            yield n
            n <- n + 1
    }

// Custom computation expression (option builder)
type OptionBuilder() =
    member _.Bind(opt, f) = Option.bind f opt
    member _.Return(x) = Some x
    member _.ReturnFrom(x) = x
    member _.Zero() = None

let option = OptionBuilder()

let result = option {
    let! a = Some 1
    let! b = Some 2
    return a + b  // Some 3
}
```

## Type Providers

```fsharp
// JSON type provider (FSharp.Data)
#r "nuget: FSharp.Data"
open FSharp.Data

type GitHubUser = JsonProvider<"https://api.github.com/users/octocat">
let user = GitHubUser.GetSample()
printfn "%s" user.Name  // strongly typed access

// SQL type provider (FSharp.Data.Sql)
type Sql = SqlDataProvider<
    DatabaseVendor = Common.DatabaseProviderTypes.POSTGRESQL,
    ConnectionString = "Host=localhost;Database=mydb"
>
let ctx = Sql.GetDataContext()
let users = ctx.Main.Users |> Seq.toList
```

## See Also

- [README.md](README.md) — overview and quick reference
