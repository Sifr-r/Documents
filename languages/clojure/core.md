# Clojure — Core Syntax

## Literal Data Structures

```clojure
;; Numbers, strings, booleans, nil
42          ; Long
3.14        ; Double
42N         ; BigInt
"hello"     ; String
true false  ; Boolean
nil         ; null equivalent
\a          ; Character

;; Vector — indexed, O(1) access by index
[1 2 3]
(get [1 2 3] 0)  ; 1
(conj [1 2] 3)   ; [1 2 3]

;; Map — key-value
{:name "Ada" :age 30}
(get {:a 1} :a)       ; 1
(assoc {:a 1} :b 2)   ; {:a 1 :b 2}

;; Set — unique elements
#{1 2 3}
(contains? #{1 2 3} 2)  ; true
(conj #{1 2} 3)          ; #{1 2 3}

;; List — linked list, O(n) access
'(1 2 3)
(first '(1 2 3))  ; 1
(rest '(1 2 3))   ; (2 3)
```

## Special Forms

```clojure
;; def — define a var
(def x 42)
(def pi 3.14159)

;; if — conditional expression
(if (> x 0) :positive :non-positive)

;; do — evaluate multiple expressions, return last
(do (println "side effect") x)

;; let — local bindings
(let [a 10
      b 20
      c (+ a b)]
  c)  ; 30

;; fn — anonymous function
(fn [x] (* x x))

;; quote — prevent evaluation
(quote (1 2 3))  ; (1 2 3)
'(1 2 3)         ; same

;; loop/recur — efficient recursion
(loop [i 0 acc []]
  (if (< i 5)
    (recur (inc i) (conj acc i))
    acc))  ; [0 1 2 3 4]
```

## Functions

```clojure
;; defn — named function
(defn greet
  "Returns a greeting string"
  [name]
  (str "Hello, " name "!"))

;; Multiple arities
(defn power
  ([base] (power base 2))
  ([base exp] (Math/pow base exp)))

;; Variadic (rest args)
(defn sum [& nums]
  (reduce + nums))

;; Anonymous functions
(map (fn [x] (* x x)) [1 2 3])    ; (1 4 9)
(map #(* % %) [1 2 3])              ; shorthand with reader macro
(#(+ %1 %2) 3 4)                    ; multiple args: %1, %2

;; Higher-order
(defn apply-twice [f x]
  (f (f x)))
(apply-twice inc 0)  ; 2
```

## Destructuring

```clojure
;; Vector destructuring
(let [[a b c] [1 2 3]]
  (+ a b c))  ; 6

(let [[first & rest] [1 2 3 4]]
  [first rest])  ; [1 (2 3 4)]

;; Map destructuring
(let [{:keys [name age]} {:name "Ada" :age 30}]
  (str name " is " age))

;; With defaults and rename
(let [{:keys [name] :or {name "unknown"} :as m}
      {:age 30}]
  [name m])  ; ["unknown" {:age 30}]

;; In function parameters
(defn print-user [{:keys [name age]}]
  (println name age))
```

## Threading Macros

```clojure
;; -> (thread-first): inserts result as first argument
(-> "  hello  "
    (.trim)
    (.toUpperCase)
    (str "!"))  ; "HELLO!"

;; ->> (thread-last): inserts result as last argument
(->> (range 10)
     (filter even?)
     (map #(* % %))
     (reduce +))  ; 120

;; as-> (thread with binding)
(as-> "hello world" s
      (clojure.string/split s #" ")
      (map clojure.string/upper-case s)
      (clojure.string/join ", " s))  ; "HELLO, WORLD"

;; cond-> (conditional threading)
(cond-> 1
  true   inc        ; 2
  false  (* 10)     ; skipped
  true   (+ 100))   ; 102

;; some-> (short-circuit on nil)
(some-> {:user {:name "Ada"}}
        :user
        :name
        clojure.string/upper-case)  ; "ADA"
```

## Keywords

```clojure
;; Simple keywords
:name :age :status

;; Namespaced keywords
:app.db/host :user/email

;; Keywords as functions (map lookup)
(:name {:name "Ada" :age 30})  ; "Ada"
(::name {:app/name "Ada"})     ; "Ada" (auto-resolves to current ns)

;; Symbol keywords (for spec, etc.)
::my-keyword  ; resolves to current namespace
```

## Lazy Sequences Basics

```clojure
;; Most sequence operations return lazy seqs
(take 5 (range))         ; (0 1 2 3 4)
(take 3 (repeat "hi"))   ; ("hi" "hi" "hi")
(take 5 (iterate inc 0)) ; (0 1 2 3 4)

;; Realize specific elements
(def xs (map inc (range)))
(take 3 xs)  ; (1 2 3) — only computes first 3

;; Force evaluation
(doall (take 100 (map println (range))))  ; prints 0-99
```

## Recursion and recur

```clojure
;; loop/recur — stack-safe tail recursion
(defn factorial [n]
  (loop [i n acc 1]
    (if (<= i 1)
      acc
      (recur (dec i) (* acc i)))))

;; recur in fn (without loop)
(defn countdown [n]
  (when (pos? n)
    (println n)
    (recur (dec n))))
```

## See Also

- [sequences.md](sequences.md) — seq abstraction, transducers, reducers
- [atoms.md](atoms.md) — atoms, refs, agents, core.async
