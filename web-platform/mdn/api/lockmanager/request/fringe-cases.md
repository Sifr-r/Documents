# Fringe Cases

## Warnings & Notes

> [!WARNING]
        > Use with care!
        > Code that was previously running inside the lock continues to run, and may clash with the code that now holds the lock.

## Exceptions

This method may return a promise rejected with a {{domxref("DOMException")}} of one of the following types:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the environments document is not fully active.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if a lock manager cannot be obtained for the current environment.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if `name` starts with a hyphen (`-`), both options `steal` and `ifAvailable` are `true`, or if option `signal` exists and _either_ option `steal` or `ifAvailable` is `true`.
- `AbortError` {{domxref("DOMException")}}
  - : Thrown if the option `signal` exists and is aborted.

