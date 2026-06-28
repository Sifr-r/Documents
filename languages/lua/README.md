# Lua

Lua 5.4+ reference. Covers the language used for embedding, game scripting (Roblox, LÖVE), and configuration (Neovim, Redis).

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, tables, functions, control flow |
| [tables.md](tables.md) | Tables as arrays, dictionaries, objects, metatables |
| [metatables.md](metatables.md) | Metamethods, OOP patterns, operator overloading |

## Quick Reference

```lua
-- Tables (the one data structure)
local t = {a = 1, b = 2}      -- dictionary
local arr = {1, 2, 3}          -- array (1-indexed)
arr[#arr + 1] = 4              -- append

-- Multiple return values
local function divrem(a, b)
    return a // b, a % b
end
local q, r = divrem(10, 3)

-- Variadic functions
local function sum(...)
    local s = 0
    for _, v in ipairs({...}) do s = s + v end
    return s
end

-- Iterators
for k, v in pairs(t) do end    -- all keys
for i, v in ipairs(arr) do end -- array (1..n)

-- Modules
local M = {}
function M.hello() return "world" end
return M
```