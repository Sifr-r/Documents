# F#

Functional-first .NET language with type inference, discriminated unions, and computation expressions.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, unions, records, pattern matching, computation expressions |

## Quick Reference

```fsharp
// Let bindings
let x = 42
let mutable count = 0
let add a b = a + b

// Pipe operator
let result = [1; 2; 3] |> List.map (fun x -> x * 2) |> List.sum

// Discriminated unions
type Shape =
    | Circle of radius: float
    | Rect of width: float * height: float

// Records
type Person = { Name: string; Age: int }

// Pattern matching
let describe x =
    match x with
    | 0 -> "zero"
    | _ -> "other"

// Async workflow
async {
    let! data = fetchDataAsync()
    return processData data
}

// Computation expression
let maybe = option {
    let! a = Some 1
    let! b = Some 2
    return a + b
}
```
