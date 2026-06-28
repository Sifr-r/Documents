# Fringe Cases

## Warnings & Notes

> [!NOTE]
> It is not possible to know reflectively (i.e., without actually calling `next()` and validating the returned result) whether a particular object implements the iterator protocol.

> [!WARNING]
> Concurrent modifications, in general, are very bug-prone and confusing. Unless you know precisely how the iterable is implemented, it's best to avoid modifying the collection while iterating over it.

