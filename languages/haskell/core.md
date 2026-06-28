# Haskell — Core Syntax

## Type System

| Type | Description |
|---|---|
| `Int` | Fixed-precision integer (machine word) |
| `Integer` | Arbitrary-precision integer |
| `Float` | Single-precision float |
| `Double` | Double-precision float |
| `Char` | Unicode character |
| `Bool` | `True` or `False` |
| `String` | `[Char]` — list of characters |

```haskell
x :: Int
x = 42

y :: Double
y = 3.14

c :: Char
c = 'λ'

name :: String
name = "Haskell"
```

## Function Definition and Type Signatures

```haskell
add :: Int -> Int -> Int
add x y = x + y

identity :: a -> a            -- polymorphic
identity x = x

double :: Num a => a -> a     -- constrained
double x = x * 2

add5 = add 5                  -- partial application
applyTwice f x = f (f x)      -- higher-order
```

## Pattern Matching

```haskell
-- Function clauses
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- List patterns
head' :: [a] -> a
head' []    = error "empty list"
head' (x:_) = x

-- Tuple patterns
fst' :: (a, b) -> a
fst' (x, _) = x

-- As-patterns — bind the whole and destructure
describe :: [Int] -> String
describe xs@(x:_) = "First of " ++ show (length xs) ++ " is " ++ show x
describe _        = "Empty"
```

## Guards

```haskell
sign :: (Ord a, Num a) => a -> Ordering
sign x
  | x > 0     = GT
  | x < 0     = LT
  | otherwise  = EQ  -- otherwise = True

-- Guards with where
bmi :: Double -> Double -> String
bmi weight height
  | val < 18.5 = "underweight"
  | val < 25   = "normal"
  | val < 30   = "overweight"
  | otherwise   = "obese"
  where val = weight / height ^ 2
```

## Where and Let Bindings

```haskell
-- where — attached to function definition
cylinder :: Double -> Double -> Double
cylinder r h = sideArea + 2 * topArea
  where
    sideArea = 2 * pi * r * h
    topArea  = pi * r ^ 2

-- let ... in — expression-level, usable anywhere
result = let x = 10; y = 20 in x + y
```

## Case Expressions

```haskell
-- Case is an expression (can be used anywhere)
describe :: Maybe Int -> String
describe m = case m of
  Just x  -> "Got " ++ show x
  Nothing -> "Nothing here"

-- Case with guards
classify :: Int -> String
classify n = case n of
  x | x > 0     -> "positive"
    | x < 0     -> "negative"
    | otherwise  -> "zero"
```

## List Comprehensions

```haskell
-- Basic
squares :: [Int]
squares = [x ^ 2 | x <- [1..10]]

-- With filter
evens :: [Int]
evens = [x | x <- [1..100], even x]

-- Multiple generators
pairs :: [(Int, Int)]
pairs = [(x, y) | x <- [1..3], y <- [1..3]]

-- With let binding
rightTriangles :: [(Int, Int, Int)]
rightTriangles =
  [ (a, b, c)
  | c <- [1..20]
  , b <- [1..c]
  , a <- [1..b]
  , a ^ 2 + b ^ 2 == c ^ 2
  ]
```

## Tuples

```haskell
fst (1, "a")  -- 1
snd (1, "a")  -- "a"
zip [1,2,3] ["a","b","c"]  -- [(1,"a"),(2,"b"),(3,"c")]
```

## Maybe and Either

```haskell
-- Maybe — represents optional value
safeDiv :: Double -> Double -> Maybe Double
safeDiv _ 0 = Nothing
safeDiv x y = Just (x / y)

-- Either — value or error
parseAge :: String -> Either String Int
parseAge s = case reads s of
  [(n, "")] -> if n >= 0 then Right n else Left "negative age"
  _         -> Left "not a number"

-- Pattern matching on Either
case parseAge "25" of
  Right age -> "Age: " ++ show age
  Left err  -> "Error: " ++ err

-- fmap over Maybe/Either
fmap (+ 1) (Just 5)        -- Just 6
fmap (+ 1) (Left "err")     -- Left "err"
fmap (+ 1) (Right 5)        -- Right 6
```

## Basic IO

```haskell
-- IO actions are values; the runtime executes main
main :: IO ()
main = do
  putStrLn "Enter your name:"
  name <- getLine
  putStrLn ("Hello, " ++ name ++ "!")

  -- Read file
  content <- readFile "data.txt"
  putStrLn (take 100 content)

  -- Write file
  writeFile "out.txt" "hello world"

-- Pure vs impure boundary
greet :: String -> String     -- pure
greet name = "Hello, " ++ name

main :: IO ()                 -- impure
main = do
  name <- getLine
  putStrLn (greet name)       -- pure function called in IO context
```

## See Also

- [monads.md](monads.md) — monad typeclass, do-notation, transformers
- [typeclasses.md](typeclasses.md) — defining and using type classes
