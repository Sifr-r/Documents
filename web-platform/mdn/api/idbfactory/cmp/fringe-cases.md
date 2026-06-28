# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Do not use this method for comparing arbitrary JavaScript
> values, because many JavaScript values are either not valid IndexedDB keys (booleans
> and objects, for example) or are treated as equivalent IndexedDB keys (for example,
> since IndexedDB ignores arrays with non-numeric properties and treats them as empty
> arrays, so any non-numeric arrays are treated as equivalent). This throws an exception
> if either of the values is not a valid key.

## Exceptions

- `DataError` {{domxref("DOMException")}}
  - : Thrown if one of the supplied keys was not a valid key.

