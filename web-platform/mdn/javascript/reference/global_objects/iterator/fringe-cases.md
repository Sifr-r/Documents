# Fringe Cases

## Warnings & Notes

> [!NOTE]
> [`NodeIterator`](/en-US/docs/Web/API/NodeIterator) and other old interfaces are named as such but do not conform to the [iterator protocol](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol) or [iterable protocol](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol).

> [!NOTE]
> These methods are _iterator_ helpers, not _iterable_ helpers, because the only requirement for an object to be iterable is just the presence of a `[Symbol.iterator]()` method. There is no shared prototype to install these methods on.

> [!NOTE]
> _Iterator helper objects_ and _iterator helper methods_ are two different concepts. An Iterator helper object is detectable at runtime, while "iterator helper method" is just a name for a set of methods for comprehension. _Iterator helper_ may refer to either the object or the method, depending on the context.

    > [!NOTE]
    > Unlike the `[Symbol.toStringTag]` on most built-in classes, `Iterator.prototype[Symbol.toStringTag]` is writable for web compatibility reasons.

