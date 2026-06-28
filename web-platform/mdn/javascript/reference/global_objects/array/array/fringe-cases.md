# Fringe Cases

## Warnings & Notes

> [!NOTE]
> `Array()` can be called with or without [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Both create a new `Array` instance.

    > [!NOTE]
    > This implies an array of `arrayLength` empty slots, not slots with actual `undefined` values — see [sparse arrays](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays)).

## Exceptions

- {{jsxref("RangeError")}}
  - : Thrown if there's only one argument (`arrayLength`) that is a number, but its value is not an integer or not between 0 and 2<sup>32</sup> - 1 (inclusive).

