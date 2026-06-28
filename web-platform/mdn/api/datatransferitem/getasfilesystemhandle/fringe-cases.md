# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Because `getAsFileSystemHandle()` can only retrieve the entry handle in the same tick as the `drop` event handler, there must be no `await` before it. This is why we synchronously invoke `getAsFileSystemHandle()` for all items first, and then wait for their results concurrently.

## Exceptions

None.

