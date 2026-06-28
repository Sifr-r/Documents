# Lua — Core Syntax & Types

## Types

Lua has 8 types: `nil`, `boolean`, `number`, `string`, `function`, `table`, `userdata`, `thread`.

```lua
-- Type checking
type(nil)      -- "nil"
type(true)     -- "boolean"
type(42)       -- "number" (always float/double)
type("hello")  -- "string"
type({})       -- "table"
type(print)    -- "function"

-- Numbers (all floating point, 5.3+ also has integer subtype)
local i = 42
local f = 3.14
math.type(i)  -- "integer" (Lua 5.3+)
math.type(f)  -- "float"

-- Strings (immutable)
local s = "hello"
local s2 = 'world'
local ml = [[
multi-line
string
]]
local len = #s           -- length
local sub = s:sub(1, 3)  -- "hel"
local up = s:upper()
s:find("ell")            -- 2, 4
s:gsub("l", "x")         -- "hexxo"
s:match("h(.*)o")        -- "ell"
```

## Variables & Scope

```lua
-- Global by default (use local!)
x = 42          -- GLOBAL — avoid

-- Local (block-scoped)
local x = 42    -- use this

-- Multiple assignment
local a, b = 1, 2
a, b = b, a     -- swap

-- Nil is "no value"
local x = nil   -- removes variable
t.key = nil     -- removes key from table
```

## Control Flow

```lua
-- if/elseif/else
if x > 0 then
    print("positive")
elseif x < 0 then
    print("negative")
else
    print("zero")
end

-- while
while condition do
    -- body
end

-- repeat/until (like do-while)
repeat
    -- body
until condition

-- Numeric for (inclusive)
for i = 1, 10 do end           -- 1 to 10
for i = 1, 10, 2 do end        -- step 2

-- Generic for
for k, v in pairs(t) do end    -- table
for i, v in ipairs(arr) do end -- array
```

## Functions

```lua
-- Function declaration
local function greet(name)
    return "Hello, " .. name
end

-- Anonymous function
local f = function(x) return x * 2 end

-- Multiple returns
local function stats(arr)
    return #arr, arr[1], arr[#arr]
end
local n, first, last = stats({1, 2, 3})

-- Variadic (...)
local function sum(...)
    local s = 0
    for _, v in ipairs({...}) do s = s + v end
    return s
end

-- Closures
local function counter()
    local n = 0
    return function() n = n + 1; return n end
end
local c = counter()
print(c(), c()) -- 1, 2

-- Method call syntax (:)
local obj = {x = 10}
function obj:getX() return self.x end
obj:getX() -- equivalent to obj.getX(obj)
```

## Tables

```lua
-- The universal data structure
local t = {}               -- empty table
local arr = {1, 2, 3}      -- array (1-indexed)
local dict = {a = 1, b = 2} -- dictionary

-- Access
arr[1]                      -- 1 (first element, 1-indexed!)
dict["a"]                   -- 1
dict.a                      -- 1 (syntactic sugar)

-- Length
#arr                        -- 3 (only for sequences)
#dict                       -- 0 (not a sequence)

-- Insert/remove
table.insert(arr, 4)        -- append
table.insert(arr, 2, "x")   -- insert at position
table.remove(arr)           -- pop last
table.remove(arr, 2)        -- remove at position

-- Iteration
for i, v in ipairs(arr) do  -- 1..n (stops at nil)
    print(i, v)
end

for k, v in pairs(dict) do  -- all keys
    print(k, v)
end
```

## Error Handling

```lua
-- pcall (protected call)
local ok, result = pcall(function()
    return 10 / 0  -- error
end)
if not ok then
    print("Error:", result) -- error message
end

-- error function
error("something went wrong")

-- assert
local f = assert(io.open("file.txt"), "Cannot open file")
```

## Standard Library

```lua
-- String
string.format("Hello %s", "world")
string.byte("A")  -- 65
string.char(65)   -- "A"

-- Table
table.concat(arr, ", ")
table.sort(arr)
table.move(src, 1, #src, #dst + 1, dst)

-- Math
math.abs(-5)
math.max(1, 2, 3)
math.random(1, 100)
math.floor(3.7)
```

## See Also

- [tables.md](tables.md) — tables as arrays, dictionaries, objects
- [metatables.md](metatables.md) — metamethods, OOP, operator overloading