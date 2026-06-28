# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Be aware of yielding rejected promises from a sync generator. In such case, `for await...of` throws when consuming the rejected promise and DOESN'T CALL `finally` blocks within that generator. This can be undesirable if you need to free some allocated resources with `try/finally`.

