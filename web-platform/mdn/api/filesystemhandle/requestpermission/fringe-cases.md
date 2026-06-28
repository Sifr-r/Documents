# Fringe Cases

## Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if no parameter is specified or the `mode` is not that of
    `'read'`, `'write'`, or `'readwrite'`
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown in one of the following cases:
    - The method was called in a context that's not [same-origin](/en-US/docs/Web/Security/Defenses/Same-origin_policy) as the top-level context (i.e., a cross-origin iframe).
    - There was no transient user activation such as a button press. This includes when the handle is in a non-Window context which cannot consume user activation, such as a worker.

## Security Notes

[Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) is required. The user has to interact with the page or a UI element in order for this feature to work.

