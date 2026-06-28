# OCaml

ML-family functional language with strong type inference, pattern matching, and a powerful module system.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, pattern matching, variants, modules, exceptions |

## Quick Reference

```ocaml
(* Let bindings *)
let x = 42
let y : float = 3.14
let add a b = a + b

(* Pattern matching *)
match value with
| Some x -> x
| None   -> 0

(* Variants *)
type shape =
  | Circle of float
  | Rect of float * float

(* Pipe operator *)
let result = [1; 2; 3] |> List.map (fun x -> x * 2) |> List.fold_left (+) 0

(* Option / Result *)
let safe_div a b = if b = 0 then None else Some (a / b)
let parse s = try Ok (int_of_string s) with Failure _ -> Error "not an int"

(* Modules *)
module Stack = struct
  type 'a t = 'a list
  let empty = []
  let push x s = x :: s
  let pop = function [] -> None | x :: rest -> Some (x, rest)
end
```
