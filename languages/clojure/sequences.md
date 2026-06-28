# Clojure — Sequences

## The seq Abstraction

All Clojure collections implement the seq abstraction. `seq` returns a
logical sequence view of any collection.

```clojure
(seq [1 2 3])     ; (1 2 3)
(seq {:a 1 :b 2}) ; ([:a 1] [:b 2])
(seq #{1 2 3})    ; (1 2 3)  (unordered)
(seq "abc")       ; (\a \b \c)

;; Core protocol: first, rest, cons
(first [1 2 3])  ; 1
(rest [1 2 3])   ; (2 3)
(cons 0 [1 2])   ; (0 1 2)
```

## Core Sequence Functions

```clojure
;; map — apply function to each element
(map inc [1 2 3])           ; (2 3 4)
(map + [1 2] [10 20])       ; (11 22)  (multiple collections)

;; filter — keep elements matching predicate
(filter even? [1 2 3 4 5])  ; (2 4)

;; reduce — accumulate
(reduce + 0 [1 2 3 4])       ; 10
(reduce + [1 2 3 4])         ; 10  (first elem as init)
(reduce conj [] [1 2 3])     ; [1 2 3]

;; take / drop
(take 3 [1 2 3 4 5])   ; (1 2 3)
(drop 2 [1 2 3 4 5])   ; (3 4 5)
(take-while #(< % 3) [1 2 3 4 5])  ; (1 2)
(drop-while #(< % 3) [1 2 3 4 5])  ; (3 4 5)

;; cons, conj
(cons 0 '(1 2))   ; (0 1 2)   — always prepends
(conj '(1 2) 0)   ; (0 1 2)   — prepends to list
(conj [1 2] 0)    ; [1 2 0]   — appends to vector

;; partition, partition-by
(partition 2 [1 2 3 4 5 6])        ; ((1 2) (3 4) (5 6))
(partition-by even? [1 3 5 2 4 1]) ; ((1 3 5) (2 4) (1))

;; group-by, frequencies
(group-by even? [1 2 3 4])         ; {false [1 3] true [2 4]}
(frequencies ["a" "b" "a" "c"])    ; {"a" 2 "b" 1 "c" 1}

;; interleave, interpose
(interleave [:a :b] [1 2])         ; (:a 1 :b 2)
(interpose "," ["a" "b" "c"])      ; ("a" "," "b" "," "c")
```

## Lazy Sequences

Clojure sequences are lazy by default. Elements are computed on demand.

```clojure
;; lazy-seq — construct a lazy sequence
(defn naturals-from [n]
  (lazy-seq
    (cons n (naturals-from (inc n)))))

(take 5 (naturals-from 0))  ; (0 1 2 3 4)

;; lazy-cat — lazy concatenation
(def fib-seq
  (lazy-cat [0 1]
            (map + (rest fib-seq) fib-seq)))

(take 8 fib-seq)  ; (0 1 1 2 3 5 8 13)

;; iterate — generate infinite sequence
(take 5 (iterate #(* 2 %) 1))  ; (1 2 4 8 16)

;; cycle, repeat, repeatedly
(take 6 (cycle [:a :b]))         ; (:a :b :a :b :a :b)
(take 3 (repeat 42))             ; (42 42 42)
(take 3 (repeatedly #(rand-int 10)))  ; 3 random ints

;; Realizing lazy seqs
(def results (map println (range 5)))
(doall results)   ; force full realization
(dorun results)   ; force realization, discard results
```

## Transducers

Composable algorithmic transformations, decoupled from input/output.
No intermediate collections — more efficient than chained seq operations.

```clojure
;; Build a transducer with comp
(def xf
  (comp
    (filter even?)
    (map #(* % %))
    (take 3)))

;; Apply with transduce
(transduce xf + (range 20))
;; (filter even?) -> (0 2 4 6 8 ...)
;; (map #(* % %)) -> (0 4 16 36 64 ...)
;; (take 3)       -> (0 4 16)
;; (+ 0 4 16) = 20

;; into — collect into a collection
(into [] xf (range 20))     ; [0 4 16]
(into {} xf (range 20))     ; {0 4, 4 16}  (as pairs)

;; sequence — apply transducer to produce a lazy seq
(sequence xf (range 20))    ; (0 4 16)

;; eduction — lazy transducer application (not cached)
(eduction xf (range 20))

;; Channel transducer (core.async)
;; (let [ch (chan 1 xf)] ...)
```

## Reducers

Parallel reduce via `clojure.core.reducers`. Works on vectors and maps
for automatic parallel folding.

```clojure
(require '[clojure.core.reducers :as r])

;; r/map, r/filter — lazy, no intermediate collections
(->> [1 2 3 4 5]
     (r/filter even?)
     (r/map #(* % %)))
;; returns a reducible, not a seq

;; Reduce (sequential, but no intermediate allocation)
(r/reduce + (r/map inc [1 2 3 4]))  ; 14

;; r/fold — parallel reduce (uses fork-join)
(r/fold + (vec (range 1000000)))     ; 499999500000

;; r/fold with combine and reduce functions
(r/fold
  (fn ([] 0) ([a b] (+ a b)))        ; combiner
  (fn [acc x] (+ acc (* x x)))       ; reducer
  (vec (range 10000)))
```

## See Also

- [core.md](core.md) — language fundamentals and syntax
- [atoms.md](atoms.md) — state management with atoms, refs, agents
