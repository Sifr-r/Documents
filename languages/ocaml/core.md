# OCaml — Core Syntax

## Let Bindings

```ocaml
(* Top-level binding *)
let x = 42

(* Typed binding *)
let pi : float = 3.14159

(* Local binding with let...in *)
let double n =
  let two_n = n * 2 in
  two_n + 1

(* Recursive binding *)
let rec factorial = function
  | 0 -> 1
  | n -> n * factorial (n - 1)

(* Mutually recursive *)
let rec even = function
  | 0 -> true
  | n -> odd (n - 1)
and odd = function
  | 0 -> false
  | n -> even (n - 1)

(* Mutable reference *)
let counter = ref 0
counter := !counter + 1   (* increment *)
```

## Primitive Types

| Type | Description |
|---|---|
| `int` | 63-bit signed integer (64-bit platform) |
| `float` | IEEE 754 double-precision float |
| `string` | Immutable byte sequence |
| `char` | Single byte (Latin-1, not Unicode) |
| `bool` | `true` / `false` |
| `unit` | `()` — no meaningful value |
| `'a list` | Immutable singly-linked list |
| `'a array` | Mutable fixed-size array |
| `'a option` | `Some of 'a` / `None` |
| `('a, 'b) result` | `Ok of 'a` / `Error of 'b` |

```ocaml
let n    = 42             (* int *)
let f    = 3.14           (* float *)
let s    = "hello"        (* string *)
let c    = 'A'            (* char *)
let b    = true           (* bool *)
let u    = ()             (* unit *)
let xs   = [1; 2; 3]     (* int list *)
let arr  = [|1; 2; 3|]   (* int array *)
let opt  = Some 42        (* int option *)
let res  = Ok "ok"        (* (string, 'a) result *)
```

## Functions

```ocaml
(* Named function *)
let add a b = a + b

(* With type annotations *)
let greet (name : string) : string = "Hello, " ^ name

(* Anonymous function (lambda) *)
let double = fun x -> x * 2
let doubled = List.map (fun x -> x * 2) [1; 2; 3]

(* Partial application *)
let add5 = add 5
let ten = add5 5   (* 10 *)

(* Labeled and optional arguments *)
let create ~name ?(age = 0) () = (name, age)
let person = create ~name:"Ada" ~age:30 ()

(* Higher-order function *)
let apply f x = f x
let result = apply (fun x -> x + 1) 41  (* 42 *)
```

## Tuples

```ocaml
let pair   = (1, "hello")
let triple = (1, 2.0, "three")

(* Destructuring *)
let (x, y) = (10, 20)
let (_, second, _) = triple

(* In function parameters *)
let swap (a, b) = (b, a)
```

## Pattern Matching

```ocaml
(* Basic match — must be exhaustive *)
let describe = function
  | 0 -> "zero"
  | 1 -> "one"
  | n when n > 1 -> "positive"
  | _ -> "negative"

(* Matching options *)
let unwrap_or default = function
  | Some x -> x
  | None   -> default

(* Matching lists *)
let rec sum = function
  | []       -> 0
  | x :: rest -> x + sum rest

(* Matching multiple values *)
let both_some a b = match a, b with
  | Some x, Some y -> Some (x, y)
  | _              -> None

(* Or-patterns *)
let is_weekend = function
  | "Saturday" | "Sunday" -> true
  | _ -> false
```

## Variants

```ocaml
(* Algebraic data type *)
type color = Red | Green | Blue

type shape =
  | Circle of float
  | Rectangle of float * float
  | Triangle of { base: float; height: float }

let area = function
  | Circle r         -> Float.pi *. r *. r
  | Rectangle (w, h) -> w *. h
  | Triangle t       -> 0.5 *. t.base *. t.height

(* Polymorphic variants — no type declaration needed *)
let to_string = function
  | `Int n    -> string_of_int n
  | `Float f  -> string_of_float f
  | `Str s    -> s

(* Recursive variant *)
type 'a tree =
  | Leaf
  | Node of 'a * 'a tree * 'a tree

let rec depth = function
  | Leaf -> 0
  | Node (_, l, r) -> 1 + max (depth l) (depth r)
```

## Records

```ocaml
type person = {
  name : string;
  age  : int;
  mutable score : int;   (* mutable field *)
}

let alice = { name = "Alice"; age = 30; score = 0 }

(* Field access *)
let n = alice.name

(* Mutable update *)
alice.score <- 100

(* Functional update (creates new record) *)
let older = { alice with age = alice.age + 1 }

(* Pattern match on record *)
let greet { name; age; _ } = Printf.sprintf "%s (%d)" name age
```

## Exceptions and Result Type

```ocaml
(* Raising exceptions *)
exception Not_found of string
let find_user name =
  if name = "" then raise (Not_found "empty name")
  else name

(* Handling exceptions *)
let safe_find name =
  try Some (find_user name)
  with Not_found _ -> None

(* Result type — preferred over exceptions *)
let divide a b =
  if b = 0 then Error "division by zero"
  else Ok (a / b)

let () = match divide 10 2 with
  | Ok v    -> Printf.printf "Result: %d\n" v
  | Error e -> Printf.printf "Error: %s\n" e

(* Result combinators *)
let map f = function Ok x -> Ok (f x) | Error e -> Error e
let bind f = function Ok x -> f x | Error e -> Error e
```

## Modules and Signatures

```ocaml
(* Module *)
module Stack = struct
  type 'a t = 'a list

  let empty = []
  let push x s = x :: s
  let pop = function
    | []      -> None
    | x :: xs -> Some (x, xs)
  let is_empty = function [] -> true | _ -> false
end

(* Signature (interface) *)
module type STACK = sig
  type 'a t
  val empty   : 'a t
  val push    : 'a -> 'a t -> 'a t
  val pop     : 'a t -> ('a * 'a t) option
  val is_empty: 'a t -> bool
end

(* Module with signature constraint *)
module TypedStack : STACK = Stack

(* Functor — module parameterized by another module *)
module type ORDERED = sig
  type t
  val compare : t -> t -> int
end

module MakeSet (Ord : ORDERED) = struct
  type elt = Ord.t
  type t = elt list

  let empty = []
  let rec add x = function
    | [] -> [x]
    | h :: _ when Ord.compare x h = 0 -> [] (* already present *)
    | h :: t when Ord.compare x h < 0 -> x :: h :: t
    | h :: t -> h :: add x t
end
```

## See Also

- [README.md](README.md) — overview and quick reference
