# Clojure

Dynamic, functional Lisp dialect on the JVM with immutable data structures.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, data structures, functions, destructuring |
| [sequences.md](sequences.md) | Lazy sequences, transducers, reducers |
| [atoms.md](atoms.md) | Atoms, refs, agents, STM, core.async |

## Quick Reference

```clojure
;; Immutable data
(def numbers [1 2 3])
(def person {:name "Alice" :age 30})
(def tags #{"clojure" "lisp"})

;; Functions
(defn greet [name] (str "Hello, " name))
(fn [x] (* x 2))  ;; anonymous
#(* % 2)          ;; reader macro

;; Threading
(->> numbers
     (map inc)
     (filter even?)
     (reduce +))

;; Destructuring
(let [{:keys [name age]} person] (str name age))
(let [[a b & rest] numbers] a)

;; Atoms (mutable references)
(def counter (atom 0))
(swap! counter inc)
@counter  ;; deref
```