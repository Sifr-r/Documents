# Fringe Cases

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if any of the following are true:
    - The {{domxref("Event.isTrusted","isTrusted")}} property is `false`.
    - The {{domxref("BackgroundFetchUpdateUIEvent")}} UI updated flag is already set, indicating that the `updateUI()` method has already been called.
    - The {{domxref("BackgroundFetchUpdateUIEvent")}} is not active.

