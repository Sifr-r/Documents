# Lua — Metatables

## What Is a Metatable?

```lua
-- Metatable — table of metamethods that customize behavior
local t = {}
local mt = {}
setmetatable(t, mt)

-- Check metatable
getmetatable(t)                 -- returns mt
getmetatable("string")          -- read-only for strings

-- Shorthand: set and return
local t = setmetatable({}, {
    __index = function(_, key) return key .. "!" end,
})
print(t.hello)                  -- "hello!"
```

## __index

```lua
-- __index — called when key is not found in table
-- As function
local mt = {
    __index = function(tbl, key)
        return "default for " .. key
    end,
}
local t = setmetatable({}, mt)
print(t.foo)                    -- "default for foo"

-- As table (prototype lookup)
local defaults = {color = "red", size = 10}
local obj = setmetatable({}, {__index = defaults})
print(obj.color)                -- "red"
print(obj.size)                 -- 10
obj.color = "blue"             -- shadows prototype
print(obj.color)                -- "blue"

-- Chain of prototypes
local animal = {type = "animal", sound = "unknown"}
local dog = setmetatable({sound = "bark"}, {__index = animal})
local rex = setmetatable({name = "Rex"}, {__index = dog})
print(rex.name)                 -- "Rex"
print(rex.sound)                -- "bark"
print(rex.type)                 -- "animal"
```

## __newindex

```lua
-- __newindex — called when setting a NEW key (not existing)
local blocked = {}
local mt = {
    __newindex = function(tbl, key, value)
        print("blocked: cannot set " .. key)
    end,
}
local proxy = setmetatable({}, mt)
proxy.name = "Alice"           -- prints "blocked: cannot set name"

-- Track changes
local log = {}
local tracked = setmetatable({}, {
    __newindex = function(tbl, key, value)
        table.insert(log, key .. " = " .. tostring(value))
        rawset(tbl, key, value) -- rawset bypasses metamethods
    end,
})
tracked.x = 1                  -- logged
tracked.y = 2                  -- logged

-- rawset/rawget bypass metatables entirely
rawset(t, "key", "value")
rawget(t, "key")
```

## __call

```lua
-- __call — make table callable like a function
local mt = {
    __call = function(tbl, ...)
        return "called with: " .. table.concat({...}, ", ")
    end,
}
local obj = setmetatable({}, mt)
print(obj(1, 2, 3))            -- "called with: 1, 2, 3"

-- Common pattern: class constructor
local function class(name)
    local cls = {__name = name}
    cls.__index = cls
    setmetatable(cls, {
        __call = function(_, ...)
            local obj = setmetatable({}, cls)
            if obj.init then obj:init(...) end
            return obj
        end,
    })
    return cls
end
```

## __tostring & __len

```lua
-- __tostring — customize tostring() and print()
local vec = {x = 3, y = 4}
setmetatable(vec, {
    __tostring = function(self)
        return string.format("(%g, %g)", self.x, self.y)
    end,
})
print(vec)                     -- "(3, 4)"
print(tostring(vec))           -- "(3, 4)"

-- __len — customize the # operator
local bounded = setmetatable({1, 2, 3}, {
    __len = function(self)
        return 100  -- override
    end,
})
print(#bounded)                -- 100
```

## Arithmetic Metamethods

```lua
local Vec = {}
Vec.__index = Vec

function Vec.new(x, y)
    return setmetatable({x = x, y = y}, Vec)
end

Vec.__add = function(a, b)
    return Vec.new(a.x + b.x, a.y + b.y)
end
Vec.__sub = function(a, b)
    return Vec.new(a.x - b.x, a.y - b.y)
end
Vec.__mul = function(a, b)
    if type(a) == "number" then return Vec.new(a * b.x, a * b.y) end
    if type(b) == "number" then return Vec.new(a.x * b, a.y * b) end
    return a.x * b.x + a.y * b.y -- dot product
end
Vec.__unm = function(a)
    return Vec.new(-a.x, -a.y)
end
Vec.__div = function(a, b)
    return Vec.new(a.x / b, a.y / b)
end
Vec.__pow = function(a, b)
    return a.x ^ b + a.y ^ b
end

local v1 = Vec.new(1, 2)
local v2 = Vec.new(3, 4)
local v3 = v1 + v2             -- (4, 6)
local v4 = v1 * 2              -- (2, 4)
```

## Comparison Metamethods

```lua
-- __eq, __lt, __le
local Point = {}
Point.__index = Point
function Point.new(x, y) return setmetatable({x=x, y=y}, Point) end

Point.__eq = function(a, b)
    return a.x == b.x and a.y == b.y
end
Point.__lt = function(a, b)
    return (a.x^2 + a.y^2) < (b.x^2 + b.y^2)
end
Point.__le = function(a, b)
    return (a.x^2 + a.y^2) <= (b.x^2 + b.y^2)
end

local p1 = Point.new(1, 2)
local p2 = Point.new(1, 2)
local p3 = Point.new(3, 4)
print(p1 == p2)                -- true
print(p1 < p3)                 -- true
print(p3 <= p3)                -- true
```

## OOP Class Pattern

```lua
local function create_class(name, parent)
    local cls = {}
    cls.__index = cls
    cls.__name = name

    -- Inheritance via parent metatable
    if parent then
        setmetatable(cls, {__index = parent})
    end

    -- Constructor
    function cls:new(...)
        local obj = setmetatable({}, cls)
        if obj.init then obj:init(...) end
        return obj
    end

    return cls
end

-- Usage
local Animal = create_class("Animal")
function Animal:init(name) self.name = name end
function Animal:speak() return self.name .. " makes a sound" end

local Dog = create_class("Dog", Animal)
function Dog:speak() return self.name .. " barks" end

local rex = Dog:new("Rex")
print(rex:speak())             -- "Rex barks"
print(rex.name)                -- "Rex" (inherited init)

-- Check instance type
local function is_instance(obj, cls)
    local mt = getmetatable(obj)
    while mt do
        if mt == cls then return true end
        mt = getmetatable(mt)
        mt = mt and mt.__index
    end
    return false
end
print(is_instance(rex, Dog))    -- true
print(is_instance(rex, Animal)) -- true
```

## See Also

- [core.md](core.md) — types, functions, closures, error handling
- [tables.md](tables.md) — arrays, dictionaries, table library
