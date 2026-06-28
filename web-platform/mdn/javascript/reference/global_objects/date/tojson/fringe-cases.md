# Fringe Cases

## Warnings & Notes

> [!NOTE]
> The reviver of `JSON.parse()` must be specific to the payload shape you expect, because the serialization is _irreversible_: it's not possible to distinguish between a string that represents a Date and a normal string.

