# Fringe Cases

## Exceptions

Rather than throwing true exceptions, `requestHitTestSource()` rejects the
returned promise with a {{domxref("DOMException")}}, specifically, one of the following:

- `NotSupportedError` {{domxref("DOMException")}}
  - : Thrown if `hit-test` is not an enabled feature in {{domxref("XRSystem.requestSession()")}}.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the session has already ended.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Thrown if there is an unreasonable amount of requests. Some user agents might limit usage for privacy reasons.

