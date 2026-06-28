# Haskell — Monads & Effects

## Monad Typeclass

A monad represents a computation with context (effects, state, failure, etc.).

```haskell
class Monad m where
  return :: a -> m a          -- wrap a value (same as pure)
  (>>=)  :: m a -> (a -> m b) -> m b  -- bind: chain computations
  (>>)   :: m a -> m b -> m b         -- sequence, discard first result

-- Monad laws
-- Left identity:  return a >>= f  ==  f a
-- Right identity: m >>= return    ==  m
-- Associativity:  (m >>= f) >>= g ==  m >>= (\x -> f x >>= g)
```

## do-Notation

Syntactic sugar for monadic binds. Desugars to `>>=` chains.

```haskell
-- With >>=
example :: Maybe Int
example = Just 3 >>= \x ->
          Just 5 >>= \y ->
          Just (x + y)

-- With do-notation (equivalent)
example :: Maybe Int
example = do
  x <- Just 3
  y <- Just 5
  return (x + y)

-- let inside do (no <- for pure values)
greet :: IO ()
greet = do
  name <- getLine
  let greeting = "Hello, " ++ name
  putStrLn greeting
```

## IO Monad

The only way to perform side effects. `IO a` is a recipe that produces an `a`.

```haskell
main :: IO ()
main = do
  line <- getLine               -- IO String
  putStrLn ("You said: " ++ line)

  handle <- openFile "log.txt" AppendMode
  hPutStrLn handle "new entry"
  hClose handle

-- liftIO — use IO inside monad transformers
import Control.Monad.IO.Class (liftIO)

action :: ReaderT Config IO ()
action = do
  cfg <- ask
  liftIO $ putStrLn ("env: " ++ env cfg)
```

## Maybe Monad

Short-circuits on `Nothing`. Useful for chains that may fail.

```haskell
safeDiv :: Double -> Double -> Maybe Double
safeDiv _ 0 = Nothing
safeDiv x y = Just (x / y)

safeSqrt :: Double -> Maybe Double
safeSqrt x | x < 0     = Nothing
           | otherwise  = Just (sqrt x)

-- Chained computation
compute :: Double -> Double -> Maybe Double
compute x y = do
  ratio <- safeDiv x y
  safeSqrt ratio
```

## Either Monad

Like Maybe but carries error information in `Left`.

```haskell
parsePositive :: String -> Either String Int
parsePositive s = case reads s of
  [(n, "")] | n >= 0 -> Right n
  _                   -> Left ("not a positive integer: " ++ s)

validate :: Int -> Either String Int
validate n | n > 100    = Left "too large"
           | otherwise   = Right n

-- Chain with monadic bind
process :: String -> Either String Int
process s = parsePositive s >>= validate

-- mapLeft to normalize error types
import Control.Arrow (left)
left show (Left 42)  -- Left "42"
```

## State Monad

Carries mutable state through pure computations.

```haskell
import Control.Monad.State

type Counter = State Int

increment :: Counter ()
increment = modify (+ 1)

getCount :: Counter Int
getCount = do
  n <- get
  increment
  return n

-- Run the state
runState getCount 0     -- (0, 1)
evalState getCount 0    -- 0  (result only)
execState getCount 0    -- 1  (final state only)
```

## Reader and Writer Monads

```haskell
-- Reader — read-only shared environment
import Control.Monad.Reader

data Config = Config { dbHost :: String, dbPort :: Int }

getConnString :: Reader Config String
getConnString = do
  cfg <- ask
  return (dbHost cfg ++ ":" ++ show (dbPort cfg))

runReader getConnString (Config "localhost" 5432)
-- "localhost:5432"

-- Writer — append-only log
import Control.Monad.Writer

logComputation :: Writer [String] Int
logComputation = do
  tell ["starting"]
  tell ["computed 42"]
  return 42

runWriter logComputation  -- (42, ["starting", "computed 42"])
```

## Applicative and Functor

Every Monad is an Applicative, and every Applicative is a Functor.

```haskell
-- Functor — map over a context
class Functor f where
  fmap :: (a -> b) -> f a -> f b

fmap (+ 1) (Just 5)        -- Just 6
fmap length ["hello", "hi"] -- [5, 2]
(+ 1) <$> Just 5            -- infix synonym for fmap

-- Applicative — apply functions in a context
class Functor f => Applicative f where
  pure  :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b

-- Lift multi-arg functions
(+) <$> Just 3 <*> Just 5   -- Just 8
(++) <$> ["hello"] <*> [" world"]  -- ["hello world"]
```

## Monad Transformers

Stack monads to combine effects.

```haskell
import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Reader

-- MaybeT — adds failure to another monad
type App = MaybeT IO

safeRead :: App Int
safeRead = do
  line <- lift getLine
  case reads line of
    [(n, "")] -> return n
    _         -> mzero  -- short-circuit to Nothing

runMaybeT safeRead  -- IO (Maybe Int)

-- Common stack pattern
newtype MyApp a = MyApp
  { runApp :: ReaderT Config (ExceptT AppError IO) a
  } deriving (Functor, Applicative, Monad,
              MonadReader Config, MonadError AppError, MonadIO)
```

## See Also

- [core.md](core.md) — basic syntax, types, and pattern matching
- [typeclasses.md](typeclasses.md) — defining type classes and instances
