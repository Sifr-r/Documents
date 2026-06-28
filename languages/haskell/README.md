# Haskell

Purely functional language with lazy evaluation and a powerful type system.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Types, pattern matching, guards, list comprehensions |
| [monads.md](monads.md) | Monad, Applicative, Functor, IO, do-notation |
| [typeclasses.md](typeclasses.md) | Class, instance, deriving, common typeclasses |

## Quick Reference

```haskell
-- Pure functions
add :: Int -> Int -> Int
add x y = x + y

-- Pattern matching
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Guards
abs x | x < 0 = -x | otherwise = x

-- List comprehension
squares = [x^2 | x <- [1..10], even x]

-- Maybe
safeDiv :: Double -> Double -> Maybe Double
safeDiv _ 0 = Nothing
safeDiv x y = Just (x / y)

-- do-notation
main :: IO ()
main = do
    putStrLn "Enter name:"
    name <- getLine
    putStrLn ("Hello, " ++ name)
```