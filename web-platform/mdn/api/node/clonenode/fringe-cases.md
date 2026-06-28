# Fringe Cases

## Warnings & Notes

> [!WARNING]
> `cloneNode()` may lead to duplicate element IDs in a document! If the original node has an `id` attribute, and the clone will be placed in the same document, then you should modify the clone's ID to be unique.
>
> Also, `name` attributes may need to be modified, depending on whether duplicate names are expected.

