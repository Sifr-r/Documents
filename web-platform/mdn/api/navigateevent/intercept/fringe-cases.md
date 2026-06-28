# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Because `precommitHandler()` can be used to cancel navigations, it will only work as expected when the event's {{domxref("Event.cancelable")}} property is `true`. Calling `intercept()` with a `precommitHandler()` on a non-cancelable event results in a `SecurityError` being thrown.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the current {{domxref("Document")}} is not yet active, or if the navigation has been cancelled.
- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if:
    - The event was dispatched by a {{domxref("EventTarget.dispatchEvent", "dispatchEvent()")}} call, rather than the user agent.
    - The navigation cannot be intercepted ({{domxref("NavigateEvent.canIntercept")}} is `false`).
    - A `precommitHandler()` callback is provided on a non-cancelable event ({{domxref("Event.cancelable")}} is `false`).

