# Fringe Cases

## Exceptions

- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown when wake lock is not available, which can happen because:
    - Use of this feature is blocked by a [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
    - The document is not fully active.
    - The document's visibility state is `hidden`.
    - The {{Glossary("User Agent")}} could not acquire platform's wake lock.
      For example, this might happen if the device is low on battery.

