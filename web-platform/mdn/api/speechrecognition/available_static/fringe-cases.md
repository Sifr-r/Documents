# Fringe Cases

## Warnings & Notes

> [!NOTE]
        > It is not possible to use `available()` to guarantee that a remote service supports the specified languages. A value of `false` means that either an on-device _or_ a remote speech recognition service supports them.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : The current document is not fully active.
- `SyntaxError` {{domxref("DOMException")}}
  - : One or more of the strings specified in `langs` is not a valid BCP 47 language tag.

