# Clojure — State Management

## Atoms

Atoms provide synchronous, independent, atomic updates. Best for most state.

```clojure
;; Create an atom
(def counter (atom 0))

;; Read current value
@counter              ; 0
(deref counter)       ; 0

;; swap! — apply function, retry on conflict (CAS loop)
(swap! counter inc)               ; 1
(swap! counter + 10)              ; 11
(swap! counter (fn [v] (* v 2)))  ; 22

;; reset! — set value unconditionally
(reset! counter 0)    ; 0

;; compare-and-set! — CAS directly
(compare-and-set! counter 0 42)   ; true (was 0, now 42)
(compare-and-set! counter 0 99)   ; false (not 0 anymore)

;; Validator — reject invalid state changes
(def age (atom 0 :validator #(>= % 0)))
(swap! age dec)  ; IllegalStateException — validator rejected

;; Metadata on atoms
(def state (atom {} :meta {:created (java.util.Date.)}))
(meta state)  ; {:created #inst "..."}
```

## Refs and STM

Refs coordinate multiple values with Software Transactional Memory.
Updates are atomic, consistent, and isolated within a transaction.

```clojure
(def account-a (ref 1000))
(def account-b (ref 500))

;; dosync — begin transaction
(defn transfer [from to amount]
  (dosync
    (alter from - amount)
    (alter to + amount)))

(transfer account-a account-b 200)
@account-a  ; 800
@account-b  ; 700

;; alter — apply function within transaction (retries on conflict)
(dosync
  (alter account-a + 100))

;; commute — like alter but allows more concurrency
;; (commutative operations only — order doesn't matter)
(dosync
  (commute account-a inc))

;; ensure — read a ref but don't modify (still part of transaction)
(dosync
  (let [balance (ensure account-a)]
    (when (> balance 500)
      (alter account-a - 500))))

;; ref-set — set value directly in transaction
(dosync
  (ref-set account-a 0))
```

## Agents

Agents provide asynchronous, independent state updates. Functions run on
a thread pool; the sender does not block.

```clojure
(def log-agent (agent []))

;; send — run on fixed-size thread pool (CPU-bound)
(send log-agent conj "event-1")
(send log-agent conj "event-2")

;; send-off — run on expandable thread pool (IO-bound)
(send-off log-agent (fn [state] (Thread/sleep 1000) (conj state "slow")))

;; await — block until all pending sends complete
(await log-agent)
@log-agent  ; ["event-1" "event-2" "slow"]

;; Error handling
(def failing-agent (agent 0 :error-mode :continue))
(send failing-agent (fn [_] (throw (Exception. "oops"))))
(agent-error failing-agent)  ; the exception

;; Restart after error
(restart-agent failing-agent 0)

;; Watcher on agent
(add-watch log-agent :logger
  (fn [key ref old new]
    (println "Agent changed:" old "->" new)))
```

## Vars

Vars hold per-thread bindings. Created with `def` and `defn`.

```clojure
;; Dynamic var
(def ^:dynamic *db* nil)

;; binding — thread-local rebind
(binding [*db* :test-conn]
  (println *db*))  ; :test-conn
(println *db*)     ; nil (original value restored)

;; alter-var-root — permanently change a var's root value
(alter-var-root #'*db* (fn [_] :prod-conn))

;; with-redefs — temporary redefinition (for testing)
(with-redefs [clojure.core/+ (fn [a b] (* a b))]
  (+ 3 4))  ; 12 (multiply instead of add)
```

## Watchers

Watchers are callbacks triggered on every state change. Work with atoms,
refs, agents, and vars.

```clojure
;; add-watch takes a key and a 4-arg function
(def state (atom {}))

(add-watch state :change-log
  (fn [key reference old-value new-value]
    (println key "changed from" old-value "to" new-value)))

(swap! state assoc :name "Ada")
;; prints: :change-log changed from {} to {:name Ada}

;; Remove a watcher
(remove-watch state :change-log)
```

## core.async

CSP-style channels for asynchronous coordination.

```clojure
(require '[clojure.core.async :refer [go go-loop chan <! >! put! take!]])

;; Create a channel
(def ch (chan))
(def buf-ch (chan 10))   ; buffered (10 items)

;; put! / take! — callback-based (outside go blocks)
(put! ch "hello")
(take! ch (fn [v] (println v)))

;; go block — lightweight async process
(go
  (let [msg (<! ch)]      ; take from channel (park)
    (println "got:" msg)))

(go
  (>! ch "hello"))         ; put to channel (park)

;; go-loop — loop inside go
(go-loop [i 0]
  (when (< i 5)
    (println i)
    (<! (timeout 1000))
    (recur (inc i))))

;; Transducer on channel
(def xf-ch (chan 10 (map #(* % %))))

;; alt! — wait on multiple channels
(require '[clojure.core.async :refer [alt! timeout]])
(go
  (alt!
    ch        ([v] (println "got" v "from ch"))
    (timeout 1000) (println "timeout")))
```

## See Also

- [core.md](core.md) — language fundamentals and syntax
- [sequences.md](sequences.md) — seq abstraction, transducers, reducers
