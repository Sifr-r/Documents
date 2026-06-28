# Lua — Tables

## The Universal Data Structure

```lua
-- Tables are associative arrays (also used as arrays, objects, modules)
local t = {}                   -- empty table
local t2 = {a = 1, b = 2}     -- dictionary
local t3 = {10, 20, 30}       -- array (1-indexed)
local t4 = {x = 1, [0] = 0}   -- mixed keys

-- All values except nil can be keys
local t = {}
t[1] = "a"                    -- numeric key
t["x"] = "b"                  -- string key
t[true] = "c"                 -- boolean key
t[{nested = true}] = "d"      -- table as key (by reference)
-- t[nil] -- not allowed as key
```

## Arrays (1-Indexed)

```lua
local arr = {"a", "b", "c"}
arr[1]                         -- "a" (1-indexed!)
arr[3]                         -- "c"
#arr                           -- 3 (length operator)

-- Sparse arrays (# is unreliable for gaps)
local sparse = {[1] = "a", [3] = "c"}
#sparse                        -- may be 1 or 3 (undefined behavior)

-- Find actual length of sparse array
local function real_len(t)
    local n = 0
    for k in pairs(t) do
        if type(k) == "number" and k > 0 and k == math.floor(k) then
            n = math.max(n, k)
        end
    end
    return n
end

-- Append
table.insert(arr, "d")         -- {"a","b","c","d"}
arr[#arr + 1] = "e"            -- manual append (faster)
```

## Dictionaries / Hash Maps

```lua
local config = {
    host = "localhost",
    port = 8080,
    debug = true,
}

-- Access
config.host                    -- "localhost"
config["port"]                 -- 8080

-- Add/update
config.timeout = 30
config["retries"] = 3

-- Delete
config.debug = nil             -- removes the key

-- Check existence
if config.host then print("has host") end

-- Iterate all key-value pairs
for k, v in pairs(config) do
    print(k, v)
end
```

## Nested Tables

```lua
-- Tables of tables
local users = {
    {name = "Alice", age = 30},
    {name = "Bob",   age = 25},
}
users[1].name                  -- "Alice"

-- Deep structure
local tree = {
    value = 1,
    left = {value = 2, left = {}, right = {}},
    right = {value = 3},
}

-- Pretty print nested tables
local function dump(t, indent)
    indent = indent or ""
    for k, v in pairs(t) do
        if type(v) == "table" then
            print(indent .. tostring(k) .. ":")
            dump(v, indent .. "  ")
        else
            print(indent .. tostring(k) .. " = " .. tostring(v))
        end
    end
end
dump(users)
```

## Table Library Functions

```lua
local arr = {3, 1, 4, 1, 5, 9}

-- Insert
table.insert(arr, 7)           -- append at end
table.insert(arr, 2, 99)       -- insert 99 at position 2

-- Remove
table.remove(arr)              -- remove last
table.remove(arr, 2)           -- remove at position 2

-- Sort
table.sort(arr)                -- ascending
table.sort(arr, function(a, b) return a > b end) -- descending

-- Concat (strings only)
table.concat({"a","b","c"}, ", ")  -- "a, b, c"

-- Move elements (Lua 5.3+)
local dst = {}
table.move({1,2,3,4}, 2, 4, 1, dst) -- dst = {2,3,4}

-- Unpack
local a, b, c = table.unpack({1, 2, 3}) -- Lua 5.3+
-- unpack() in Lua 5.1
```

## Common Patterns

```lua
-- Stack (LIFO)
local stack = {}
table.insert(stack, "a")       -- push
table.insert(stack, "b")
local top = table.remove(stack) -- pop: "b"

-- Queue (FIFO)
local queue = {}
table.insert(queue, "first")
table.insert(queue, "second")
local front = table.remove(queue, 1) -- dequeue: "first"

-- Set
local set = {}
set["a"] = true
set["b"] = true
if set["a"] then print("in set") end
set["a"] = nil -- remove from set

-- Class-like object
local function make_point(x, y)
    return {
        x = x, y = y,
        distance = function(self)
            return math.sqrt(self.x^2 + self.y^2)
        end,
    }
end
local p = make_point(3, 4)
p:distance()                    -- 5.0
```

## Table Identity vs Equality

```lua
-- Tables are compared by reference, not value
local a = {1, 2, 3}
local b = {1, 2, 3}
print(a == b)                   -- false (different objects)
print(a == a)                   -- true  (same reference)

-- Deep equality check
local function deep_eq(t1, t2)
    if type(t1) ~= type(t2) then return false end
    if type(t1) ~= "table" then return t1 == t2 end
    for k, v in pairs(t1) do
        if not deep_eq(v, t2[k]) then return false end
    end
    for k in pairs(t2) do
        if t1[k] == nil then return false end
    end
    return true
end
print(deep_eq(a, b))           -- true
```

## See Also

- [core.md](core.md) — types, variables, functions, control flow
- [metatables.md](metatables.md) — metamethods, operator overloading, OOP
