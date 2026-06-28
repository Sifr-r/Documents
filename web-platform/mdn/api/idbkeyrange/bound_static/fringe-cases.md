# Fringe Cases

## Warnings & Notes

> [!NOTE]
> For a more complete example allowing you to experiment with
> key range, have a look at the idbkeyrange directory in the [indexeddb-examples](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbkeyrange) repo. (View the example [live](https://mdn.github.io/dom-examples/indexeddb-examples/idbkeyrange/) too.

## Exceptions

- `DataError` {{domxref("DOMException")}}
  - : Thrown when one of the following conditions is met:
    - The lower or upper parameters were not passed a valid key.
    - The lower key is greater than the upper key.
    - The lower key and upper key match and either of the bounds are open.

