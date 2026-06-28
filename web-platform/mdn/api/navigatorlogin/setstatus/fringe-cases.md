# Fringe Cases

## Exceptions

- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the calling domain is not in a frame where all of the nesting hierarchy is same-origin. Whether called from the main frame, an {{htmlelement("iframe")}} nested inside the main frame, or another `<iframe>` nested one or more levels deep inside the first `<iframe>`, _all_ levels of the nesting hierarchy must be same-origin for the call to be successful.

