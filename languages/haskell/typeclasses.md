# Haskell — Type Classes

## Defining Type Classes

```haskell
-- Class declaration
class Eq' a where
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
  x /= y = not (x == y)   -- default implementation

-- Instance declaration
data Color = Red | Green | Blue

instance Eq Color where
  Red == Red       = True
  Green == Green   = True
  Blue == Blue     = True
  _ == _           = False

-- Class with superclass constraint
class Eq a => Ord a where
  compare :: a -> a -> Ordering
  (<), (<=), (>), (>=) :: a -> a -> Bool
```

## Deriving

Common typeclasses can be derived automatically.

```haskell
-- Auto-derive standard classes
data Point = Point Double Double
  deriving (Eq, Show, Read, Ord)

-- Enum — sequential constructors
data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun
  deriving (Eq, Show, Enum, Bounded)

succ Mon   -- Tue
[minBound .. maxBound] :: [Day]  -- all days
fromEnum Wed  -- 2

-- Standalone deriving (GHC extension)
deriving instance Show MyType
```

### Standard derivable classes

| Class | Purpose |
|---|---|
| `Eq` | Equality (`==`, `/=`) |
| `Ord` | Ordering (`compare`, `<`, `>`) |
| `Show` | Convert to string (`show`) |
| `Read` | Parse from string (`read`) |
| `Enum` | Sequential values (`succ`, `pred`) |
| `Bounded` | Min/max values (`minBound`, `maxBound`) |

## Multi-Parameter Type Classes

Classes that relate multiple types. Requires `MultiParamTypeClasses`.

```haskell
{-# LANGUAGE MultiParamTypeClasses #-}

class Convertible a b where
  convert :: a -> b

instance Convertible Int Double where
  convert = fromIntegral

instance Convertible String Int where
  convert = read
```

## Functional Dependencies

Constrain which instances are valid. Requires `FunctionalDependencies`.

```haskell
{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies #-}

-- b is determined by a (each a maps to exactly one b)
class Convertible a b | a -> b where
  convert :: a -> b

-- Without | a -> b, the compiler cannot infer b from a
-- and type inference becomes ambiguous
```

## Monoid

Types with an associative binary operation and identity element.

```haskell
class Monoid a where
  mempty  :: a              -- identity
  mappend :: a -> a -> a    -- combine (also <>)
  mconcat :: [a] -> a       -- fold with mappend

instance Monoid [a] where
  mempty  = []
  mappend = (++)

instance Monoid Sum where
  mempty = Sum 0
  mappend (Sum a) (Sum b) = Sum (a + b)

-- Usage
mconcat ["Hello", " ", "World"]   -- "Hello World"
mconcat [Sum 1, Sum 2, Sum 3]     -- Sum 6

-- <> operator (Semigroup, preferred over mappend)
[1, 2] <> [3, 4]  -- [1, 2, 3, 4]
```

## Foldable and Traversable

```haskell
-- Foldable — types you can fold over
class Foldable t where
  foldr   :: (a -> b -> b) -> b -> t a -> b
  foldMap :: Monoid m => (a -> m) -> t a -> m

import Data.Foldable (toList, foldl', sum, product, elem)

foldr (+) 0 [1,2,3]      -- 6
foldMap Sum [1,2,3]       -- Sum 6
toList (Just 42)           -- [42]

-- Traversable — Foldable + map with effects
class (Functor t, Foldable t) => Traversable t where
  traverse :: Applicative f => (a -> f b) -> t a -> f (t b)
  sequenceA :: Applicative f => t (f a) -> f (t a)

-- Map with effectful function
traverse readFile ["a.txt", "b.txt"]  -- IO [String]

-- Validate all, fail if any fails
traverse validateAge [25, 17, 30]  -- Either String [Int]
```

## Type Families

Associate types with a type class. Requires `TypeFamilies`.

```haskell
{-# LANGUAGE TypeFamilies #-}

-- Associated type family
class Container c where
  type Elem c          -- associated type
  empty  :: c
  insert :: Elem c -> c -> c
  member :: Elem c -> c -> Bool

instance Container [a] where
  type Elem [a] = a
  empty  = []
  insert = (:)
  member = elem

-- Standalone type family
type family Rep a
type instance Rep Int  = Int32
type instance Rep Char = Word8
```

## GADTs (Generalized Algebraic Data Types)

Allows constructors with different return types. Requires `GADTs`.

```haskell
{-# LANGUAGE GADTs #-}

data Expr a where
  LitInt  :: Int -> Expr Int
  LitBool :: Bool -> Expr Bool
  Add     :: Expr Int -> Expr Int -> Expr Int
  If      :: Expr Bool -> Expr a -> Expr a -> Expr a

-- The type parameter 'a' is refined by each constructor
eval :: Expr a -> a
eval (LitInt n)    = n
eval (LitBool b)   = b
eval (Add x y)     = eval x + eval y
eval (If cond t f) = if eval cond then eval t else eval f

-- Type-safe: this would not compile (Add expects Expr Int)
-- Add (LitBool True) (LitInt 5)
```

## See Also

- [core.md](core.md) — basic syntax, types, and pattern matching
- [monads.md](monads.md) — monad typeclass and effect systems
